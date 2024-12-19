<?php
session_start(); // Démarrage de la session

include 'include/connect.inc.php'; // Inclusion du fichier de connexion

// Vérification de la présence de l'ID du produit
if (!isset($_GET['id']) || empty($_GET['id'])) {
  die("Aucun produit spécifié.");
}

$idProduit = intval($_GET['id']); // Récupération sécurisée de l'ID du produit

// Requête pour récupérer les informations principales du produit
$queryProduit = $conn->prepare("
    SELECT P.idNumProduit, P.nomProduit, P.prix, P.descriptionProduit, C.nomCategorie
    FROM Produit P
    LEFT JOIN Categorie C ON P.idCategorie = C.idCategorie
    WHERE P.idNumProduit = ?
");
$queryProduit->execute([$idProduit]);
$produit = $queryProduit->fetch(PDO::FETCH_ASSOC);

if (!$produit) {
  die("Produit introuvable.");
}

// Requête pour récupérer les images du produit
$queryImages = $conn->prepare("
    SELECT I.nomImage
    FROM Contient CT
    JOIN Image I ON CT.idImage = I.idImage
    WHERE CT.idNumProduit = ?
");
$queryImages->execute([$idProduit]);
$images = $queryImages->fetchAll(PDO::FETCH_ASSOC);

// Si aucune image n'est trouvée, utiliser une image par défaut
if (empty($images)) {
  $images = [['nomImage' => 'no-image.jpg']];
}

// Requête pour récupérer les composants du produit avec leurs images
$queryComposants = $conn->prepare("
    SELECT P2.nomProduit, I.nomImage
    FROM Comporte C
    JOIN Produit P2 ON C.idNumProduitComporte = P2.idNumProduit
    LEFT JOIN Contient CT ON P2.idNumProduit = CT.idNumProduit
    LEFT JOIN Image I ON CT.idImage = I.idImage
    WHERE C.idNumProduitComportant = ?
");
$queryComposants->execute([$idProduit]);
$composants = $queryComposants->fetchAll(PDO::FETCH_ASSOC);

// Requête pour récupérer les avis clients
$queryAvis = $conn->prepare("
    SELECT C.nom, C.prenom, A.txtAvis
    FROM Avis A
    JOIN Client C ON A.idNumCli = C.idNumCli
    WHERE A.idNumProduit = ?
");
$queryAvis->execute([$idProduit]);
$avisClients = $queryAvis->fetchAll(PDO::FETCH_ASSOC);

// Traitement du formulaire d'ajout d'avis
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['avis'])) {
  if (isset($_SESSION['idClient'])) {
    $avis = htmlspecialchars($_POST['avis']);
    $idClient = $_SESSION['idClient'];

    // Préparation de l'insertion dans la table Avis
    $stmt = $conn->prepare("
            INSERT INTO Avis (idNumCli, idNumProduit, txtAvis, idNumEmploye, txtReponse, idImage)
            VALUES (:idClient, :idProduit, :avis, NULL, NULL, NULL)
            ON DUPLICATE KEY UPDATE txtAvis = :avis
        ");

    $stmt->bindParam(':idClient', $idClient, PDO::PARAM_INT);
    $stmt->bindParam(':idProduit', $idProduit, PDO::PARAM_INT);
    $stmt->bindParam(':avis', $avis, PDO::PARAM_STR);

    try {
      $stmt->execute();
      // Redirection pour recharger les avis après l'ajout
      header("Location: detailsProduit.php?id=$idProduit");
      exit;
    } catch (PDOException $e) {
      die("Erreur lors de l'ajout de l'avis : " . $e->getMessage());
    }
  } else {
    // Redirection si la session est perdue
    header("Location: formConnexion.php");
    exit;
  }
}
?>

<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Détail Produit</title>
  <link rel="stylesheet" href="css/header.css">
  <link rel="stylesheet" href="css/footer.css">
  <link rel="stylesheet" href="css/detailsProduit.css">
  <script>
    function afficherFormulaireAvis() {
      // Vérification de connexion
      const isConnected = <?php echo isset($_SESSION['login']) && $_SESSION['login'] === 'OK' ? 'true' : 'false'; ?>;
      if (!isConnected) {
        // Rediriger vers la page de connexion
        window.location.href = "formConnexion.php";
      } else {
        // Afficher le formulaire d'avis
        document.getElementById("add-review-section").innerHTML = `
          <form id="form-add-review" method="POST">
            <textarea name="avis" rows="5" placeholder="Écrivez votre avis ici..." required></textarea>
            <button type="submit" class="btn-add-to-cart">Soumettre l'avis</button>
          </form>
        `;
      }
    }
  </script>
</head>

<body>
  <!-- Header principal -->
  <?php include 'include/header.php'; ?>

  <!-- Contenu principal -->
  <main>
    <div class="detail-container">
      <!-- Section images -->
      <div class="image-section">
        <div class="image-list">
          <?php foreach ($images as $img): ?>
            <img src="image/produits/<?php echo htmlspecialchars($img['nomImage']); ?>" alt="Image produit"
              class="thumbnail" onclick="changeMainImage(this)">
          <?php endforeach; ?>
        </div>
        <div class="main-image">
          <img src="image/produits/<?php echo htmlspecialchars($images[0]['nomImage']); ?>"
            alt="Image principale du produit">
        </div>
      </div>

      <!-- Section informations produit -->
      <div class="product-info">
        <h1 class="product-title"><?php echo htmlspecialchars($produit['nomProduit']); ?></h1>
        <p class="product-category">Catégorie : <?php echo htmlspecialchars($produit['nomCategorie']); ?></p>
        <div class="product-price">
          <span class="normal-price"><?php echo number_format($produit['prix'], 2, ',', ' '); ?>€</span>
        </div>
        <div class="quantity-section">
          <label for="quantity">Quantité :</label>
          <input type="number" id="quantity" name="quantity" min="1" value="1">
        </div>
        <button class="btn-add-to-cart" onclick="ajouterAuPanier(<?php echo $idProduit; ?>)">Ajouter au panier</button>
      </div>
    </div>

    <!-- Section composants -->
    <?php if (!empty($composants)): ?>
      <div class="components-section">
        <h2>Composants</h2>
        <div class="components-list">
          <?php foreach ($composants as $composant): ?>
            <div class="component">
              <img src="image/produits/<?php echo htmlspecialchars($composant['nomImage'] ?? 'no-image.jpg'); ?>"
                alt="Image composant">
              <p><?php echo htmlspecialchars($composant['nomProduit']); ?></p>
            </div>
          <?php endforeach; ?>
        </div>
      </div>
    <?php endif; ?>

    <!-- Section description -->
    <div class="description-section">
      <h2>Description</h2>
      <p>
        <?php echo nl2br(htmlspecialchars($produit['descriptionProduit'])); ?>
      </p>
    </div>

    <!-- Section avis clients -->
    <div class="reviews-section">
      <h2>Avis des clients</h2>
      <?php if (!empty($avisClients)): ?>
        <?php foreach ($avisClients as $avis): ?>
          <div class="review">
            <h3><?php echo htmlspecialchars($avis['prenom']) . ' ' . htmlspecialchars($avis['nom']); ?></h3>
            <p><?php echo htmlspecialchars($avis['txtAvis']); ?></p>
          </div>
        <?php endforeach; ?>
      <?php else: ?>
        <p>Pas d'avis pour ce produit.</p>
      <?php endif; ?>

      <!-- Bouton Ajouter un Avis -->
      <div id="add-review-section">
        <button class="btn-add-review" onclick="afficherFormulaireAvis()">Ajouter un avis</button>
      </div>
    </div>
  </main>

  <!-- Footer -->
  <?php include 'include/footer.php'; ?>

  <!-- Scripts -->
  <script src="js/select_img.js"></script>
</body>

</html>
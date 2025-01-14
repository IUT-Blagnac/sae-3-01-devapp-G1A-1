<?php
session_start();
if (!isset($_SESSION['login']) || $_SESSION['login'] != 'OK') {
  header('Location: index.php?erreur=Veuillez_passer_par_le_formulaire_de_connexion');
}
?>

<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>BuildMyPC</title>
  <link rel="stylesheet" href="css/header.css">
  <link rel="stylesheet" href="css/footer.css">
  <link rel="stylesheet" href="css/panier.css">
  <link rel="icon" href="image/BuildMyPC_logo.png" />

</head>

<body>
  <!-- Header principal -->
  <?php include 'include/header.php'; ?>

  <!-- Contenu principal -->
  <main>
    <?php
    include 'include/connect.inc.php';

    $req = $conn->prepare('SELECT * FROM Client WHERE idNumCli = ?');
    $req->execute(array($_SESSION['idClient']));
    $data = $req->fetch();

    // Requête pour récupérer les informations principales de la commande
    $queryCommande = $conn->prepare("SELECT idCommande 
                                            FROM Commande 
                                            WHERE estPanierActuel = 1
                                            AND idNumCli = ?");
    $queryCommande->execute([$data['idNumCli']]);
    $Commande = $queryCommande->fetch(PDO::FETCH_ASSOC);

    if (!$Commande) {
      die("Commande introuvable.");
    }

    // Requête pour récupérer les informations principales des produits
    $queryACommande = $conn->prepare("SELECT a.idNumProduit, p.nomProduit, p.prix, a.qte
                                             FROM ACommande a
                                             JOIN Produit p ON a.idNumProduit = p.idNumProduit
                                             WHERE a.idCommande = ?");
    $queryACommande->execute([$Commande['idCommande']]);
    $ACommandes = $queryACommande->fetchAll(PDO::FETCH_ASSOC); 
    
    // Requête pour récupérer les informations principales de l'adresse'
    // echo htmlspecialchars($Adresse['idAdresse']);
    $queryAdresse = $conn->prepare("SELECT * 
                                       FROM AdressePostale a, Client c
                                       WHERE a.idAdresse = c.idAdresse
                                       AND idNumCli = ?");
    $queryAdresse->execute([$data['idNumCli']]);
    $Adresse = $queryAdresse->fetch(PDO::FETCH_ASSOC);

    if (!$Adresse) {
      die("Adresse introuvable.");
    }

    ?>

    <h2 class="titre-panier"> Votre Panier </h2>

    <?php
    if (!$ACommandes) {
      echo '<div class="panier-main-container">';
      echo '<div class="panier-container left">';
      echo '<ul>';

      echo '<li>';
      echo '<div class="panier-item">';
      echo '<p class = "panier-vide"> Votre panier est vide </p>';
      echo '</div>';
      echo '</li>';

      echo '</ul>';
      echo '</div>';
      echo '</div>';
    }

    $total = 0;
    $count = 0;
    ?>

    <div class="panier-main-container">
      <div class="panier-container left">
        <ul>
          <?php foreach ($ACommandes as $ACommande): ?>
            <?php
            // Requête pour récupérer les images du produit
            $queryImages = $conn->prepare("SELECT i.nomImage
                                      FROM Contient c
                                      JOIN Image i ON c.idImage = i.idImage
                                      WHERE c.idNumProduit = ?");
            $queryImages->execute([$ACommande['idNumProduit']]);
            $images = $queryImages->fetchAll(PDO::FETCH_ASSOC);

            // Si aucune image n'est trouvée, utiliser une image par défaut
            if (empty($images)) {
              $images = [['nomImage' => 'no-image.jpg']];
            }

            $prixProduit = $ACommande['prix'];
            $quantiteProduit = $ACommande['qte'];
            $totalProduit = $prixProduit * $quantiteProduit;
            $total += $totalProduit;

            ?>
            <li>
              <div class="panier-item">
                <img src="image/produits/<?php echo htmlspecialchars($images[0]['nomImage']); ?>" alt="Produit"
                  class="panier-image">
                <div class="panier-info">
                  <h3 class="panier-nom"><?php echo htmlspecialchars($ACommande['nomProduit']); ?></h3>
                  <p class="panier-quantite">Quantité: <input
                      name="quantite-<?php echo htmlspecialchars($ACommande['idNumProduit']); ?>"
                      id="quantite-<?php echo htmlspecialchars($ACommande['idNumProduit']); ?>" class="selection"
                      type="number" min="1" value="<?php echo htmlspecialchars($ACommande['qte']); ?>" /></p>
                  <p class="panier-prix">Prix unitaire: <?php echo htmlspecialchars($ACommande['prix']); ?>€</p>
                </div>
                <form action="supprimer_produit.php" method="POST">
                  <input type="hidden" name="idProduit"
                    value="<?php echo htmlspecialchars($ACommande['idNumProduit']); ?>">
                  <button type="submit" class="panier-supprimer">Supprimer</button>
                </form>
              </div>
            </li>
            <?php $count = $count + 1; ?>
          <?php endforeach; ?>

        </ul>
      </div>
      <?php if ($ACommandes): ?>
        <form method="post" action="panierLivraison.php">
          <div class="panier-container right">
            <div class="panier-total">

              <div class="container">

                <div class="row">
                  <div class="total-section">
                    <p class="total">Total : </p>
                    <p class="montant-total"><?= number_format($total, 2, ',', '') ?>€</p>
                  </div>
                  <button type="submit" name="valider_commande" class="panier-valider">Commander</button>
                </div>
              </div>
            </div>
          </div>
          <input type="hidden" name="idNumCli" value="<?= $data['idNumCli'] ?>">
        </form>
      <?php endif; ?>
    </div>

  </main>
  <!-- Fin Contenu principal -->

  <?php
  include_once "include/footer.php";
  ?>

  <!-- Lien vers le fichier JavaScript -->

</body>

</html>
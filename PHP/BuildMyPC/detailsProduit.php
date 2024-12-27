<?php
session_start(); // Démarrage de la session
include 'include/connect.inc.php'; // Inclusion du fichier de connexion

// Vérification de la présence de l'ID du produit
if (!isset($_GET['id']) || empty($_GET['id'])) {
    die("Aucun produit spécifié.");
}

$idProduit = intval($_GET['id']); // Récupération sécurisée de l'ID du produit

// Requête pour récupérer les informations principales du produit et la promotion
$queryProduit = $conn->prepare("SELECT P.idNumProduit, P.nomProduit, P.prix, P.descriptionProduit, P.stock, C.idCategorie, C.nomCategorie, C.idCategoriePere,  PR.pourcentageReduction FROM Produit P LEFT JOIN Categorie C ON P.idCategorie = C.idCategorie LEFT JOIN EnPromo EP ON P.idNumProduit = EP.idNumProduit LEFT JOIN Promotion PR ON EP.idPromotion = PR.idPromotion WHERE P.idNumProduit = ?");
$queryProduit->execute([$idProduit]);
$produit = $queryProduit->fetch(PDO::FETCH_ASSOC);

$queryCategoriePere = $conn->prepare("SELECT nomCategorie FROM Categorie WHERE idCategorie = ?");
$queryCategoriePere->execute([$produit['idCategoriePere']]);
$categPere = $queryCategoriePere->fetch(PDO::FETCH_ASSOC);

if (!$produit) {
    die("Produit introuvable.");
}

// Calculer le prix après promotion si applicable
$prixApresPromotion = null;
if (!empty($produit['pourcentageReduction'])) {
    $prixApresPromotion = $produit['prix'] * (1 - $produit['pourcentageReduction'] / 100);
}

// Requête pour récupérer les images du produit
$queryImages = $conn->prepare("SELECT I.nomImage FROM Contient CT JOIN Image I ON CT.idImage = I.idImage WHERE CT.idNumProduit = ?");
$queryImages->execute([$idProduit]);
$images = $queryImages->fetchAll(PDO::FETCH_ASSOC);

if (empty($images)) {
    $images = [['nomImage' => 'no-image.jpg']];
}

// Requête pour récupérer les composants du produit avec leur première image
$queryComposants = $conn->prepare("SELECT P2.nomProduit, MIN(I.nomImage) AS nomImage, P2.idNumProduit FROM Comporte C JOIN Produit P2 ON C.idNumProduitComporte = P2.idNumProduit LEFT JOIN Contient CT ON P2.idNumProduit = CT.idNumProduit LEFT JOIN Image I ON CT.idImage = I.idImage WHERE C.idNumProduitComportant = ? GROUP BY P2.idNumProduit, P2.nomProduit");
$queryComposants->execute([$idProduit]);
$composants = $queryComposants->fetchAll(PDO::FETCH_ASSOC);

// Requête pour calculer la moyenne des notes
$queryMoyenneNote = $conn->prepare("SELECT AVG(note) AS moyenneNote FROM Avis WHERE idNumProduit = ?");
$queryMoyenneNote->execute([$idProduit]);
$moyenneNote = $queryMoyenneNote->fetchColumn();
$moyenneNote = $moyenneNote ? round($moyenneNote, 1) : 0;

// Vérifier si le client peut ajouter un avis et s'il en a déjà ajouté
$avisUtilisateur = null;
$peutAjouterAvis = false;
if (isset($_SESSION['idClient'])) {
    $idClient = intval($_SESSION['idClient']);

    // Vérification si le client a déjà laissé un avis
    $queryAvisUtilisateur = $conn->prepare("SELECT txtAvis, note, nomImage FROM Avis WHERE idNumProduit = ? AND idNumCli = ?");
    $queryAvisUtilisateur->execute([$idProduit, $idClient]);
    $avisUtilisateur = $queryAvisUtilisateur->fetch(PDO::FETCH_ASSOC);

    // Vérification si le client peut ajouter/modifier un avis
    $queryPeutAjouterAvis = $conn->prepare("SELECT 1 FROM ACommande AC JOIN Commande C ON AC.idCommande = C.idCommande WHERE C.idNumCli = ? AND AC.idNumProduit = ? AND C.estPanierActuel = FALSE LIMIT 1");
    $queryPeutAjouterAvis->execute([$idClient, $idProduit]);
    $peutAjouterAvis = $queryPeutAjouterAvis->fetchColumn() ? true : false;
}

$queryAvis = $conn->prepare("SELECT A.idNumCli, A.txtAvis, A.txtReponse, A.note, A.nomImage, C.nom AS nomClient, C.prenom AS prenomClient, E.nom AS nomEmploye, E.prenom AS prenomEmploye FROM Avis A JOIN Client C ON A.idNumCli = C.idNumCli LEFT JOIN Employe E ON A.idNumEmploye = E.idNumEmploye WHERE A.idNumProduit = ?");
$queryAvis->execute([$idProduit]);
$avisClients = $queryAvis->fetchAll(PDO::FETCH_ASSOC);

// Traitement du formulaire d'ajout/modification d'avis
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['avis']) && isset($_POST['note'])) {
    if (isset($_SESSION['idClient'])) {
        $avis = $_POST['avis'];
        $note = intval($_POST['note']);
        $idClient = $_SESSION['idClient'];
        $imageName = null;

        if (!empty($_FILES['reviewImage']['name'])) {
            $uploadDir = 'image/avis/';
            $imageFile = $_FILES['reviewImage'];
            $imageExt = pathinfo($imageFile['name'], PATHINFO_EXTENSION);
            $validExtensions = ['jpg', 'jpeg', 'png', 'webp'];

            if (in_array(strtolower($imageExt), $validExtensions)) {
                $imageName = uniqid('review_', true);
                $imagePath = $uploadDir . $imageName . '.' . $imageExt;

                if (move_uploaded_file($imageFile['tmp_name'], $imagePath)) {
                } else {
                    $imageName = null;
                }
            }
        }

        $stmt = $conn->prepare("INSERT INTO Avis (idNumCli, idNumProduit, txtAvis, note, nomImage) VALUES (:idClient, :idProduit, :avis, :note, :imageName) ON DUPLICATE KEY UPDATE note = :note, txtAvis = :avis, nomImage = :imageName");
        $stmt->bindParam(':idClient', $idClient, PDO::PARAM_INT);
        $stmt->bindParam(':idProduit', $idProduit, PDO::PARAM_INT);
        $stmt->bindParam(':note', $note, PDO::PARAM_INT);
        $stmt->bindParam(':avis', $avis, PDO::PARAM_STR);
        $stmt->bindParam(':imageName', $imageName, PDO::PARAM_STR);
        $stmt->execute();
        header("Location: detailsProduit.php?id=$idProduit");
        exit;
    }
}

// Traitement du formulaire de réponse d'employé
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['reponse'])) {
    if (isset($_SESSION['idEmp'])) {
        $reponse = $_POST['reponse'];
        $idEmploye = $_SESSION['idEmp'];
        $idNumCli = intval($_POST['idNumCli']);

        $stmt = $conn->prepare("UPDATE Avis SET txtReponse = :reponse, idNumEmploye = :idEmploye WHERE idNumProduit = :idProduit AND idNumCli = :idNumCli");
        $stmt->bindParam(':idEmploye', $idEmploye, PDO::PARAM_INT);
        $stmt->bindParam(':reponse', $reponse, PDO::PARAM_STR);
        $stmt->bindParam(':idProduit', $idProduit, PDO::PARAM_INT);
        $stmt->bindParam(':idNumCli', $idNumCli, PDO::PARAM_INT);
        $stmt->execute();
        header("Location: detailsProduit.php?id=$idProduit");
        exit;
    }
}

//Ajout Pablo : Ajout de la consultation
if (isset($_GET['id']) && isset($_SESSION['idClient'])) {
    $product_id = intval($_GET['id']);
    $user_id = intval($_SESSION['idClient']);

    // Vérifier si une consultation récente existe
    $stmt = $conn->prepare("
        SELECT 1 
        FROM AConsulte 
        WHERE idNumCli = ? 
          AND idNumProduit = ? 
          AND dateConsultation > DATE_SUB(NOW(), INTERVAL 24 HOUR)
    ");
    $stmt->bindParam(1, $user_id, PDO::PARAM_INT);
    $stmt->bindParam(2, $product_id, PDO::PARAM_INT);
    $stmt->execute();

    if ($stmt->rowCount() === 0) {
        $stmt = $conn->prepare("INSERT INTO AConsulte (idNumCli, idNumProduit, dateConsultation) VALUES (?, ?, ?)");
        $stmt->bindParam(1, $user_id, PDO::PARAM_INT);
        $stmt->bindParam(2, $product_id, PDO::PARAM_INT);
        $dateConsultation = date('Y-m-d H:i:s');
        $stmt->bindParam(3, $dateConsultation);
        $stmt->execute();
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
    <link rel="icon" href="image/BuildMyPC_logo.png" />
    <script>
        function ajouterAuPanier(idProduit) {
            const isConnected = <?php echo isset($_SESSION['login']) && $_SESSION['login'] === 'OK' ? 'true' : 'false'; ?>;
            if (!isConnected) {
                window.location.href = "formConnexion.php";
            } else {
                window.location.href = `ajoutProduit.php?id=${idProduit}`;
            }
        }

        function afficherFormulaireAvis(existeDeja) {
            const existingReview = <?php echo json_encode($avisUtilisateur); ?>;
            const note = existeDeja && existingReview ? existingReview.note : 0;
            const avis = existeDeja && existingReview ? existingReview.txtAvis : '';
            const image = existeDeja && existingReview ? existingReview.nomImage : '';

            document.getElementById("add-review-section").innerHTML = `
                <form id="form-add-review" method="POST" enctype="multipart/form-data">
                    <div class="rating-input">
                        <input type="hidden" name="note" id="note" value="${note}">
                        <div class="stars">
                            ${[1, 2, 3, 4, 5].map(i => `<span class="star ${i <= note ? 'filled' : ''}" data-value="${i}">★</span>`).join('')}
                        </div>
                    </div>
                    <textarea name="avis" rows="5" placeholder="Écrivez votre avis ici..." required>${avis}</textarea>
                    <label for="review-image">Ajouter une image (optionnel) :</label>
                    <input type="file" name="reviewImage" id="review-image" accept=".png, .jpg, .jpeg, .webp">
                    ${image ? `<p>Image actuelle : ${image}</p>` : ''}
                    <div class="form-buttons">
                        <button type="submit" class="btn-add-to-cart">Sauvegarder</button>
                        <button type="button" class="btn-add-to-cart" onclick="location.reload()">Annuler</button>
                    </div>
                </form>
            `;
            attachStarEvents();
        }

        function afficherFormulaireReponse(idClient) {
            document.getElementById("reponse-section-" + idClient).innerHTML = `
                <form method="POST" class="form-add-reponse">
                    <input type="hidden" name="idNumCli" value="${idClient}">
                    <textarea name="reponse" rows="4" placeholder="Écrivez votre réponse ici..." required></textarea>
                    <div class="form-buttons">
                        <button type="submit" class="btn-add-to-cart">Envoyer la réponse</button>
                        <button type="button" class="btn-add-to-cart" onclick="location.reload()">Annuler</button>
                    </div>
                </form>
            `;
        }
    </script>
</head>

<body>
    <!-- Lightbox -->
    <div id="lightbox" class="lightbox" onclick="closeLightbox()">
        <img id="lightbox-img" class="lightbox-img" alt="Image zoomée">
    </div>
    <?php include 'include/header.php'; ?>

    <main>

        <!-- Fil d'ariane -->
        <div class="breadcrumb">
            <?php if (!empty($produit['idCategoriePere'])): ?>
                <a href="traitListeProduit.php?categ_id=<?= $produit['idCategoriePere'] ?>">
                    <?= htmlspecialchars($categPere['nomCategorie']) ?>
                </a>
                <span>&gt;</span>
            <?php endif; ?>
            <a href="traitListeProduit.php?categ_id=<?= $produit['idCategorie'] ?>">
                <?= htmlspecialchars($produit['nomCategorie']) ?>
            </a>
            <span>&gt;</span>
            <span><?= htmlspecialchars($produit['nomProduit']) ?></span>
        </div>

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
                    <?php if ($prixApresPromotion !== null): ?>
                        <span class="normal-price promo">
                            <?php echo number_format($produit['prix'], 2, ',', ' '); ?>€
                        </span>
                        <br>
                        <span class="promo-price">
                            <?php echo number_format($prixApresPromotion, 2, ',', ' '); ?>€
                        </span>
                    <?php else: ?>
                        <span class="normal-price">
                            <?php echo number_format($produit['prix'], 2, ',', ' '); ?>€
                        </span>
                    <?php endif; ?>
                </div>

                <!-- Affichage de la note moyenne -->
                <div class="product-rating">
                    <div class="stars static">
                        <?php for ($i = 1; $i <= 5; $i++): ?>
                            <span class="star <?php echo $i <= $moyenneNote ? 'filled' : ''; ?>">★</span>
                        <?php endfor; ?>
                    </div>
                </div>

                <!-- Ajout de l'état du stock -->
                <div class="stock-section">
                    <?php if ($produit['stock'] > 0): ?>
                        <span class="in-stock">En stock</span>
                        <br>
                        <button class="btn-add-to-cart" onclick="ajouterAuPanier(<?php echo $idProduit; ?>)">Ajouter au
                            panier</button>
                    <?php else: ?>
                        <span class="out-of-stock">Rupture de stock</span>
                        <br>
                        <button class="btn-add-to-cart-disable" disabled>Ajouter au panier</button>
                    <?php endif; ?>
                </div>
            </div>
        </div>

        <!-- Section composants -->
        <?php if (!empty($composants)): ?>
            <div class="components-section">
                <h2>Composants</h2>
                <div class="components-list">
                    <?php foreach ($composants as $composant): ?>
                        <div class="component">
                            <a href="detailsProduit.php?id=<?php echo htmlspecialchars($composant['idNumProduit']); ?>">
                                <img src="image/produits/<?php echo htmlspecialchars($composant['nomImage'] ?? 'no-image.jpg'); ?>"
                                    alt="Image composant">
                            </a>
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
                        <h3><?php echo htmlspecialchars($avis['prenomClient']) . ' ' . htmlspecialchars($avis['nomClient']); ?>
                        </h3>
                        <div class="stars static">
                            <?php for ($i = 1; $i <= 5; $i++): ?>
                                <span class="star <?php echo $i <= $avis['note'] ? 'filled' : ''; ?>">★</span>
                            <?php endfor; ?>
                        </div>
                        <p><?php echo htmlspecialchars($avis['txtAvis']); ?></p>
                        <?php if (!empty($avis['nomImage'])): ?>
                            <?php
                            // Recherche des fichiers correspondant à l'nomImage avec différentes extensions
                            $imagePath = null;
                            $extensions = ['jpg', 'jpeg', 'png', 'webp', 'gif']; // Extensions possibles
                            foreach ($extensions as $ext) {
                                if (file_exists("image/avis/{$avis['nomImage']}.$ext")) {
                                    $imagePath = "image/avis/{$avis['nomImage']}.$ext";
                                    break;
                                }
                            }
                            ?>
                            <?php if ($imagePath): ?>
                                <div class="review-image">
                                    <img src="<?php echo htmlspecialchars($imagePath); ?>" alt="Image pour l'avis"
                                        style="max-width: 100px; max-height: 100px;" onclick="openLightbox(this.src)">
                                </div>
                            <?php endif; ?>
                        <?php endif; ?>
                        <?php if (!empty($avis['txtReponse'])): ?>
                            <div class="reponse">
                                <small><?php echo htmlspecialchars($avis['prenomEmploye']) . ' ' . htmlspecialchars($avis['nomEmploye']); ?></small>
                                <p><?php echo htmlspecialchars($avis['txtReponse']); ?></p>
                            </div>
                        <?php elseif (isset($_SESSION['email']) && strpos($_SESSION['email'], '@buildmypc.com') !== false): ?>
                            <div id="reponse-section-<?php echo $avis['idNumCli']; ?>">
                                <button class="btn-add-review"
                                    onclick="afficherFormulaireReponse(<?php echo $avis['idNumCli']; ?>)">Répondre</button>
                            </div>
                        <?php endif; ?>
                    </div>
                <?php endforeach; ?>

            <?php else: ?>
                <p>Pas d'avis pour ce produit.</p>
            <?php endif; ?>

            <!-- Bouton Ajouter un Avis -->
            <?php if ($peutAjouterAvis && isset($_SESSION['email']) && strpos($_SESSION['email'], '@buildmypc.com') === false): ?>
                <div id="add-review-section">
                    <button class="btn-add-review"
                        onclick="afficherFormulaireAvis(<?php echo $avisUtilisateur ? 'true' : 'false'; ?>)">
                        <?php echo $avisUtilisateur ? 'Modifier son avis' : 'Ajouter un avis'; ?>
                    </button>
                </div>
            <?php endif; ?>

        </div>


        <!-- Section produits similaires -->
        <?php
        $sql = "
                SELECT p.idNumProduit, p.nomProduit, p.prix, c.nomCategorie
                FROM Produit p
                JOIN Categorie c ON p.idCategorie = c.idCategorie
                WHERE c.idCategorie = :idCategorie
                AND p.idNumProduit != :idNumProduit
                ORDER BY RAND()
            ";

        // Préparation et exécution de la requête
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':idCategorie', $produit['idCategorie'], PDO::PARAM_INT);
        $stmt->bindParam(':idNumProduit', $idProduit, PDO::PARAM_INT);
        $stmt->execute();
        $topProduits = $stmt->fetchAll(PDO::FETCH_ASSOC);
        // Étape 2 : Initialiser un tableau pour stocker les données
        $data2 = [];

        foreach ($topProduits as $produit) {
            $idNumProduit = $produit['idNumProduit'];

            // Récupérer les produits liés
            $reqComporte = $conn->prepare("
                    SELECT P.nomProduit AS nomProduit
                    FROM Comporte C
                    JOIN Produit P ON P.idNumProduit = C.idNumProduitComporte
                    WHERE C.idNumProduitComportant = :idNumProduit
                    ORDER BY P.nomProduit ASC
                ");
            $reqComporte->execute(['idNumProduit' => $idNumProduit]);
            $produitsLies = $reqComporte->fetchAll(PDO::FETCH_COLUMN);

            // Récupérer les images associées
            $reqContient = $conn->prepare("
                    SELECT I.nomImage AS image
                    FROM Contient C
                    JOIN Image I ON I.idImage = C.idImage
                    WHERE C.idNumProduit = :idNumProduit
                    ORDER BY I.idImage ASC
                ");
            $reqContient->execute(['idNumProduit' => $idNumProduit]);
            $images = $reqContient->fetchAll(PDO::FETCH_COLUMN);

            // Récupérer la promotion (si disponible)
            $reqPromotion = $conn->prepare("
                    SELECT E.idPromotion, P.pourcentageReduction
                    FROM EnPromo E
                    JOIN Promotion P ON P.idPromotion = E.idPromotion
                    WHERE E.idNumProduit = :idNumProduit
                ");
            $reqPromotion->execute(['idNumProduit' => $idNumProduit]);
            $promotion = $reqPromotion->fetch(PDO::FETCH_ASSOC);

            // Ajouter toutes les données pour ce produit
            $data2[] = [
                'produit' => $produit,
                'promotion' => $promotion ? $promotion['pourcentageReduction'] : null,
                'produits_lies' => $produitsLies,
                'images' => $images
            ];
        }
        ?>

        <div class="reviews-section">
            <h2>Produits similaires</h2>

            <?php if (count($data2) < 1) {
                echo "<p>Pas de produits similaires.</p>";
            } else { ?>
                <div class="gallery js-flickity" data-flickity-options='{ <?php if (count($data2) < 5) {
                    echo "\"wrapAround\": false,\"cellAlign\":\"center\"";
                } else {
                    echo "\"wrapAround\": true";
                } ?>, "draggable": false, "pageDots": true}'>

                    <?php foreach ($data2 as $item) { ?>
                        <div class="gallery-cell">
                            <div class="grid-item">
                                <a href="detailsProduit.php?id=<?= $item['produit']['idNumProduit'] ?>" class="product image">
                                    <img src="image/produits/<?php echo $item['images'][0] ?? "no-image.jpg" ?>"
                                        alt="imgProduit" class="product" />
                                    <?php if ($item['promotion'] != null) { ?>
                                        <span class="product badge">-<?= $item['promotion'] ?>%</span>
                                    <?php } ?>

                                </a>
                                <div class="product name"><?= htmlspecialchars($item['produit']['nomProduit']) ?></div>
                                <div class="product components">
                                    <?php
                                    if (!empty($item['produits_lies'])) {
                                        echo implode(" - ", $item['produits_lies']);
                                    }
                                    ?>
                                </div>
                                <div class="product category"><?= htmlspecialchars($item['produit']['nomCategorie']) ?></div>
                                <?php if ($item['promotion'] == null) { ?>
                                    <div class="product price">
                                        <?= str_replace(".", "€", number_format(htmlspecialchars($item['produit']['prix']), 2)) ?>
                                    </div>
                                <?php } else { ?>
                                    <div class="product normal-price">
                                        <?= str_replace(".", "€", number_format(htmlspecialchars($item['produit']['prix']), 2)) ?>
                                    </div>
                                    <div class="product promotion">
                                        <?= str_replace(".", "€", number_format(($item['produit']['prix']) - ($item['produit']['prix']) * (($item['promotion']) / 100), 2)) ?>
                                    </div>
                                <?php } ?>
                                <button class="product btnPanier" type="submit">
                                    <div class="product btnPanier">Ajouter au panier</div>
                                </button>
                            </div>
                        </div>
                    <?php } ?>
                </div>
            <?php } ?>
        </div>
    </main>

    <?php include 'include/footer.php'; ?>

    <!-- Includes des fichiers JavaScript -->
    <script src="js/select_img.js"></script>
    <script src="js/stars.js"></script>
    <script src="js/lightbox.js"></script>
    <script src="js/carousel.js"></script>
    <script src="js/carousel_height.js"></script>
</body>

</html>
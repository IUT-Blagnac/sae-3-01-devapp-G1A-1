<?php session_start(); ?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuildMyPC</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="icon" href="image/BuildMyPC_logo.png" />

</head>

<body>
    <!-- Header principal -->
    <?php include 'include/header.php'; ?>

    <!-- Contenu principal -->
    <main>

        <section>
            <h2 class="popular-categ">Catégories populaires</h2>

            <div class="row">
                <a href="traitListeProduit.php?categ_id=11" class="column column-left"
                    style="background-color:#74FFA9;">
                    <img class="pcGaming-img" src="image/produits/pcGaming.webp" alt="PC Gaming">
                    <div class="text-container">
                        <h2>PC GAMING</h2>
                        <p>Découvrez notre large gamme de PC Fixes Gaming prémontés.
                            Vous retrouverez différentes configurations qui sauront convenir à tous les budgets !</p>
                    </div>
                </a>
                <a href="traitListeProduit.php?categ_id=12" class="column column-right"
                    style="background-color:#212121;">
                    <img class="pcBureautique-img" src="image/produits/pcBureautique.png" alt="PC Bureautique">
                    <h2 class="text-column-2">PC Bureautique</h2>
                </a>
                <a href="traitListeProduit.php?categ_id=5" class="column column-right"
                    style="background-color:#212121;">
                    <img class="carteGraphique-img" src="image/produits/carteGraphique.webp" alt="Carte Graphique">
                    <h2 class="text-column-3">Carte Graphique</h2>
                </a>
            </div>
        </section>

        <section>

            <!-- /////////////////////////////////
            /////////////// Grid ////////////////
            ///////////////////////////////// -->

            <!-- Requete préparée pour récupérer les produits en promotion -->
            <?php
            include "include/connect.inc.php";
            $req = $conn->prepare("SELECT idNumProduit, idPromotion FROM EnPromo");
            $req->execute();
            $enPromo = $req->fetchAll(PDO::FETCH_ASSOC);

            // Initialiser un tableau pour stocker les données
            $data = [];

            // Parcourir chaque enregistrement de EnPromo
            foreach ($enPromo as $row) {
                $idNumProduit = $row['idNumProduit'];
                $idPromotion = $row['idPromotion'];

                // Récupérer les informations du produit
                $reqProduit = $conn->prepare("SELECT P.idNumProduit, P.nomProduit, C.nomCategorie, P.prix, P.stock  FROM Categorie C, Produit P WHERE idNumProduit = :idNumProduit AND P.idCategorie = C.idCategorie");
                $reqProduit->execute(['idNumProduit' => $idNumProduit]);
                $produit = $reqProduit->fetch(PDO::FETCH_ASSOC);

                // Récupérer le pourcentage de la promotion
                $reqPromotion = $conn->prepare("SELECT pourcentageReduction FROM Promotion WHERE idPromotion = :idPromotion");
                $reqPromotion->execute(['idPromotion' => $idPromotion]);
                $promotion = $reqPromotion->fetch(PDO::FETCH_ASSOC);

                // Récupérer les produits liés (nomProduit) depuis la table Comporte
                $reqComporte = $conn->prepare("
                    SELECT P.nomProduit AS nomProduit
                    FROM Comporte C, Produit P
                    WHERE P.idNumProduit = C.idNumProduitComporte 
                    AND C.idNumProduitComportant = :idNumProduit
                    ORDER BY P.nomProduit ASC
                ");
                $reqComporte->execute(['idNumProduit' => $idNumProduit]);
                $produitsLies = $reqComporte->fetchAll(PDO::FETCH_COLUMN); // Récupérer uniquement les noms des produits
            
                // Récupérer les images associées depuis la table Contient
                $reqContient = $conn->prepare("
                    SELECT I.nomImage AS image
                    FROM Contient C, Image I
                    WHERE I.idImage = C.idImage 
                    AND C.idNumProduit = :idNumProduit
                    ORDER BY I.idImage ASC
                ");
                $reqContient->execute(['idNumProduit' => $idNumProduit]);
                $images = $reqContient->fetchAll(PDO::FETCH_COLUMN); // Récupérer uniquement les noms des images
            

                // Ajouter les données dans le tableau
                if ($produit && $promotion) {
                    $data[] = [
                        'produit' => $produit,
                        'promotion' => $promotion['pourcentageReduction'],
                        'produits_lies' => $produitsLies,
                        'images' => $images
                    ];
                }
            }
            ?>

            <!-- Requete préparée pour récupérer les produits les plus populaires -->

            <?php
            $sql = "
                SELECT p.idNumProduit, p.nomProduit, p.prix, p.stock, c.nomCategorie, SUM(ac.qte) AS totalQuantite
                FROM Produit p
                JOIN ACommande ac ON p.idNumProduit = ac.idNumProduit
                JOIN Categorie c ON p.idCategorie = c.idCategorie
                GROUP BY p.idNumProduit
                ORDER BY totalQuantite DESC
                LIMIT 6
            ";

            // Préparation et exécution de la requête
            $stmt = $conn->prepare($sql);
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

            <!-- Partie Meilleures promotions -->
            <h2 class="titre-produit">Meilleures promotions</h2>

            <div class="gallery js-flickity" data-flickity-options='{ "wrapAround": true, "draggable": false }'>

                <?php foreach ($data as $row) { ?>
                    <div class="gallery-cell">
                        <div class="grid-item item4">
                            <a href="detailsProduit.php?id=<?= $row['produit']['idNumProduit'] ?>" class="product image">
                                <img src="image/produits/<?php echo $row['images'][0] ?? "no-image.jpg" ?>" alt="imgProduit"
                                    class="product" />
                                <span class="product badge">-<?= $row['promotion'] ?>%</span>
                            </a>
                            <div class="product name"><?= $row['produit']['nomProduit'] ?></div>
                            <div class="product components">
                                <?php
                                if (!empty($row['produits_lies'])) {
                                    echo implode(" - ", $row['produits_lies']);
                                }
                                ?>
                            </div>
                            <div class="product category"><?= $row['produit']['nomCategorie'] ?></div>
                            <div class="product normal-price">
                                <?= str_replace(".", "€", number_format($row['produit']['prix'], 2)) ?>
                            </div>
                            <div class="product promotion">
                                <?= str_replace(".", "€", number_format($row['produit']['prix'] - ($row['produit']['prix'] * ($row['promotion'] / 100)), 2)) ?>
                            </div>
                            <?php
                            if ($row['produit']['stock'] > 0) {
                                ?>
                                <a class='product btnPanier' href='ajoutProduit.php?id=<?= $row['produit']['idNumProduit'] ?>'>
                                    <div class='product btnPanier'>Ajouter au panier</div>
                                </a>
                                <?php
                            } else {
                                ?>
                                <a class='product btnPanier disabled' href='#'>
                                    <div class='product btnPanier'>Rupture de stock</div>
                                </a>
                                <?php
                            }
                            ?>
                        </div>
                    </div>
                <?php } ?>
            </div>

            <!-- Partie Produits les plus populaires -->
            <h2 class="titre-produit">Produits les plus populaires</h2>

            <div class="gallery js-flickity" data-flickity-options='{ "wrapAround": true, "draggable": false }'>

                <?php foreach ($data2 as $item) { ?>
                    <div class="gallery-cell">
                        <div class="grid-item item1">
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
                            <?php
                            if ($item['produit']['stock'] > 0) {
                                ?>
                                <a class='product btnPanier' href='ajoutProduit.php?id=<?= $row['produit']['idNumProduit'] ?>'>
                                    <div class='product btnPanier'>Ajouter au panier</div>
                                </a>
                                <?php
                            } else {
                                ?>
                                <a class='product btnPanier disabled' href='#'>
                                    <div class='product btnPanier'>Rupture de stock</div>
                                </a>
                                <?php
                            }
                            ?>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </section>

    </main>

    <?php
    include "include/footer.php";
    ?>

    <!-- Lien vers le fichier JavaScript -->
    <script src="js/carousel.js"></script>
    <script src="js/carousel_height.js"></script>
</body>

</html>
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
    <link rel="stylesheet" href="css/consultCompte.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="icon" href="image/BuildMyPC_logo.png" />
</head>

<body>
    <!-- Header principal -->
    <?php include 'include/header.php'; ?>

    <!-- Contenu principal -->
    <main>
        <div class="sidebar">
            <div class="user-info">
                <img src="image/BuildMyPC_logo.png" alt="Photo de profil">
                <h3><?php echo $_SESSION['prenom'] ?></h3>
            </div>
            <a href="consultCompte.php">Informations personnelles</a>
            <a href="payment.php">Informations de paiement</a>
            <a href="security.php">Sécurité</a>
            <a href="order.php">Historique des commandes</a>
            <a href="fidelity.php">Programme de fidélité</a>
            <a href="historique.php" class="active">Historique de navigation</a>
            <a href="logout.php">Se Déconnecter</a>
        </div>

        <!-- Préparation des requêtes pour récupérer l'historique de navigation de l'utilisateur -->
        <?php
        include "include/connect.inc.php";

        $selectPrix = "SELECT P.idNumProduit, MIN(P.prix-(P.prix*(Pro.pourcentageReduction/100))) AS prixReduc
                        FROM Promotion Pro, EnPromo EP, Produit P
                        WHERE Pro.idPromotion = EP.idPromotion AND EP.idNumProduit = P.idNumProduit AND Pro.active = 1
                        GROUP BY P.idNumProduit";

        $selectProducts = "SELECT DISTINCT P.idNumProduit AS idProduit, P.nomProduit AS nomProduit, C.nomCategorie AS nomCategorie, P.prix AS prix, COALESCE(PrixR.prixReduc,P.prix) AS prixRed, AC.dateConsultation AS dateConsultation
                            FROM Produit P
                            LEFT OUTER JOIN Avis A ON P.idNumProduit = A.idNumProduit
                            INNER JOIN Categorie C ON P.idCategorie = C.idCategorie
                            INNER JOIN Marque M ON P.idMarque = M.idMarque
                            LEFT OUTER JOIN ($selectPrix) AS PrixR ON P.idNumProduit = PrixR.idNumProduit
                            INNER JOIN AConsulte AC ON P.idNumProduit = AC.idNumProduit
                            WHERE AC.idNumCli = :user_id 
                            GROUP BY P.idNumProduit, P.nomProduit, C.nomCategorie, P.prix, AC.dateConsultation, PrixR.prixReduc
                            ORDER BY AC.dateConsultation DESC";


        function new_product(int $gridPosition, int $idProduct, string $name, string $category, float $price, string $imagePath, int $reduction = 0): bool
        {
            if ($gridPosition <= 0 || $idProduct < 0 || empty($name) || empty($category) || $price <= 0 || $reduction < 0 || $reduction > 99) {
                return false;
            }
            // format the price to have only two decimals and a € instead of a .
            $formated_price = str_replace(".", "€", number_format($price, 2));

            echo "<div class='grid-item item$gridPosition'>";
            echo "<a href='detailsProduit.php?id=$idProduct' class='product image'><img src = 'image/produits/$imagePath' alt = 'imgProduit' class='product' /> ";
            if ($reduction > 0) {
                echo "<span class='product badge'>-$reduction%</span>";
            }
            echo "</a>";
            echo "<div class='product name'>$name</div>";
            echo "<div class='product category'>$category</div>";
            if ($reduction > 0) {
                echo "<div class='product normal-price'>" . $formated_price . "</div>";
                echo "<div class='product promotion'>" . str_replace(".", "€", number_format($price - ($price * ($reduction / 100)), 2)) . "</div>";
            } else {
                echo "<div class='product price'>" . $formated_price . "</div>";
            }

            echo "<form method='POST' action='deleteHistorique.php' class='product form'>";
            echo "<input type='hidden' name='idProduit' value='$idProduct' />";
            echo "<button class='product btnPanier' type='submit'>Supprimer</button>";
            echo "</form>";

            echo "</div>";

            return true;
        }



        function getImages(int $idProduit): array
        {
            global $conn;
            $images = [];

            $query = "  SELECT I.nomImage AS image FROM Contient C, Image I WHERE I.idImage = C.idImage AND C.idNumProduit = ? ORDER BY I.idImage ASC";
            $pdo = $conn->prepare($query);
            $pdo->execute([$idProduit]);
            while ($produit = $pdo->fetch()) {
                $images[] = $produit["image"];
            }
            return $images;
        }

        function getPromotion(int $idProduit): int
        {
            $reduction = 0;
            global $conn;

            $query = "  SELECT P.pourcentageReduction AS reduc FROM Promotion P, EnPromo EP WHERE P.idPromotion = EP.idPromotion AND EP.idNumProduit = ? ORDER BY P.idPromotion ASC";
            $pdo = $conn->prepare($query);
            $pdo->execute([$idProduit]);
            while ($promotion = $pdo->fetch()) {
                $reduction = max($reduction, $promotion['reduc']);
            }
            return $reduction;
        }

        function limitHistorique($userId, $maxHistorique = 16)
        {
            global $conn;

            $deleteQuery = "
                DELETE FROM AConsulte
                WHERE idNumCli = :user_id
                AND idNumProduit NOT IN (
                SELECT MyTable.idNumProduit 
                FROM (
                    SELECT idNumProduit
                    FROM AConsulte
                    WHERE idNumCli = :user_id 
                    ORDER BY DateConsultation DESC
                    LIMIT :max_historique) AS MyTable
                )
            ";

            $stmt = $conn->prepare($deleteQuery);
            $stmt->bindParam(':user_id', $userId, PDO::PARAM_INT);
            $stmt->bindValue(':max_historique', $maxHistorique, PDO::PARAM_INT);
            $stmt->execute();
        }


        function getProducts(): array
        {
            global $conn;
            global $selectProducts;

            // Limiter l'historique à 15 articles
            limitHistorique($_SESSION['idClient']);

            $products = [];

            $pdo = $conn->prepare($selectProducts);
            $pdo->bindParam(':user_id', $_SESSION['idClient']);
            $pdo->execute();
            while ($produit = $pdo->fetch()) {
                $id = $produit["idProduit"];
                $products[] = [
                    "idProduit" => $produit["idProduit"],
                    "nomProduit" => $produit["nomProduit"],
                    "nomCategorie" => $produit["nomCategorie"],
                    "prix" => $produit["prix"],
                    "image" => getImages($id)[0] ?? "no-image.jpg",
                    "reduction" => getPromotion($id),
                    "dateConsultation" => $produit["dateConsultation"]
                ];
            }
            return $products;
        }

        $products = getProducts();

        function displayProducts()
        {
            global $products;
            $i = 0;
            foreach ($products as $produit) {
                $i++;
                new_product($i, $produit["idProduit"], $produit["nomProduit"], $produit["nomCategorie"], $produit["prix"], $produit["image"], $produit["reduction"]);
            }
            if ($i < 4) {
                while ($i < 4) {
                    $i++;
                    echo "<div class='grid-item item$i empty'> </div>";
                }
            }
        }
        ?>

        <div class="content">
            <!-- Historique de navigation -->
            <div id="order" class="form-section active">
                <h2>Historique de navigation</h2>
                <h4>Ces articles ont été consultés récemment.<?php if (isset($_GET['message'])): ?>
                        <div class="alert success"><?php echo htmlspecialchars($_GET['message']); ?></div>
                    <?php elseif (isset($_GET['error'])): ?>
                        <div class="alert error"><?php echo htmlspecialchars($_GET['error']); ?></div><?php endif; ?>
                </h4>
                <div class="main grid-container">
                    <?php
                    displayProducts();
                    ?>
                </div>
            </div>
        </div>
    </main>

    <?php
    include "include/footer.php";
    ?>

    <!-- Lien vers le fichier JavaScript -->
    <script>
        function toggleEditMode(sectionId) {
            const section = document.querySelector(`.${sectionId}-section`);
            const viewMode = section.querySelector('.view-mode');
            const editMode = section.querySelector('.edit-mode');

            viewMode.classList.toggle('hidden');
            editMode.classList.toggle('hidden');
        }
    </script>
</body>

</html>
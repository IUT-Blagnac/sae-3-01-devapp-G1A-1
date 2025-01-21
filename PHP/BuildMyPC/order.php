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
            <a href="order.php" class="active">Historique des commandes</a>
            <a href="fidelity.php">Programme de fidélité</a>
            <a href="historique.php">Historique de navigation</a>
            <a href="logout.php">Se Déconnecter</a>
        </div>
        <div class="content">
            <!-- Historique Commande -->

            <!-- Requetes préparées pour récupérer l'historique des commandes de l'utilisateur -->
            <?php
            $req = $conn->prepare('SELECT * FROM Commande WHERE idNumCli = ?');
            $req->execute(array($_SESSION['idClient']));
            $data = $req->fetchAll();

            $orders = [];

            foreach ($data as $row) {
                if ($row['estPanierActuel'] != 1) {
                    $req2 = $conn->prepare('SELECT AC.*, P.nomProduit FROM ACommande AC, Produit P WHERE AC.idCommande = ? AND AC.idNumProduit = P.idNumProduit');
                    $req2->execute(array($row['idCommande']));
                    $data2 = $req2->fetchAll();

                    $details = []; // Crée un tableau pour les produits de cette commande
            
                    foreach ($data2 as $row2) {
                        // Récupérer la première image associée à ce produit
                        $reqContient = $conn->prepare("
                            SELECT I.nomImage AS image
                            FROM Contient C
                            JOIN Image I ON I.idImage = C.idImage
                            WHERE C.idNumProduit = :idNumProduit
                            ORDER BY I.idImage ASC
                            LIMIT 1
                        ");
                        $reqContient->execute(['idNumProduit' => $row2['idNumProduit']]);
                        $productImage = $reqContient->fetchColumn(); // Récupère la première image (ou `false` si aucune)
            
                        // Ajouter les informations du produit avec son image au tableau des détails
                        $details[] = array_merge($row2, ['image' => $productImage]);
                    }

                    $orders[] = [
                        'order' => $row,
                        'details' => $details, // Regroupe tous les produits sous une seule clé
                    ];
                }
                // var_dump(value: $orders);
            }
            ?>
            <div id="order" class="form-section active">
                <h2>Historique des commandes</h2>
                <?php
                if (!empty($orders)) {
                    foreach ($orders as $order) {
                        if (!empty($order['details'])) { // Vérifie si la commande contient des produits
                
                            echo '<div class="view-mode">';
                            echo '<h3>Commande n°' . $order['order']['idCommande'] . '</h3>';
                            echo '<p><strong>Date de commande :</strong> ' . $order['order']['dateCommande'] . '</p>';

                            //Calcul du prix total de la commande
                            $totalPrice = 0;
                            foreach ($order['details'] as $detail) {
                                $totalPrice += $detail['prixAchat'] * $detail['qte'];
                            }
                            echo '<p><strong>Prix total :</strong> ' . $totalPrice . ' €</p>';
                            echo '<button onclick="toggleDetails(\'details-' . $order['order']['idCommande'] . '\', this)">Voir plus de détails</button>';

                            // Affiche les détails de la commande
                            echo '<div id="details-' . $order['order']['idCommande'] . '" class="details hidden">';
                            echo '<h4>Détails de la commande :</h4>';

                            foreach ($order['details'] as $detail) {
                                // echo '<p><strong>Produit :</strong> ' . $detail['idNumProduit'] . '</p>';
                                echo '<a href="detailsProduit.php?id=' . $detail['idNumProduit'] . '"><img src="image/produits/' . $detail['image'] . '" style="max-width: 100px; max-height: 100px; margin-top: 10px;"/></a>';
                                echo '<p><strong>Produit :</strong> ' . $detail['nomProduit'] . '</p>';
                                echo '<p><strong>Quantité :</strong> ' . $detail['qte'] . '</p>';
                                echo '<p><strong>Prix unitaire :</strong> ' . $detail['prixAchat'] . ' €</p>';
                                echo '<hr>';
                            }
                            echo '</div>';
                            echo '</div>';
                        }
                    }
                } else {
                    echo '<div class="view-mode">';
                    echo '<p>Vous n\'avez pas encore passé de commande.</p>';
                    echo '</div>';
                }
                ?>
            </div>
        </div>
    </main>

    <?php
    include "include/footer.php";
    ?>

    <!-- Lien vers le fichier JavaScript -->
    <script>
        function toggleDetails(detailId, button) {
            const detailSection = document.getElementById(detailId);
            detailSection.classList.toggle('hidden');

            // Basculer le texte du bouton entre "Voir plus de détails" et "Fermer"
            if (detailSection.classList.contains('hidden')) {
                button.textContent = "Voir plus de détails";
            } else {
                button.textContent = "Fermer";
            }
        }
    </script>
</body>

</html>
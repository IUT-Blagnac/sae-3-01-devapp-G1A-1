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
                <img src="https://via.placeholder.com/80" alt="Photo de profil">
                <h3><?php echo $_SESSION['prenom'] ?></h3>
            </div>
            <a href="consultCompte.php">Informations personnelles</a>
            <a href="payment.php">Informations de paiement</a>
            <a href="security.php">Sécurité</a>
            <a href="order.php" class="active">Historique des commandes</a>
            <a href="fidelity.php">Programme de fidélité</a>
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
                    $req2 = $conn->prepare('SELECT * FROM ACommande WHERE idCommande = ?');
                    $req2->execute(array($row['idCommande']));
                    $data2 = $req2->fetchAll();

                    $details = []; // Crée un tableau pour les produits de cette commande
                    foreach ($data2 as $row2) {
                        $details[] = $row2; // Ajoute chaque produit à la commande
                    }

                    $orders[] = [
                        'order' => $row,
                        'details' => $details // Regroupe tous les produits sous une seule clé
                    ];
                }
            }
            ?>
            <div id="order" class="form-section active">
                <h2>Historique des commandes</h2>
                <?php
                if (!empty($orders)):
                    foreach ($orders as $order):
                        echo '<div class="view-mode">';
                        echo '<h3>Commande n°' . $order['order']['idCommande'] . '</h3>';
                        echo '<p><strong>Date de commande :</strong> ' . $order['order']['dateCommande'] . '</p>';

                        //Calcul du prix total de la commande
                        $totalPrice = 0;
                        foreach ($order['details'] as $detail) {
                            $totalPrice += $detail['prixAchat'] * $detail['qte'];
                        }
                        echo '<p><strong>Prix total :</strong> ' . $totalPrice . ' €</p>';
                        echo '<button onclick="toggleEditMode(\'order\')">Voir les détails</button>';
                        echo '</div>';
                    endforeach;
                else:
                    echo '<div class="view-mode">';
                    echo '<p>Vous n\'avez pas encore passé de commande.</p>';
                    echo '</div>';
                endif;
                ?>

                <div class="edit-mode hidden">
                    <?php
                    foreach ($order['details'] as $detail): // Parcourt tous les produits de cette commande
                        echo '<p><strong>Produit :</strong> ' . $detail['idNumProduit'] . '</p>';
                        echo '<p><strong>Quantité :</strong> ' . $detail['quantite'] . '</p>';
                        echo '<p><strong>Prix unitaire :</strong> ' . $detail['prix'] . ' €</p>';
                    endforeach;
                    ?>
                    <button onclick="toggleEditMode('order')">Annuler</button>
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

        function toggleEditMode2(sectionId) {
            const section = document.getElementById(sectionId);
            const viewMode = section.querySelector('.view-mode');
            const editMode = section.querySelector('.edit-mode');

            viewMode.classList.toggle('hidden');
            editMode.classList.toggle('hidden');
        }


    </script>
</body>

</html>
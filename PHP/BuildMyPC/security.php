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
            <a href="security.php" class="active">Sécurité</a>
            <a href="order.php">Historique des commandes</a>
            <a href="fidelity.php">Programme de fidélité</a>
            <a href="logout.php">Se Déconnecter</a>
        </div>
        <div class="content">
            <!-- Sécurité -->
            <div id="security" class="form-section active">
                <div class="view-mode">
                    <h2>Sécurité</h2>
                    <p><strong>Changer le mot de passe :</strong></p>
                    <button onclick="toggleEditMode2('security')">Modifier</button>
                </div>
                <div class="edit-mode hidden">
                    <h2>Modifier le mot de passe</h2>
                    <label for="password">Nouveau mot de passe</label>
                    <input type="password" id="password" placeholder="Votre nouveau mot de passe">
                    <label for="confirmPassword">Confirmer le mot de passe</label>
                    <input type="password" id="confirmPassword" placeholder="Confirmer votre mot de passe">
                    <button>Changer le mot de passe</button>
                    <button onclick="toggleEditMode2('security')">Annuler</button>
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
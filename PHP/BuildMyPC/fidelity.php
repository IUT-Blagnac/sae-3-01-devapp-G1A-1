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
            <a href="fidelity.php" class="active">Programme de fidélité</a>
            <a href="historique.php">Historique de navigation</a>
            <a href="logout.php">Se Déconnecter</a>
        </div>
        <div class="content">
            <h2>Programme de fidélité</h2>
            <p>Soon</p>
        </div>
    </main>

    <?php
    include "include/footer.php";
    ?>

    <!-- Lien vers le fichier JavaScript -->
    <script>
        // function showSection(sectionId, element) {
        //     event.preventDefault();

        //     const sections = document.querySelectorAll('.form-section');
        //     sections.forEach(section => section.classList.remove('active'));

        //     document.getElementById(sectionId).classList.add('active');

        //     const links = document.querySelectorAll('.sidebar a');
        //     links.forEach(link => link.classList.remove('active'));
        //     element.classList.add('active');
        // }

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
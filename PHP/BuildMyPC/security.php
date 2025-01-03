<?php
session_start();
if (!isset($_SESSION['login']) || $_SESSION['login'] != 'OK') {
    header('Location: index.php?erreur=Veuillez_passer_par_le_formulaire_de_connexion');
}

$securityFormOpen = isset($_GET['erreurSecurity']) ? true : false;
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
            <a href="security.php" class="active">Sécurité</a>
            <a href="order.php">Historique des commandes</a>
            <a href="fidelity.php">Programme de fidélité</a>
            <a href="historique.php">Historique de navigation</a>
            <a href="logout.php">Se Déconnecter</a>
        </div>
        <div class="content">
            <!-- Sécurité -->
            <div id="security" class="form-section active">
                <div class="view-mode <?php echo $securityFormOpen ? 'hidden' : ''; ?>">
                    <h2>Sécurité</h2>
                    <?php if (isset($_GET['succesSecurity'])) {
                        if ($_GET['succesSecurity'] == 'Ok') {
                            echo ("<label for='password' style='color : GREEN; weight : Bold'> Mot de passe modifié avec succès</label> <br><br>");
                        }
                    } ?>
                    <p><strong>Changer le mot de passe :</strong></p>
                    <button onclick="toggleEditMode('security')">Modifier</button>
                </div>
                <div class="edit-mode <?php echo $securityFormOpen ? '' : 'hidden'; ?>">
                    <form action="update_security.php" method="POST">
                        <h2>Modifier le mot de passe</h2>
                        <label for="currentPassword">Mot de passe actuel</label>
                        <input type="password" id="currentPassword" name="currentPassword" placeholder="Votre mot de passe actuel" required>
                        <?php if (isset($_GET['erreurSecurity'])) {
                            if ($_GET['erreurSecurity'] == 'currentPassword') {
                                echo ("<label for='currentPassword' style='color : RED; weight : Bold'> Le mot de passe actuel est incorrect</label> <br><br>");
                            }
                        } ?>
                        <label for="password">Nouveau mot de passe</label>
                        <input type="password" id="password" name="newPassword" placeholder="Votre nouveau mot de passe" required>
                        <?php if (isset($_GET['erreurSecurity'])) {
                            if ($_GET['erreurSecurity'] == 'password') {
                                echo ("<label for='password' style='color : RED; weight : Bold'> Le nouveau mot de passe et la confirmation ne correspondent pas</label> <br><br>");
                            }
                        } ?>
                        <label for="confirmPassword">Confirmer le mot de passe</label>
                        <input type="password" id="confirmPassword"  name="confirmPassword" placeholder="Confirmer votre mot de passe" required>
                        <?php if (isset($_GET['erreurSecurity'])) {
                            if ($_GET['erreurSecurity'] == 'confirmPassword') {
                                echo ("<label for='confirmPassword' style='color : RED; weight : Bold'>Le nouveau mot de passe et la confirmation ne correspondent pas</label> <br><br>");
                            }
                        } ?>
                        <button>Changer le mot de passe</button>
                    </form>
                    <button onclick="toggleEditMode('security')">Annuler</button>
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
            const section = document.getElementById(sectionId);
            const viewMode = section.querySelector('.view-mode');
            const editMode = section.querySelector('.edit-mode');

            viewMode.classList.toggle('hidden');
            editMode.classList.toggle('hidden');
        }


    </script>
</body>

</html>
<?php session_start(); ?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <link rel="icon" href="image/BuildMyPC_logo.png" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page de Connexion</title>
    <link href="css/formulaireConnexion.css" rel="stylesheet">
</head>

<body>
    <div class="formulaire-creamod">
        <div class="form-container-2">
            <div class="comeback">
                <a href="index.php"><span>&#8592; Accueil</span></a>
            </div>
            <h1>Page de connexion</h1>

            <form method="post" id="ConecCompte" action="traitConnexion.php">
                <label for="login">Entrez vos identifiants de connexion :</label>
                <?php
                if(isset($_GET['Login'])){
                    echo("<input type='login' id='login' name='login' placeholder='Adresse mail' value=".$_GET['Login']."    required>");
                }
                else{
                    echo("<input type='login' id='login' name='login' placeholder='Adresse mail' required>");
                }
                if (isset($_GET['Erreur'])) {
                    if ($_GET['Erreur'] == 'noAcc') {
                        echo ("<label for='login' style='color : RED; weight : Bold'> Login incorrect</label>");
                    }
                }
                ?>
                <input type="password" id="mdp" name="mdp" placeholder="Mot de passe" required>
                <?php
                if (isset($_GET['Erreur'])) {
                    if ($_GET['Erreur'] == 'mdpInc') {
                        echo ("<label for='login' style='color : RED; weight : Bold'> Mot de passe incorrect</label>");
                    }
                }
                ?>
                <div class="container">
                    <input type="checkbox" id="remember" name="remember">
                    <label for="remember">Se souvenir de moi</label>
                </div>

                <button type="submit" id="submitButton">Soumettre</button>

            </form>
            <div class="redirection">
                <p> Pour créer un compte, cliquez <a href="formCreation.php">ici</a> </p>
            </div>
        </div>
    </div>

</body>

</html>
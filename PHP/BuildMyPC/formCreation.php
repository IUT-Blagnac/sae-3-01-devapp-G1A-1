<?php session_start(); ?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <link rel="icon" href="image/BuildMyPC_logo.png" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page de création de compte</title>
    <link href="css/formulaireCreation.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
</head>

<body>
    <div class="formulaire-creamod">
        <div class="form-container-2">
            <div class="comeback">
                <a href="index.php"><span>&#8592; Accueil</span></a>
            </div>
            <h1>Page de création de compte</h1>
            <form method="post" id="creaCompte" action="traitCreation.php" onsubmit="process()">
                <label for="prenom">Prenom * :</label>
                <input type="prenom" id="prenom" name="prenom" placeholder="Prenom" required>
                <label for="nom">Nom * :</label>
                <input type="nom" id="nom" name="nom" placeholder="Nom" required>
                <label for="pays">Pays * :</label>
                <input type="pays" id="pays" name="pays" placeholder="Pays" required>
                <label for="cdpostal">Code postal * :</label>
                <input type="cdpostal" id="cdpostal" name="cdpostal" placeholder="Code postal" required>
                <label for="ville">Ville * :</label>
                <input type="ville" id="ville" name="ville" placeholder="Ville" required>
                <label for="adr">Adresse * :</label>
                <input type="adr" id="adr" name="adr" placeholder="Rue et n° de rue" required>
                <label for="phone">Numéro de téléphone * :</label>
                <input type="tel" id="phone" name="numtel" required>
                <?php
                if (isset($_GET['Erreur']) && $_GET['Erreur'] == "Ftel") {
                    echo ("<label for='phone' style='color : RED; weight : Bold'> numero de téléphone incorrect </label>");
                }
                ?>
                <label for="mail">Adresse mail * :</label>
                <input type="email" id="mail" name="mail" placeholder="Exemple@typemail.com" required>
                <?php
                if (isset($_GET['Erreur'])) {
                    if ($_GET['Erreur'] == "Fmail") {
                        echo ("<label for='phone' style='color : RED; weight : Bold'> mail incorrect </label>");
                    } elseif ($_GET['Erreur'] == "FmailEXI") {
                        echo ("<label for='phone' style='color : RED; weight : Bold'> mail deja existant, veuillez vous connecter </label>");
                    }
                }
                ?>
                <div class="password-container">
                    <label for="mdp">Mot de passe * :</label>
                    <input type="password" id="mdp" name="mdp"
                        placeholder="Minimum 8 caractères, 1 majuscule et 1 chiffre" required>
                    <?php
                    if (isset($_GET['Erreur']) && $_GET['Erreur'] == "Fmdp") {
                        echo ("<label for='phone' style='color : RED; weight : Bold'> mot de passe incorrect </label>");
                    }
                    ?>
                    <div class="container">
                        <input type="checkbox" onclick="myFunction()" id="show" name="show">
                        <span class="checkbox-container"></span>
                        <label id="btn" for="show">Afficher mot de passe</label>
                    </div>
                </div>
                <div class="container-2">
                    <input type="checkbox" id="remember" name="remember">
                    <span class="checkbox-container"></span>
                    <label id="btn" for="remember">Se souvenir de moi</label>
                </div>

                <button type="submit" id="submitButton">Soumettre</button>

            </form>
            <div class="redirection">
                <p> Vous avez déjà un compte ? Cliquez <a href="formConnexion.php">ici pour vous connecter.</a> </p>
            </div>

            <script>
                function myFunction() {
                    var x = document.getElementById("mdp");
                    if (x.type === "password") {
                        x.type = "text";
                    } else {
                        x.type = "password";
                    }
                }
            </script>
            <script>
                const phoneInputField = document.querySelector("#phone");
                const phoneInput = window.intlTelInput(phoneInputField, {
                    preferredCountries: ["fr", "it", "gb", "es", "de"],
                    utilsScript: "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
                });

                function process() {
                    const phoneNumber = phoneInput.getNumber();
                    document.getElementById("phone").value = phoneNumber;
                    info.style.display = "";
                }
            </script>
        </div>
    </div>

</body>

</html>
<?php
session_start();
if (!isset($_SESSION['login']) || $_SESSION['login'] != 'OK') {
    header('Location: index.php?erreur=Veuillez_passer_par_le_formulaire_de_connexion');
}
include 'include/connect.inc.php';

// Récupération des données du client
$req = $conn->prepare('SELECT * FROM Client WHERE idNumCli = ?');
$req->execute([$_SESSION['idClient']]);
$data = $req->fetch();

// Requête pour récupérer les informations principales de l'adresse
$queryAdresse = $conn->prepare("SELECT * 
                                FROM AdressePostale a, Client c
                                WHERE a.idAdresse = c.idAdresse
                                AND idNumCli = ?");
$queryAdresse->execute([$data['idNumCli']]);
$Adresse = $queryAdresse->fetch(PDO::FETCH_ASSOC);

if (!$Adresse) {
    die("Adresse introuvable.");
}

$Livrason = true;
$validation = false;

$Paypal = false;
$CB_UE = false;
$CB_AE = false;

if (isset($_GET['test']) && $_GET['test'] == 1) {

    $Livrason = false;
    $validation = true;

    $pays = $_POST['pays'] ?? '';
    $cdpostal = $_POST['cdpostal'] ?? '';
    $ville = $_POST['ville'] ?? '';
    $adr = $_POST['adr'] ?? '';

    if (isset($_GET['test']) && $_GET['test'] == 1 && isset($_GET['Paypal']) && $_GET['Paypal'] == 1) {
        $Paypal = true;
        $CB_UE = false;
        $CB_AE = false;

        $email = $_POST['cardname'] ?? '';
        $mdp = $_POST['mdp'] ?? '';

    } elseif (isset($_GET['test']) && $_GET['test'] == 1 && isset($_GET['CB_UE']) && $_GET['CB_UE'] == 1) {
        $Paypal = false;
        $CB_UE = true;
        $CB_AE = false;

        $Nom = $_POST['cardname'] ?? '';
        $NumCarte = $_POST['cardnumber'] ?? '';
        $ExpMonth = $_POST['expmonth'] ?? '';
        $CVV = $_POST['cvv'] ?? '';

    } elseif (isset($_GET['test']) && $_GET['test'] == 1 && isset($_GET['CB_AE']) && $_GET['CB_AE'] == 1) {
        $Paypal = false;
        $CB_UE = false;
        $CB_AE = true;

        $Nom = $_POST['cardname'] ?? '';
        $NumCarte = $_POST['cardnumber'] ?? '';
        $ExpMonth = $_POST['expmonth'] ?? '';
        $CVV = $_POST['cvv'] ?? '';
    }

}

if (isset($_GET['reset']) && $_GET['reset'] == 1) {
    $Livrason = true;
    $validation = false;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $req = $conn->prepare('SELECT * FROM Client WHERE idNumCli = ?');
    $req->execute([$_SESSION['idClient']]);
    $data = $req->fetch();
    try {
        $stmt = $conn->prepare("CALL ValiderCommande(:idNumCli)");
        $stmt->bindParam(':idNumCli', $data['idNumCli'], PDO::PARAM_INT);
        $stmt->execute();

        header('Location: panier.php?success=1');
        exit;
    } catch (PDOException $e) {
        header('Location: panier.php?error=1');
        exit;
    }
}
?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <link rel="icon" href="image/BuildMyPC_logo.png" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lieu de livraison</title>
    <link href="css/panierLivraison.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js"></script>
</head>

<body>
    <?php if ($Livrason): ?>
        <div class="formulaire-creamod">
            <div class="form-container-2">
                <div class="comeback">
                    <a href="panier.php"><span>&#8592; Panier </span></a>
                </div>
                <h1>Lieu de livraison</h1>
                <label for="pays">Pays :</label>
                <input type="text" id="pays" name="pays" placeholder="Pays"
                    value="<?php echo htmlspecialchars($Adresse['pays']); ?>" required>
                <label for="cdpostal">Code postal :</label>
                <input type="text" id="cdpostal" name="cdpostal" placeholder="Code postal"
                    value="<?php echo htmlspecialchars($Adresse['codePostal']); ?>" required>
                <label for="ville">Ville :</label>
                <input type="text" id="ville" name="ville" placeholder="Ville"
                    value="<?php echo htmlspecialchars($Adresse['ville']); ?>" required>
                <label for="adr">Adresse :</label>
                <input type="text" id="adr" name="adr" placeholder="Rue et n° de rue"
                    value="<?php echo htmlspecialchars($Adresse['numNomRue']); ?>" required>
                <div class="suivant">
                    <a href="?test=1"><span class="doite">Suivant &#x2192;</span></a>
                </div>
            </div>
        </div>

    <?php elseif ($validation === true && $Livrason === false): ?>
        <div class="formulaire-creamod">
            <div class="form-container-2">
                <div class="comeback">
                    <a href="?reset=1"><span class="gauche">&#8592; Revenir en arrière </span></a>
                </div>
                <h1>Moyen de payment</h1>

                <div class="button-container">
                    <a href="?test=1&Paypal=1" class="button doite">Paypal</a>
                    <a href="?test=1&CB_UE=1" class="button doite">CB_UE</a>
                    <a href="?test=1&CB_AE=1" class="button doite">CB_AE</a>
                </div>

                <?php if ($Paypal): ?>
                    <form method="post" id="creaCompte" action="">
                        <label for="cname" classe="texte-payment">Adresse email</label>
                        <input type="text" id="cname" name="cardname" placeholder="exemple@gmail.com" required>
                        <label for="ccnum" classe="texte-payment">Mots de passe </label>
                        <input type="password" id="mdp" name="mdp" placeholder="Mot de passe" required>

                        <button type="submit" id="submitButton">Soumettre</button>
                    </form>

                <?php elseif ($CB_UE): ?>
                    <form method="post" id="creaCompte" action="">
                        <label for="cname" classe="texte-payment">Nom sur la Carte</label>
                        <input type="text" id="cname" name="cardname" placeholder="Jean Cérien" required>
                        <label for="ccnum" classe="texte-payment">Numéro de la Carte</label>
                        <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444" required>

                        <div class="row">
                            <div class="col-50">
                                <label for="expmonth" classe="texte-payment">Date d'expiration</label>
                                <input type="text" id="expmonth" name="expmonth" placeholder="09/25" required>
                            </div>
                            <div class="col-50">
                                <label for="cvv" classe="texte-payment">CVV</label>
                                <input type="text" id="cvv" name="cvv" placeholder="352" required>
                            </div>
                        </div>

                        <button type="submit" id="submitButton">Soumettre</button>
                    </form>

                <?php elseif ($CB_AE): ?>
                    <form method="post" id="creaCompte" action="">
                        <label for="cname" classe="texte-payment">Nom sur la Carte</label>
                        <input type="text" id="cname" name="cardname" placeholder="John More Doe" required>
                        <label for="ccnum" classe="texte-payment">Numéro de la Carte</label>
                        <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-444" required>

                        <div class="row">
                            <div class="col-50">
                                <label for="expmonth" classe="texte-payment">Date d'expiration</label>
                                <input type="text" id="expmonth" name="expmonth" placeholder="26/07" required>
                            </div>
                            <div class="col-50">
                                <label for="cvv" classe="texte-payment">CVV</label>
                                <input type="text" id="cvv" name="cvv" placeholder="352" required>
                            </div>
                        </div>

                        <button type="submit" id="submitButton">Soumettre</button>
                    </form>

                <?php endif; ?>
            </div>
        </div>
    <?php endif; ?>
</body>

</html>
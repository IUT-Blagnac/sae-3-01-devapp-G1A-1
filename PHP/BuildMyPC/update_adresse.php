<?php
session_start();
include 'include/connect.inc.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $address = htmlspecialchars($_POST['address']);
    $city = htmlspecialchars($_POST['city']);
    $zip = htmlspecialchars($_POST['zip']);

    $errors = [];
    if (empty($address) || empty($city) || empty($zip)) {
        $errors[] = 'Tous les champs sont obligatoires.';
        header(header: 'location: consultCompte.php?Erreur2=champsVides');
        exit();
    }

    if (!preg_match("/^[0-9]{5}$/", $zip)) {
        $errors[] = 'Le code postal doit comporter exactement 5 chiffres.';
        header(header: 'location: consultCompte.php?Erreur2=zipInc');
        exit();
    }

    // if (!empty($errors)) {
    //     //Gérer les erreurs
    //     echo '<h3>Erreurs :</h3>';
    //     echo '<ul>';
    //     foreach ($errors as $error) {
    //         echo '<li>' . htmlspecialchars($error) . '</li>';
    //     }
    //     echo '</ul>';
    //     echo '<a href="consultCompte.php">Retour</a>';
    //     exit;
    // }

    try {
        $req = $conn->prepare('UPDATE AdressePostale SET numNomRue = ?, ville = ?, codePostal = ? WHERE idAdresse = (SELECT idAdresse FROM Client WHERE idNumCli = ?)');
        $req->execute([$address, $city, $zip, $_SESSION['idClient']]);

        header('Location: consultCompte.php?success=1');
        exit;
    } catch (Exception $e) {
        echo '<h3>Erreur :</h3>';
        echo '<p>Une erreur est survenue : ' . htmlspecialchars($e->getMessage()) . '</p>';
        echo '<a href="consultCompte.php">Retour</a>';
    }
}
?>

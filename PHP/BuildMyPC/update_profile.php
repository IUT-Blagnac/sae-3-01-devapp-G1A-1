<?php
session_start();
include 'include/connect.inc.php';

// Vérifier que le formulaire a été soumis
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Récupérer les données envoyées par le formulaire
    $firstName = htmlspecialchars($_POST['firstName']);
    $lastName = htmlspecialchars($_POST['lastName']);
    $email = htmlspecialchars($_POST['email']);
    $phone = htmlspecialchars($_POST['phone']);

    // Initialiser un tableau d'erreurs
    $errors = [];
    if (empty($firstName) || empty($lastName) || empty($email) || empty($phone)) {
        $errors[] = 'Tous les champs sont obligatoires.';
    }    

    $namePattern = "/^[a-zA-ZÀ-ÿ\s\-]+$/";
    $emailPattern = "/^[a-zA-Z0-9._-]+@+[a-zA-Z0-9._-]{2,}\.[a-z]{2,4}$/";
    $phonePattern = "/^[+]/";

    // Validation des champs
    if (!preg_match($namePattern, $firstName)) {
        $errors[] = 'Le prénom contient des caractères invalides.';
        header(header: 'location: consultCompte.php?Erreur=prenomInc');
        exit;
    }
    if (!preg_match($namePattern, $lastName)) {
        $errors[] = 'Le nom contient des caractères invalides.';
        header(header: 'location: consultCompte.php?Erreur=nomInc');
        exit;
    }
    if (!preg_match($emailPattern, $email)) {
        $errors[] = 'L’adresse e-mail n’est pas valide.';
        header(header: 'location: consultCompte.php?Erreur=emailInc');
        exit;
    }
    if (!preg_match($phonePattern, $phone)) {
        $errors[] = 'Le numéro de téléphone n’est pas valide. Il doit commencer par un signe +.';
        header(header: 'location: consultCompte.php?Erreur=phoneInc');
        exit;
    }

    // Si des erreurs existent, les afficher
    // if (!empty($errors)) {
    //     echo '<h3>Erreurs :</h3>';
    //     echo '<ul>';
    //     foreach ($errors as $error) {
    //         echo '<li>' . htmlspecialchars($error) . '</li>';
    //     }
    //     echo '</ul>';
    //     echo '<a href="consultCompte.php">Retour</a>'; // Lien pour revenir au formulaire
    //     exit;
    // }

    // Si tout est valide, mettre à jour la base de données
    try {
        $req = $conn->prepare('UPDATE Client SET prenom = ?, nom = ?, email = ?, telephone = ? WHERE idNumCli = ?');
        $req->execute([$firstName, $lastName, $email, $phone, $_SESSION['idClient']]);

        // echo '<h3>Succès :</h3>';
        // echo '<p>Les informations ont été mises à jour avec succès.</p>';
        header(header: 'location: consultCompte.php?succesSecurity=Ok');
    } catch (Exception $e) {
        echo '<h3>Erreur :</h3>';
        echo '<p>Une erreur est survenue lors de la mise à jour : ' . htmlspecialchars($e->getMessage()) . '</p>';
        echo '<a href="consultCompte.php">Retour</a>';
    }
}
?>


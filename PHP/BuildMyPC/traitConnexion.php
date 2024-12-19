<?php
session_start();
include("include/connect.inc.php");
if (isset($_POST['login']) && ($_POST['mdp'])) {

    //Partie Cookie
    if (isset($_POST["remember"])) {
        setcookie('cBuildMyPC', $_POST['login'], time() + 60 * 5);
    }

    $l = htmlspecialchars($_POST['login']);
    $mdp = htmlspecialchars($_POST['mdp']);
    $mdpH = hash('sha256', $mdp);
    $login = strtolower($l);
    if (preg_match("#@buildmypc.com$#", $login)) {
        $testLog = $conn->prepare("SELECT idNumEmploye,mdp, prenom, administrateur FROM Employe WHERE email = :idMail");
        $testLog->bindParam(':idMail', $login);
        $testLog->execute();
        $result = $testLog->fetch(PDO::FETCH_ASSOC);
    } else {
        $testLog = $conn->prepare("SELECT idNumCli,mdp, prenom FROM Client WHERE email = :idMail");
        $testLog->bindParam(':idMail', $login);
        $testLog->execute();
        $result = $testLog->fetch(PDO::FETCH_ASSOC);
    }
    if ($result) {
        if ($result) {
            if ($result['mdp'] == $mdpH) {
                $_SESSION['login'] = 'OK';
                $_SESSION['prenom'] = $result['prenom'];
                if (isset($result['administrateur'])) {
                    $_SESSION['idEmp'] = $result['idNumEmploye'];
                    if ($result['administrateur'] == 1) {
                        $_SESSION['isAdmin'] = 'True';
                    }

                } else {
                    $_SESSION['idClient'] = $result['idNumCli'];
                }
                header('location: index.php');
                die();
            } else {
                // Mot de passe incorrect
                header(header: "location: formConnexion.php?Erreur=mdpInc&Login=" . $_POST['login']);
            }
        } else {
            // Erreur inconnue
            header(header: 'location: formConnexion.php?Erreur=toAcc');
        }
    } else {
        // Aucun utilisateur correspondant
        header(header: 'location: formConnexion.php?Erreur=noAcc');
    }
}

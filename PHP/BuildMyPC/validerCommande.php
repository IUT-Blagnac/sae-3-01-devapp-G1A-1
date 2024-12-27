<?php
session_start(); 

    include 'include/connect.inc.php'; 

    $req = $conn->prepare('SELECT * FROM Client WHERE idNumCli = ?');
    $req->execute(array($_SESSION['idClient']));
    $data = $req->fetch(); 

    try {
        $statment = $conn->prepare("CALL ValiderCommande(:idNumCli)");
        $statment->bindParam(':idNumCli', $data['idNumCli'], PDO::PARAM_INT);
        $statment->execute();   

        header('Location: panier.php?success=1');
        exit;
    } catch (PDOException $e) {
        header('Location: panier.php?error=1');
        exit;
    }

?>

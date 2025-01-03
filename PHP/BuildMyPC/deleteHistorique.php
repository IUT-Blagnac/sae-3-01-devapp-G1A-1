<?php
session_start();
if (!isset($_SESSION['login']) || $_SESSION['login'] != 'OK') {
    header('Location: index.php?erreur=Veuillez_passer_par_le_formulaire_de_connexion');
    exit;
}

include "include/connect.inc.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['idProduit'])) {
    $idProduit = intval($_POST['idProduit']);
    $userId = $_SESSION['idClient'];

    $query = "DELETE FROM AConsulte WHERE idNumProduit = :idProduit AND idNumCli = :userId";
    $pdo = $conn->prepare($query);
    $pdo->bindParam(':idProduit', $idProduit);
    $pdo->bindParam(':userId', $userId);

    if ($pdo->execute()) {
        header('Location: historique.php?message=Produit supprimé');
    } else {
        header('Location: historique.php?error=Erreur lors de la suppression');
    }
    exit;
}
?>

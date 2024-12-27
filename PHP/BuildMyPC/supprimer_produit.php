<?php
session_start(); 

if (!isset($_SESSION['idClient']) || !isset($_POST['idProduit'])) {
    die("Accès interdit.");
}

include 'include/connect.inc.php'; 

$idProduit = $_POST['idProduit'];
$idClient = $_SESSION['idClient']; 

$query = $conn->prepare("DELETE FROM ACommande WHERE idNumProduit = ? AND idCommande IN (SELECT idCommande FROM Commande WHERE idNumCli = ?)");
$query->execute([$idProduit, $idClient]);

if ($query->rowCount() > 0) {
    header("Location: panier.php");
    exit();
} else {
    echo "Une erreur est survenue lors de la suppression du produit.";
}

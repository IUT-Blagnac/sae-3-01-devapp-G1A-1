<?php
session_start();
if (!isset($_SESSION['login']) || $_SESSION['login'] != 'OK') {
    header('Location: index.php?erreur=Veuillez_passer_par_le_formulaire_de_connexion');
}
include 'include/connect.inc.php';

$idClient = $_SESSION['idClient'];

if(isset($_GET['id'])){
    $idProduit = intval($_GET['id']); // Récupération de l'ID du produit depuis l'URL
}
// Vérifier si l'ID du produit est valide
if (empty($idProduit)) {
    echo "ID du produit non valide.";
    exit();
}

// Récupérer l'ID de la commande actuelle
$queryPanier = "SELECT idCommande FROM Commande WHERE idNumCli = :idClient AND estPanierActuel = 1 LIMIT 1";
$stmt = $conn->prepare($queryPanier);
$stmt->bindParam(':idClient', $idClient, PDO::PARAM_INT);
$stmt->execute();
$row = $stmt->fetch(PDO::FETCH_ASSOC);

if ($row) {
    $idCommande = $row['idCommande'];
} else {
    echo "Aucune commande active trouvée.";
    exit();
}

// Vérifier si le produit existe déjà dans le panier
$queryExiste = "SELECT qte FROM ACommande WHERE idCommande = :idCommande AND idNumProduit = :idProduit";
$stmt = $conn->prepare($queryExiste);
$stmt->bindParam(':idCommande', $idCommande, PDO::PARAM_INT);
$stmt->bindParam(':idProduit', $idProduit, PDO::PARAM_INT);
$stmt->execute();
$row = $stmt->fetch(PDO::FETCH_ASSOC);

if ($row) {
    // Mettre à jour la quantité existante
    $newQte = $row['qte'] + 1;
    $updateQte = "UPDATE ACommande SET qte = :newQte WHERE idCommande = :idCommande AND idNumProduit = :idProduit";
    $stmt = $conn->prepare($updateQte);
    $stmt->bindParam(':newQte', $newQte, PDO::PARAM_INT);
    $stmt->bindParam(':idCommande', $idCommande, PDO::PARAM_INT);
    $stmt->bindParam(':idProduit', $idProduit, PDO::PARAM_INT);
    $stmt->execute();
} else {
    // Insérer un nouveau produit dans ACommande
    // Récupérer le prix actuel du produit
    $queryPrix = "SELECT prix FROM Produit WHERE idNumProduit = :idProduit";
    $stmt = $conn->prepare($queryPrix);
    $stmt->bindParam(':idProduit', $idProduit, PDO::PARAM_INT);
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($row) {
        $prixAchat = $row['prix'];
        $insertACommande = "INSERT INTO ACommande (idCommande, idNumProduit, qte, prixAchat) VALUES (:idCommande, :idProduit, 1, :prixAchat)";
        $stmt = $conn->prepare($insertACommande);
        $stmt->bindParam(':idCommande', $idCommande, PDO::PARAM_INT);
        $stmt->bindParam(':idProduit', $idProduit, PDO::PARAM_INT);
        $stmt->bindParam(':prixAchat', $prixAchat, PDO::PARAM_STR);
        $stmt->execute();
    } else {
        echo "Produit introuvable.";
        exit();
    }
}
header("Location: panier.php");
exit();
?>

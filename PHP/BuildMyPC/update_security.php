<?php
session_start();

if (!isset($_SESSION['idClient'])) {
    echo "Erreur : Utilisateur non authentifié.";
    exit;
}

include 'include/connect.inc.php';

// Vérification que le formulaire a été soumis
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $currentPassword = htmlspecialchars($_POST['currentPassword']);
    $newPassword = htmlspecialchars($_POST['newPassword']);
    $confirmPassword = htmlspecialchars($_POST['confirmPassword']);

    $userId = $_SESSION['idClient'];

    $sql = "SELECT mdp FROM Client WHERE idNumCli = :idNumCli";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':idNumCli', $userId);
    $stmt->execute();
    $result = $stmt->fetch();

    $currentMdp_hash = hash('sha256', $currentPassword);

    if ($currentMdp_hash !== $result['mdp']) {
        // echo "Erreur : Le mot de passe actuel est incorrect.";
        header(header: 'location: security.php?erreurSecurity=currentPassword');
        exit;
    }

    if ($newPassword !== $confirmPassword) {
        // echo "Erreur : Le nouveau mot de passe et la confirmation ne correspondent pas.";
        header(header: 'location: security.php?erreurSecurity=password');
        exit;
    }

    $hashedPassword = hash('sha256', $newPassword);

    $updateSql = "UPDATE Client SET mdp = :mdp WHERE idNumCli = :idNumCli";
    $updateStmt = $conn->prepare($updateSql);
    $updateStmt->bindParam(':mdp', $hashedPassword);
    $updateStmt->bindParam(':idNumCli', $userId);

    if ($updateStmt->execute()) {
        // echo "Mot de passe mis à jour avec succès.";
        header(header: 'location: security.php?succesSecurity=Ok');
    } else {
        echo "Erreur : Impossible de mettre à jour le mot de passe.";
    }
} else {
    echo "Erreur : Aucune donnée soumise.";
}
?>
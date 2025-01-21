<?php
session_start();
include 'include/connect.inc.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $idCarte = $_POST['idCarte'] ?? null;
    $idMethodePaiement = $_POST['idMethodePaiement'] ?? null;

    if (!$idCarte || !$idMethodePaiement) {
        header('Location: payment.php?erreur=Champs_manquants');
        exit;
    }

    switch ($idMethodePaiement) {
        case 'Visa':
        case 'MasterCard':
            $numCarte = $_POST['numCarte'] ?? null;
            $dateExp = $_POST['dateExp'] ?? null;

            // Validation des champs
            if (!preg_match('/^\d{16}$/', $numCarte)) {
                header('Location: payment.php?erreur=Numéro_de_carte_invalide');
                exit;
            }
            if (!preg_match('/^\d{4}\-\d{2}\-\d{2}$/', $dateExp)) { // Format YY/MM/DD
                header('Location: payment.php?erreur=Date_d_expiration_invalide');
                exit;
            }

            // Mise à jour en base de données
            $query = "UPDATE Carte_EU SET numCarte = ?, dateExp = ? WHERE idCarte = ?";
            $stmt = $conn->prepare($query);
            $stmt->execute([$numCarte, $dateExp, $idCarte]);
            break;

        case 'Carte_AE':
            $numCarte = $_POST['numCarte'] ?? null;
            $dateExp = $_POST['dateExp'] ?? null;

            // Validation des champs
            if (!preg_match('/^\d{15}$/', $numCarte)) {
                header('Location: payment.php?erreur=Numéro_de_carte_invalide');
                exit;
            }
            if (!preg_match('/^\d{4}\-\d{2}\-\d{2}$/', $dateExp)) { // Format MM/YY
                header('Location: payment.php?erreur=Date_d_expiration_invalide');
                exit;
            }

            // Mise à jour en base de données
            $query = "UPDATE Carte_AE SET numCarte = ?, dateExp = ? WHERE idCarte = ?";
            $stmt = $conn->prepare($query);
            $stmt->execute([$numCarte, $dateExp, $idCarte]);
            break;

        case 'Paypal':
            $email = $_POST['email'] ?? null;
            $mdp = $_POST['mdp'] ?? null;

            // Validation des champs
            if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                header('Location: payment.php?erreur=Email_invalide');
                exit;
            }
            if (empty($mdp)) {
                header('Location: payment.php?erreur=Mot_de_passe_invalide');
                exit;
            }

            // Mise à jour en base de données
            $query = "UPDATE Paypal SET email = ?, mdp = ? WHERE idCarte = ?";
            $stmt = $conn->prepare($query);
            $stmt->execute([$email, $mdp, $idCarte]);
            break;

        default:
            header('Location: payment.php?erreur=Méthode_de_paiement_non_reconnue');
            exit;
    }

    // Redirection après la mise à jour
    header('Location: payment.php?success=Méthode_de_paiement_mise_à_jour');
    exit;
} else {
    header('Location: payment.php');
    exit;
}
?>

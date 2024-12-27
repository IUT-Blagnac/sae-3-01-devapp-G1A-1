<?php
session_start();
if (!isset($_SESSION['login']) || $_SESSION['login'] != 'OK') {
    header('Location: index.php?erreur=Veuillez_passer_par_le_formulaire_de_connexion');
}
?>

<!DOCTYPE html>
<html lang="fr">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuildMyPC</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/consultCompte.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="icon" href="image/BuildMyPC_logo.png" />
</head>

<body>
    <!-- Header principal -->
    <?php include 'include/header.php'; ?>

    <!-- Contenu principal -->
    <main>
        <div class="sidebar">
            <div class="user-info">
                <img src="image/BuildMyPC_logo.png" alt="Photo de profil">
                <h3><?php echo $_SESSION['prenom'] ?></h3>
            </div>
            <a href="consultCompte.php">Informations personnelles</a>
            <a href="payment.php" class="active">Informations de paiement</a>
            <a href="security.php">Sécurité</a>
            <a href="order.php">Historique des commandes</a>
            <a href="fidelity.php">Programme de fidélité</a>
            <a href="historique.php">Historique de navigation</a>
            <a href="logout.php">Se Déconnecter</a>
        </div>
        <div class="content">
            <!-- Informations de paiement -->

            <!-- Requete préparée pour récupérer les informations de paiement de l'utilisateur -->
            <?php
            $query = "SELECT c.idCarte, c.idMethodePaiement, m.nomMethodePaiement,
                    CASE 
                        WHEN m.nomMethodePaiement = 'Visa' OR m.nomMethodePaiement = 'MasterCard' THEN 'Carte_EU'
                        WHEN m.nomMethodePaiement = 'Carte_AE' THEN 'Carte_AE'
                        WHEN m.nomMethodePaiement = 'Paypal' THEN 'Paypal'
                    END AS tableName
                FROM 
                    Client cl
                JOIN 
                    infoPaiement c ON cl.idNumCli = c.idNumCli
                JOIN 
                    MethodePaiement m ON c.idMethodePaiement = m.idMethodePaiement
                WHERE 
                    cl.idNumCli = ?
            ";
            $req = $conn->prepare($query);
            $req->execute(array($_SESSION['idClient']));
            $data = $req->fetchAll();

            $paymentDetails = [];

            $tableQueries = [
                'Carte_EU' => 'SELECT numCarte, dateExp FROM Carte_EU WHERE idCarte = ?',
                'Carte_AE' => 'SELECT numCarte, dateExp FROM Carte_AE WHERE idCarte = ?',
                'Paypal' => 'SELECT email, mdp FROM Paypal WHERE idCarte = ?'
            ];

            foreach ($data as $row) {
                $methodName = $row['nomMethodePaiement'];
                $tableName = $row['tableName'];

                if (isset($tableQueries[$tableName])) {
                    $req2 = $conn->prepare($tableQueries[$tableName]);
                    $req2->execute(array($row['idCarte']));
                    $details = $req2->fetch();

                    if ($details) {
                        $paymentDetails[] = [
                            'methodName' => $methodName,
                            'type' => $tableName === 'Paypal' ? 'paypal' : 'card',
                            'details' => $details,
                            'idCarte' => $row['idCarte']
                        ];
                    }
                }
            }
            ?>


            <div id="payment" class="form-section active">
                <div class="payment-section">
                    <h2>Vos informations de paiement</h2>
                    <?php if (!empty($paymentDetails)): ?>
                        <?php foreach ($paymentDetails as $payment): ?>
                            <div class="payment-item" id="payment-<?= htmlspecialchars($payment['idCarte']) ?>">
                                <!-- Vue en mode affichage -->
                                <div class="view-mode">
                                    <h3>Méthode : <?= htmlspecialchars($payment['methodName']) ?></h3>
                                    <?php if ($payment['type'] === 'card'): ?>
                                        <p><strong>Numéro de carte :</strong> **** **** ****
                                            <?= htmlspecialchars(substr($payment['details']['numCarte'], -4)) ?>
                                        </p>
                                        <p><strong>Date d'expiration :</strong>
                                            <?= htmlspecialchars($payment['details']['dateExp']) ?></p>
                                    <?php elseif ($payment['type'] === 'paypal'): ?>
                                        <p><strong>Email :</strong> <?= htmlspecialchars($payment['details']['email']) ?></p>
                                        <p><strong>Mot de passe :</strong> ********</p>
                                    <?php endif; ?>
                                    <button
                                        onclick="toggleEditMode(<?= htmlspecialchars($payment['idCarte']) ?>)">Modifier</button>
                                </div>

                                <!-- Vue en mode édition -->
                                <div class="edit-mode hidden">
                                    <h3>Éditer la méthode : <?= htmlspecialchars($payment['methodName']) ?></h3>
                                    <form action="update_payment.php" method="POST">
                                        <input type="hidden" name="idCarte" value="<?= htmlspecialchars($payment['idCarte']) ?>">
                                        <input type="hidden" name="idMethodePaiement" value="<?= htmlspecialchars($payment['methodName']) ?>">
                                        <?php if ($payment['type'] === 'card'): ?>
                                            <label for="cardNumber-<?= htmlspecialchars($payment['idCarte']) ?>">Numéro de
                                                carte</label>
                                            <input type="text" id="cardNumber-<?= htmlspecialchars($payment['idCarte']) ?> " name="numCarte" 
                                                value="<?= htmlspecialchars($payment['details']['numCarte']) ?>" required>
                                            <label for="expiry-<?= htmlspecialchars($payment['idCarte']) ?>">Date
                                                d'expiration</label>
                                            <input type="text" id="expiry-<?= htmlspecialchars($payment['idCarte']) ?>" name="dateExp"
                                                value="<?= htmlspecialchars($payment['details']['dateExp']) ?>" required>
                                        <?php elseif ($payment['type'] === 'paypal'): ?>
                                            <label for="email-<?= htmlspecialchars($payment['idCarte']) ?>">Email</label>
                                            <input type="email" id="email-<?= htmlspecialchars($payment['idCarte']) ?>" name="email"
                                                value="<?= htmlspecialchars($payment['details']['email']) ?>" required>
                                            <label for="password-<?= htmlspecialchars($payment['idCarte']) ?>">Mot de passe</label>
                                            <input type="password" id="password-<?= htmlspecialchars($payment['idCarte']) ?>" name="mdp"
                                                value="<?= htmlspecialchars($payment['details']['mdp']) ?>" required>
                                        <?php endif; ?>
                                        <button>Enregistrer les modifications</button>
                                    </form>
                                    <button
                                        onclick="toggleEditMode(<?= htmlspecialchars($payment['idCarte']) ?>)">Annuler</button>
                                </div>
                            </div>
                        <?php endforeach; ?>

                    <?php else: ?>
                        <p>Aucune méthode de paiement enregistrée sur votre compte.</p>
                    <?php endif; ?>
                </div>
            </div>
        </div>
        </div>
        </div>
    </main>

    <?php
    include "include/footer.php";
    ?>

    <!-- Lien vers le fichier JavaScript -->
    <script>

        function toggleEditMode(paymentId) {
            const paymentItem = document.querySelector(`#payment-${paymentId}`);

            if (paymentItem) {
                const viewMode = paymentItem.querySelector('.view-mode');
                const editMode = paymentItem.querySelector('.edit-mode');

                viewMode.classList.toggle('hidden');
                editMode.classList.toggle('hidden');
            }
        }




    </script>
</body>

</html>
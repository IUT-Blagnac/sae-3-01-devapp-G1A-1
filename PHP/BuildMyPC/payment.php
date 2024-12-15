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
                <img src="https://via.placeholder.com/80" alt="Photo de profil">
                <h3><?php echo $_SESSION['prenom'] ?></h3>
            </div>
            <a href="consultCompte.php">Informations personnelles</a>
            <a href="payment.php" class="active">Informations de paiement</a>
            <a href="security.php">Sécurité</a>
            <a href="order.php">Historique des commandes</a>
            <a href="fidelity.php">Programme de fidélité</a>
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
                            'details' => $details
                        ];
                    }
                }
            }
            ?>


            <div id="payment" class="form-section active">
                <div class="view-mode">
                    <h2>Vos informations de paiement</h2>
                    <?php if (!empty($paymentDetails)): ?>
                        <?php foreach ($paymentDetails as $payment): ?>
                            <div class="payment-method">
                                <h3>Méthode : <?= htmlspecialchars($payment['methodName']) ?></h3>
                                <?php if ($payment['type'] === 'card'): ?>
                                    <p><strong>Numéro de carte :</strong> **** **** ****
                                        <?= htmlspecialchars(substr($payment['details']['numCarte'], -4)) ?>
                                    </p>
                                    <p><strong>Date d'expiration :</strong> <?= htmlspecialchars($payment['details']['dateExp']) ?>
                                    </p>
                                <?php elseif ($payment['type'] === 'paypal'): ?>
                                    <p><strong>Email :</strong> <?= htmlspecialchars($payment['details']['email']) ?></p>
                                    <p><strong>Mot de passe :</strong> <?= htmlspecialchars($payment['details']['mdp']) ?></p>
                                <?php endif; ?>
                                <button onclick="toggleEditMode2('payment')">Modifier</button>
                            </div>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <p>Vous n'avez pas encore ajouté de méthode de paiement.</p>
                    <?php endif; ?>
                </div>

                <div class="edit-mode hidden">
                    <h2>Mettre à jour les informations de paiement</h2>
                    <?php if (!empty($paymentDetails)): ?>
                        <?php foreach ($paymentDetails as $payment): ?>
                            <div class="edit-payment-method">
                                <h3>Méthode : <?= htmlspecialchars($payment['methodName']) ?></h3>
                                <?php if ($payment['type'] === 'card'): ?>
                                    <label for="cardNumber-<?= htmlspecialchars($row['idCarte']) ?>">Numéro de carte</label>
                                    <input type="text" id="cardNumber-<?= htmlspecialchars($row['idCarte']) ?>"
                                        value="<?= htmlspecialchars($payment['details']['numCarte']) ?>">

                                    <label for="expiry-<?= htmlspecialchars($row['idCarte']) ?>">Date d'expiration</label>
                                    <input type="text" id="expiry-<?= htmlspecialchars($row['idCarte']) ?>"
                                        value="<?= htmlspecialchars($payment['details']['dateExp']) ?>">
                                <?php elseif ($payment['type'] === 'paypal'): ?>
                                    <label for="email-<?= htmlspecialchars($row['idCarte']) ?>">Email</label>
                                    <input type="email" id="email-<?= htmlspecialchars($row['idCarte']) ?>"
                                        value="<?= htmlspecialchars($payment['details']['email']) ?>">

                                    <label for="password-<?= htmlspecialchars($row['idCarte']) ?>">Mot de passe</label>
                                    <input type="text" id="password-<?= htmlspecialchars($row['idCarte']) ?>"
                                        value="<?= htmlspecialchars($payment['details']['mdp']) ?>">
                                <?php endif; ?>
                                <button>Enregistrer les modifications</button>
                                <button onclick="toggleEditMode2('payment')">Annuler</button>
                            </div>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <p>Aucune méthode de paiement à modifier.</p>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </main>

    <?php
    include "include/footer.php";
    ?>

    <!-- Lien vers le fichier JavaScript -->
    <script>
        function toggleEditMode(sectionId) {
            const section = document.querySelector(`.${sectionId}-section`);
            const viewMode = section.querySelector('.view-mode');
            const editMode = section.querySelector('.edit-mode');

            viewMode.classList.toggle('hidden');
            editMode.classList.toggle('hidden');
        }

        function toggleEditMode2(sectionId) {
            const section = document.getElementById(sectionId);
            const viewMode = section.querySelector('.view-mode');
            const editMode = section.querySelector('.edit-mode');

            viewMode.classList.toggle('hidden');
            editMode.classList.toggle('hidden');
        }


    </script>
</body>

</html>
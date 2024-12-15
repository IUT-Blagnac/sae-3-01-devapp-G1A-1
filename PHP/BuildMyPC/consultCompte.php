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
            <a href="consultCompte.php" class="active">Informations personnelles</a>
            <a href="payment.php">Informations de paiement</a>
            <a href="security.php">Sécurité</a>
            <a href="order.php">Historique des commandes</a>
            <a href="fidelity.php">Programme de fidélité</a>
            <a href="logout.php">Se Déconnecter</a>
        </div>
        <div class="content">
            <div id="profile-delivery" class="form-section active">
                <!-- Informations personnelles -->

                <!-- Requete préparée pour récupérer les informations de l'utilisateur -->
                <?php
                include 'include/connect.inc.php';
                $req = $conn->prepare('SELECT * FROM Client WHERE idNumCli = ?');
                $req->execute(array($_SESSION['idClient']));
                $data = $req->fetch();
                ?>
                <div class="profile-section">
                    <div class="view-mode">
                        <h2>Vos informations personnelles</h2>
                        <p><strong>Prénom :</strong> <?php echo $data['prenom'] ?></p>
                        <p><strong>Nom :</strong> <?php echo $data['nom'] ?></p>
                        <p><strong>Email :</strong> <?php echo $data['email'] ?></p>
                        <p><strong>Numéro de téléphone :</strong> <?php echo $data['telephone'] ?></p>
                        <button onclick="toggleEditMode('profile')">Modifier</button>
                    </div>
                    <div class="edit-mode hidden">
                        <h2>Modifier vos informations personnelles</h2>
                        <label for="firstName">Prénom</label>
                        <input type="text" id="firstName" placeholder="Votre prénom"
                            value="<?php echo $data['prenom'] ?>">
                        <label for="lastName">Nom</label>
                        <input type="text" id="lastName" placeholder="Votre nom" value="<?php echo $data['nom'] ?>">
                        <label for="email">Adresse e-mail</label>
                        <input type="email" id="email" placeholder="Votre adresse e-mail"
                            value="<?php echo $data['email'] ?>">
                        <label for="phone">Numéro de téléphone</label>
                        <input type="tel" id="phone" placeholder="Votre numéro de téléphone"
                            value="<?php echo $data['telephone'] ?>">
                        <button>Enregistrer les modifications</button>
                        <button onclick="toggleEditMode('profile')">Annuler</button>
                    </div>
                </div>

                <!-- Adresse de livraison -->

                <!-- Requete préparée pour récupérer les informations de l'adresse de l'utilisateur -->
                <?php
                $req = $conn->prepare('SELECT * FROM AdressePostale , Client
                WHERE Client.idAdresse = AdressePostale.idAdresse AND Client.idNumCli = ?');
                $req->execute(array($_SESSION['idClient']));
                $data = $req->fetch();
                ?>
                <div class="delivery-section">
                    <div class="view-mode">
                        <h2>Votre adresse de livraison</h2>
                        <p><strong>Adresse :</strong> <?php echo $data['numNomRue'] ?></p>
                        <p><strong>Ville :</strong> <?php echo $data['ville'] ?></p>
                        <p><strong>Code postal :</strong> <?php echo $data['codePostal'] ?></p>
                        <button onclick="toggleEditMode('delivery')">Modifier</button>
                    </div>
                    <div class="edit-mode hidden">
                        <h2>Mettre à jour l'adresse de livraison</h2>
                        <label for="address">Adresse</label>
                        <input type="text" id="address" value="<?php echo $data['numNomRue'] ?>">
                        <label for="city">Ville</label>
                        <input type="text" id="city" value="<?php echo $data['ville'] ?>">
                        <label for="zip">Code postal</label>
                        <input type="text" id="zip" value="<?php echo $data['codePostal'] ?>">
                        <button>Enregistrer les modifications</button>
                        <button onclick="toggleEditMode('delivery')">Annuler</button>
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
        function toggleEditMode(sectionId) {
            const section = document.querySelector(`.${sectionId}-section`);
            const viewMode = section.querySelector('.view-mode');
            const editMode = section.querySelector('.edit-mode');

            viewMode.classList.toggle('hidden');
            editMode.classList.toggle('hidden');
        }
    </script>
</body>

</html>
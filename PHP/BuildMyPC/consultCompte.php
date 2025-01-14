<?php
session_start();
if (!isset($_SESSION['login']) || $_SESSION['login'] != 'OK') {
    header('Location: index.php?erreur=Veuillez_passer_par_le_formulaire_de_connexion');
}

$securityFormOpen = isset($_GET['Erreur']) ? true : false;
$securityFormOpen2 = isset($_GET['Erreur2']) ? true : false;
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
            <a href="consultCompte.php" class="active">Informations personnelles</a>
            <a href="payment.php">Informations de paiement</a>
            <a href="security.php">Sécurité</a>
            <a href="order.php">Historique des commandes</a>
            <a href="fidelity.php">Programme de fidélité</a>
            <a href="historique.php">Historique de navigation</a>
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
                    <div class="view-mode <?php echo $securityFormOpen ? 'hidden' : ''; ?>">
                        <h2>Vos informations personnelles</h2>
                        <?php if (isset($_GET['succesSecurity'])) {
                            if ($_GET['succesSecurity'] == 'Ok') {
                                echo ("<label for='password' style='color : GREEN; weight : Bold'>  Informations modifiées avec succès. </label> <br><br>");
                            }
                        } ?>
                        <p><strong>Prénom :</strong> <?php echo $data['prenom'] ?></p>
                        <p><strong>Nom :</strong> <?php echo $data['nom'] ?></p>
                        <p><strong>Email :</strong> <?php echo $data['email'] ?></p>
                        <p><strong>Numéro de téléphone :</strong> <?php echo $data['telephone'] ?></p>
                        <button onclick="toggleEditMode('profile')">Modifier</button>
                    </div>
                    <div class="edit-mode <?php echo $securityFormOpen ? '' : 'hidden'; ?>">
                        <form method="POST" action="update_profile.php">
                            <h2>Modifier vos informations personnelles</h2>
                            <label for="firstName">Prénom</label>
                            <input type="text" id="firstName" name="firstName" placeholder="Votre prénom"
                                value="<?php echo $data['prenom'] ?>" required>
                            <?php if (isset($_GET['Erreur'])) {
                                if ($_GET['Erreur'] == 'prenomInc') {
                                    echo ("<label for='firstName' style='color : RED; weight : Bold'> Le prénom contient des caractères invalides.</label> <br><br>");
                                }
                            } ?>
                            <label for="lastName">Nom</label>
                            <input type="text" id="lastName" name="lastName" placeholder="Votre nom"
                                value="<?php echo $data['nom'] ?>" required>
                            <?php if (isset($_GET['Erreur'])) {
                                if ($_GET['Erreur'] == 'nomInc') {
                                    echo ("<label for='lastName' style='color : RED; weight : Bold'> Le nom contient des caractères invalides.</label> <br><br>");
                                }
                            } ?>
                            <label for="email">Adresse e-mail</label>
                            <input type="email" id="email" name="email" placeholder="Votre adresse e-mail"
                                value="<?php echo $data['email'] ?>" required>
                            <?php if (isset($_GET['Erreur'])) {
                                if ($_GET['Erreur'] == 'emailInc') {
                                    echo ("<label for='email' style='color : RED; weight : Bold'> L’adresse e-mail n’est pas valide.</label> <br><br>");
                                }
                            } ?>
                            <label for="phone">Numéro de téléphone</label>
                            <input type="tel" id="phone" name="phone" placeholder="Votre numéro de téléphone"
                                value="<?php echo $data['telephone'] ?>" required>
                            <?php if (isset($_GET['Erreur'])) {
                                if ($_GET['Erreur'] == 'phoneInc') {
                                    echo ("<label for='phone' style='color : RED; weight : Bold'> Le numéro de téléphone n’est pas valide. Il doit commencer par un signe +.</label> <br><br>");
                                }
                            } ?>
                            <button type="submit">Enregistrer les modifications</button>
                        </form>
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
                    <div class="view-mode <?php echo $securityFormOpen2 ? 'hidden' : ''; ?>">
                        <h2>Votre adresse de livraison</h2>
                        <?php if (isset($_GET['success'])) {
                            if ($_GET['success'] == '1') {
                                echo ("<label for='password' style='color : GREEN; weight : Bold'>  Informations de livraisons modifiées avec succès. </label> <br><br>");
                            }
                        } ?>
                        <p><strong>Adresse :</strong> <?php echo $data['numNomRue'] ?></p>
                        <p><strong>Ville :</strong> <?php echo $data['ville'] ?></p>
                        <p><strong>Code postal :</strong> <?php echo $data['codePostal'] ?></p>
                        <button onclick="toggleEditMode('delivery')">Modifier</button>
                    </div>
                    <div class="edit-mode <?php echo $securityFormOpen2 ? '' : 'hidden'; ?>">
                        <form method="POST" action="update_adresse.php">
                            <h2>Mettre à jour l'adresse de livraison</h2>
                            <label for="address">Adresse</label>
                            <input type="text" id="address" name="address" value="<?php echo $data['numNomRue'] ?>"
                                required>
                            <?php if (isset($_GET['Erreur2'])) {
                                if ($_GET['Erreur2'] == 'adresseInc') {
                                    echo ("<label for='address' style='color : RED; weight : Bold'> L’adresse contient des caractères invalides.</label> <br><br>");
                                }
                            } ?>
                            <label for="city">Ville</label>
                            <input type="text" id="city" name="city" value="<?php echo $data['ville'] ?>" required>
                            <?php if (isset($_GET['Erreur2'])) {
                                if ($_GET['Erreur2'] == 'villeInc') {
                                    echo ("<label for='city' style='color : RED; weight : Bold'> La ville contient des caractères invalides.</label> <br><br>");
                                }
                            } ?>
                            <label for="zip">Code postal</label>
                            <input type="text" id="zip" name="zip" value="<?php echo $data['codePostal'] ?>" required>
                            <?php if (isset($_GET['Erreur2'])) {
                                if ($_GET['Erreur2'] == 'zipInc') {
                                    echo ("<label for='zip' style='color : RED; weight : Bold'> Le code postal doit comporter exactement 5 chiffres.</label> <br><br>");
                                }
                            } ?>
                            <button type="submit">Enregistrer les modifications</button>
                        </form>
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

            if (!editMode.classList.contains('hidden')) {
                // Fermeture du mode édition
                editMode.classList.add('hidden');
                viewMode.classList.remove('hidden');
            } else {
                // Ouverture du mode édition
                editMode.classList.remove('hidden');
                viewMode.classList.add('hidden');
            }
        }

    </script>
</body>

</html>
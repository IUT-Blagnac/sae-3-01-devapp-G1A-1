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
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="icon" href="image/BuildMyPC_logo.png" />

</head>

<body>
    <!-- Header principal -->
    <?php include 'include/header.php'; ?>

    <!-- Contenu principal -->
    <main>
        <!-- Section employés -->
        <div class="section">
            <h1 class="employee section-title">
                Gestion des employés
            </h1>
            <div class="employee grid-container">
                <!-- Item 1 -->
                <div class="employee grid-item item1">
                    <div class="employee name">
                        <strong>Nom : </strong>Jean
                    </div>
                    <div class="employee surname">
                        <strong>Prenom : </strong>François
                    </div>
                    <div class="employee mail">
                        <strong>Mail : </strong>jddelacompta@buildmypc.com
                    </div>
                    <div class="employee phone">
                        <strong>Téléphone : </strong>06 36 36 42 08
                    </div>
                    <div class="employee buttons">
                        <button class='employee btnAction btnEdit' data-id="8" onclick="toggleModif()">
                            Modifier
                        </button>
                        <button class='employee btnAction btnDelete' data-id="8">
                            Supprimer
                        </button>
                    </div>
                </div>
                <!-- Item 2 -->
                <div class="employee grid-item item2">
                    <div class="employee name">
                        <strong>Nom : </strong>Jean
                    </div>
                    <div class="employee surname">
                        <strong>Prenom : </strong>François
                    </div>
                    <div class="employee mail">
                        <strong>Mail : </strong>trestreslongmailpourjeanfrancoisdelacomte@buildmypc.com
                    </div>
                    <div class="employee phone">
                        <strong>Téléphone : </strong>06 36 36 42 08
                    </div>
                    <div class="employee buttons">
                        <button class='employee btnAction btnEdit' data-id="5" onclick="toggleModif()">
                            Modifier
                        </button>
                        <button class='employee btnAction btnDelete' data-id="5">
                            Supprimer
                        </button>
                    </div>
                </div>
                <!-- Item 3 -->
                <div class="employee grid-item item3">
                    <div class="employee name">
                        <strong>Nom : </strong>Jean
                    </div>
                    <div class="employee surname">
                        <strong>Prenom : </strong>François
                    </div>
                    <div class="employee mail">
                        <strong>Mail : </strong>jddelacompta@buildmypc.com
                    </div>
                    <div class="employee phone">
                        <strong>Téléphone : </strong>06 36 36 42 08
                    </div>
                </div>
                <!-- Item 4 -->
                <div class="employee grid-item item4">
                    <div class="employee name">
                        <strong>Nom : </strong>Jean
                    </div>
                    <div class="employee surname">
                        <strong>Prenom : </strong>François
                    </div>
                    <div class="employee mail">
                        <strong>Mail : </strong>jddelacompta@buildmypc.com
                    </div>
                    <div class="employee phone">
                        <strong>Téléphone : </strong>06 36 36 42 08
                    </div>
                </div>
                <!-- Item 5 -->
                <div class="employee grid-item item5">
                    <div class="employee name">
                        <strong>Nom : </strong>Jean
                    </div>
                    <div class="employee surname">
                        <strong>Prenom : </strong>François
                    </div>
                    <div class="employee mail">
                        <strong>Mail : </strong>jddelacompta@buildmypc.com
                    </div>
                    <div class="employee phone">
                        <strong>Téléphone : </strong>06 36 36 42 08
                    </div>
                </div>
            </div>
            <!-- Formulaire de modification -->
            <!-- div#modifEmployee is the dark background, 
                div#modifContainer is the actual form,
                the overall form will be referred as overlay
            -->
            <div id="modifEmployee" class="overlay-container">
                <div id="modifContainer" class="popup-box">
                    <!-- this div is the cross on the top right corner -->
                    <div class="close-button">
                        <span></span>
                        <span></span>
                    </div>
                    <h2 style="color: green;">Popup Form</h2>
                    <form class="form-container">
                        <label class="form-label" for="name">
                            Username:
                        </label>
                        <input class="form-input" type="text" placeholder="Enter Your Username" id="name" name="name"
                            required>

                        <label class="form-label" for="email">Email:</label>
                        <input class="form-input" type="email" placeholder="Enter Your Email" id="email" name="email"
                            required>

                        <button class="btn-submit" type="submit">
                            Submit
                        </button>
                    </form>

                    <button class="btn-close-popup" onclick="toggleModif()">
                        Close
                    </button>
                </div>
            </div>
        </div>
        <!-- Section promotions -->
        <div class="section">
            <h1 class="section-title">
                Gestion des promotions
            </h1>
            <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                et
                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                aliquip
                ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
                dolore eu
                fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
                deserunt mollit anim id est laborum.
            </p>
        </div>
        <!-- Section produits -->
        <div class="section">
            <h1 class="section-title">
                Gestion des produits
            </h1>
            <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                labore et
                dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                aliquip
                ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
                dolore eu
                fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
                deserunt mollit anim id est laborum.
            </p>
        </div>
    </main>

    <?php
    include "include/footer.php";
    ?>

    <script>
        /* ----------------------------------------------
         * Methode qui fait apparaitre et disparaitre le 
         * formulaire de modification des employés avec 
         * des animations.
         * ------------------------------------------- */
        let isToggling = false;

        function toggleModif() {
            if (isToggling) return;
            isToggling = true;

            const overlay = document.getElementById('modifEmployee');
            const popupBox = document.getElementById('modifContainer');

            if (overlay.classList.contains('show')) {
                // Trigger the fade-out animation
                popupBox.classList.add('fade-out');
                // Wait for the animation to finish before hiding the overlay
                setTimeout(() => {
                    overlay.classList.remove('show');
                    popupBox.classList.remove('fade-out');
                    // Match the animation duration
                }, 500);
            } else {
                overlay.classList.add('show');
            }
            // This timeout prevent a double activation toggleModif 
            // (that would make the form appear and disappear instantly)
            setTimeout(() => isToggling = false, 100);
        }
    </script>
    <script>
        /* ------------------------------------------
         * Script qui permet de faire disparaitre le 
         * formulaire de modification des employés
         * lorsque l'on clique hors du formulaire.
         * --------------------------------------- */
        document.addEventListener('click', (event) => {
            const overlay = document.getElementById('modifEmployee');
            const popupBox = document.getElementById('modifContainer');
            if (overlay.classList.contains('show') && !popupBox.contains(event.target)) {
                toggleModif();
            }
        });
    </script>
</body>

</html>
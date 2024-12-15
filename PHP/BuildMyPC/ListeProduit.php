<?php session_start(); ?>

<!DOCTYPE html>
<html lang="fr">

<?php
// Récuperations des informations de l'url
?>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BuildMyPC</title>
    <link rel="stylesheet" href="css/header.css" />
    <link rel="stylesheet" href="css/footer.css" />
    <link rel="stylesheet" href="css/ListeProduit.css" />
    <link rel="icon" href="image/BuildMyPC_logo.png" />
    <?php
    include "include/ListeProduit.inc.php";
    ?>
</head>

<body>
    <!-- Header principal -->
    <?php
    include "include/header.php";
    ?>

    <!-- Contenu principal -->
    <main>
        <!-- /////////////////////////////////
       ////////// Selection  ////////////
       ///////////////////////////////// -->
        <div class="selection">
            <?php
            $searchbarToURL = "";
            if (isset($_GET['searchbar'])) {
                $searchbarToURL = "?searchbar=" . htmlentities($_GET['searchbar']);
            }
            ?>

            <form action=<?php echo "'traitListeProduit.php$searchbarToURL'"; ?> class="selection"
                id="form-selection-big" method="POST">
                <?php
                setSelectionCriterias(false);
                ?>
            </form>
        </div>
        <!-- /////////////////////////////////
       /////////// Btn sorting /////////////
       ///////////////////////////////// -->
        <div class="selection small button">
            <label class="selection title small button" for="toggle-list-small">
                Affiner <span class="arrow">&#11206;</span>
            </label>
            <input class="selection title small button" type="checkbox" name="toggle-list-small"
                id="toggle-list-small" />
        </div>
        <div class="sorting">
            <!-- TODO We will be using SQL to sort the list -->
            <?php
            $previous = isset($_SERVER['QUERY_STRING']) ? "?previous=" . htmlentities(urlencode($_SERVER['QUERY_STRING'])) : "";
            ?>
            <form class="sorting" action=<?php echo "'traitListeProduit.php$previous'"; ?> name="sortingForm"
                id="sortingForm" method="POST">
                <select class="sorting" name="sorting-mode" id="sorting-mode" onchange="sortingForm.submit()">
                    <option class="sorting" selected disabled>Trier par</option>
                    <option class="sorting" value="pertinence">Pertinence</option>
                    <option class="sorting" value="nomProduit_ASC">
                        Nom Croissant
                    </option>
                    <option class="sorting" value="nomProduit_DESC">
                        Nom Décroissant
                    </option>
                    <option class="sorting" value="prix_ASC">
                        Prix Croissant
                    </option>
                    <option class="sorting" value="prix_DESC">
                        Prix Décroissant
                    </option>
                    <option class="sorting" value="bestVentes">
                        Meilleures Ventes
                    </option>
                    <option class="sorting" value="bestNotes">Meilleures Notes</option>
                </select>
            </form>
        </div>
        <!-- /////////////////////////////////
       //////// Selection small //////////
       ///////////////////////////////// -->
        <div class="selection small">
            <form action=<?php echo "'traitListeProduit.php$searchbarToURL'"; ?> class="selection small"
                id="form-selection-small" method="POST">
                <?php
                setSelectionCriterias(true);
                ?>
            </form>
        </div>
        <!-- /////////////////////////////////
       /////////////// Grid ////////////////
       ///////////////////////////////// -->
        <div class="main grid-container">
            <?php
            displayAllProducts();
            ?>
            <?php
            // new_product(1, 200, "PC GAMER ARMOR", "PC Gaming", 2079.9919, "image/produits/pcGaming2.png", ["AMD Ryzen 7", "32Go", "AMD Radeon RX7900XT"], 20);
            // new_product(2, 300, "PC Gamer 4070 super powa", "PC Gaming", 1399.99, "image/produits/pcGaming4.webp", ["Intel Core i5", "16Go", "RTX 4070 SUPER"]);
            // new_product(3, 10, "MSI GeForce RTX 4060 SUPER 16G VENTUS 3X OC", "Carte graphique", 1000.99, "image/produits/carteGraphique.webp");
            ?>
            <!-- <div class="grid-item">
        <a href="#" class="product image">
          <img src="image/produits/carteGraphique3.webp" alt="imgProduit" class="product" />
        </a>
        <div class="product name">
          Sapphire Pulse Radeon RX 7800 XT GAMING 16GB
        </div>
        <div class="product category">Carte graphique</div>
        <div class="product price">569€99</div>
        <button class="product btnPanier" type="submit">
          <div class="product btnPanier">Ajouter au panier</div>
        </button>
      </div>
      <div class="grid-item">
        <a href="#" class="product image">
          <img src="image/produits/processeurIntel.webp" alt="imgProduit" class="product" />
          <span class="product badge">-30%</span>
        </a>
        <div class="product name">
          Intel Core Ultra 7 265K - LGA1851/Sans boite
        </div>
        <div class="product category">Processeur</div>
        <div class="product normal-price">479€99</div>
        <div class="product promotion">335€99</div>
        <button class="product btnPanier" type="submit">
          <div class="product btnPanier">Ajouter au panier</div>
        </button>
      </div>
      <div class="grid-item">
        <a href="#" class="product image">
          <img src="image/produits/pcGaming3.png" alt="imgProduit" class="product" />
        </a>
        <div class="product name">PC GAMER THUNDER</div>
        <div class="product components">
          Intel Core i7 - 32Go - nVidia GF RTX 4080 SUPER
        </div>
        <div class="product category">PC Gaming</div>
        <div class="product price">2349€99</div>
        <button class="product btnPanier" type="submit">
          <div class="product btnPanier">Ajouter au panier</div>
        </button>
      </div>
      <div class="grid-item">
        <a href="#" class="product image">
          <img src="image/produits/pcBureautique.png" alt="imgProduit" class="product" />
        </a>
        <div class="product name">PC FIXE PRO BUREAUTIQUE I3</div>
        <div class="product components">
          Intel Core i3 - 4Go - COOLER MASTER
        </div>
        <div class="product category">PC Bureautique</div>
        <div class="product price">489€99</div>
        <button class="product btnPanier" type="submit">
          <div class="product btnPanier">Ajouter au panier</div>
        </button>
      </div> -->
        </div>
    </main>

    <?php
    include "include/footer.php";
    ?>

    <!-- JavaScript -->
    <script>
    /* -----------------------------------------------------
                                        Script qui permet de réduire les catégories de sélection
                                        pour le bloc .selection.
                                        ----------------------------------------------------- */
    document.addEventListener("DOMContentLoaded", () => {
        // On récupère toutes les checkbox de titre
        const checkboxes = document.querySelectorAll(
            'input[type="checkbox"].selection.title'
        );
        // On récupere tous les éléments 'contenu'
        const contentItems = document.querySelectorAll("li.selection.content");
        // On itère à travers les checkbox pour placer des listener
        checkboxes.forEach((checkbox) => {
            const contentItem =
                checkbox.closest("li.selection.title").nextElementSibling;

            // On vérifie qu'on a bien les bonnes balises avec les bonnes classes
            if (
                contentItem &&
                contentItem.classList.contains("selection") &&
                contentItem.classList.contains("content")
            ) {
                // Au départ on affiche le contenu
                const contentUl = contentItem.querySelector("ul.selection");
                if (contentUl) contentUl.style.display = "block";
                // On ajoute le listener qui va changer la visibilité
                checkbox.addEventListener("change", () => {
                    if (checkbox.checked) {
                        contentUl.style.display = "block";
                    } else {
                        contentUl.style.display = "none";
                    }
                });
            }
        });
    });
    </script>
    <script>
    /* ---------------------------------------------------------------------
                                        Script qui affiche le bloc .selection.small lorsque la checkbox "Affiner" 
                                        de .selection.small.button est cochée 
                                        --------------------------------------------------------------------- */
    document.addEventListener("DOMContentLoaded", () => {
        // On va chercher la checkbox qui agit comme une sorte de bouton
        const smallButtonCheckbox = document.querySelector(
            'input[type="checkbox"].selection.title.small.button'
        );
        // On va chercher le div.selection.small qui contient tout le bloc de selection
        const smallDivSelection = document.querySelectorAll(
            "div.selection.small:not(div.selection.small.button)"
        );
        if (smallButtonCheckbox && smallDivSelection) {
            // Ajout d'un event listener à la checkbox
            smallButtonCheckbox.addEventListener("change", () => {
                // il ne devrait y avoir qu'un élément mais on fait une boucle dans le doute
                smallDivSelection.forEach((element) => {
                    element.style.display = smallButtonCheckbox.checked ?
                        "block" :
                        "none";
                });
            });
            // On applique un état initial au div en fonction de la checkbox
            smallDivSelection.forEach((element) => {
                element.style.display = smallButtonCheckbox.checked ?
                    "block" :
                    "none";
            });
        }
    });
    </script>
    <script>
    /* -----------------------------------------------------
                                        Script qui permet de réduire les catégories de séléction
                                        pour le bloc .selection.small.
                                        ----------------------------------------------------- */
    document.addEventListener("DOMContentLoaded", () => {
        // On récupère toutes les checkbox de titre
        const checkboxes = document.querySelectorAll(
            'input[type="checkbox"].selection.title.small:not(input[type="checkbox"].selection.title.small.button)'
        );

        // On itère à travers les checkbox pour placer des listener
        checkboxes.forEach((checkbox) => {
            // On va chercher notre parent et prendre l'élement suivant càd li.select.small.content
            const contentItem = checkbox.closest(
                "li.selection.small.title"
            ).nextElementSibling;
            // On vérifie qu'on a pris le bon élément en regardant ses classes
            if (
                contentItem &&
                contentItem.classList.contains("selection") &&
                contentItem.classList.contains("content") &&
                contentItem.classList.contains("small")
            ) {
                // On va prendre l'élément ul.selection.small (qui est dans li.select.small.content)
                // et on va lui mettre une visibilité par défaut
                const contentUl = contentItem.querySelector("ul.selection.small");
                if (contentUl) contentUl.style.display = "block";
                // On ajoute le listener qui va changer sa visibilité
                checkbox.addEventListener("change", () => {
                    if (checkbox.checked) {
                        contentUl.style.display = "block";
                    } else {
                        contentUl.style.display = "none";
                    }
                });
            }
        });
    });
    </script>
    <script>
    /* -----------------------------------------------------
                                        Script qui permet de uncheck la checkbox .selection.title.small.button
                                        quand la taille de l'écran est > 950px. Permet d'éviter que
                                        les éléments .selection.small restent visibles alors qu'ils sont
                                        sensé être remplacé par leur version .selection normale.
                                        ----------------------------------------------------- */
    document.addEventListener("DOMContentLoaded", () => {
        const smallButtonCheckbox = document.querySelector(
            'input[type="checkbox"].selection.title.small.button'
        );

        if (smallButtonCheckbox) {
            const handleResize = () => {
                if (window.innerWidth > 950) {
                    smallButtonCheckbox.checked = false;
                    const smallDivSelectionElements = document.querySelectorAll(
                        "div.selection.small:not(div.selection.small.button)"
                    );
                    // On s'assure que le container principal soit bien caché
                    smallDivSelectionElements.forEach((element) => {
                        element.style.display = "none";
                    });
                }
            };
            // On ajoute l'event listener
            window.addEventListener("resize", handleResize);

            // On lance le handle resize une fois pour prendre en compte la taille initiale de l'écran
            handleResize();
        }
    });
    </script>

    <script>
    /* -----------------------------------------------------
                                        Script qui permet de synchroniser les deux form de 
                                        selection pour que les valeurs dans les 2 formulaires
                                        soient les même.
                                        ----------------------------------------------------- */
    document.addEventListener("DOMContentLoaded", () => {
        const form1 = document.getElementById("form-selection-big");
        const form2 = document.getElementById("form-selection-small");

        const syncForms = (sourceForm, targetForm) => {
            const sourceFields = sourceForm.elements;
            const targetFields = targetForm.elements;

            for (let i = 0; i < sourceFields.length; i++) {
                const sourceField = sourceFields[i];
                const targetField = targetFields[sourceField.name];

                if (targetField) {
                    if (sourceField.type === "checkbox" || sourceField.type === "radio") {
                        if (targetField.checked !== sourceField.checked) {
                            targetField.checked = sourceField.checked;

                            const changeEvent = new Event("change", {
                                bubbles: true
                            });
                            targetField.dispatchEvent(changeEvent);
                        }
                        // targetField.checked = sourceField.checked;
                    } else {
                        targetField.value = sourceField.value;
                    }
                }
            }
        };

        const handleFormChange = (event) => {
            const sourceForm = event.currentTarget;
            const targetForm = sourceForm === form1 ? form2 : form1;
            syncForms(sourceForm, targetForm);
        };

        // Attach event listeners to both forms
        form1.addEventListener("input", handleFormChange);
        form2.addEventListener("input", handleFormChange);
    });
    </script>
</body>

</html>
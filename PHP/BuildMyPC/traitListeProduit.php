<?php
include "include/connect.inc.php";

function addToURL(string $strToAdd)
{
    global $url;
    if (isset($url)) {
        $url .= "&$strToAdd";
    } else {
        $url = "$strToAdd";
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////// Get datas from header /////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////


// Search bar
if (isset($_POST['search-bar'])) {
    $searchBar = htmlspecialchars($_POST['search-bar']);
    addToURL("searchbar=$searchBar");
    addToURL("sort=pertinence");
    // Quand search bar est dans POST, on n'est pas sensé recevoir d'autres informations. On redirige donc directement sur la page ListeProduit
    if (isset($url)) {
        header("location:ListeProduit.php?$url");
        die();
    }
}


$newest = false;
$categ_id;
$promotion = false;

$categs = [];

// Nouveautés
if (isset($_GET['newest'])) {
    // Check if newest is a boolean. Returns true if newest is "1", "true", "on" and "yes" if not returns false
    $newest = filter_var(htmlspecialchars($_GET['newest']), FILTER_VALIDATE_BOOLEAN);
    if ($newest) {
        addToURL("newest=$newest");
    }
}
// Promotion
if (isset($_GET['promotion'])) {
    // Check if promotion is a boolean. Returns true if promotion is "1", "true", "on" and "yes" if not returns false
    $promotion = filter_var(htmlspecialchars($_GET['promotion']), FILTER_VALIDATE_BOOLEAN);
    if ($promotion) {
        addToURL("promo=only");
    }
}
// Categories
if (isset($_GET['categ_id'])) {
    $categ_id = intval(htmlspecialchars($_GET['categ_id']));
    $categories = [];

    $query = "  SELECT idCategorie AS id, idCategoriePere AS idPere
                FROM Categorie";
    $pdo = $conn->prepare($query);
    $pdo->execute();
    while ($categorie = $pdo->fetch()) {
        if ($categorie['id'] == $categ_id or $categorie['idPere'] == $categ_id) {
            $categories[] = [
                'id' => $categorie['id'],
                'idPere' => $categorie['idPere']
            ];
        }
    }
    if (count($categories) > 1) {
        foreach ($categories as $categorie) {
            if ($categorie["idPere"] != null) {
                $categs[] = $categorie['id'];
            }
        }
    } else {
        foreach ($categories as $categorie) {
            $categs[] = $categorie['id'];
        }
    }
    unset($categories);
    addToURL("categ_id=" . implode("+", $categs));
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////// Sorting ///////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////

// keeps datas from the previous url (used when sorting the datas)
if (isset($_POST['sorting-mode'])) {
    if (isset($_GET['previous'])) {
        // on récupère les données précédentes et on les décode. On remplace ensuite les espaces 
        // par + car ils ont été changés lorsqu'on les a décodés. On sépare ensuite l'url
        // en un tableau dans lequel on va itérer pour supprimer toutes partie étant liée
        // au tri des données car on va le réécrire en dessous. On réassemble l'url puis
        // on l'ajoute au nouvel url
        $previousURL = explode("&", str_replace(" ", "+", urldecode($_GET["previous"])));
        foreach ($previousURL as $key => $urlPart) {
            if (str_starts_with($urlPart, "sort=")) {
                unset($previousURL[$key]);
            }
        }
        $previousURL = implode("&", $previousURL);
        addToURL($previousURL);
    }
    $sortingList = ["pertinence", "nomProduit_ASC", "nomProduit_DESC", "prix_ASC", "prix_DESC", "bestVentes", "bestNotes"];
    if (in_array($_POST['sorting-mode'], $sortingList)) {
        addToURL(htmlspecialchars("sort=" . $_POST['sorting-mode']));
    }
    header("location:ListeProduit.php?$url");
    die();
}

//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////// Get datas from selection ////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////

// Search bar lorsque on cherche à affiner à partir de la recherche
if (isset($_GET['searchbar'])) {
    addToURL("searchbar={$_GET['searchbar']}");
}

// Categories
$categories = [];
$query = "  SELECT idCategorie AS id
                FROM Categorie";
$pdo = $conn->prepare($query);
$pdo->execute();
while ($categorie = $pdo->fetch()) {
    $insertName = "categ_" . $categorie['id'];
    if (isset($_POST[$insertName]) and htmlentities($_POST[$insertName]) === 'on') {
        $categories[] = $categorie['id'];
    }
}
if (!empty($categories)) {
    addToURL("categ_id=" . implode("+", $categories));
}

// Marques
$marques = [];
$query = "  SELECT idMarque AS id
                FROM Marque";
$pdo = $conn->prepare($query);
$pdo->execute();
while ($marque = $pdo->fetch()) {
    $insertName = "marque_" . $marque['id'];
    if (isset($_POST[$insertName]) and htmlentities($_POST[$insertName]) === 'on') {
        $marques[] = $marque['id'];
    }
}
if (!empty($marques)) {
    addToURL("marque_id=" . implode("+", $marques));
}

// Prix
$min = 0;
$max = 100000;
// Pas besoin d'utiliser htmlspecialchar car intval va transformer la valeur en int ce qui supprimera les potentiels problèmes de XSS
if (isset($_POST['minimum']))
    $min = intval($_POST['minimum']);
if (isset($_POST['maximum']))
    $max = intval($_POST['maximum']);

$query = "  SELECT MIN(prix) AS min, MAX(prix) AS max
                FROM Produit";
$pdo = $conn->prepare($query);
$pdo->execute();
if ($prix = $pdo->fetch()) {
    // intval récupere la valeur en int, arrondit à l'inferieur.
    $min = max($min, intval($prix['min']));
    $max = min($max, intval($prix['max']) + 1);
}
addToURL("min=" . $min . "&max=" . $max);

// Promotion
if (isset($_POST['promo1']) and htmlentities($_POST['promo1']) === 'on') {
    $promo = "only";
} else {
    $promo = "both";
}
if (!$promotion) {
    addToURL("promo=$promo");
}

if (!isset($url)) {
    $url = "";
}
header("location:ListeProduit.php?$url");
die();
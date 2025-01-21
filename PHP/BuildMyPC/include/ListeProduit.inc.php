<?php
include "connect.inc.php";

////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////// extract url datas ///////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

// promo
// categ_id
// searchbar
// sort
// marque_id
// min
// max

$categQuery = "";
$marqueQuery = "";
$priceQuery = "";
$searchBarCaseQuery = "";
$searchBarWhereQuery = "";
$sortingQuery = "";
$onlyPromoQuery = "";
$newestQuery = "";

// Lecture des categories
// on crée une liste de toutes les catégories de la BD
$listeCategorie = [];
$query = "  SELECT idCategorie AS id
                FROM Categorie";
$pdo = $conn->prepare($query);
$pdo->execute();
while ($categorie = $pdo->fetch()) {
  $listeCategorie[] = $categorie['id'];
}
if (isset($_GET['categ_id'])) {
  // on va chercher dans l'url les catégories demandées
  $categories = explode(" ", $_GET['categ_id']);
  // on retire des catégories de l'url celles qui n'existent pas
  foreach ($categories as $key => $categ) {
    $categories[$key] = intval($categ);
    if (!in_array($categ, $listeCategorie)) {
      unset($categories[$key]);
    }
  }
}
// si on a aucune catégorie alors on les met toutes
if (empty($categories)) {
  $categories = $listeCategorie;
}

// on écrit la partie de la requete qui concerne les catégories
$categQuery = "C.idCategorie IN (";
foreach ($categories as $categ) {
  $categQuery .= "$categ,";
}
$categQuery = substr_replace($categQuery, '', -1);
$categQuery .= ") ";


// Lecture des marques
// on fait la meme chose que pour les catégories
$listeMarque = [];
$query = "  SELECT idMarque AS id
                FROM Marque";
$pdo = $conn->prepare($query);
$pdo->execute();
while ($marque = $pdo->fetch()) {
  $listeMarque[] = $marque['id'];
}
if (isset($_GET['marque_id'])) {
  $marques = explode(" ", $_GET['marque_id']);
  // on retire les marques qui n'existent pas
  foreach ($marques as $key => $mrq) {
    $marques[$key] = intval($mrq);
    if (!in_array($mrq, $listeMarque)) {
      unset($marques[$key]);
    }
  }
}
if (empty($marques)) {
  $marques = $listeMarque;
}
$marqueQuery = "M.idMarque IN (";
foreach ($marques as $mrq) {
  $marqueQuery .= "$mrq,";
}
$marqueQuery = substr_replace($marqueQuery, '', -1);
$marqueQuery .= ") ";


// Lecture des prix
if (isset($_GET['min'])) {
  // on récupère la valeur du minimum en int
  $prixMin = intval($_GET['min']);
  $priceQuery = "P.prix >= $prixMin ";
}
if (isset($_GET['max'])) {
  // on récupère la valeur du maximum en int
  $prixMax = intval($_GET['max']);
  $priceQuery .= empty($priceQuery) ? "P.prix <= $prixMax " : "AND P.prix <= $prixMax ";
}


// Lecture de la search bar
if (isset($_GET['searchbar'])) {
  $wordi = [];
  // on récupère chaque mot de la barre de recherche séparement
  $searchBarWords = explode(" ", $_GET['searchbar']);
  $exactWord = ["exactword" => implode(" ", $searchBarWords)];
  // supprime les valeurs vide pouvant être causées par un double espace
  $searchbarWords = array_filter($searchBarWords, fn($value) => $value !== "");
  // On va chercher tous les produits dont le nom, la catégorie ou la marque contient au moins un des mots.
  $searchBarWhereQuery = " P.idNumProduit IN (";
  foreach (["Produit", "Categorie", "Marque"] as $table) {
    $alias = substr($table, 0, 1);
    $idFrom = $table == "Produit" ? "idNum$table" : "id$table";
    $searchBarWhereQuery .= " SELECT Pro.idNumProduit FROM Produit Pro, $table $alias 
                              WHERE Pro.$idFrom = $alias.$idFrom AND (";
    $i = 1;
    foreach ($searchBarWords as $word) {
      if ($i != 1) {
        $searchBarWhereQuery .= " OR ";
      }
      // UPPER pour éviter la casse
      $wordi["word$i"] = "%$word%";
      $searchBarWhereQuery .= " UPPER($alias.nom$table) LIKE UPPER(:word$i) ";
      $i++;
    }
    $searchBarWhereQuery .= ") ";
    // si la table n'est pas la dernière
    if ($table != "Marque") {
      $searchBarWhereQuery .= " UNION ";
    }
  }
  $searchBarWhereQuery .= ") ";
  // On construit un CASE qui va permettre de mesurer la pertinence de la recherche en attribuant
  // un poids à chaque produit. Plus le poids est élevé, plus le produit correspond à la recherche.
  // Le CASE est placé dans le SELECT pour pouvoir trier le poids avec ORDER BY.
  // Les poids sont (du plus au moins lourd) : 
  // - Exactement les mêmes mots (10 à 12)
  // - Tous les mots sont présents dans l'ordre (7 à 9)
  // - Tous les mots sont présents dans le désordre (4 à 6)
  // - Un ou plusieurs mots sont présents (1 à 3)
  // Il y a aussi un poids sur les tables : 
  // - Produit (+2)
  // - Categorie (+1)
  // - Marque (+0)

  // On commence par une virgule car le case sera forcement placé après d'autres attributs dans le SELECT
  $searchBarCaseQuery = ", CASE ";
  $i = 0;
  foreach (["Marque", "Categorie", "Produit"] as $table) {
    $searchBarCaseQuery .= " WHEN UPPER(nom$table) LIKE UPPER(:exactword) THEN " . (10 + $i) . " ";
    $i++;
  }
  $i = 0;
  foreach (["Marque", "Categorie", "Produit"] as $table) {
    // ici on remplace les espaces du mot par % donc on cherche juste si les mots sont présents dans le bon ordre
    $searchBarCaseQuery .= " WHEN UPPER(nom$table) LIKE UPPER(REPLACE(:exactword, ' ', '%')) THEN " . (7 + $i) . " ";
    $i++;
  }
  $i = 0;
  foreach (["Marque", "Categorie", "Produit"] as $table) {
    $searchBarCaseQuery .= " WHEN ";
    $j = 1;
    foreach ($searchBarWords as $word) {
      if ($j != 1) {
        $searchBarCaseQuery .= " AND ";
      }
      $searchBarCaseQuery .= " UPPER(nom$table) LIKE UPPER(:word$j) ";
      $j++;
    }
    $searchBarCaseQuery .= " THEN " . (4 + $i) . " ";
    $i++;
  }
  $i = 0;
  foreach (["Marque", "Categorie", "Produit"] as $table) {
    $searchBarCaseQuery .= " WHEN ";
    $j = 1;
    foreach ($searchBarWords as $word) {
      if ($j != 1) {
        $searchBarCaseQuery .= " OR ";
      }
      $searchBarCaseQuery .= " UPPER(nom$table) LIKE UPPER(:word$j) ";
      $j++;
    }
    $searchBarCaseQuery .= " THEN " . (1 + $i) . " ";
    $i++;
  }
  $searchBarCaseQuery .= " ELSE 0 END AS pertinence ";
}


// Lecture du tri
// Liste de tous les types de tri possible
$sortingList = ["pertinence", "nomProduit_ASC", "nomProduit_DESC", "prix_ASC", "prix_DESC", "bestVentes", "bestNotes"];
// si on a une un tri dans l'url et qu'il fait parti de la liste des tri possible
if (isset($_GET['sort'])) {
  if (in_array($_GET['sort'], $sortingList)) {
    $sortMode = $_GET['sort'];
  }
}
// tri par défaut
if (empty($sortMode)) {
  $sortMode = "nomProduit_ASC";
}
switch ($sortMode) {
  case "pertinence":
    // Si la barre de recherche n'est pas vide alors on tri par pertinence. Sinon par ordre alphabétique croissant.
    if (!empty($searchBarCaseQuery)) {
      // pertinence est un CASE qui va calculer la pertinence des mots càd à quel point ils sont proche des mots donnés dans la barre de recherche
      $sortingQuery = " ORDER BY pertinence DESC, P.nomProduit ASC";
      break;
    }
  case "nomProduit_ASC":
    $sortingQuery = " ORDER BY P.nomProduit ASC";
    break;
  case "nomProduit_DESC":
    $sortingQuery = " ORDER BY P.nomProduit DESC";
    break;
  case "prix_ASC":
    $sortingQuery = " ORDER BY prixRed ASC";
    break;
  case "prix_DESC":
    $sortingQuery = " ORDER BY prixRed DESC";
    break;
  case "bestVentes":
    $sortingQuery = " ORDER BY SUM(COALESCE(AC.qte,1)) DESC";
    break;
  case "bestNotes":
    // COALESCE retourne la première valeur non null de la liste. Ici, retourne 0 si la note est null
    $sortingQuery = " ORDER BY AVG(COALESCE(A.note,0)) DESC";
    break;
  default:
    $sortingQuery = "";
    break;
}


if (isset($_GET['promo']) and $_GET['promo'] == "only") {
  $onlyPromoQuery = " P.idNumProduit IN ( SELECT EP.idNumProduit 
                                          FROM EnPromo EP, Promotion Promo
                                          WHERE EP.idPromotion = Promo.idPromotion
                                          AND Promo.active = 1) ";
}

if (isset($_GET['newest']) and $_GET['newest'] == true) {
  $newestQuery = " P.nouveau = 1 ";
}

// construction du select : 
/**
 * Recupère la liste des query à insérer dans la clause WHERE et les ajoute à la clause WHERE 
 * si ils ne sont pas vide. Ajoute AND entre les query quand il y en a plus de 1.
 * Si il n'y a pas de query ou qu'ils sont tous vide, retourne une chaine vide.
 * @param array $queryParts la liste des query à ajouter
 * @return string la clause WHERE si des query ont été ajoutés ou une chaine vide.
 */
function buildWhereClause(array $queryParts): string
{
  $query = " WHERE ";
  $i = 0;
  foreach ($queryParts as $part) {
    if (!empty($part)) {
      $query .= $i > 0 ? " AND $part " : " $part ";
      $i++;
    }
  }
  return $i > 0 ? " $query " : " ";
}

$whereClause = buildWhereClause([$categQuery, $marqueQuery, $priceQuery, $searchBarWhereQuery, $onlyPromoQuery, $newestQuery]);

$selectPrix = "SELECT P.idNumProduit, MIN(P.prix-(P.prix*(Pro.pourcentageReduction/100))) AS prixReduc
                FROM Promotion Pro, EnPromo EP, Produit P
                WHERE Pro.idPromotion = EP.idPromotion AND EP.idNumProduit = P.idNumProduit AND Pro.active = 1
                GROUP BY P.idNumProduit";

$selectProducts =
  " SELECT DISTINCT P.idNumProduit AS idProduit, P.nomProduit AS nomProduit, C.nomCategorie AS nomCategorie, P.prix AS prix, COALESCE(PrixR.prixReduc,P.prix) AS prixRed, P.stock $searchBarCaseQuery
  FROM Produit P LEFT OUTER JOIN Avis A ON P.idNumProduit = A.idNumProduit
  INNER JOIN Categorie C ON P.idCategorie = C.idCategorie
  INNER JOIN Marque M ON P.idMarque = M.idMarque
  LEFT OUTER JOIN ACommande AC ON P.idNumProduit = AC.idNumProduit
  LEFT OUTER JOIN ($selectPrix) AS PrixR ON P.idNumProduit = PrixR.idNumProduit 
  $whereClause 
  GROUP BY P.idNumProduit, P.nomProduit, C.nomCategorie, P.prix
  $sortingQuery";




////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////// get and display products ////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

/**
 * Creates a new grid item with the given informations
 * 
 * @param int $gridPosition the position of the element on the grid
 * @param int $idProduct the id of the product
 * @param string $name name of the product
 * @param string $category category of the product
 * @param float $price normal price of the product
 * @param string $imagePath the path to the image (with the extension)
 * @param array $components if the product is a PC, the list of the names of it's components
 * @param int $reduction if the article has a promotion, the percentage of its reduction (between 1 and 99).
 * @return bool
 */
function new_product(int $gridPosition, int $idProduct, string $name, string $category, float $price, int $stock, string $imagePath, array $components = [], int $reduction = 0): bool
{
  if ($gridPosition <= 0 || $idProduct < 0 || empty($name) || empty($category) || $price <= 0 || $reduction < 0 || $reduction > 99) {
    return false;
  }
  // format the price to have only two decimals and a € instead of a .
  $formated_price = str_replace(".", "€", number_format($price, 2));

  echo "<div class='grid-item item$gridPosition'>";
  echo "<a href='detailsProduit.php?id=$idProduct' class='product image'>
    <img src='image/produits/$imagePath' alt='imgProduit' class='product' />";
  if ($reduction > 0) {
    echo "<span class='product badge'>-$reduction%</span>";
  }
  echo "</a>";
  echo "<div class='product name'>$name</div>";
  if (!empty($components)) {
    echo "<div class='product components'>" . implode(" - ", $components) . "</div>";
  }
  echo "<div class='product category'>$category</div>";
  if ($reduction > 0) {
    echo "<div class='product normal-price'>" . $formated_price . "</div>";
    echo "<div class='product promotion'>" . str_replace(".", "€", number_format($price - ($price * ($reduction / 100)), 2)) . "</div>";
  } else {
    echo "<div class='product price'>" . $formated_price . "</div>";
  }
  if ($stock > 0) {
    echo "<a class='product btnPanier' href='ajoutProduit.php?id=$idProduct'>
        <div class='product btnPanier'>Ajouter au panier</div>
      </a>";
  } else {
    echo "<a class='product btnPanier disabled' href='#'>
    <div class='product btnPanier'>Rupture de stock</div>
    </a>";
  }
  echo "</div>";
  return true;
}

function getComposants(int $idProduit): array
{
  global $conn;
  $composants = [];

  $query = "  SELECT P.nomProduit AS nomProduit
                FROM Comporte C, Produit P
                WHERE P.idNumProduit = C.idNumProduitComporte AND C.idNumProduitComportant = ?
                ORDER BY P.nomProduit ASC";
  $pdo = $conn->prepare($query);
  $pdo->execute([$idProduit]);
  while ($produit = $pdo->fetch()) {
    $composants[] = $produit["nomProduit"];
  }
  return $composants;
}

function getImages(int $idProduit): array
{
  global $conn;
  $images = [];

  $query = "  SELECT I.nomImage AS image
                FROM Contient C, Image I
                WHERE I.idImage = C.idImage AND C.idNumProduit = ?
                ORDER BY I.idImage ASC";
  $pdo = $conn->prepare($query);
  $pdo->execute([$idProduit]);
  while ($produit = $pdo->fetch()) {
    $images[] = $produit["image"];
  }
  return $images;
}

/**
 * Search the database for a promotion on a product and return the reduction 
 * percentage of this promotion. If there are no promotions it returns 0 and if 
 * there are multiple promotions return the highest value.
 * @param int $idProduit id of the product to search
 * @return int the value of the reduction (between 0 and 99)
 */
function getPromotion(int $idProduit): int
{
  $reduction = 0;
  global $conn;

  $query = "  SELECT P.pourcentageReduction AS reduc
                FROM Promotion P, EnPromo EP
                WHERE P.idPromotion = EP.idPromotion AND EP.idNumProduit = ?
                ORDER BY P.idPromotion ASC";
  $pdo = $conn->prepare($query);
  $pdo->execute([$idProduit]);
  while ($promotion = $pdo->fetch()) {
    $reduction = max($reduction, $promotion['reduc']);
  }
  return $reduction;
}

/**
 * Search all the products in the database and return an array with 7 elements : 
 * - idProduit : int
 * - nomProduit : string
 * - nomCategorie : string
 * - prix : float 
 * - image : string 
 * - composants : array of string
 * - reduction : int 
 * @return array a dictionnary
 */
function getProducts(): array
{
  global $conn;
  global $selectProducts;
  global $wordi;
  global $exactWord;
  $products = [];

  $pdo = $conn->prepare($selectProducts);
  if (isset($wordi) and isset($exactWord)) {
    $pdo->execute(array_merge($wordi, $exactWord));
  } else {
    $pdo->execute();
  }
  while ($produit = $pdo->fetch()) {
    $id = $produit["idProduit"];
    $products[] = [
      "idProduit" => $produit["idProduit"],
      "nomProduit" => $produit["nomProduit"],
      "nomCategorie" => $produit["nomCategorie"],
      "prix" => $produit["prix"],
      "stock" => $produit["stock"],
      "image" => getImages($id)[0] ?? "no-image.jpg", // soit la première image soit une image indiquant qu'il n'y en a pas
      "composants" => getComposants($id),
      "reduction" => getPromotion($id)
    ];
  }
  return $products;
}

$products = getProducts();

function displayProducts()
{
  global $products;
  $i = 0;
  foreach ($products as $produit) {
    $i++;
    new_product($i, $produit["idProduit"], $produit["nomProduit"], $produit["nomCategorie"], $produit["prix"], $produit["stock"], $produit["image"], $produit["composants"], $produit["reduction"]);
  }
  if ($i < 3) {
    while ($i < 3) {
      $i++;
      echo "<div class='grid-item item$i empty'> </div>";
    }
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////// Selection part /////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////

function getSelectionCriterias()
{
  global $conn;
  $selection = [];
  // requetes categories
  $query = "  SELECT idCategorie AS id, nomCategorie AS nom, idCategoriePere AS idPere
                FROM Categorie
                ORDER BY nomCategorie ASC";
  $pdo = $conn->prepare($query);
  $pdo->execute();
  while ($categorie = $pdo->fetch()) {
    if (!empty($categorie['nom'])) {
      $selection['categories'][] = [
        'id' => $categorie['id'],
        'nom' => $categorie['nom'],
        'idPere' => $categorie['idPere']
      ];
    }
  }

  // suppression des categories parent
  $parent = [];
  foreach ($selection['categories'] as $categorie) {
    if (!empty($categorie['idPere'])) {
      $parent[] = $categorie['idPere'];
    }
  }
  for ($i = 0; $i < sizeof($selection['categories']); $i++) {
    if (in_array($selection['categories'][$i]['id'], $parent)) {
      unset($selection['categories'][$i]);
    }
  }

  // requetes marques
  $query = "  SELECT idMarque AS id, nomMarque AS nom
                FROM Marque
                ORDER BY nomMarque ASC";
  $pdo = $conn->prepare($query);
  $pdo->execute();
  while ($marque = $pdo->fetch()) {
    if (!empty($marque['nom'])) {
      $selection['marques'][] = [
        'id' => $marque['id'],
        'nom' => $marque['nom']
      ];
    }
  }

  // Si vous rajoutez des criteres de selection. Merci de ne pas mettre le prix ni promotion.
  return $selection;
}

$selecCriteria = getSelectionCriterias();

/**
 * To put inside an empty form element.
 * @param bool $small the parameter that define if the elements needs to have the class "small"
 * @return void
 */
function setSelectionCriterias(bool $small)
{
  global $conn;
  global $prixMin;
  global $prixMax;
  global $categories;
  global $marques;

  $smallClass = $small ? " small" : "";
  $smallId = $small ? "-small" : "";

  $min = 0;
  $max = 10000;

  $query = "  SELECT MIN(prix) AS min, MAX(prix) AS max
                FROM Produit";
  $pdo = $conn->prepare($query);
  $pdo->execute();
  if ($prix = $pdo->fetch()) {
    // intval récupere la valeur en int, arrondit à l'inferieur.
    $min = intval($prix['min']);
    $max = intval($prix['max']) + 1;
  }
  $minValue = $min;
  $maxValue = $max;
  if (isset($prixMin)) {
    $minValue = max($prixMin, $min);
  }
  if (isset($prixMax)) {
    $maxValue = min($prixMax, $max);
  }

  echo "<ul class='selection parent$smallClass'>";

  $i = 1;
  setOneSelectionCriteria($small, $i, "Categorie", "categories", "categ", $categories);
  $i++;
  setOneSelectionCriteria($small, $i, "Marque", "marques", "marque", $marques);
  $i++;
  echo "<li class='selection title$smallClass'>
            <label class='selection title$smallClass' for='toggle-list$smallId$i'>
              Prix
            </label>
            <input class='selection title$smallClass' type='checkbox' name='toggle-list$i' id='toggle-list$smallId$i'
              checked />
          </li>
          <li class='selection content$smallClass'>
            <ul class='selection$smallClass'>
              <li class='selection$smallClass'>
                <label class='selection$smallClass' for='minimum$smallId'>
                  Minimum :
                </label>
                <input name='minimum' id='minimum$smallId' class='selection$smallClass' type='number' min='$min' max='$max'
                  placeholder='$minValue' value='$minValue' />
                <span class='selection price$smallClass'>€</span>
              </li>
              <li class='selection$smallClass'>
                <label class='selection$smallClass' for='maximum$smallId'>
                  Maximum :
                </label>
                <input name='maximum' id='maximum$smallId' class='selection$smallClass' type='number' min='$min' max='$max'
                  placeholder='$maxValue' value='$maxValue' />
                <span class='selection price$smallClass'>€</span>
              </li>
            </ul>
          </li>";
  $i++;
  $checked = (isset($_GET['promo']) and $_GET['promo'] == 'only') ? "checked" : "";
  echo "<li class='selection title$smallClass'>
            <label class='selection title$smallClass' for='toggle-list$smallId$i'>Promotion</label>
            <input class='selection title$smallClass' type='checkbox' name='toggle-list$i' id='toggle-list$smallId$i' checked />
          </li>
          <li class='selection content$smallClass'>
            <ul class='selection$smallClass'>
              <li class='selection$smallClass'>
                <label class='selection$smallClass' for='promo{$smallId}_1'>
                  Articles en promotion
                  <input name='promo1' id='promo{$smallId}_1' class='selection$smallClass' type='checkbox' $checked />
                </label>
              </li>
            </ul>
          </li>";
  echo "<li class='selection$smallClass'>
            <button type='submit' id='submitButton' class='selection affiner$smallClass'>
              Affiner la recherche
            </button>
          </li>";
  echo '</ul>';
}

/**
 * 
 * @param bool $small
 * @param int $togglePos
 * @param string $titre
 * @param string $accessKey
 * @param string $nameOfInput !! don't put _ in this variable
 * @return void
 */
function setOneSelectionCriteria(bool $small, int $togglePos, string $titre, string $accessKey, string $nameOfInput, array $checkedId)
{
  global $selecCriteria;
  global $categories;

  $smallClass = $small ? " small" : "";
  $smallId = $small ? "-small" : "";

  echo "<li class='selection title$smallClass'>
                <label class='selection title$smallClass' for='toggle-list$smallId$togglePos'>$titre</label>
                <input class='selection title$smallClass' type='checkbox' name='toggle-list$togglePos' id='toggle-list$smallId$togglePos' checked />
            </li>
            <li class='selection content$smallClass'>
                <ul class='selection$smallClass'>";
  $i = 0;
  foreach ($selecCriteria[$accessKey] as $value) {
    $i++;
    $id = $value["id"];
    $name = $value["nom"];
    $checked = in_array(intval($id), $checkedId) ? "checked" : "";
    echo "<li class='selection$smallClass'>
            <label class='selection$smallClass' for='$nameOfInput$smallId$i'>
                $name
              <input name='{$nameOfInput}_$id' id='$nameOfInput$smallId$i' class='selection$smallClass' type='checkbox' $checked />
            </label>
          </li>";
  }
  echo '</ul></li>';
}
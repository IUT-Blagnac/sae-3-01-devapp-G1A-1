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
// sort $sortingList = ["pertinence", "nomProduit_ASC", "nomProduit_DESC", "prix_ASC", "prix_DESC", "bestVentes", "bestNotes"];
// marque_id
// min
// max

$categQuery = "";
$marqueQuery = "";
$priceQuery = "";
$sortingQuery = "";
$searchBarQuery = "";
$onlyPromo = false;

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
  $categories = explode("+", $_GET['categ_id']);
  // on retire des catégories de l'url celles qui n'existent pas
  foreach ($categories as $key => $categ) {
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
  $marques = explode("+", $_GET['marque_id']);
  // on retire les marques qui n'existent pas
  foreach ($marques as $key => $mrq) {
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
  $min = intval($_GET['min']);
  $priceQuery = "P.prix >= $min ";
}
if (isset($_GET['max'])) {
  // on récupère la valeur du maximum en int
  $max = intval($_GET['max']);
  $priceQuery = empty($priceQuery) ? "P.prix <= $max " : "AND P.prix <= $max ";
}


// Lecture du tri
$sortingList = ["pertinence", "nomProduit_ASC", "nomProduit_DESC", "prix_ASC", "prix_DESC", "bestVentes", "bestNotes"];
if (isset($_GET['sort'])) {

}


if (isset($_GET['promo']) and $_GET['promo'] == "only") {
  $onlyPromo = true;
}


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
function new_product(int $gridPosition, int $idProduct, string $name, string $category, float $price, string $imagePath, array $components = [], int $reduction = 0): bool
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
  echo "<button class='product btnPanier' type='submit'>
        <div class='product btnPanier'>Ajouter au panier</div>
      </button>
    </div>";
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
  $products = [];

  $query = "  SELECT P.idNumProduit AS idProduit, P.nomProduit AS nomProduit, C.nomCategorie AS nomCategorie, P.prix AS prix
                FROM Categorie C, Produit P
                WHERE P.idCategorie = C.idCategorie
                ORDER BY P.nomProduit ASC";
  $pdo = $conn->prepare($query);
  $pdo->execute();
  while ($produit = $pdo->fetch()) {
    $id = $produit["idProduit"];
    $products[] = [
      "idProduit" => $produit["idProduit"],
      "nomProduit" => $produit["nomProduit"],
      "nomCategorie" => $produit["nomCategorie"],
      "prix" => $produit["prix"],
      "image" => getImages($id)[0] ?? "no-image.jpg", // soit la première image soit une image indiquant qu'il n'y en a pas
      "composants" => getComposants($id),
      "reduction" => getPromotion($id)
    ];
  }
  return $products;
}

function displayAllProducts()
{
  $products = getProducts();
  $i = 0;
  foreach ($products as $produit) {
    $i++;
    new_product($i, $produit["idProduit"], $produit["nomProduit"], $produit["nomCategorie"], $produit["prix"], $produit["image"], $produit["composants"], $produit['reduction']);
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

  echo "<ul class='selection parent$smallClass'>";

  $i = 1;
  setOneSelectionCriteria($small, $i, "Categorie", "categories", "categ");
  $i++;
  setOneSelectionCriteria($small, $i, "Marque", "marques", "marque");
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
                  placeholder='$min' value='$min' />
                <span class='selection price$smallClass'>€</span>
              </li>
              <li class='selection$smallClass'>
                <label class='selection$smallClass' for='maximum$smallId'>
                  Maximum :
                </label>
                <input name='maximum' id='maximum$smallId' class='selection$smallClass' type='number' min='$min' max='$max'
                  placeholder='$max' value='$max' />
                <span class='selection price$smallClass'>€</span>
              </li>
            </ul>
          </li>";
  $i++;
  echo "<li class='selection title$smallClass'>
            <label class='selection title$smallClass' for='toggle-list$smallId$i'>Promotion</label>
            <input class='selection title$smallClass' type='checkbox' name='toggle-list$i' id='toggle-list$smallId$i' checked />
          </li>
          <li class='selection content$smallClass'>
            <ul class='selection$smallClass'>
              <li class='selection$smallClass'>
                <label class='selection$smallClass' for='promo{$smallId}_1'>
                  Articles en promotion
                  <input name='promo1' id='promo{$smallId}_1' class='selection$smallClass' type='checkbox' />
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
function setOneSelectionCriteria(bool $small, int $togglePos, string $titre, string $accessKey, string $nameOfInput)
{
  global $selecCriteria;

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
    echo "<li class='selection$smallClass'>
                            <label class='selection$smallClass' for='$nameOfInput$smallId$i'>
                                $name
                              <input name='{$nameOfInput}_$id' id='$nameOfInput$smallId$i' class='selection$smallClass' type='checkbox' />
                            </label>
                          </li>";
  }
  echo '</ul></li>';
}
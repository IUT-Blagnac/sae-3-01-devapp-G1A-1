<?php session_start(); ?>

<!DOCTYPE html>
<html lang="fr">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>BuildMyPC</title>
  <link rel="stylesheet" href="css/header.css">
  <link rel="stylesheet" href="css/footer.css">
  <link rel="stylesheet" href="css/main.css">
  <link rel="icon" href="image/BuildMyPC_logo.png" />

</head>

<body>
  <!-- Header principal -->
  <?php include 'include/header.php'; ?>

  <!-- Contenu principal -->
  <main>
    
    <!-- Test Pablo  -->
    <section>
      <h2 class="popular-categ">Catégories populaires</h2>

      <div class="row">
        <a href="traitListeProduit.php" class="column column-left" style="background-color:#74FFA9;">
          <img class="pcGaming-img" src="image/produits/pcGaming.webp" alt="PC Gaming">
          <div class="text-container">
            <h2>PC GAMING</h2>
            <p>Découvrez notre large gamme de PC Fixes Gaming prémontés.
              Vous retrouverez différentes configurations qui sauront convenir à tous les budgets !</p>
          </div>
        </a>
        <a href="traitListeProduit.php" class="column column-right" style="background-color:#212121;">
          <img class="pcBureautique-img" src="image/produits/pcBureautique.png" alt="PC Bureautique">
          <h2 class="text-column-2">PC Bureautique</h2>
        </a>
        <a href="traitListeProduit.php" class="column column-right" style="background-color:#212121;">
          <img class="carteGraphique-img" src="image/produits/carteGraphique.webp" alt="Carte Graphique">
          <h2 class="text-column-3">Carte Graphique</h2>
        </a>
      </div>
    </section>

    <!-- fin test Pablo -->

    <section>
      <!-- /////////////////////////////////
       /////////////// Grid ////////////////
       ///////////////////////////////// -->
      </div>
      <h2 class="titre-produit">Meilleures promotions</h2>


      <div class="gallery js-flickity" data-flickity-options='{ "wrapAround": true }'>
        <div class="gallery-cell">
          <div class="grid-item item1">
            <a href="#" class="product image">
              <img src="image/produits/pcGaming2.png" alt="imgProduit" class="product" />
              <span class="product badge">-20%</span>
            </a>
            <div class="product name">PC Gamer 4070 super powa</div>
            <div class="product components">
              AMD Ryzen 7 - 32Go - AMD Radeon RX7900XT
            </div>
            <div class="product category">PC Gaming</div>
            <div class="product normal-price">2079€99</div>
            <div class="product promotion">1663€99</div>
            <button class="product btnPanier" type="submit">
              <div class="product btnPanier">Ajouter au panier</div>
            </button>
          </div>
        </div>


        <div class="gallery-cell">
          <div class="grid-item item2">
            <a href="#" class="product image">
              <img src="image/produits/pcGaming3.png" alt="imgProduit" class="product" />
              <span class="product badge">-11%</span>
            </a>
            <div class="product name">PC GAMER THUNDER</div>
            <div class="product components">
              Intel Core i7 - 32Go - nVidia GF RTX 4080 SUPER
            </div>
            <div class="product category">PC Gaming</div>
            <div class="product normal-price">2649€99</div>
            <div class="product promotion">2349€99</div>
            <button class="product btnPanier" type="submit">
              <div class="product btnPanier">Ajouter au panier</div>
            </button>
          </div>
        </div>


        <div class="gallery-cell">
          <div class="grid-item item3">
            <a href="#" class="product image">
              <img src="image/produits/carteGraphique.webp" alt="imgProduit" class="product" />
              <span class="product badge">-40%</span>
            </a>
            <div class="product name">MSI GeForce RTX 4060 SUPER 16G VENTUS 3X OC</div>
            <br>
            <div class="product category">Carte graphique</div>
            <div class="product normal-price">1199€99</div>
            <div class="product promotion">719€99</div>
            <button class="product btnPanier" type="submit">
              <div class="product btnPanier">Ajouter au panier</div>
            </button>
          </div>
        </div>


        <div class="gallery-cell">
          <div class="grid-item item3">
            <a href="#" class="product image">
              <img src="image/produits/pcGaming2.png" alt="imgProduit" class="product" />
              <span class="product badge">-5%</span>
            </a>
            <div class="product name">Asus Corsair 4000D</div>
            <div class="product components">
              NZXT Intel Core i7- 16Go - MSI GTX 1660 Ti
            </div>
            <div class="product category">PC Gaming</div>
            <div class="product normal-price">1429€99</div>
            <div class="product promotion">1358€49</div>
            <button class="product btnPanier" type="submit">
              <div class="product btnPanier">Ajouter au panier</div>
            </button>
          </div>
        </div>


        <div class="gallery-cell">
          <div class="grid-item item3">
            <a href="#" class="product image">
              <img src="image/produits/pcGaming.webp" alt="imgProduit" class="product" />
              <span class="product badge">-40%</span>
            </a>
            <div class="product name">MSI Trident Z RGB super</div>
            <div class="product components">
              Intel Core Ultra 7 - 32Go - MSI GeForce RTX 4080 SUPER 34G
            </div>
            <div class="product category">PC Gaming</div>
            <div class="product normal-price">2502€99</div>
            <div class="product promotion">1501€79</div>
            <button class="product btnPanier" type="submit">
              <div class="product btnPanier">Ajouter au panier</div>
            </button>
          </div>
        </div>
      </div>

      <h2 class="titre-produit">Produits les plus populaires</h2>

      <div class="gallery js-flickity" data-flickity-options='{ "wrapAround": true }'>
        <div class="gallery-cell">
          <div class="grid-item item1">
            <a href="#" class="product image">
              <img src="image/produits/carteGraphique3.webp" alt="imgProduit" class="product" />
            </a>
            <div class="product name">Sapphire Pulse Radeon RX 7800 XT GAMING 16GB</div>
            <div class="product category">Carte Graphique</div>
            <div class="product price">569€99</div>
            <button class="product btnPanier" type="submit">
              <div class="product btnPanier">Ajouter au panier</div>
            </button>
          </div>
        </div>

        <div class="gallery-cell">
          <div class="grid-item item2">
            <a href="#" class="product image">
              <img src="image/produits/pcGaming4.webp" alt="imgProduit" class="product" />
            </a>
            <div class="product name">PC Gamer 4070 super powa</div>
            <div class="product components">
              Intel Core i5 - 16Go - RTX 4070 SUPER
            </div>
            <div class="product category">PC Gaming</div>
            <div class="product price">1399€99</div>
            <button class="product btnPanier" type="submit">
              <div class="product btnPanier">Ajouter au panier</div>
            </button>
          </div>
        </div>

        <div class="gallery-cell">
          <div class="grid-item item3">
            <a href="#" class="product image">
              <img src="image/produits/carteGraphique2.webp" alt="imgProduit" class="product" />
            </a>
            <div class="product name">MSI GeForce RTX 4080 SUPER 34G</div>
            <div class="product category">Carte graphique</div>
            <div class="product price">1199€99</div>
            <button class="product btnPanier" type="submit">
              <div class="product btnPanier">Ajouter au panier</div>
            </button>
          </div>
        </div>

        <div class="gallery-cell">
          <div class="grid-item item3">
            <a href="#" class="product image">
              <img src="image/produits/processeurIntel.webp" alt="imgProduit" class="product" />
            </a>
            <div class="product name">Intel Core Ultra 7 265K - LGA1851/Sans boite</div>
            <div class="product category">Processeur</div>
            <div class="product price">479€99</div>
            <button class="product btnPanier" type="submit">
              <div class="product btnPanier">Ajouter au panier</div>
            </button>
          </div>
        </div>

        <div class="gallery-cell">
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
          </div>
        </div>

      </div>
    </section>

    <!--
    <img class="d-block w-100" src="image/produits/carteGraphique3.webp" alt="First slide">
    <img class="d-block w-100" src="image/produits/pcGaming4.webp" alt="Second slide">
    <img class="d-block w-100" src="image/produits/processeurIntel.webp" alt="Third slide">
    -->

    <!-- test titouan -->

    <!-- Flickity HTML init -->

    <!-- fin test titouan -->
  </main>

  <?php
  include "include/footer.php";
  ?>

  <!-- Lien vers le fichier JavaScript -->
  <script src="js/carousel.js"></script>

</body>

</html>
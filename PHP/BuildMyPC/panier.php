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
  <link rel="stylesheet" href="css/panier.css">
  <link rel="icon" href="image/BuildMyPC_logo.png" />

</head>

<body>
  <!-- Header principal -->
  <?php include 'include/header.php'; ?>

  <!-- Contenu principal -->
  <main>
    <h2 class="titre-panier">Votre Panier</h2>

    <ul>
      <div class="panier-container left">
        <li>
          <div class="panier-item">
            <img src="image/produits/pcGaming4.webp" alt="Produit 1" class="panier-image">
            <div class="panier-info">
              <h3 class="panier-nom">PC Gamer 4070 super powa</h3>
              <p class="panier-quantite">Quantité: <input name="maximum" id="maximum" class="selection" type="number"
                  min="1" placeholder="1" /></p>
              <!-- faire une demande de suppression si la qte sélectionner est égale à 0 (même chose que pour le bouton suprim -->
              <p class="panier-prix">Prix: 1 399€99</p>
            </div>
            <button class="panier-supprimer">Supprimer</button>
          </div>
        </li>
        <li>
          <div class="panier-item">
            <img src="image/produits/carteGraphique3.webp" alt="Produit 2" class="panier-image">
            <div class="panier-info">
              <h3 class="panier-nom">Sapphire Pulse Radeon RX 7800 XT GAMING 16GB</h3>
              <p class="panier-quantite">Quantité: <input name="maximum" id="maximum" class="selection" type="number"
                  min="1" placeholder="1" /></p>
              <p class="panier-prix">Prix: 569€99</p>
            </div>
            <button class="panier-supprimer">Supprimer</button>
          </div>

        </li>
      </div>
    </ul>

    <div class="panier-container right">
      <div class="panier-total">
        <p class="total">Total : 1 969€98</p>
        <button class="panier-valider">Commander</button>
      </div>
    </div>

  </main>
  <!-- Fin Contenu principal -->

  <?php
  include_once "include/footer.php";
  ?>

  <!-- Lien vers le fichier JavaScript -->

</body>

</html>
<header>
  <div class="header-top" style="display: flex; align-items: center;">

    <?php
    include 'include/connect.inc.php';

    try {
      // Récupération des catégories
      $sql = "SELECT idCategorie, nomCategorie, idCategoriePere FROM Categorie";
      $result = $conn->query($sql);

      // Organisation initiale des catégories
      $categories = [];
      $sousCategories = []; // Stockage temporaire des sous-catégories

      while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
        $id = $row['idCategorie'];
        $pere = $row['idCategoriePere'];

        $categories[$id] = [
          'nom' => $row['nomCategorie'],
          'pere' => $pere,
          'sousCategories' => []
        ];

        // Si une catégorie a un parent, la stocker temporairement
        if ($pere !== null) {
          $sousCategories[$id] = $pere;
        }
      }

      // Associer les sous-catégories à leurs parents
      foreach ($sousCategories as $id => $pere) {
        if (isset($categories[$pere])) {
          $categories[$pere]['sousCategories'][$id] = $categories[$id];
          unset($categories[$id]); // Retirer de la liste des catégories principales
        }
      }
    } catch (PDOException $e) {
      echo "Erreur : " . $e->getMessage();
    }
    ?>

    <!-- Menu latéral -->
    <div id="overlay"></div>
    <div id="sideMenu">
      <h2 id="menuTitle">Catégories</h2>
      <button id="closeBtn">&times;</button>
      <div class="footer-main__separator"></div>
      <nav class="main-nav-side">
        <!-- Menu principal -->
        <ul class="navbar-side" id="mainMenu">
          <li class='nav-item'>
            <a href='traitListeProduit.php?newest=true' class='nav-link'>Nouveautés</a>
          </li>
          <?php
          // Affichage des catégories principales
          foreach ($categories as $id => $category) {
            echo "<li class='nav-item'>";

            // Si la catégorie principale a des sous-catégories, afficher le lien avec data-target
            if (!empty($category['sousCategories'])) {
              echo "<a href='traitListeProduit.php?categ_id=$id' class='nav-link' data-target='category-$id'>{$category['nom']}</a>";
            } else {
              // Sinon, afficher juste le nom sans le data-target
              echo "<a href='traitListeProduit.php?categ_id=$id' class='nav-link'>{$category['nom']}</a>";
            }
            echo "</li>";
          }
          echo "<li class='nav-item'>";
          echo "<a href='traitListeProduit.php?promotion=true' class='nav-link'><div class='colored'>Promotions</div></a>";
          echo "</li>";
          ?>
        </ul>


        <!-- Bouton retour -->
        <div id="backBtn" class="hidden">&larr;</div>
        <!-- Sous-menus -->
        <?php
        // Affichage des sous-catégories pour chaque catégorie principale
        foreach ($categories as $id => $category) {
          if (!empty($category['sousCategories'])) {
            echo "<ul class='navbar-side hidden' id='category-$id'>";
            foreach ($category['sousCategories'] as $subId => $subcategory) {
              echo "<li><a href='traitListeProduit.php?categ_id=$subId' class='dropdown-item'>{$subcategory['nom']}</a></li>";
            }
            echo "</ul>";
          }
        }
        ?>
      </nav>
    </div>

    <!-- Fin de menu Latéral -->


    <!-- Bouton Menu -->
    <button class="menu-icon">
      <img src="image/menu.jpg" alt="Menu Icon" width="40" height="40" loading="auto">
    </button>

    <a href="index.php"><img src="image/BuildMyPC_Sans-Fond.png" alt="Logo BuildMyPC" class="logo" width="200"
        height="52" loading="auto"></a>

    <!-- Formulaire de recherche -->
    <form action="traitListeProduit.php" method="POST" class="search-form" role="search" style="flex-grow: 1;">
      <label class="search-bar-label" for="search-bar">Search for stuff</label>
      <input class="search-bar" type="search" name="search-bar" placeholder="Cherche un produit, une marque..." autofocus required />
      <button class="search-button" type="submit">
        <img src="image/loupe.png" alt="Search Icon" width="37%">
      </button>
    </form>

    <!-- Icônes utilisateur et panier -->
    <div class="double-icon">
      <div>
        <?php if (isset($_SESSION['login'])) { ?>
          <a href="consultCompte.php"><img src="image/profil_vert.png" alt="User Profile" class="icon-profil" width="50" height="50" loading="auto"></a>
          <label class="text-icon-profil"><?php echo $_SESSION['prenom']; ?></label>
        <?php } else { ?>
          <a href="formConnexion.php"><img src="image/profil_blanc.png" alt="User Profile" class="icon-profil" width="50" height="50" loading="auto"></a>
          <label class="text-icon-profil">Compte</label>
        <?php } ?>
      </div>
      <div>
        <a href="panier.php"><img src="image/panier_blanc.png" alt="Shopping Cart" class="icon-panier" width="40"
            height="35" loading="auto" style="margin-top: 8px;"></a>
        <label class="text-icon-panier">
          <div style="padding-top: 7px;">Panier</div>
        </label>
      </div>
    </div>
  </div>

  <!-- Barre de navigation -->
  <nav class="main-nav">
    <ul class="navbar">
      <!-- Menu principal avec dropdown -->
      <li class="nav-item">
        <a href="traitListeProduit.php?newest=true" class="nav-link">Nouveautés</a>
        <ul class="dropdown-menu">
        </ul>
      </li>
      <?php
      // Affichage des catégories principales avec dropdown
      foreach ($categories as $id => $category) {
        echo "<li class='nav-item'>";

        // Si c'est une catégorie Promotions, ajouter la classe colored
        if ($category['nom'] === 'Promotions') {
          echo "<a href='traitListeProduit.php?promotion=true' class='nav-link'><div class='colored'>{$category['nom']}</div></a>";
        } else {
          echo "<a href='traitListeProduit.php?categ_id=$id' class='nav-link'>{$category['nom']}</a>";
        }

        // Si la catégorie a des sous-catégories, les afficher dans un dropdown
        if (!empty($category['sousCategories'])) {
          echo "<ul class='dropdown-menu'>";
          foreach ($category['sousCategories'] as $subId => $subcategory) {
            echo "<li><a href='traitListeProduit.php?categ_id=$subId' class='dropdown-item'>{$subcategory['nom']}</a></li>";
          }
          echo "</ul>";
        } else {
          // Sinon, afficher un dropdown vide
          echo "<ul class='dropdown-menu'></ul>";
        }

        echo "</li>";
      }
      ?>
      <li class="nav-item">
        <a href="traitListeProduit.php?promotion=true" class="nav-link">
          <div class="colored">Promotions</div>
        </a>
      </li>
    </ul>
  </nav>
</header>

<!-- Script pour le menu latéral -->
<script src="js/icon_navbar.js"></script>
<script src="js/menu_lateral.js"></script>
<script src="js/submenu_lateral.js"></script>
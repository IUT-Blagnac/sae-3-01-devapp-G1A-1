<header>
  <div class="header-top" style="display: flex; align-items: center;">
    <!-- Logo du site -->

    <!-- Menu latéral -->
    <div id="overlay"></div>
    <div id="sideMenu">
      <h2 id="menuTitle">Catégories</h2>
      <button id="closeBtn">&times;</button>
      <div class="footer-main__separator"></div>
      <nav class="main-nav-side">
        <!-- Menu principal -->
        <ul class="navbar-side" id="mainMenu">
          <li class="nav-item">
            <a href="#" class="nav-link">Nouveautés</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link" data-target="pc-gaming">PC Gaming</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link" data-target="pc-bureautique">PC Bureautique</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link" data-target="composants">Composants</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <div class="colored">Promotions</div>
            </a>
          </li>
        </ul>


        <!-- Bouton retour -->
        <div id="backBtn" class="hidden">&larr;</div>
        <!-- Sous-menus -->
        <ul class="navbar-side hidden" id="pc-gaming">
          <li><a href="#" class="dropdown-item">Gaming Laptop</a></li>
          <li><a href="#" class="dropdown-item">Gaming Desktop</a></li>
        </ul>
        <ul class="navbar-side hidden" id="pc-bureautique">
          <li><a href="#" class="dropdown-item">Ordinateurs Professionnels</a></li>
        </ul>
        <ul class="navbar-side hidden" id="composants">
          <li><a href="#" class="dropdown-item">Processeurs</a></li>
          <li><a href="#" class="dropdown-item">Cartes Graphiques</a></li>
        </ul>
      </nav>
    </div>

    <!-- Fin de menu Latéral -->


    <!-- Bouton Menu -->
    <button class="menu-icon">
      <img src="image/menu.jpg" alt="Menu Icon" width="40" height="40" loading="auto">
    </button>

    <img src="image/BuildMyPc.png" alt="Logo BuildMyPC" class="logo" width="200" height="52" loading="auto">

    <!-- Formulaire de recherche -->
    <form action="#" class="search-form" role="search" style="flex-grow: 1;">
      <label class="search-bar-label" for="search-bar">Search for stuff</label>
      <input class="search-bar" type="search" placeholder="Cherche un produit, une marque..." autofocus required />
      <button class="search-button" type="submit">
        <img src="image/loupe.png" alt="Search Icon" width="40%">
      </button>
    </form>


    <!-- Icônes utilisateur et panier -->
    <img src="image/profil_blanc.png" alt="User Profile" class="icon-profil" width="50" height="50" loading="auto">
    <img src="image/panier_blanc.png" alt="Shopping Cart" class="icon-panier" width="40" height="35" loading="auto">
  </div>

  <!-- Barre de navigation -->
  <nav class="main-nav">
    <ul class="navbar">
      <!-- Menu principal avec dropdown -->
      <li class="nav-item">
        <a href="#" class="nav-link">Nouveautés</a>
        <ul class="dropdown-menu">
        </ul>
      </li>
      <li class="nav-item">
        <a href="#" class="nav-link">PC Gaming</a>
        <ul class="dropdown-menu">
          <li><a href="#" class="dropdown-item">Test1</a></li>
        </ul>
      </li>
      <li class="nav-item">
        <a href="#" class="nav-link">PC Bureautique</a>
        <ul class="dropdown-menu">
          <li><a href="#" class="dropdown-item">Test2</a></li>
        </ul>
      </li>
      <li class="nav-item">
        <a href="#" class="nav-link">Composants</a>
        <ul class="dropdown-menu">
          <li><a href="#" class="dropdown-item">Test3</a></li>
        </ul>
      </li>
      <li class="nav-item">
        <a href="#" class="nav-link">
          <div class="colored">Promotions</div>
        </a>
        <ul class="dropdown-menu">
        </ul>
      </li>
    </ul>
  </nav>
</header>
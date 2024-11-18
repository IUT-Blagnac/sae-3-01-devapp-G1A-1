<header>
    <div class="header-top" style="display: flex; align-items: center;">
      <!-- Logo du site -->
      <img src="image/BuildMyPc.png" alt="Logo BuildMyPC" class="logo" style="margin-right: 3%; margin-left: 3%;"
        width="15%">

      <!-- Formulaire de recherche -->
      <form action="#" class="search-form" role="search" style="flex-grow: 1;">
        <label for="search-bar">Search for stuff</label>
        <input id="search-bar" type="search" placeholder="Cherche un produit, une marque..." autofocus required />
        <button type="submit">
          <img src="image/loupe.png" alt="Search Icon" width="40%">
        </button>
      </form>
      

      <!-- Icônes utilisateur et panier -->
      <img src="image/profil_blanc.png" alt="User Profile" class="icon" style="margin-right: 2%; margin-left: 3%;"
        width="3%">
      <img src="image/panier_blanc.png" alt="Shopping Cart" class="icon" style="margin-right: 3%;" width="3%">
    </div>

    <!-- Barre de navigation -->
    <nav>
      <ul class="navbar">
        <!-- Menu principal avec dropdown -->
        <li>
          <a href="#">Nouveautés</a>
          <ul class="dropdown">
            <li><a href="#">Test</a></li>
          </ul>
        </li>
        <li>
          <a href="#">PC Gaming</a>
          <ul class="dropdown">
            <li><a href="#">Test1</a></li>
          </ul>
        </li>
        <li>
          <a href="#">PC Bureautique</a>
          <ul class="dropdown">
            <li><a href="#">Test2</a></li>
          </ul>
        </li>
        <li>
          <a href="#">Composants</a>
          <ul class="dropdown">
            <li><a href="#">Test3</a></li>
          </ul>
        </li>
        <li>
          <a class="chiant" href="#">Promotions</a>
          <ul class="dropdown">
            <li><a href="#">Test4</a></li>
            <li><a href="#">Test5</a></li>
          </ul>
        </li>
      </ul>
    </nav>
  </header>
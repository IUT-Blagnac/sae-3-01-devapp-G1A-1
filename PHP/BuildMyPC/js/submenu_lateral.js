// Sélection des éléments
const mainMenu = document.getElementById('mainMenu');
const subMenus = document.querySelectorAll('.navbar-side.hidden');
const backBtn = document.getElementById('backBtn');
const menuTitle = document.getElementById('menuTitle');

// Gérer l'affichage du sous-menu
document.querySelectorAll('.nav-link[data-target]').forEach(link => {
    link.addEventListener('click', e => {
        e.preventDefault(); // Empêche le rechargement de la page
        const targetId = e.target.dataset.target; // Récupère l'ID du sous-menu

        if (targetId) {
            mainMenu.classList.add('hidden'); // Masque le menu principal
            backBtn.classList.remove('hidden'); // Affiche le bouton retour
            document.getElementById(targetId).classList.remove('hidden'); // Affiche le sous-menu
            menuTitle.textContent = e.target.textContent; // Met à jour le titre
        }
    });
});

// Revenir au menu principal
backBtn.addEventListener('click', () => {
    subMenus.forEach(menu => menu.classList.add('hidden')); // Cache tous les sous-menus
    mainMenu.classList.remove('hidden'); // Affiche le menu principal
    backBtn.classList.add('hidden'); // Masque le bouton retour
    menuTitle.textContent = 'Catégories'; // Réinitialise le titre
});
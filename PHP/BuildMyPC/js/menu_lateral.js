const menuBtn = document.querySelector(".menu-icon"); // Bouton menu
const sideMenu = document.getElementById("sideMenu"); // Menu latéral
const closeBtn = document.getElementById("closeBtn"); // Bouton de fermeture
const overlay = document.getElementById("overlay");   // Overlay

// Ouvrir le menu
menuBtn.addEventListener("click", () => {
    sideMenu.style.left = "0";
    overlay.style.display = "block";
});

// Fermer le menu avec le bouton de fermeture
closeBtn.addEventListener("click", () => {
    sideMenu.style.left = "-300px";
    overlay.style.display = "none";
});

// Fermer le menu en cliquant sur l'overlay
overlay.addEventListener("click", () => {
    sideMenu.style.left = "-300px";
    overlay.style.display = "none";
});

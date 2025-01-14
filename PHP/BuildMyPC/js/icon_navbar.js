// Récupération de toutes les images avec la classe "icon"
const icons = document.querySelectorAll(".icon-profil, .icon-panier, .icon-dashboard");

// Parcours des images pour attacher les événements
icons.forEach(icon => {
  const originalSrc = icon.src; // Sauvegarde la source initiale

  // Ajoute l'événement "mouseover"
  icon.addEventListener("mouseover", () => {
    if (icon.alt === "User Profile") {
      icon.src = "image/profil_vert.png"; // Change l'image pour celle en vert
    } else if (icon.alt === "Shopping Cart") {
      icon.src = "image/panier_vert.png"; // Change l'image pour celle en vert
    }else if (icon.alt === "Dashboard") {
      icon.src = "image/dashboard-icon-green.png"; // Change l'image pour celle en vert
    }
  });

  // Ajoute l'événement "mouseout"
  icon.addEventListener("mouseout", () => {
    icon.src = originalSrc; // Restaure l'image originale
  });
});
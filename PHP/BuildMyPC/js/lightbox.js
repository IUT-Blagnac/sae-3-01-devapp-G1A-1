// Fonction pour ouvrir la lightbox
function openLightbox(src) {
    const lightbox = document.getElementById('lightbox');
    const lightboxImg = document.getElementById('lightbox-img');
    lightboxImg.src = src; // Définit la source de l'image zoomée
    lightbox.style.display = 'flex'; // Affiche le lightbox
}

// Fonction pour fermer la lightbox
function closeLightbox() {
    const lightbox = document.getElementById('lightbox');
    const lightboxImg = document.getElementById('lightbox-img');
    lightboxImg.src = ''; // Réinitialise la source pour éviter des résidus
    lightbox.style.display = 'none'; // Cache le lightbox
}

// Fonction pour ouvrir la lightbox
function openLightbox(src) {
    const lightbox = document.getElementById('lightbox');
    const lightboxImg = document.getElementById('lightbox-img');
    lightboxImg.src = src; // D�finit la source de l'image zoom�e
    lightbox.style.display = 'flex'; // Affiche le lightbox
}

// Fonction pour fermer la lightbox
function closeLightbox() {
    const lightbox = document.getElementById('lightbox');
    const lightboxImg = document.getElementById('lightbox-img');
    lightboxImg.src = ''; // R�initialise la source pour �viter des r�sidus
    lightbox.style.display = 'none'; // Cache le lightbox
}

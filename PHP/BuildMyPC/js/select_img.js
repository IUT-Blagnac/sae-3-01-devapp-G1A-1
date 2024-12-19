function changeMainImage(thumbnail) {
  // Récupère la source de l'image miniature cliquée
  const newSrc = thumbnail.src;

  // Sélectionne l'image principale
  const mainImage = document.querySelector(".main-image img");

  if (mainImage) {
    // Si l'image principale est trouvée, modifie sa source
    mainImage.src = newSrc;
  } else {
    console.error("L'image principale n'a pas été trouvée dans le DOM.");
  }
}

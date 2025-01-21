function changeMainImage(thumbnail) {
  // R�cup�re la source de l'image miniature cliqu�e
  const newSrc = thumbnail.src;

  // S�lectionne l'image principale
  const mainImage = document.querySelector(".main-image img");

  if (mainImage) {
    // Si l'image principale est trouv�e, modifie sa source
    mainImage.src = newSrc;
  } else {
    console.error("L'image principale n'a pas �t� trouv�e dans le DOM.");
  }
}

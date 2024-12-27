/* -----------------------------------------------------
 * Script qui permet d'uniformiser la taille de chaque
 * grid-item d'un carrousel quand l'écran est grand.
 * Pour chaque carrousel, on va chercher le plus grand
 * grid-item, récuperer sa taille et mettre la même pour
 * tous les autres grid-items.
 * Quand l'écran est plus petit (- de 660px), on va faire
 * l'inverse et redonner à chaque grid-item leur taille
 * d'origine. On met ensuite en place un listener qui va
 * écouter la taille de l'écran et mettre à jour la taille
 * des grid item quand l'écran est trop petit ou trop grand.
 * ----------------------------------------------------- */

function adjustCellHeights() {
  // On va chercher tous les carrousels et itérer dans chacun d'entre eux
  var galleries = document.querySelectorAll(".gallery");
  galleries.forEach(function (gallery) {
    // On va chercher tous les grid-item d'un carrousel
    var cells = gallery.querySelectorAll(".gallery-cell");
    var maxHeight = 0;

    // On cherche la taille du plus grand grid-item
    cells.forEach(function (cell) {
      // On reset la taille à celle d'origine pour éviter d'avoir des erreurs
      cell.style.height = "";
      maxHeight = Math.max(maxHeight, cell.offsetHeight);
    });

    // On met tous les grid-item à jour avec leur nouvelle taille
    cells.forEach(function (cell) {
      cell.style.height = maxHeight + "px";
    });
  });
}

function resetCellHeights() {
  // Meme principe que pour uniformiser la taille des grid-item mais ici on se contente de la reset
  var galleries = document.querySelectorAll(".gallery");
  galleries.forEach(function (gallery) {
    var cells = gallery.querySelectorAll(".gallery-cell");
    cells.forEach(function (cell) {
      cell.style.height = "";
    });
  });
}

function handleResponsiveHeight() {
  // En fonction de la taille de l'écran on appelle une des deux méthodes
  if (window.innerWidth < 660) {
    resetCellHeights();
  } else {
    adjustCellHeights();
  }
}

// On ajoute le listener
document.addEventListener("DOMContentLoaded", function () {
  // Pour chaque carrousels on ajuste la taille quand elle change et au départ
  var galleries = document.querySelectorAll(".gallery");
  galleries.forEach(function (gallery) {
    var flickityInstance = Flickity.data(gallery);
    if (flickityInstance) {
      flickityInstance.on("ready", adjustCellHeights);
      flickityInstance.on("resize", adjustCellHeights);
    }
  });

  // On appelle une fois la méthode manuellement
  handleResponsiveHeight();

  // On ajoute le listener sur la taille de l'écran
  window.addEventListener("resize", handleResponsiveHeight);
});

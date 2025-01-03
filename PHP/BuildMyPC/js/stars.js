function attachStarEvents() {
    const form = document.getElementById("form-add-review");
    const stars = form.querySelectorAll(".stars .star");
    const noteInput = form.querySelector("#note"); // Champ caché pour envoyer la note
    let currentRating = 0;

    stars.forEach((star, index) => {
        // Ajouter un survol pour changer la couleur
        star.addEventListener("mouseover", () => {
            resetStars(stars);
            for (let i = 0; i <= index; i++) {
                stars[i].classList.add("hover");
            }
        });

        // Enlever l'effet de survol quand la souris quitte les étoiles
        star.addEventListener("mouseout", () => {
            resetStars(stars);
            fillStars(stars, currentRating - 1);
        });

        // Gérer le clic pour fixer la note
        star.addEventListener("click", () => {
            currentRating = index + 1;
            noteInput.value = currentRating; // Mettre à jour la valeur de l'input caché
            fillStars(stars, index);
        });
    });

    // Réinitialiser toutes les étoiles d'un groupe donné
    function resetStars(stars) {
        stars.forEach((star) => {
            star.classList.remove("hover");
            star.classList.remove("filled");
        });
    }

    // Remplir les étoiles jusqu'à l'index donné
    function fillStars(stars, index) {
        for (let i = 0; i <= index; i++) {
            stars[i].classList.add("filled");
        }
    }
}

        function ajouterAuPanier(idProduit) {
            const isConnected = <?php echo isset($_SESSION['login']) && $_SESSION['login'] === 'OK' ? 'true' : 'false'; ?>;
            if (!isConnected) {
                window.location.href = "formConnexion.php";
            } else {
                window.location.href = ajoutProduit.php?id=${idProduit};
            }
        }

        function afficherFormulaireAvis() {
            document.getElementById("add-review-section").innerHTML = 
                <form id="form-add-review" method="POST" enctype="multipart/form-data">
                    <div class="rating-input">
                        <input type="hidden" name="note" id="note" value="0">
                        <div class="stars">
                            <?php for ($i = 1; $i <= 5; $i++): ?>
                                        <span class="star" data-value="<?php echo $i; ?>">?</span>
                            <?php endfor; ?>
                        </div>
                    </div>
                    <textarea name="avis" rows="5" placeholder="Écrivez votre avis ici..." required></textarea>
                    <label for="review-image">Ajouter une image (optionnel) :</label>
                    <input type="file" name="reviewImage" id="review-image" accept=".png, .jpg, .jpeg, .webp">
                    <button type="submit" class="btn-add-to-cart">Soumettre l'avis</button>
                </form>
            ;
            attachStarEvents();
        }

        function afficherFormulaireReponse(idClient) {
            document.getElementById("reponse-section-" + idClient).innerHTML = 
                <form method="POST" class="form-add-reponse">
                    <input type="hidden" name="idNumCli" value="${idClient}">
                    <textarea name="reponse" rows="4" placeholder="Écrivez votre réponse ici..." required></textarea>
                    <button type="submit" class="btn-add-to-cart">Envoyer la réponse</button>
                </form>
            ;
        }
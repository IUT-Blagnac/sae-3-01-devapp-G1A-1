package tools;
import javafx.animation.TranslateTransition;
import javafx.scene.layout.VBox;
import javafx.util.Duration;

/*
 * Composant JavaFX pour afficher une liste d'alertes
 * superposées en bas à droite de l'écran
 * avec un message et un bouton pour voir les détails
 * Les alertes disparaissent automatiquement après un certain temps
 * et peuvent être ajoutées dynamiquement
 */
public class AlertOverlay extends VBox {

    public AlertOverlay() {
        setSpacing(10); // Espacement entre les alertes
        setStyle("-fx-padding: 10; -fx-background-color: rgba(0,0,0,0.2);");
    
        // Position en haut à droite
        setTranslateX(300); // Ajustez en fonction de votre scène
        setTranslateY(390);  // Ajustez pour le décalage vertical
        setMaxWidth(300);   // Limitez la largeur

        setPickOnBounds(false); // Permettre aux clics de passer à travers les zones vides

    }

    public void addAlert(String message, Runnable onDetailsClicked) {
        AlertBox alert = new AlertBox(message, onDetailsClicked);

        getChildren().add(alert);
        

        // Animation d'entrée
        TranslateTransition transition = new TranslateTransition(Duration.seconds(0.5), alert);
        transition.setFromY(50);
        transition.setToY(0);
        transition.play();

        // Retirer l'alerte après 5 secondes
        alert.startAutoDismiss(Duration.seconds(5), () -> {
            getChildren().remove(alert);
        });
    }
}


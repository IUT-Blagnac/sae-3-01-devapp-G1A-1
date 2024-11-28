package tools;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.scene.control.Button;
import javafx.scene.layout.HBox;
import javafx.scene.text.Text;
import javafx.util.Duration;

public class AlertBox extends HBox {
    private String message;
    private Runnable onDetailsClicked;

    public AlertBox(String message, Runnable onDetailsClicked) {
        this.message = message;
        this.onDetailsClicked = onDetailsClicked;

        // Configurer le style de l'alerte
        setStyle("-fx-background-color: #f8d7da; -fx-border-color: #f5c2c7; -fx-padding: 5; -fx-spacing: 5;");

        // Ajouter le texte et le bouton
        Text alertText = new Text(message);
        Button detailsButton = new Button("Voir détails");
        detailsButton.setOnAction(e -> onDetailsClicked.run());

        getChildren().addAll(alertText, detailsButton);
    }

    public void startAutoDismiss(Duration duration, Runnable onDismissed) {
        Timeline timeline = new Timeline(new KeyFrame(duration, e -> onDismissed.run()));
        timeline.setCycleCount(1);
        timeline.play();
    }
}

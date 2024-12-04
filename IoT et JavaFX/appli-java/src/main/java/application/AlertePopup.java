package application;

import java.util.LinkedList;
import java.util.Queue;

import javafx.animation.FadeTransition;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Pane;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;
import javafx.stage.Stage;
import javafx.util.Duration;

/**
 * Singleton that displays alerts on the screen. It is supposed to be
 * initialized again whenever the user changes scene.
 */
public class AlertePopup {
    // the unique instance
    private static AlertePopup alertPopupInstance;

    private StackPane stackPane;
    private Stage primaryStage;
    private Queue<Pane> queueAlertes;
    private static final int MAXQUEUE = 3;

    private AlertePopup(Stage primaryStage) {
        this.primaryStage = primaryStage;
        this.stackPane = (StackPane) primaryStage.getScene().getRoot();
        this.queueAlertes = new LinkedList<>();
    }

    /**
     * Returns the unique instance of AlertPopup and set the primary stage as it's
     * new primary stage.
     * 
     * If you initialize the AlertPopup for the first time please use this method.
     * 
     * @param primaryStage the new primary stage
     * @return the unique instance of AlertPopup
     */
    public static AlertePopup getAlertPopupInstance(Stage primaryStage) {
        if (alertPopupInstance == null) {
            alertPopupInstance = new AlertePopup(primaryStage);
        } else {
            alertPopupInstance.setPrimaryStage(primaryStage);
        }
        return alertPopupInstance;
    }

    /**
     * Returns the unique instance of AlertPopup.
     * 
     * @return the unique instance of AlertPopup.
     * @throws Exception if the primary stage was not already instantiated.
     */
    public static AlertePopup getAlertPopupInstance() throws Exception {
        if (alertPopupInstance == null) {
            throw new Exception("primaryStage non instancié");
        }
        return alertPopupInstance;
    }

    /**
     * Checks if the primary stage is set.
     * 
     * @return true if the primaryStage is set, else false
     */
    public static boolean isPrimaryStageSet() {
        return alertPopupInstance.primaryStage != null;
    }

    public void setPrimaryStage(Stage primaryStage) {
        if (primaryStage != null && primaryStage != this.primaryStage) {
            // on supprime les alertes de l'ancien stackpane pour les remettre dans la
            // nouvelle
            this.stackPane.getChildren().removeAll(this.queueAlertes);
            this.stackPane = (StackPane) primaryStage.getScene().getRoot();
            this.stackPane.getChildren().addAll(this.queueAlertes);
        }
    }

    /**
     * Return the horizontal position where an alert sould be displayed.
     * 
     * @return the X value
     */
    private double getXPosition() {
        return (stackPane.getWidth() / 2) - 210;
    }

    /**
     * Return the vertical position where an alert sould be displayed.
     * 
     * @return the Y value
     */
    private double getYPosition() {
        return (stackPane.getHeight() / 2) - 30;
    }

    private static int count = 0;

    /**
     * Creates a new alert, adds it to the queue and displays it
     */
    public void createNewAlert() {
        count++;
        Pane container = new Pane();
        container.setMaxWidth(200);
        container.setMaxHeight(100);
        HBox popupContent = new HBox(10);
        popupContent.setStyle(
                "-fx-background-color: lightyellow; -fx-border-color: black; -fx-border-width: 1; -fx-padding: 10;");
        popupContent.setAlignment(Pos.CENTER_LEFT);

        Label messageLabel = new Label("This is a warning!" + count);
        messageLabel.setTextFill(Color.BLACK);

        Button printButton = new Button("Print Hello");
        printButton.setOnAction(e -> System.out.println("HelloWorld"));

        Button closeButton = new Button("X");
        closeButton.setStyle("-fx-background-color: transparent; -fx-text-fill: red; -fx-font-weight: bold;");
        closeButton.setOnAction(e -> removeAlert(container));

        popupContent.getChildren().addAll(messageLabel, printButton, closeButton);
        container.getChildren().add(popupContent);
        // Position the "popup" at the bottom-right corner
        container.setTranslateX(this.getXPosition());
        container.setTranslateY(this.getYPosition());

        // Add the "popup" to the main pane
        stackPane.getChildren().add(container);
        this.newAlertToQueue(container);

        // Automatically hide the popup after 5 seconds
        Timeline autoHide = new Timeline(
                new KeyFrame(Duration.seconds(10), e -> removeAlert(container)));
        autoHide.play();
    }

    private void newAlertToQueue(Pane alert) {
        // add the new alert
        this.queueAlertes.offer(alert);
        // removes all the alerts after the 3rd
        while (this.queueAlertes.size() > MAXQUEUE) {
            removeAlert(this.queueAlertes.poll());
        }
        updateAlertDisplay();
    }

    /**
     * Plays a small animation that make the alert fade away and remove the alert
     * from the stackpane
     * 
     * @param alert the alert to remove
     */
    private void removeAlert(Pane alert) {
        if (alert == null) {
            return;
        }
        this.queueAlertes.remove(alert);
        FadeTransition fadeOut = new FadeTransition(Duration.millis(300), alert);
        fadeOut.setFromValue(1);
        fadeOut.setToValue(0);
        fadeOut.setOnFinished(event -> stackPane.getChildren().remove(alert));
        fadeOut.play();
        updateAlertDisplay();
    }

    /**
     * Moves the alerts in order for them to be one above the other with no gap
     */
    private void updateAlertDisplay() {
        int i = this.queueAlertes.size() - 1;
        for (Pane container : this.queueAlertes) {
            container.setTranslateY(this.getYPosition() - (75 * i));
            i--;
        }
    }
}
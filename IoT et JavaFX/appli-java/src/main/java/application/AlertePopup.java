package application;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.concurrent.Executors;

import application.controller.AlerteHistoriqueController;
import application.controller.MenuController;
import javafx.animation.FadeTransition;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.application.Platform;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Control;
import javafx.scene.control.Label;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Pane;
import javafx.scene.layout.StackPane;
import javafx.scene.paint.Color;
import javafx.stage.Stage;
import javafx.util.Duration;
import tools.DataReader;
import tools.GlobalVariables;

import java.nio.file.*;
import java.util.concurrent.ExecutorService;

/**
 * Singleton that displays alerts on the screen. It is supposed to be
 * initialized again whenever the user changes scene.
 */
public class AlertePopup {
    // the unique instance
    private static AlertePopup alertPopupInstance;

    private ExecutorService watchServiceExecutor;

    private StackPane stackPane;
    private Stage primaryStage;
    private Queue<Pane> queueAlertes;
    private static final int MAXQUEUE = 3;

    private AlertePopup(Stage primaryStage) {
        this.primaryStage = primaryStage;
        this.stackPane = (StackPane) primaryStage.getScene().getRoot();
        this.queueAlertes = new LinkedList<>();
        startFileWatcher();
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

    public void setPrimaryStage(Stage primaryStage) {
        if (primaryStage != null) {
            this.primaryStage = primaryStage;
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

    /**
     * Creates a new alert, adds it to the queue and displays it
     */
    public void createNewAlert(String message) {
        int fontSize;
        if (message.length() < 35) {
            fontSize = 16;
        } else if (message.length() < 45) {
            fontSize = 15;
        } else {
            fontSize = 13;
        }

        Pane container = new Pane();
        container.setMaxWidth(200);
        container.setMinWidth(200);
        container.setMaxHeight(100);
        HBox popupContent = new HBox(10);
        popupContent
                .setStyle(
                        "-fx-background-color: LightGrey; -fx-border-color: LightGray; -fx-padding: 5; -fx-spacing: 5; -fx-font-size:"
                                + fontSize + "px;");
        popupContent.setAlignment(Pos.CENTER_LEFT);
        popupContent.setPrefHeight(Control.USE_COMPUTED_SIZE);

        Label messageLabel = new Label(message);
        messageLabel.setTextFill(Color.BLACK);
        messageLabel.setMaxWidth(150);
        messageLabel.setWrapText(true);

        Button printButton = new Button("Voir détails");
        printButton.setStyle("-fx-font-size:14px;");
        printButton.setOnAction(e -> this.doHistorique());

        Button closeButton = new Button("\u274C");
        closeButton.setStyle(
                "-fx-background-color: transparent; -fx-text-fill: Gray; -fx-font-weight: bold;");
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

    /**
     * Lance le WatchService pour surveiller les modifications de LOG_ALERTE.jsonl
     */
    private void startFileWatcher() {
        watchServiceExecutor = Executors.newSingleThreadExecutor();
        Path logFilePath = Paths.get(GlobalVariables.alertsFilePath);

        watchServiceExecutor.submit(() -> {
            try (WatchService watchService = FileSystems.getDefault().newWatchService()) {
                // Enregistrer le répertoire parent du fichier à surveiller
                Path directory = logFilePath.getParent();
                directory.register(watchService, StandardWatchEventKinds.ENTRY_MODIFY);

                while (!Thread.currentThread().isInterrupted()) {
                    WatchKey key = watchService.take(); // Bloque jusqu'à un événement
                    for (WatchEvent<?> event : key.pollEvents()) {
                        WatchEvent.Kind<?> kind = event.kind();

                        if (kind == StandardWatchEventKinds.ENTRY_MODIFY) {
                            // Vérifier si le fichier modifié est LOG_ALERTE.jsonl
                            Path changedFile = directory.resolve((Path) event.context());
                            if (changedFile.endsWith(logFilePath.getFileName())) {
                                Platform.runLater(() -> {
                                    DataReader reader = new DataReader();
                                    List<HashMap<String, Object>> logError = reader
                                            .readJsonLFile(logFilePath.toString());
                                    String message = "";
                                    if (logError != null && logError.size() > 0) {
                                        HashMap<String, Object> lastLine = logError.get(logError.size() - 1);
                                        message = "Alerte " + lastLine.get("type") + " dans la salle "
                                                + lastLine.get("salle");
                                    } else {
                                        message = "Alerte : un problème a été détecté !";
                                    }
                                    this.createNewAlert(message);
                                });
                            }
                        }
                    }
                    if (!key.reset()) {
                        break;
                    }
                }
            } catch (IOException | InterruptedException e) {
                // Gestion des erreurs ou interruption
                e.printStackTrace();
            }
        });
    }

    private void doHistorique() {
        try {
            FXMLLoader loader = new FXMLLoader(
                    MenuController.class.getResource("/application/view/alerteHistorique.fxml"));
            BorderPane root = loader.load();

            Scene scene = new Scene(root, root.getPrefWidth() + 20, root.getPrefHeight() + 10);
            scene.getStylesheets().add(Menu.class.getResource("application.css").toExternalForm());

            primaryStage.setScene(scene);
            primaryStage.setTitle("Fenêtre d'historique des alertes");

            AlerteHistoriqueController mfc = loader.getController();
            mfc.initContext(primaryStage);

            mfc.displayDialog();

        } catch (Exception e) {
            e.printStackTrace();
            System.exit(-1);
        }
    }
}
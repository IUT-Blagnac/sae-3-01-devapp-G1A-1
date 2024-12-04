package application.controller;

import javafx.application.Platform;
import javafx.concurrent.Task;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.ProgressIndicator;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;
import tools.GlobalVariables;

import java.net.URL;
import java.util.ResourceBundle;

/**
 * Contrôleur pour le test de connexion Python
 * Affiche un spinner pendant le test et un check ou une croix à la fin
 * Ferme la fenêtre après 5 secondes
 */
public class RelancePythonController implements Initializable {

    @FXML
    private StackPane mainPane;

    @FXML
    private ProgressIndicator spinner; // Spinner pour l'attente

    @FXML
    private ImageView resultIcon; // Image pour afficher le check ou la croix

    private Stage primaryStage;

    public void initContext(Stage _containingStage) {
        this.primaryStage = _containingStage;
        this.configure();

    }

    public void displayDialog() {
        this.primaryStage.show();
        this.startRelaunch();
    }

    private void configure() {
        // On laisse la possibilité de fermer la fenêtre en cliquant sur la croix
        this.primaryStage.setOnCloseRequest(e -> {
            // Optionnel : Si tu veux afficher une confirmation de fermeture, tu peux la
            // gérer ici.
        });
    }

    private void startRelaunch() {
        // Task pour exécuter le script Python
        Task<Boolean> launchTask = new Task<>() {
            @Override
            protected Boolean call() {
                GlobalVariables.mqttPython.stopPython();
                try {
                    GlobalVariables.mqttPython.startPython();
                } catch (Exception e) {
                    // il y toujours a une erreur si le lancement a échoué
                    return false;
                }
                return true;
            }
        };

        // Quand le résultat arrive
        launchTask.setOnSucceeded(event -> {
            boolean isRunning = launchTask.getValue();
            showResult(isRunning);
        });

        // Quand la tâche échoue
        launchTask.setOnFailed(event -> {
            showResult(false);
        });

        // Démarre la tâche en arrière-plan
        new Thread(launchTask).start();
    }

    private void showResult(boolean isRunning) {
        System.out.println("Affichage du résultat de relance : " + (isRunning ? "actif" : "echec"));

        // Mise à jour de l'interface graphique sur le thread principal
        Platform.runLater(() -> {
            spinner.setVisible(false); // Cache le spinner
            resultIcon.setVisible(true); // Affiche l'icône

            if (isRunning) {
                resultIcon.setImage(new Image(getClass().getResource("../../check.png").toExternalForm()));
            } else {
                resultIcon.setImage(new Image(getClass().getResource("../../cross.png").toExternalForm()));
            }

            // Fermer la fenêtre après 5 secondes
            new Thread(() -> {
                try {
                    Thread.sleep(2000); // Attente
                    Platform.runLater(this::closeWindow); // Fermer la fenêtre
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }).start();
        });
    }

    @FXML
    private void closeWindow() {
        // Ferme la fenêtre
        this.primaryStage.close();
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        // Initialisation : spinner visible et icône cachée
        spinner.setVisible(true);
        resultIcon.setVisible(false);
    }
}

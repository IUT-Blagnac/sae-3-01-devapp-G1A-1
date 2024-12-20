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

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ResourceBundle;

/**
 * Controller for the Python connection test
 * Displays a spinner during the test and a check or cross at the end
 * Closes the window after 5 seconds
 */
public class TestController implements Initializable {

    @FXML
    private StackPane mainPane;

    @FXML
    private ProgressIndicator spinner; // Spinner pour l'attente de la connexion

    @FXML
    private ImageView resultIcon; // Image pour afficher le check ou la croix

    private Stage primaryStage;

    /**
     * Method to initialize the context of the window
     * 
     * @param _containingStage the stage containing the window
     */
    public void initContext(Stage _containingStage) {
        this.primaryStage = _containingStage;
        this.configure();

    }

    /**
     * Method to display the window
     */
    public void displayDialog() {
        this.primaryStage.show();
        this.startConnectionTest(); // Lance le test au démarrage
    }

    /**
     * Method to configure the window
     */
    private void configure() {
        // On laisse la possibilité de fermer la fenêtre en cliquant sur la croix
        this.primaryStage.setOnCloseRequest(e -> {
            // Optionnel : Si tu veux afficher une confirmation de fermeture, tu peux la
            // gérer ici.
        });
    }

    /**
     * Method to start the Python connection test
     */
    private void startConnectionTest() {
        // Task pour exécuter le script Python
        Task<Boolean> connectionTask = new Task<>() {
            @Override
            protected Boolean call() {
                return testPythonConnection();
            }
        };

        // Quand le résultat arrive
        connectionTask.setOnSucceeded(event -> {
            boolean isConnected = connectionTask.getValue();
            showResult(isConnected);
        });

        // Quand la tâche échoue
        connectionTask.setOnFailed(event -> {
            showResult(false);
        });

        // Démarre la tâche en arrière-plan
        new Thread(connectionTask).start();
    }

    /**
     * Method to test the Python connection
     * 
     * @return true if the connection is successful, false otherwise
     */
    private boolean testPythonConnection() {
        try {
            // Commande pour exécuter le script Python
            ProcessBuilder pb = new ProcessBuilder("python", GlobalVariables.testConnexionFilePath);
            Process process = pb.start();

            // Lire la sortie standard du script Python
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String result = "";
            String line;
            while ((line = reader.readLine()) != null) {
                result += line + "\n"; // Capture toute la sortie standard
                System.out.println("Output from Python: " + line); // Affiche la sortie
            }

            // Lire la sortie d'erreur (au cas où Python génère des erreurs)
            BufferedReader errorReader = new BufferedReader(new InputStreamReader(process.getErrorStream()));
            while ((line = errorReader.readLine()) != null) {
                System.err.println("Error from Python: " + line); // Affiche les erreurs
            }

            // Attendre la fin du processus Python
            int exitCode = process.waitFor();
            System.out.println("Python script exit code: " + exitCode); // Affiche le code de sortie

            // Vérifie la sortie de Python et renvoie true ou false
            return "OK".equals(result.trim()); // "OK" attendu si connexion réussie
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Erreur dans le script ou problème
        }
    }

    /**
     * This method shows the result of the connection test
     * 
     * @param isConnected
     */
    private void showResult(boolean isConnected) {
        System.out.println("Affichage du résultat de connexion : " + (isConnected ? "Réussi" : "Échoué"));

        // Mise à jour de l'interface graphique sur le thread principal
        Platform.runLater(() -> {
            spinner.setVisible(false); // Cache le spinner
            resultIcon.setVisible(true); // Affiche l'icône

            if (isConnected) {
                resultIcon.setImage(new Image(getClass().getResource("/check.png").toExternalForm()));
            } else {
                resultIcon.setImage(new Image(getClass().getResource("/cross.png").toExternalForm()));
            }

            // Fermer la fenêtre après 5 secondes
            new Thread(() -> {
                try {
                    Thread.sleep(5000); // Attente
                    Platform.runLater(this::closeWindow); // Fermer la fenêtre
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }).start();
        });
    }

    @FXML
    /*
     * Méthode pour fermer la fenêtre
     */
    private void closeWindow() {
        // Ferme la fenêtre
        this.primaryStage.close();
    }

    @Override
    /**
     * Initialisation de la fenêtre
     * 
     * @param location  l'URL de la fenêtre
     * @param resources les ressources de la fenêtre
     */
    public void initialize(URL location, ResourceBundle resources) {
        // Initialisation : spinner visible et icône cachée
        spinner.setVisible(true);
        resultIcon.setVisible(false);
    }
}

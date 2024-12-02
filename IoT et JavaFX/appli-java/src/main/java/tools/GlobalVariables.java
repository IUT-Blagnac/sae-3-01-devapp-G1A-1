package tools;

import application.AlertUtilities;
import javafx.scene.control.Alert.AlertType;
import javafx.stage.Stage;

/*
 * Classe contenant les variables globales de l'application
 * pour faciliter l'accès et la modification
 * depuis n'importe quelle partie du code
 * et pour éviter les valeurs magiques
 * et les répétitions inutiles
 */
public class GlobalVariables {
    private GlobalVariables() {
    }

    public static final String pythonFilePath = "IoT et JavaFX/appli-python/MQTT.py";
    public static final String pythonConfigFilePath = "IoT et JavaFX/appli-python/config.json";

    public enum pythonState {
        RUNNING, PENDING, DISCONNECTED
    }// actif, en démarrage, arrêté

    public static final PythonExecuter mqttPython = new PythonExecuter(pythonFilePath);

    public static void exitApp(Stage primaryStage) {
        if (AlertUtilities.confirmYesCancel(primaryStage, "Quitter Appli Principale",
                "Etes vous sur de vouloir quitter l'appli ?", null, AlertType.CONFIRMATION)) {
            mqttPython.stopPython();
            primaryStage.close();
            System.exit(0);
        }
    }

}

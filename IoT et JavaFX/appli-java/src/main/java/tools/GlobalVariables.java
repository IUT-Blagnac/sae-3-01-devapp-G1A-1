package tools;

import java.util.Arrays;
import java.util.List;

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

    // liste des salles avec des capteurs
    public static List<String> salles = Arrays.asList(
            "B006", "B106", "B105", "B103", "B101", "E105", "Serveurs", "E003", "B234", "B104", "B115", "B004", "B005",
            "B006", "B219", "E006", "E209", "E001", "E007", "amphi1", "hall-amphi", "B217", "C002", "B112", "B108",
            "C102", "E208", "B203", "E210", "E207", "E101", "C006", "E100", "E102", "E103", "B110",
            "hall-entrée-principale", "Local-velo", "B202", "Foyer-personnels", "B201", "B109", "C001", "Salle-conseil",
            "B002", "B111", "B113");

    public static void exitApp(Stage primaryStage) {
        if (AlertUtilities.confirmYesCancel(primaryStage, "Quitter Appli Principale",
                "Etes vous sur de vouloir quitter l'appli ?", null, AlertType.CONFIRMATION)) {
            mqttPython.stopPython();
            primaryStage.close();
            System.exit(0);
        }
    }

}

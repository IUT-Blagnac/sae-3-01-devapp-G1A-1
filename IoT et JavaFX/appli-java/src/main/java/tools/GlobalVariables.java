package tools;

import java.util.Arrays;
import java.util.List;

import application.AlertUtilities;
import javafx.scene.control.Alert.AlertType;
import javafx.stage.Stage;

/**
 * Class containing global variables and methods that are used everywhere in the
 * app. This class facilitates the modification of variables such as file paths
 * and can be accessed from anywhere in the code.
 * 
 * This class helps preventing repetitions in code.
 */
public class GlobalVariables {
    private GlobalVariables() {
    }

    public static final String pythonFilePath = "appli-python/MQTT.py";
    public static final String pythonConfigFilePath = "appli-python/config.json";
    public static final String testConnexionFilePath = "appli-python/TestConnexion.py";
    public static final String alertsFilePath = "appli-python/alerts/LOG_ALERTE.jsonl";
    public static final String solarDataFilePath = "appli-python/datas/solar/DONNEES_SOLAIRES.jsonl";
    // Generic path for the rooms. Use String.format(GlobalVariables.roomsFilePath,
    // "B001") to have the path to a specific room. B001 is an example of how string
    // formating works here.
    public static final String roomsFilePath = "appli-python/datas/captor/%s.jsonl";

    /**
     * The different states a python file in the PythonExecuter class can be in.
     */
    public enum pythonState {
        RUNNING, PENDING, DISCONNECTED
    }// actif, en démarrage, arrêté

    // The PythonExecuter variable that runs the mqtt script. This variable needs to
    // be accessible everywhere.
    public static final PythonExecuter mqttPython = new PythonExecuter(pythonFilePath);

    // liste des salles avec des capteurs
    public static final List<String> salles = Arrays.asList("B001",
            "B002", "B004", "B005", "B006", "B101", "B103", "B104", "B105", "B106", "B108", "B109", "B110", "B111",
            "B112", "B113", "B115", "B201", "B202", "B203", "B217", "B219", "B234", "C001", "C002", "C004", "C006",
            "C102", "E001", "E003", "E004", "E006", "E007", "E100", "E101", "E102", "E103", "E105", "E106", "E207",
            "E208", "E209", "E210", "Foyer-etudiants-entrée", "Foyer-personnels", "Local-velo", "Salle-conseil",
            "Serveurs", "amphi1", "hall-amphi", "hall-entrée-principale");

    /**
     * Asks the user confirmation and closes the app on a positive answer. Closes
     * latents programs such as the mqtt python script before closing the app.
     * 
     * @param primaryStage the main stage of the app.
     */
    public static void exitApp(Stage primaryStage) {
        if (AlertUtilities.confirmYesCancel(primaryStage, "Quitter Appli Principale",
                "Etes vous sur de vouloir quitter l'appli ?", null, AlertType.CONFIRMATION)) {
            mqttPython.stopPython();
            primaryStage.close();
            System.exit(0);
        }
    }

}

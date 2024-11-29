package tools;

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
    }

    public static final PythonExecuter mqttPython = new PythonExecuter(pythonFilePath);

}

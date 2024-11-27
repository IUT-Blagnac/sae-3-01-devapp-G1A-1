package tools;

public class GlobalVariables {
    private GlobalVariables() {
    }

    public static final String pythonFilePath = "MQTT.py";
    public static final String pythonConfigFilePath = "../config.json";

    public enum pythonState {
        RUNNING, PENDING, DISCONNECTED
    }

    public static final PythonExecuter mqttPython = new PythonExecuter(pythonFilePath);

}

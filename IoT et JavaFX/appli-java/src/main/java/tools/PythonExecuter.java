package tools;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class PythonExecuter {

    private final int NBTRIES = 3;
    private String filePath;

    public PythonExecuter(String filePath) {
        this.filePath = filePath;
    }

    public void startPython() {
        boolean pythonWorks = false;
        int attempts = 0;
        String filePath = "../HelloWorldPrinter2.py";
        // TODO remplacer par HelloWorldPrinter2.py par MQTT.py

        while (!pythonWorks && attempts < this.NBTRIES) {
            attempts++;
            try {
                ProcessBuilder processBuilder = new ProcessBuilder();
                // processBuilder.directory(new java.io.File("."));
                processBuilder.command("python", filePath);
                Process process = processBuilder.start();

                // Lecture des erreurs dans le script
                BufferedReader errorReader = new BufferedReader(new InputStreamReader(process.getErrorStream()));
                // le try/catch ne s'occupe pas des erreurs envoyées par le code python,
                // seulement de celles des classes java quand elles essaient d'appeler le
                // python. Il faut donc lire nous meme les erreurs et générer une exception
                // quand il y en a une dans le code python
                String error = "";
                String line = errorReader.readLine();
                while (line != null) {
                    error += line + "\n";
                    line = errorReader.readLine();
                }
                if (!error.isEmpty()) {
                    throw new Exception(error);
                }
                pythonWorks = true;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void stopPython() {

    }
}

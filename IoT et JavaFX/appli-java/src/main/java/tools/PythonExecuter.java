package tools;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class PythonExecuter {

    private final int NBTRIES = 3;
    private String filePath;
    private Process process;

    public PythonExecuter(String filePath) {
        // TODO pour les tests, utiliser "../HelloWorldPrinter2.py" ou "../MQTT.py"
        this.filePath = filePath;
    }

    public String getFilePath() {
        return this.filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    /**
     * Creates a thread and execute the python code of the filePath.
     * If a python code was already running in the process it will be destroyed.
     * 
     * TODO finish the method by adding the thread
     */
    public void startPython() throws Exception {
        synchronized (this.process) {
            if (this.process != null && this.process.isAlive()) {
                this.process.destroy();
            }
        }
        boolean pythonWorks = false;
        int attempts = 0;
        String exceptionList = "";

        // on essaie de lancer le programme 3 fois
        while (!pythonWorks && attempts < this.NBTRIES) {
            attempts++;
            try {
                ProcessBuilder processBuilder = new ProcessBuilder();
                processBuilder.command("python", this.filePath);
                this.process = processBuilder.start();

                // Lecture des erreurs dans le script
                BufferedReader errorReader = new BufferedReader(new InputStreamReader(this.process.getErrorStream()));
                // le try/catch ne s'occupe pas des erreurs envoyées par le code python,
                // seulement de celles des classes java quand elles essaient d'appeler le
                // python. Il faut donc lire nous meme les erreurs et générer une exception
                // quand il y en a une dans le code python.
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
                exceptionList += e.getMessage() + "\n";
                e.printStackTrace();
            }
        }
        if (!pythonWorks && attempts >= this.NBTRIES) {
            throw new Exception("Erreur lors du lancement du programme :\n" + exceptionList);
        }
    }

    /**
     * Kills the python process
     */
    public void stopPython() {
        synchronized (this.process) {
            if (this.process != null && this.process.isAlive()) {
                this.process.destroy();
            }
        }
    }
}

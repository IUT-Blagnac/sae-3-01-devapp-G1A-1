package tools;

import java.io.BufferedReader;
import java.io.InputStreamReader;

/**
 * Class to execute a python file and manage its state
 */
public class PythonExecuter {
    // Note : to execute the MQTT python file, please use the PythonExecuter object
    // in GlobalVariables and don't create a new one

    private final int NBTRIES = 3;
    private String filePath;
    private GlobalVariables.pythonState state;
    private Process process;

    public PythonExecuter(String filePath) {
        this.filePath = filePath;
        this.state = (this.process != null && this.process.isAlive()) ? GlobalVariables.pythonState.RUNNING
                : GlobalVariables.pythonState.DISCONNECTED;
    }

    public String getFilePath() {
        return this.filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public GlobalVariables.pythonState getState() {
        updateState();
        return this.state;
    }

    private void updateState() {
        this.state = (this.process != null && this.process.isAlive()) ? GlobalVariables.pythonState.RUNNING
                : GlobalVariables.pythonState.DISCONNECTED;
    }

    /**
     * Executes the python code of the of the python file in filePath.
     * If the python code was already running in the process, it will be destroyed.
     * Sets a default acknowledgementSentence as "OK java".
     * 
     * @throws Exception when the python script failed to launch.
     */
    public void startPython() throws Exception {
        startPython("OK java");
    }

    /**
     * Executes the python code of the of the python file in filePath.
     * If the python code was already running in the process, it will be destroyed.
     *
     * @param acknowledgementSentence a sentence that signals that the python code
     *                                is running correctly and that the startPython
     *                                function can move on and let the python code
     *                                run without supervision
     * 
     * @throws Exception when the python script failed to launch.
     */
    public void startPython(String acknowledgementSentence) throws Exception {
        stopPython();

        boolean pythonWorks = false;
        int attempts = 0;
        state = GlobalVariables.pythonState.PENDING;

        while (!pythonWorks && attempts < NBTRIES) {
            attempts++;
            try {
                this.state = GlobalVariables.pythonState.PENDING;

                ProcessBuilder processBuilder = new ProcessBuilder("python", filePath);
                // Redirect error stream to input stream
                processBuilder.redirectErrorStream(true);
                process = processBuilder.start();

                // Read
                try (BufferedReader inputReader = new BufferedReader(
                        new InputStreamReader(process.getInputStream()))) {
                    String line;
                    while (!pythonWorks && (line = inputReader.readLine()) != null) {
                        if (line.equals(acknowledgementSentence)) {
                            pythonWorks = true;
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        updateState();
        if (!pythonWorks) {
            throw new Exception("Failed to start Python script.");
        }
    }

    /**
     * Kills the python process
     */
    public void stopPython() {
        if (process != null) {
            synchronized (process) {
                if (process.isAlive()) {
                    process.destroy();
                }
            }
        }
        updateState();
    }
}

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

    /**
     * Constructor of a PythonExecuter
     * 
     * @param filePath the path to the python file to be executed
     */
    public PythonExecuter(String filePath) {
        this.filePath = filePath;
        this.state = (this.process != null && this.process.isAlive()) ? GlobalVariables.pythonState.RUNNING
                : GlobalVariables.pythonState.DISCONNECTED;
    }

    /**
     * Returns the current file path
     * 
     * @return a file path
     */
    public String getFilePath() {
        return this.filePath;
    }

    /**
     * Sets a new file path.
     * 
     * Note : setting a new filePath will not restart the current running python
     * script.
     * 
     * @param filePath the new file path
     */
    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    /**
     * Return the current state of the python script
     * 
     * @return the current state
     */
    public GlobalVariables.pythonState getState() {
        updateState();
        return this.state;
    }

    /**
     * Update the state to match the current state of the python process
     */
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
                ProcessBuilder processBuilder = new ProcessBuilder("python", this.filePath);
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

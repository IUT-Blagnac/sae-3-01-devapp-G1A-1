package tools;

public class TestPythonExecuter {
    public static void main(String[] args) {

        try {
            // Start the Python script
            System.out.println("Starting Python process...");
            GlobalVariables.mqttPython.startPython();

            // Print "It works" every second for 10 seconds
            for (int i = 0; i < 10; i++) {
                System.out.println(i + " - It works : " + GlobalVariables.mqttPython.getState());
                Thread.sleep(1000); // Pause for 1 second
            }

        } catch (Exception e) {
            e.printStackTrace();
            e.getMessage();
        } finally {
            // Ensure the Python process is stopped
            System.out.println("Stopping Python process...");
            GlobalVariables.mqttPython.stopPython();
            System.out.println(GlobalVariables.mqttPython.getState());
        }

    }
}

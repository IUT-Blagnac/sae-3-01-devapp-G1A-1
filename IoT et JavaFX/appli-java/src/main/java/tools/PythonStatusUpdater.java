package tools;

import java.util.Timer;
import java.util.TimerTask;

import javafx.application.Platform;
import javafx.scene.control.Label;
import javafx.scene.paint.Color;

/**
 * A singleton that updates the label that displays the mqtt python status. The
 * singleton updates the label only when it exists.
 * Only one label can be updated at a time so everytime the window changes, a
 * new label needs to be set (it's more like linking an existing label to this
 * singleton).
 */
public class PythonStatusUpdater {

    private static PythonStatusUpdater psuInstance;

    private Label lblPythonState;
    private Timer timer;

    /**
     * Constructor of the singleton of PythonStatusUpdater.
     */
    private PythonStatusUpdater() {
        // Quand on crée le PSU on met en place un daemon timer qui va mettre à jour un
        // label toutes les 4 secondes. A partir du moment où on a créé le PSU, il
        // s'executera toutes les 3 secondes meme si il n'y a pas de label.
        // préciser que ce timer est daemon fait que ce timer va se fermer quand la JVM
        // se fermera.
        timer = new Timer(true);
        // Toutes les 4 secondes, met à jour le label qui indique l'état du fichier
        // python.
        timer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                Platform.runLater(() -> updateLabel());
            }
        }, 0, 4000);
    }

    /**
     * Return the instance of PythonStatusUpdater or create one if there is none.
     * 
     * @return the unique instance of PythonStatusUpdater
     */
    public static PythonStatusUpdater getPSUInstance() {
        if (psuInstance == null) {
            psuInstance = new PythonStatusUpdater();
        }
        return psuInstance;
    }

    /**
     * Sets a new label to be updated
     * 
     * @param lblPythonState the label to update
     */
    public void setPSULabel(Label lblPythonState) {
        this.lblPythonState = lblPythonState;
        updateLabel();
    }

    /**
     * Updates the label to match the current status.
     */
    private void updateLabel() {
        if (PythonStatusUpdater.this.lblPythonState != null) {
            switch (GlobalVariables.mqttPython.getState()) {
                case RUNNING:
                    PythonStatusUpdater.this.lblPythonState.setTextFill(Color.GREEN);
                    PythonStatusUpdater.this.lblPythonState.setText("actif");
                    break;
                case PENDING:
                    PythonStatusUpdater.this.lblPythonState.setTextFill(Color.ORANGE);
                    PythonStatusUpdater.this.lblPythonState.setText("en démarrage");
                    break;
                case DISCONNECTED:
                    PythonStatusUpdater.this.lblPythonState.setTextFill(Color.RED);
                    PythonStatusUpdater.this.lblPythonState.setText("arrêté");
                    break;
                default:
                    PythonStatusUpdater.this.lblPythonState.setTextFill(Color.BLACK);
                    PythonStatusUpdater.this.lblPythonState.setText("???");
                    break;
            }
        }
    }

}

package tools;

import java.util.Timer;
import java.util.TimerTask;

import javafx.application.Platform;
import javafx.scene.control.Label;
import javafx.scene.paint.Color;

/**
 * Un singleton qui va mettre à jour un label si il a été défini en fonction du
 * status du programme mqtt python.
 * Un seul label peut etre mis à jour à la fois donc quand on entre dans une
 * nouvelle fenêtre possédant ce label il faut set le label à nouveau.
 */
public class PythonStatusUpdater {

    private static PythonStatusUpdater psuInstance;

    private Label lblPythonState;
    private Timer timer;

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
                Platform.runLater(() -> {
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
                });
            }
        }, 0, 4000);
    }

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
    }

}

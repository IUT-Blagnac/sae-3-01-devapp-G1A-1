package application.controller;

import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Timer;
import java.util.TimerTask;

import application.AlertePopup;
import application.Menu;
import javafx.application.Platform;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.geometry.VPos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TitledPane;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.RowConstraints;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import tools.DataReader;
import tools.GlobalVariables;

public class VisuDonneesController implements Initializable {

    /**
     * Classe interne qui va servir à modifier plus facilement chaque case de la
     * grille
     */
    private class Salle {
        private TitledPane titledPane;
        private VBox vBox;
        private Label lblCO2;
        private Label lblTemp;
        private Label lblHum;

        private static final String noData = "aucune donnée";

        /**
         * Constructeur d'une salle
         * 
         * @param nomSalle    le nom de la salle
         * @param tauxCO2     le taux de co2 présent dans la salle (parsé en String)
         * @param temperature la température de la salle (parsée en String)
         * @param humidite    l'humidité de la salle (parsée en String)
         */
        public Salle(String nomSalle, String tauxCO2, String temperature, String humidite) {
            this.lblCO2 = new Label((tauxCO2 != null) ? "CO2 : " + tauxCO2 : "CO2 : " + noData);
            this.lblTemp = new Label(
                    (temperature != null) ? "Température : " + temperature : "Température : " + noData);
            this.lblHum = new Label((humidite != null) ? "Humidité : " + humidite : "Humidité : " + noData);
            this.vBox = new VBox(this.lblCO2, this.lblTemp, this.lblHum);
            this.titledPane = new TitledPane(nomSalle, this.vBox);
        }

        /**
         * Set le texte du label co2
         * 
         * @param tauxCO2 la nouvelle valeur du taux (parsée en String)
         */
        public void setCO2(String tauxCO2) {
            this.lblCO2.setText((tauxCO2 != null) ? "CO2 : " + tauxCO2 : "CO2 : " + noData);
        }

        /**
         * Set le texte du label température
         * 
         * @param temperature la nouvelle valeur de la température (parsée en String)
         */
        public void setTemperature(String temperature) {
            this.lblTemp.setText((temperature != null) ? "Température : " + temperature : "Température : " + noData);
        }

        /**
         * Set le texte du label humidité
         * 
         * @param humidite la nouvelle valeur de l'humidité (parsée en String)
         */
        public void setHumidite(String humidite) {
            this.lblHum.setText((humidite != null) ? "Humidité : " + humidite : "Humidité : " + noData);
        }

        public TitledPane getTitledPane() {
            return this.titledPane;
        }
    }

    // Fenêtre physique
    private Stage primaryStage;

    // Chaque salle sous forme de hashMap
    private Map<String, Salle> salles;

    private Timer timer;

    public void initContext(Stage _containingStage) {
        this.primaryStage = _containingStage;
        this.configure();

        // Ajouter l'overlay à la scène existante
        BorderPane root = (BorderPane) primaryStage.getScene().getRoot();
        StackPane stackPane = new StackPane();
        stackPane.getChildren().add(root);
        primaryStage.getScene().setRoot(stackPane);

        // Allow the alerts to be displayed
        AlertePopup alertePopup = AlertePopup.getAlertPopupInstance(this.primaryStage);
    }

    public void displayDialog() {

        this.primaryStage.show();
    }

    private void configure() {
        this.primaryStage.setOnCloseRequest(e -> this.closeWindow(e));
    }

    // Gestion du stage
    private Object closeWindow(WindowEvent e) {
        this.doQuit();
        e.consume();
        return null;
    }

    // Attributs de la scene + actions

    @FXML
    private Button btnBack;

    @FXML
    private void doBack() { // Bouton qui mène à la page précédente (menu.fxml)
        try {
            this.timer.cancel();
            FXMLLoader loader = new FXMLLoader(
                    MenuCourbeController.class.getResource("/application/view/menu.fxml"));
            BorderPane root = loader.load();

            Scene scene = new Scene(root, root.getPrefWidth() + 20, root.getPrefHeight() + 10);
            scene.getStylesheets().add(Menu.class.getResource("application.css").toExternalForm());

            primaryStage.setScene(scene);
            primaryStage.setTitle("Fenêtre Menu Principal");

            MenuController mfc = loader.getController();
            mfc.initContext(primaryStage);

            mfc.displayDialog();

        } catch (Exception e) {
            e.printStackTrace();
            System.exit(-1);
        }
    }

    @FXML
    private void doQuit() { // Gestion de la fermeture de la fenêtre
        GlobalVariables.exitApp(this.primaryStage);
    }

    @FXML
    private ScrollPane scrollPane;

    @FXML
    private GridPane gridPane;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        this.salles = new HashMap<>();

        // on initialise la map des salles avec leur valeurs
        setNewRoomValues();
        // on affiche la grille
        RowConstraints rowConstraints = new RowConstraints();
        rowConstraints.setValignment(VPos.TOP);
        gridPane.getRowConstraints().add(rowConstraints);
        int i = 0;
        for (Map.Entry<String, Salle> salle : this.salles.entrySet()) {
            gridPane.add(salle.getValue().getTitledPane(), i % 3, i / 3);
            i++;
        }

        // On met un timer qui va, toutes les 60 secondes, rappeler la methode
        // setNewRoomValues pour mettre à jour les valeurs de chaque salle avec
        // leur derniere valeur (il se peut que les valeurs ne changent pas).
        timer = new Timer(true);
        timer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                Platform.runLater(() -> {
                    setNewRoomValues();
                });
            }
        }, 0, 10000);

    }

    public void setNewRoomValues() {
        DataReader dataReader = new DataReader();
        List<HashMap<String, Object>> record;
        HashMap<String, Object> lastLine;
        for (String room : GlobalVariables.salles) {
            record = dataReader.readJsonLFile("IoT et JavaFX/appli-python/datas/captor/" + room + ".jsonl");
            if (record != null) {
                lastLine = record.get(record.size() - 1);
                String co2 = lastLine.getOrDefault("co2", Salle.noData).toString();
                String temperature = lastLine.getOrDefault("temperature",
                        Salle.noData).toString();
                String humidite = lastLine.getOrDefault("humidite", Salle.noData).toString();
                // Si la salle est déjà présente dans le dictionnaire on modifie simplement ses
                // valeurs, sinon on crée une nouvelle salle
                if (this.salles.containsKey(room)) {
                    this.salles.get(room).setCO2(co2);
                    this.salles.get(room).setTemperature(temperature);
                    this.salles.get(room).setHumidite(humidite);
                } else {
                    this.salles.put(room, new Salle(room, co2, temperature, humidite));
                }
            } else {
                // Si on ne trouve pas de fichier on met des valeurs nulles à la place
                this.salles.put(room, new Salle(room, null, null, null));
            }
        }
    }
}

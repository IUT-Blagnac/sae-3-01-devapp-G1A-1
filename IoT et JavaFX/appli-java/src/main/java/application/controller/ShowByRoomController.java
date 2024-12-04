package application.controller;

import java.io.File;
import java.net.URL;
import java.util.ResourceBundle;
import java.util.Timer;
import java.util.TimerTask;

import application.AlertePopup;
import application.Menu;
import javafx.application.Platform;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.chart.LineChart;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.XYChart;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.TitledPane;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.Region;
import javafx.scene.layout.StackPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import tools.DataReader;
import tools.GlobalVariables;
import javafx.scene.Node;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
 * Contrôleur pour afficher les données par salle
 * avec des graphiques pour chaque salle
 * et des options pour afficher les données
 * de CO2, d'humidité et de température
 * pour chaque salle
 * Les salles peuvent être affichées ou masquées
 * et les graphiques sont mis à jour en conséquence
 * en fonction des options sélectionnées
 */
public class ShowByRoomController implements Initializable {

    // Fenêtre physique
    private Stage primaryStage;

    private Timer timer;

    private Map<String, Boolean> salleVisibility = new HashMap<>();

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
                    ShowByRoomController.class.getResource("/application/view/menuCourbe.fxml"));
            BorderPane root = loader.load();

            Scene scene = new Scene(root, root.getPrefWidth() + 20, root.getPrefHeight() + 10);
            scene.getStylesheets().add(Menu.class.getResource("application.css").toExternalForm());

            primaryStage.setScene(scene);
            primaryStage.setTitle("Fenêtre Menu Courbe");

            MenuCourbeController mfc = loader.getController();
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
    private ScrollPane scrollPaneLeft; // Lien avec votre ScrollPane à gauche

    @FXML
    private VBox contentLeftVBox; // Conteneur pour les salles à l'intérieur du ScrollPane Gauche

    @FXML
    private ScrollPane scrollPaneRight; // ScrollPane droit pour afficher les graphiques

    @FXML
    private VBox contentRightVBox; // Conteneur des sections dans le ScrollPane droit

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        // Salles à afficher
        String filePath = "IoT et JavaFX/appli-python/config.json";
        DataReader dataReader = new DataReader();
        HashMap<String, Object> jsonMap = dataReader.readJsonFile(filePath);

        // Récupérer les valeurs sous l'objet "salle"
        HashMap<String, Object> salleValues = (HashMap<String, Object>) jsonMap.get("salle");
        String numSalle = (String) salleValues.get("num_salle");
        List<String> sallesSelectionnees = Arrays.asList(numSalle.split(","));

        String[] sallesConfig = {};
        for (String salle : sallesSelectionnees) {
            sallesConfig = Arrays.copyOf(sallesConfig, sallesConfig.length + 1);
            sallesConfig[sallesConfig.length - 1] = salle;
        }

        for (String salle : sallesConfig) {
            // Ajouter chaque salle à la HashMap avec un état visible par défaut
            salleVisibility.put(salle, true);

            TitledPane titledPane = new TitledPane();
            titledPane.setText(""); // On ne veut pas de texte supplémentaire

            HBox titleHBox = new HBox(50);
            titleHBox.setAlignment(Pos.CENTER_LEFT);

            Label titleLabel = new Label(salle);
            titleLabel.setStyle("-fx-font-weight: bold; -fx-font-size: 14px;");

            Region spacer = new Region();
            HBox.setHgrow(spacer, Priority.ALWAYS);

            Button eyeButton = new Button("👁");
            eyeButton.setStyle("-fx-background-color: transparent; -fx-cursor: hand;");
            eyeButton.setOnAction(event -> toggleVisibility(salle, eyeButton));

            titleHBox.getChildren().addAll(titleLabel, spacer, eyeButton);
            titledPane.setGraphic(titleHBox);

            VBox optionsVBox = new VBox(5);
            CheckBox checkBoxCO2 = new CheckBox("CO2");
            CheckBox checkBoxHumidity = new CheckBox("Humidité");
            CheckBox checkBoxTemperature = new CheckBox("Température");

            checkBoxCO2.setOnAction(event -> updateRightScrollPane());
            checkBoxHumidity.setOnAction(event -> updateRightScrollPane());
            checkBoxTemperature.setOnAction(event -> updateRightScrollPane());

            optionsVBox.getChildren().addAll(checkBoxCO2, checkBoxHumidity, checkBoxTemperature);
            titledPane.setContent(optionsVBox);

            contentLeftVBox.getChildren().add(titledPane);
        }

        updateRightScrollPane();

        timer = new Timer(true);
        timer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                Platform.runLater(() -> {
                    updateRightScrollPane();
                });
            }
        }, 0, 10000);
    }

    // Méthode pour afficher/cacher une salle (fonctionnalité future)
    private void toggleVisibility(String salle, Button eyeButton) {
        // Vérifier que la salle existe dans la HashMap
        if (!salleVisibility.containsKey(salle)) {
            System.err.println("Salle non trouvée : " + salle);
            return;
        }

        // Inverser l'état de visibilité
        boolean isVisible = salleVisibility.get(salle);
        salleVisibility.put(salle, !isVisible);

        // Mettre à jour l'icône
        if (!isVisible) {
            eyeButton.setText("👁");
            System.out.println("Afficher la salle: " + salle);
        } else {
            eyeButton.setText("🙈");
            System.out.println("Cacher la salle: " + salle);
            // Fermer ou ouvrir le menu déroulant de la salle
            for (Node node : contentLeftVBox.getChildren()) {
                if (node instanceof TitledPane) {
                    TitledPane titledPane = (TitledPane) node;
                    Label titleLabel = getTitleLabel(titledPane);
                    if (titleLabel != null && titleLabel.getText().equals(salle)) {
                        // Si la salle est masquée, fermer le TitledPane
                        titledPane.setExpanded(!isVisible); // Si invisible, fermer le menu
                        titledPane.setExpanded(false); // Ferme le menu latéral
                        break;
                    }
                }
            }
        }

        // Mettre à jour l'affichage des graphiques
        updateRightScrollPane();
    }

    private void updateRightScrollPane() {
        contentRightVBox.getChildren().clear();

        for (Node node : contentLeftVBox.getChildren()) {
            if (node instanceof TitledPane) {
                TitledPane titledPane = (TitledPane) node;
                Label titleLabel = getTitleLabel(titledPane);
                String salle = titleLabel != null ? titleLabel.getText() : "";

                // Vérifier que la salle existe dans la HashMap
                if (!salleVisibility.containsKey(salle) || !salleVisibility.get(salle)) {
                    continue; // Sauter les salles qui sont masquées ou inexistantes
                }

                if (titledPane.getContent() instanceof VBox) {
                    VBox optionsVBox = (VBox) titledPane.getContent();
                    CheckBox checkBoxCO2 = (CheckBox) optionsVBox.getChildren().get(0);
                    CheckBox checkBoxHumidity = (CheckBox) optionsVBox.getChildren().get(1);
                    CheckBox checkBoxTemperature = (CheckBox) optionsVBox.getChildren().get(2);

                    // Charger les données pour la salle
                    List<HashMap<String, Object>> salleData = loadSalleData(salle);

                    // Boîte pour chaque salle (avec une taille fixe)
                    VBox salleRightVBox = new VBox(10);
                    salleRightVBox.setAlignment(Pos.TOP_CENTER);
                    salleRightVBox.setPrefSize(400, 400); // Taille fixe (largeur, hauteur)
                    salleRightVBox.setMinSize(400, 400);
                    salleRightVBox.setStyle("-fx-border-color: black; -fx-border-width: 2px; -fx-padding: 15px;");
                    salleRightVBox.getStyleClass().add("salle-box");

                    Label rightSalleLabel = new Label("Salle : " + salle);
                    rightSalleLabel.setStyle("-fx-font-weight: bold; -fx-font-size: 16px;");

                    LineChart<Number, Number> lineChart = createEmptyChart();

                    if (checkBoxCO2.isSelected() || checkBoxHumidity.isSelected() || checkBoxTemperature.isSelected()) {
                        if (checkBoxCO2.isSelected()) {
                            lineChart.getData().add(createSeriesFromData("CO2", salleData, "co2"));
                        }
                        if (checkBoxHumidity.isSelected()) {
                            lineChart.getData().add(createSeriesFromData("Humidité", salleData, "humidite"));
                        }
                        if (checkBoxTemperature.isSelected()) {
                            lineChart.getData().add(createSeriesFromData("Température", salleData, "temperature"));
                        }
                    } else {
                        lineChart.setTitle("Aucune donnée sélectionnée pour cette salle.");
                    }

                    // Ajouter le label et le graphique dans la boîte
                    salleRightVBox.getChildren().addAll(rightSalleLabel, lineChart);
                    contentRightVBox.getChildren().add(salleRightVBox);
                }
            }
        }
    }

    // Créer un graphique vide
    private LineChart<Number, Number> createEmptyChart() {
        NumberAxis xAxis = new NumberAxis();
        xAxis.setLabel("Temps");
        NumberAxis yAxis = new NumberAxis();
        yAxis.setLabel("Valeur");

        LineChart<Number, Number> lineChart = new LineChart<>(xAxis, yAxis);
        lineChart.setTitle("Graphique de données");
        lineChart.setLegendVisible(true);

        return lineChart;
    }

    /**
     * Charge les données d'une salle depuis un fichier JSONL.
     *
     * @param salle Le nom de la salle.
     * @return Une liste de données de la salle.
     */
    private List<HashMap<String, Object>> loadSalleData(String salle) {
        String filePath = "IoT et JavaFX/appli-python/datas/captor/" + salle + ".jsonl";
        File file = new File(filePath);
        if (!file.exists()) {
            System.out.println(
                    "Le fichier pour la salle " + salle + " n'existe pas. Un tableau de données vide sera utilisé.");
            // Alert alert = new Alert(AlertType.WARNING);
            // alert.setTitle("Fichier introuvable");
            // alert.setHeaderText("Données manquantes pour la salle : " + salle);
            // alert.setContentText(
            // "Le fichier " + salle + ".jsonl est introuvable. Un tableau de données vide
            // sera utilisé.");
            // alert.showAndWait(); // Affiche le popup et attend la fermeture par
            // l'utilisateur
            return new ArrayList<>();
        }

        DataReader dataReader = new DataReader();
        try {
            return dataReader.readJsonLFile(filePath);
        } catch (Exception e) {
            System.err.println("Erreur lors du chargement des données pour la salle " + salle + ": " + e.getMessage());
            return new ArrayList<>();
        }
    }

    /**
     * Crée une série à partir des données JSONL pour un type de mesure spécifique.
     * 
     * @param name Le nom de la série.
     * @param data Les données de la salle.
     * @param key  La clé correspondant au type de mesure (ex. "co2", "humidite",
     *             "temperature").
     * @return Une série prête à être ajoutée au graphique.
     */
    private XYChart.Series<Number, Number> createSeriesFromData(String name, List<HashMap<String, Object>> data, String key) {
        XYChart.Series<Number, Number> series = new XYChart.Series<>();
        series.setName(name);
    
        for (int i = 0; i < data.size(); i++) {
            HashMap<String, Object> record = data.get(i);
            if (record.containsKey(key)) {
                double value = ((Number) record.get(key)).doubleValue();
                // Normalisation pour le CO2
                if (key.equals("co2")) {
                    value /= 100; // Diviser par 100 pour réduire l'échelle
                }
                series.getData().add(new XYChart.Data<>(i, value));
            }
        }
        return series;
    }

    public Label getTitleLabel(TitledPane titledPane) {
        Node graphic = titledPane.getGraphic();
        if (graphic instanceof HBox) {
            HBox hbox = (HBox) graphic;
            for (Node child : hbox.getChildren()) {
                if (child instanceof Label) {
                    return (Label) child; // Retourne le premier Label trouvé
                }
            }
        }
        return null; // Si aucun Label trouvé
    }

    /*
     * Vérifie si un fichier existe à un chemin donné.
     */
    private boolean fileExists(String filePath) {
        File file = new File(filePath);
        return file.exists();
    }

}

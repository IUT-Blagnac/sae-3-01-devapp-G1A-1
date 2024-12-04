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
import tools.PythonStatusUpdater;
import javafx.scene.Node;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
 * Contrôleur pour afficher les données par salle
 * avec des graphiques pour chaque type de donnée
 * et des options pour afficher/cacher les salles
 * et les types de données
 */
public class ShowByDataController implements Initializable {

    // Fenêtre physique
    private Stage primaryStage;

    private Timer timer;

    private Map<String, Boolean> dataVisibility = new HashMap<>();

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

        PythonStatusUpdater.getPSUInstance().setPSULabel(this.lblPythonState);
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
    private Label lblPythonState;

    @FXML
    private void doBack() { // Bouton qui mène à la page précédente (menu.fxml)
        try {
            this.timer.cancel();
            FXMLLoader loader = new FXMLLoader(
                    ShowByDataController.class.getResource("/application/view/menuCourbe.fxml"));
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
        String[] typeDonnee = { "Température", "CO2", "Humidité" };

        // Charger les salles depuis le fichier de configuration
        // Salles à afficher
        String filePath = "IoT et JavaFX/appli-python/config.json";
        DataReader dataReader = new DataReader();
        HashMap<String, Object> jsonMap = dataReader.readJsonFile(filePath);

        // Récupérer les valeurs sous l'objet "salle"
        HashMap<String, Object> salleValues = (HashMap<String, Object>) jsonMap.get("salle");
        String numSalle = (String) salleValues.get("num_salle");
        List<String> sallesSelectionnees = Arrays.asList(numSalle.split(","));

        for (String donnee : typeDonnee) {
            // Ajouter chaque salle à la HashMap avec un état visible par défaut
            dataVisibility.put(donnee, true);

            TitledPane titledPane = new TitledPane();
            titledPane.setText(""); // On ne veut pas de texte supplémentaire

            HBox titleHBox = new HBox(30);
            titleHBox.setAlignment(Pos.CENTER_LEFT);

            Label titleLabel = new Label(donnee);
            titleLabel.setStyle("-fx-font-weight: bold; -fx-font-size: 14px;");

            Region spacer = new Region();
            HBox.setHgrow(spacer, Priority.ALWAYS);

            Button eyeButton = new Button("👁");
            eyeButton.setStyle("-fx-background-color: transparent; -fx-cursor: hand;");
            eyeButton.setOnAction(event -> toggleVisibility(donnee, eyeButton));

            titleHBox.getChildren().addAll(titleLabel, spacer, eyeButton);
            titledPane.setGraphic(titleHBox);

            VBox optionsVBox = new VBox(5);

            for (String salleSelectionnee : sallesSelectionnees) {
                CheckBox checkBox = new CheckBox(salleSelectionnee);
                checkBox.setOnAction(event -> updateRightScrollPane());
                optionsVBox.getChildren().add(checkBox);
            }

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
    private void toggleVisibility(String typeData, Button eyeButton) {
        // Vérifier que la donnée existe dans la HashMap
        if (!dataVisibility.containsKey(typeData)) {
            System.err.println("Donnée non trouvée : " + typeData);
            return;
        }

        // Inverser l'état de visibilité
        boolean isVisible = dataVisibility.get(typeData);
        dataVisibility.put(typeData, !isVisible);

        // Mettre à jour l'icône
        if (!isVisible) {
            eyeButton.setText("👁");
            System.out.println("Afficher la donnée: " + typeData);
        } else {
            eyeButton.setText("🙈");
            System.out.println("Cacher la donnée: " + typeData);
            // Fermer ou ouvrir le menu déroulant de la donnée
            for (Node node : contentLeftVBox.getChildren()) {
                if (node instanceof TitledPane) {
                    TitledPane titledPane = (TitledPane) node;
                    Label titleLabel = getTitleLabel(titledPane);
                    if (titleLabel != null && titleLabel.getText().equals(typeData)) {
                        // Si la donnée est masquée, fermer le TitledPane
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
                String typeDonnee = titleLabel != null ? titleLabel.getText() : "";

                // Vérifier que la donnée existe dans la HashMap et que la donnée est visible
                if (!dataVisibility.containsKey(typeDonnee) || !dataVisibility.get(typeDonnee)) {
                    continue; // Sauter si la donnée est masquée
                }

                if (titledPane.getContent() instanceof VBox) {
                    VBox optionsVBox = (VBox) titledPane.getContent();
                    // Initialisation du graphique pour cette donnée
                    LineChart<Number, Number> lineChart = createEmptyChart();
                    lineChart.setLegendVisible(true);

                    // Variable pour vérifier si au moins une salle est sélectionnée
                    boolean salleSelectionnee = false;

                    // Parcours des CheckBox dynamiquement dans la VBox des options
                    for (Node checkBoxNode : optionsVBox.getChildren()) {
                        if (checkBoxNode instanceof CheckBox) {
                            CheckBox checkBox = (CheckBox) checkBoxNode;
                            if (checkBox.isSelected()) {
                                salleSelectionnee = true;
                                String salleName = checkBox.getText(); // Récupère le nom de la salle

                                // Ajoute la série de données correspondante pour cette salle
                                lineChart.getData()
                                        .add(createSeries(salleName, getDataForSalle(typeDonnee, salleName)));
                            }
                        }
                    }

                    // Si aucune salle n'est sélectionnée, afficher un message dans le graphique
                    if (!salleSelectionnee) {
                        lineChart.setTitle("Aucune salle sélectionnée pour cette donnée.");
                    }

                    // Ajouter le label et le graphique dans une boîte à droite
                    VBox dataRightVBox = new VBox(10);
                    dataRightVBox.setAlignment(Pos.TOP_CENTER);
                    dataRightVBox.setPrefSize(400, 400); // Taille fixe pour le graphique
                    dataRightVBox.setMinSize(400, 400);
                    dataRightVBox.setStyle("-fx-border-color: black; -fx-border-width: 2px; -fx-padding: 15px;");
                    Label rightDataLabel = new Label("Donnée : " + typeDonnee);
                    rightDataLabel.setStyle("-fx-font-weight: bold; -fx-font-size: 16px;");

                    // Ajouter le label et le graphique dans la VBox
                    dataRightVBox.getChildren().addAll(rightDataLabel, lineChart);
                    contentRightVBox.getChildren().add(dataRightVBox);
                }
            }
        }
    }

    private double[] getDataForSalle(String typeDonnee, String salleName) {
        // Charger les données depuis le fichier JSONL
        String filePath = "IoT et JavaFX/appli-python/datas/captor/" + salleName + ".jsonl";
        File file = new File(filePath);
        if (!file.exists()) {
            System.out.println(
                    "Le fichier pour la salle " + salleName
                            + " n'existe pas. Un tableau de données vide sera utilisé.");
            return new double[] {};
        }

        DataReader dataReader = new DataReader();
        try {
            List<HashMap<String, Object>> records = dataReader.readJsonLFile(filePath);

            // Assigne les valeurs selon le type de donnée
            if (typeDonnee.equals("Température")) {
                double[] temperatures = new double[records.size()];
                for (int i = 0; i < records.size(); i++) {
                    HashMap<String, Object> record = records.get(i);
                    Object tempValue = record.get("temperature");

                    if (tempValue instanceof Integer) {
                        // Si c'est un Integer, on le convertit en Double
                        temperatures[i] = ((Integer) tempValue).doubleValue();
                    } else if (tempValue instanceof Double) {
                        // Si c'est déjà un Double, on l'assigne directement
                        temperatures[i] = (Double) tempValue;
                    } else {
                        // Gérer les cas où la donnée n'est ni Integer ni Double
                        System.err.println("Type inattendu pour Température : " + tempValue.getClass());
                        temperatures[i] = 0.0; // On assigne une valeur par défaut en cas de type incorrect
                    }
                }
                return temperatures;
            } else if (typeDonnee.equals("CO2")) {
                double[] cDoubles = new double[records.size()];
                for (int i = 0; i < records.size(); i++) {
                    HashMap<String, Object> record = records.get(i);
                    Object co2Value = record.get("co2");

                    if (co2Value instanceof Integer) {
                        // Si c'est un Integer, on le convertit en Double
                        cDoubles[i] = ((Integer) co2Value).doubleValue();
                    } else if (co2Value instanceof Double) {
                        // Si c'est déjà un Double, on l'assigne directement
                        cDoubles[i] = (Double) co2Value;
                    } else {
                        // Gérer les cas où la donnée n'est ni Integer ni Double
                        System.err.println("Type inattendu pour CO2 : " + co2Value.getClass());
                        cDoubles[i] = 0.0; // On assigne une valeur par défaut en cas de type incorrect
                    }
                }
                return cDoubles;
            } else if (typeDonnee.equals("Humidité")) {
                double[] humidites = new double[records.size()];
                for (int i = 0; i < records.size(); i++) {
                    HashMap<String, Object> record = records.get(i);
                    Object humiditeValue = record.get("humidite");

                    if (humiditeValue instanceof Integer) {
                        // Si c'est un Integer, on le convertit en Double
                        humidites[i] = ((Integer) humiditeValue).doubleValue();
                    } else if (humiditeValue instanceof Double) {
                        // Si c'est déjà un Double, on l'assigne directement
                        humidites[i] = (Double) humiditeValue;
                    } else {
                        // Gérer les cas où la donnée n'est ni Integer ni Double
                        System.err.println("Type inattendu pour Humidité : " + humiditeValue.getClass());
                        humidites[i] = 0.0; // On assigne une valeur par défaut en cas de type incorrect
                    }
                }
                return humidites;
            }
        } catch (Exception e) {
            System.err.println(
                    "Erreur lors du chargement des données pour la salle " + salleName + ": " + e.getMessage());
        }
        return new double[] {};
    }

    // Créer un graphique vide
    private LineChart<Number, Number> createEmptyChart() {
        NumberAxis xAxis = new NumberAxis();
        xAxis.setLabel("Temps");
        NumberAxis yAxis = new NumberAxis();
        yAxis.setLabel("Valeur");

        LineChart<Number, Number> chart = new LineChart<>(xAxis, yAxis);
        chart.setTitle("Graphique");

        return chart;
    }

    // Créer une série de données pour le graphique
    private XYChart.Series<Number, Number> createSeries(String name, double[] data) {
        XYChart.Series<Number, Number> series = new XYChart.Series<>();
        series.setName(name);
        for (int i = 0; i < data.length; i++) {
            series.getData().add(new XYChart.Data<>(i, data[i]));
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

}

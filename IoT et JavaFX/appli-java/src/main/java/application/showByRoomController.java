package application;

import java.net.URL;
import java.util.ResourceBundle;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.chart.LineChart;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.XYChart;
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
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import javafx.scene.Node;
import java.util.HashMap;
import java.util.Map;

public class showByRoomController implements Initializable {

    // Fenêtre physique
    private Stage primaryStage;

    private Map<String, Boolean> salleVisibility = new HashMap<>();

    public void initContext(Stage _containingStage) {
        this.primaryStage = _containingStage;
        this.configure();
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
    private Button btnQuit;

    @FXML
    private void doBack() { // Bouton qui mène à la page précédente (menu.fxml)
        this.primaryStage.hide();

        try {
            FXMLLoader loader = new FXMLLoader(
                    showByRoomController.class.getResource("menuCourbe.fxml"));
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

        this.primaryStage.show();
    }

    @FXML
    private void doQuit() { // Gestion de la fermeture de la fenêtre
        if (AlertUtilities.confirmYesCancel(this.primaryStage, "Quitter Appli Principale",
                "Etes vous sur de vouloir quitter l'appli ?", null, AlertType.CONFIRMATION)) {

            this.primaryStage.close();
            System.exit(0);
        }
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
        // Liste statique des noms de salles (remplacer par JSON plus tard)
        String[] salles = { "Salle A", "Salle B", "Salle C" };

        for (String salle : salles) {

            salleVisibility.put(salle, true); // Par défaut, les salles sont visibles

            // Création d'un TitledPane pour chaque salle
            TitledPane titledPane = new TitledPane();

            // Conteneur horizontal pour le titre et l'œil
            HBox titleHBox = new HBox(50); // Pas de largeur fixe
            titleHBox.setAlignment(Pos.CENTER_LEFT); // Alignement global

            // Titre de la salle
            Label titleLabel = new Label(salle);
            titleLabel.setStyle("-fx-font-weight: bold; -fx-font-size: 14px;");

            // Stocker le titre dans les propriétés utilisateur du TitledPane
            titledPane.setUserData(titleLabel);

            // Espaceur flexible entre le titre et le bouton œil
            Region spacer = new Region();
            HBox.setHgrow(spacer, Priority.ALWAYS); // Le spacer prend tout l'espace disponible

            // Bouton "œil" pour afficher/cacher la salle
            Button eyeButton = new Button("👁"); // Initialisation de l'icône à un œil ouvert
            eyeButton.setStyle("-fx-background-color: transparent; -fx-cursor: hand;");
            eyeButton.setOnAction(event -> toggleVisibility(salle, eyeButton));

            // Ajouter le titre, le spacer et le bouton œil dans le HBox
            titleHBox.getChildren().addAll(titleLabel, spacer, eyeButton);

            // Définir le HBox comme graphique du TitledPane
            titledPane.setGraphic(titleHBox);

            // Contenu du TitledPane (VBox)
            VBox optionsVBox = new VBox(5); // Espacement vertical
            CheckBox checkBoxCO2 = new CheckBox("CO2");
            CheckBox checkBoxHumidity = new CheckBox("Humidité");
            CheckBox checkBoxTemperature = new CheckBox("Température");

            checkBoxCO2.setOnAction(event -> updateRightScrollPane());
            checkBoxHumidity.setOnAction(event -> updateRightScrollPane());
            checkBoxTemperature.setOnAction(event -> updateRightScrollPane());

            // Ajouter les cases à cocher au contenu
            optionsVBox.getChildren().addAll(checkBoxCO2, checkBoxHumidity, checkBoxTemperature);

            // Définir le contenu
            titledPane.setContent(optionsVBox);

            // Ajouter le TitledPane au conteneur principal
            contentLeftVBox.getChildren().add(titledPane);
        }

    }

    // Méthode pour afficher/cacher une salle (fonctionnalité future)
    private void toggleVisibility(String salle, Button eyeButton) {
        // Inverser l'état de visibilité de la salle
        boolean isVisible = salleVisibility.get(salle);
        salleVisibility.put(salle, !isVisible);

        // Mettre à jour l'icône
        if (!isVisible) {
            eyeButton.setText("👁");
            System.out.println("Afficher la salle: " + salle);
        } else {
            eyeButton.setText("🙈");
            System.out.println("Cacher la salle: " + salle);
        }

        // Mettre à jour l'affichage des graphiques
        updateRightScrollPane();
    }

    private void updateRightScrollPane() {
        contentRightVBox.getChildren().clear();
    
        for (Node node : contentLeftVBox.getChildren()) {
            if (node instanceof TitledPane) {
                TitledPane titledPane = (TitledPane) node;
                String salle = titledPane.getText();
    
                // Vérifier si la salle est visible
                if (!salleVisibility.get(salle)) {
                    continue; // Ne pas afficher si la salle est masquée
                }
    
                if (titledPane.getContent() instanceof VBox) {
                    VBox optionsVBox = (VBox) titledPane.getContent();
                    CheckBox checkBoxCO2 = (CheckBox) optionsVBox.getChildren().get(0);
                    CheckBox checkBoxHumidity = (CheckBox) optionsVBox.getChildren().get(1);
                    CheckBox checkBoxTemperature = (CheckBox) optionsVBox.getChildren().get(2);
    
                    VBox salleRightVBox = new VBox(10);
                    salleRightVBox.setAlignment(Pos.TOP_CENTER);
    
                    Label rightSalleLabel = new Label("Salle : " + salle);
                    rightSalleLabel.setStyle("-fx-font-weight: bold; -fx-font-size: 16px;");
    
                    LineChart<Number, Number> lineChart = createEmptyChart();
    
                    // Ajouter les séries même si aucune case n'est cochée
                    if (checkBoxCO2.isSelected() || checkBoxHumidity.isSelected() || checkBoxTemperature.isSelected()) {
                        if (checkBoxCO2.isSelected()) {
                            lineChart.getData().add(createSeries("CO2", new double[] { 10, 20, 30, 40, 50 }));
                        }
                        if (checkBoxHumidity.isSelected()) {
                            lineChart.getData().add(createSeries("Humidité", new double[] { 60, 50, 70, 80, 90 }));
                        }
                        if (checkBoxTemperature.isSelected()) {
                            lineChart.getData().add(createSeries("Température", new double[] { 15, 17, 19, 21, 23 }));
                        }
                    } else {
                        // Graphique vide mais toujours affiché
                        lineChart.setTitle("Aucune donnée sélectionnée pour cette salle.");
                    }
    
                    salleRightVBox.getChildren().addAll(rightSalleLabel, lineChart);
                    contentRightVBox.getChildren().add(salleRightVBox);
                }
            }
        }
    }
    

    // Créer un graphique avec un titre
    private LineChart<Number, Number> createChartWithTitle(String salleName) {
        NumberAxis xAxis = new NumberAxis();
        xAxis.setLabel("Temps");
        NumberAxis yAxis = new NumberAxis();
        yAxis.setLabel("Valeur");

        LineChart<Number, Number> chart = new LineChart<>(xAxis, yAxis);
        chart.setTitle("Salle : " + salleName); // Définir le nom de la salle comme titre du graphique

        return chart;
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

}

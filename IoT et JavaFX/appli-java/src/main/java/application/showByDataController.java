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

public class showByDataController implements Initializable {

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
    private void doBack() { // Bouton qui mène à la page précédente (menu.fxml)
        this.primaryStage.hide();

        try {
            FXMLLoader loader = new FXMLLoader(
                    showByDataController.class.getResource("menuCourbe.fxml"));
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
        String[] salles = { "Température", "CO2", "Humidité" };

        for (String salle : salles) {
            // Ajouter chaque salle à la HashMap avec un état visible par défaut
            salleVisibility.put(salle, true);

            TitledPane titledPane = new TitledPane();
            titledPane.setText(""); // On ne veut pas de texte supplémentaire

            HBox titleHBox = new HBox(30);
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
            CheckBox checkBoxCO2 = new CheckBox("Salle A");
            CheckBox checkBoxHumidity = new CheckBox("Salle B");
            CheckBox checkBoxTemperature = new CheckBox("Salle C");

            checkBoxCO2.setOnAction(event -> updateRightScrollPane());
            checkBoxHumidity.setOnAction(event -> updateRightScrollPane());
            checkBoxTemperature.setOnAction(event -> updateRightScrollPane());

            optionsVBox.getChildren().addAll(checkBoxCO2, checkBoxHumidity, checkBoxTemperature);
            titledPane.setContent(optionsVBox);

            contentLeftVBox.getChildren().add(titledPane);
        }

        updateRightScrollPane();
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
            System.out.println("Afficher la donnée: " + salle);
        } else {
            eyeButton.setText("🙈");
            System.out.println("Cacher la donnée: " + salle);
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

                    // Boîte pour chaque salle (avec une taille fixe)
                    VBox salleRightVBox = new VBox(10);
                    salleRightVBox.setAlignment(Pos.TOP_CENTER);
                    salleRightVBox.setPrefSize(400, 300); // Taille fixe (largeur, hauteur)
                    salleRightVBox.setMinSize(400, 300);
                    salleRightVBox.setStyle("-fx-border-color: black; -fx-border-width: 2px; -fx-padding: 15px;");
                    salleRightVBox.getStyleClass().add("salle-box");

                    Label rightSalleLabel = new Label("Donnée : " + salle);
                    rightSalleLabel.setStyle("-fx-font-weight: bold; -fx-font-size: 16px;");

                    LineChart<Number, Number> lineChart = createEmptyChart();

                    if (checkBoxCO2.isSelected() || checkBoxHumidity.isSelected() || checkBoxTemperature.isSelected()) {
                        if (checkBoxCO2.isSelected()) {
                            lineChart.getData().add(createSeries("Salle A", new double[] { 10, 20, 30, 40, 50 }));
                        }
                        if (checkBoxHumidity.isSelected()) {
                            lineChart.getData().add(createSeries("Salle B", new double[] { 60, 50, 70, 80, 90 }));
                        }
                        if (checkBoxTemperature.isSelected()) {
                            lineChart.getData().add(createSeries("Salle C", new double[] { 15, 17, 19, 21, 23 }));
                        }
                    } else {
                        lineChart.setTitle("Aucune salle sélectionnée pour cette donnée.");
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

package application;

import java.net.URL;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.ResourceBundle;

import java.util.List;
import java.util.Map;

import javafx.util.StringConverter;
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
import javafx.scene.control.Label;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import tools.SolarDataReader;

/* Contrôleur pour afficher les données solaires
 *Affiche les données de production actuelle, journalière, mensuelle et annuelle
 *Affiche un graphique de production en fonction du temps
 */
public class showSolarController implements Initializable {

    private static final String DATA_FILE_PATH = "IOT et JavaFX/appli-python/datas/solar/DONNEES_SOLAIRES.jsonl";

    private List<HashMap<String, Object>> solarData; // Liste des données solaires

    // Fenêtre physique
    private Stage primaryStage;

    private String previousPage;

    public void setPreviousPage(String previousPage) {
        this.previousPage = previousPage;
    }

    public String getPreviousPage() {
        return this.previousPage;
    }

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
        try {
            if (this.previousPage.equals("menuCourbe.fxml")) {
                FXMLLoader loader = new FXMLLoader(
                        showByRoomController.class.getResource("menuCourbe.fxml"));
                BorderPane root = loader.load();

                Scene scene = new Scene(root, root.getPrefWidth() + 20, root.getPrefHeight() + 10);
                scene.getStylesheets().add(menu.class.getResource("application.css").toExternalForm());

                primaryStage.setScene(scene);
                primaryStage.setTitle("Fenêtre Menu Courbe");

                menuCourbeController mfc = loader.getController();
                mfc.initContext(primaryStage);

                mfc.displayDialog();
            } else {
                FXMLLoader loader = new FXMLLoader(
                        showByRoomController.class.getResource("menu.fxml"));
                BorderPane root = loader.load();

                Scene scene = new Scene(root, root.getPrefWidth() + 20, root.getPrefHeight() + 10);
                scene.getStylesheets().add(menu.class.getResource("application.css").toExternalForm());

                primaryStage.setScene(scene);
                primaryStage.setTitle("Fenêtre Menu Principal");

                menuController mfc = loader.getController();
                mfc.initContext(primaryStage);

                mfc.displayDialog();
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(-1);
        }
    }

    @FXML
    private void doQuit() { // Gestion de la fermeture de la fenêtre
        if (AlertUtilities.confirmYesCancel(this.primaryStage, "Quitter Appli Principale",
                "Etes vous sur de vouloir quitter l'appli ?", null, AlertType.CONFIRMATION)) {

            this.primaryStage.close();
            System.exit(0);
        }
    }

    // Attributs de la scene + actions
    @FXML
    private BorderPane contentBorderPane;

    @FXML
    private HBox contentHBox;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        setupHBox();
        setupCenterChart();
    }

    // Méthode pour configurer le HBox
    private void setupHBox() {

        Map<String, Double> summaryData = SolarDataReader.loadSummaryData();

        String[] titles = { "Production Actuelle", "Production Journalière", "Production Mensuelle",
                "Production Annuelle" };
        String[] keys = { "currentPower", "lastDayData", "lastMonthData", "lastYearData" };

        for (int i = 0; i < titles.length; i++) {
            VBox vbox = new VBox(5);
            vbox.setAlignment(Pos.CENTER);

            Label titleLabel = new Label(titles[i]);
            titleLabel.setStyle("-fx-font-weight: bold; -fx-font-size: 14px;");

            Label valueLabel = new Label(String.format("%.2f", summaryData.get(keys[i])) + " kW");
            valueLabel.setStyle("-fx-font-size: 12px;");
            vbox.setStyle("-fx-border-color: black; -fx-border-width: 2px; -fx-padding: 1px;");

            vbox.getChildren().addAll(titleLabel, valueLabel);
            contentHBox.getChildren().add(vbox);
        }

        contentHBox.setSpacing(20);
    }

    // Méthode pour configurer le graphique dans le center
    private void setupCenterChart() {
        List<Map.Entry<LocalTime, Double>> graphData = SolarDataReader.loadGraphData();
    
        if (graphData.isEmpty()) {
            System.err.println("Aucune donnée disponible pour le graphique.");
            return;
        }
    
        // S'assurer que les données sont triées par heure
        graphData.sort(Map.Entry.comparingByKey());
    
        // Déterminer le premier et le dernier timestamp en secondes depuis minuit
        int startSeconds = graphData.get(0).getKey().toSecondOfDay();
        int endSeconds = graphData.get(graphData.size() - 1).getKey().toSecondOfDay();
    
        // Configuration des axes
        NumberAxis xAxis = new NumberAxis();
        NumberAxis yAxis = new NumberAxis();
        xAxis.setLabel("Heure");
        yAxis.setLabel("Valeur (kW)");
    
        // Désactiver le réajustement automatique et définir les bornes manuellement
        xAxis.setAutoRanging(false);
        xAxis.setLowerBound(startSeconds);
        xAxis.setUpperBound(endSeconds);
    
        // Définir l'unité des ticks à 1800 secondes (30 minutes)
        xAxis.setTickUnit(1800); // 30 minutes
    
        // Configurer les labels pour n'afficher que les heures principales
        xAxis.setTickLabelFormatter(new StringConverter<Number>() {
            @Override
            public String toString(Number object) {
                int seconds = object.intValue();
                int hours = seconds / 3600;
                int minutes = (seconds % 3600) / 60;
        
                // Pour débogage : Affiche tous les labels
                System.out.println("Label généré : " + String.format("%02d:%02d", hours, minutes));
                return String.format("%02d:%02d", hours, minutes); // Affiche tout pour test
            }
        
            @Override
            public Number fromString(String string) {
                return null; // Non utilisé
            }
        });
    
        // Créer le LineChart
        LineChart<Number, Number> lineChart = new LineChart<>(xAxis, yAxis);
        lineChart.setTitle("Production en fonction du temps");
    
        // Créer la série de données
        XYChart.Series<Number, Number> series = new XYChart.Series<>();
        series.setName("Production actuelle");
    
        // Ajouter les données à la série
        for (Map.Entry<LocalTime, Double> point : graphData) {
            series.getData().add(new XYChart.Data<>(point.getKey().toSecondOfDay(), point.getValue()));
        }
    
        // Ajouter la série au graphique
        lineChart.getData().add(series);
    
        // Ajouter le graphique au BorderPane central
        contentBorderPane.setCenter(lineChart);
    }

}

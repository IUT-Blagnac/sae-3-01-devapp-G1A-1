package application;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.chart.BarChart;
import javafx.scene.chart.CategoryAxis;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.XYChart;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Label;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;

import java.net.URL;
import java.util.ResourceBundle;

public class showSolarController implements Initializable {

    // Fenêtre physique
    private Stage primaryStage;

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

    @FXML
    private void doBack() {
        this.primaryStage.hide();

        try {
            FXMLLoader loader = new FXMLLoader(
                    showByRoomController.class.getResource("menuCourbe.fxml"));
            BorderPane root = loader.load();

            Scene scene = new Scene(root, root.getPrefWidth() + 20, root.getPrefHeight() + 10);
            scene.getStylesheets().add(Menu.class.getResource("application.css").toExternalForm());

            primaryStage.setScene(scene);
            primaryStage.setTitle("Fenêtre Menu Courbe");

            // Initialisation du contrôleur showSolarController avec le primaryStage
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
    private BarChart<String, Number> energyBarChart; // Graphique à barres

    @FXML
    private Label lblCurrentPower; // Label pour afficher la puissance actuelle

    // Exemple de données, à remplacer par les données réelles de vos panneaux
    // solaires
    private double energyToday = 10700; // Energie du jour (Wh)
    private double energyLastMonth = 195784; // Energie du mois dernier (Wh)
    private double energyLastYear = 245001; // Energie de l'année dernière (Wh)
    private double currentPower = 15; // Puissance actuelle (W)

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        // S'assurer que primaryStage est initialisé avant de mettre à jour le graphique
        if (this.primaryStage != null) {
            updateEnergyGraph();
            lblCurrentPower.setText("Puissance actuelle: " + currentPower + "W");
        } else {
            System.err.println("primaryStage is not initialized in initialize()");
        }
    }

    private void updateEnergyGraph() {
        // Créer les axes du graphique
        CategoryAxis xAxis = new CategoryAxis();
        xAxis.setLabel("Période");

        NumberAxis yAxis = new NumberAxis();
        yAxis.setLabel("Energie (Wh)");

        // Créer le graphique à barres
        energyBarChart = new BarChart<>(xAxis, yAxis);
        energyBarChart.setTitle("Evolution de l'énergie produite");

        // Créer les séries de données pour différentes périodes
        XYChart.Series<String, Number> series = new XYChart.Series<>();
        series.setName("Energie produite");

        // Ajouter les données pour chaque période
        series.getData().add(new XYChart.Data<>("Aujourd'hui", energyToday));
        series.getData().add(new XYChart.Data<>("Mois dernier", energyLastMonth));
        series.getData().add(new XYChart.Data<>("Année dernière", energyLastYear));

        // Ajouter la série de données au graphique
        energyBarChart.getData().add(series);

        // Assurez-vous que primaryStage n'est pas nul avant de définir la scène
        if (this.primaryStage != null) {
            BorderPane root = new BorderPane();
            root.setCenter(energyBarChart);

            Scene scene = new Scene(root, 800, 600);
            this.primaryStage.setScene(scene); // Définit la scène
            this.primaryStage.show();
        } else {
            System.err.println("primaryStage is not initialized in updateEnergyGraph()");
        }
    }
}

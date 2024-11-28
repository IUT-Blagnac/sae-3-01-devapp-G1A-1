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
import javafx.scene.control.Label;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;

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

    // Attributs de la scene + actions

    @FXML
    private Button btnBack;

    @FXML
    private void doBack() { // Bouton qui mène à la page précédente (menu.fxml)
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
        String[] titles = { "Production Actuelle", "Production Journalière", "Production Mensuelle", "Production Annuelle" };
        double[] values = { 200.5, 5000.3, 150000.7, 1800000.4 }; // Valeurs fictives, remplacez par vos données

        for (int i = 0; i < titles.length; i++) {
            VBox vbox = new VBox(5);
            vbox.setAlignment(Pos.CENTER);

            Label titleLabel = new Label(titles[i]);
            titleLabel.setStyle("-fx-font-weight: bold; -fx-font-size: 14px;");

            Label valueLabel = new Label(String.format("%.2f", values[i]) + " kW");
            valueLabel.setStyle("-fx-font-size: 12px;");
            vbox.setStyle("-fx-border-color: black; -fx-border-width: 2px; -fx-padding: 1px;");

            vbox.getChildren().addAll(titleLabel, valueLabel);
            contentHBox.getChildren().add(vbox);
        }

        contentHBox.setSpacing(20); // Espacement entre les cases
    }

    // Méthode pour configurer le graphique dans le center
    private void setupCenterChart() {
        NumberAxis xAxis = new NumberAxis();
        NumberAxis yAxis = new NumberAxis();
        xAxis.setLabel("Date et Heure");
        yAxis.setLabel("Valeur (kW)");

        LineChart<Number, Number> lineChart = new LineChart<>(xAxis, yAxis);
        lineChart.setTitle("Production en fonction du temps"); 

        // Ajout de séries de données fictives
        XYChart.Series<Number, Number> series = new XYChart.Series<>();
        series.setName("Production actuelle");
        series.getData().add(new XYChart.Data<>(0, 200));
        series.getData().add(new XYChart.Data<>(1, 210));
        series.getData().add(new XYChart.Data<>(2, 220));
        series.getData().add(new XYChart.Data<>(3, 215));
        series.getData().add(new XYChart.Data<>(4, 230));

        lineChart.getData().add(series);

        // Ajouter le graphique à la partie centrale du BorderPane
        contentBorderPane.setCenter(lineChart);
    }

}

package application;

import java.net.URL;
import java.util.ResourceBundle;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;

public class MenuCourbeController implements Initializable {

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
    private Button btnByRoom;

    @FXML
    private Button btnByData;

    @FXML
    private Button btnSolar;

    @FXML
    private Button btnBack;

    @FXML
    private Button btnQuit;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
    }

    @FXML
    private void doByRoom() { // Bouton qui mène à la page de choix des courbes par pièce
                              // (menuCourbePiece.fxml)
        this.primaryStage.hide();

        try {
            FXMLLoader loader = new FXMLLoader(
                    MenuCourbeController.class.getResource("showByRoom.fxml"));
            BorderPane root = loader.load();

            Scene scene = new Scene(root, root.getPrefWidth() + 20, root.getPrefHeight() + 10);
            scene.getStylesheets().add(Menu.class.getResource("application.css").toExternalForm());

            primaryStage.setScene(scene);
            primaryStage.setTitle("Fenêtre Menu Principal");

            showByRoomController mfc = loader.getController();
            mfc.initContext(primaryStage);

            mfc.displayDialog();

        } catch (Exception e) {
            e.printStackTrace();
            System.exit(-1);
        }

        this.primaryStage.show();
    }

    @FXML
    private void doByData() { // Bouton qui mène à la page de choix des courbes par type de données
                              // (menuCourbeData.fxml)
        this.primaryStage.hide();
        this.primaryStage.show();
    }

    @FXML
    private void doSolar() { // Bouton qui mène à la page de choix des courbes pour le solaire
                             // (menuCourbeSolaire.fxml)
        this.primaryStage.hide();

        try {
            FXMLLoader loader = new FXMLLoader(
                    MenuCourbeController.class.getResource("showSolar.fxml"));
            BorderPane root = loader.load();

            Scene scene = new Scene(root, root.getPrefWidth() + 20, root.getPrefHeight() + 10);
            scene.getStylesheets().add(Menu.class.getResource("application.css").toExternalForm());

            primaryStage.setScene(scene);
            primaryStage.setTitle("Fenêtre Menu Principal");

            showSolarController mfc = loader.getController();
            mfc.initContext(primaryStage);

            mfc.displayDialog();

        } catch (Exception e) {
            e.printStackTrace();
            System.exit(-1);
        }

        this.primaryStage.show();
    }

    @FXML
    private void doBack() { // Bouton qui mène à la page précédente (menu.fxml)
        this.primaryStage.hide();

        try {
            FXMLLoader loader = new FXMLLoader(
                    MenuCourbeController.class.getResource("menu.fxml"));
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

        this.primaryStage.show();
    }

    @FXML
    private void doCourbe() { // Bouton qui mène à la page de choix des courbes (menuCourbe.fxml)
        this.primaryStage.hide();
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
}

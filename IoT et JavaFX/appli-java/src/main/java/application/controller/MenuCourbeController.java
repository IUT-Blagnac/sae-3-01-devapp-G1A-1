package application.controller;

import java.net.URL;
import java.util.ResourceBundle;

import application.AlertePopup;
import application.Menu;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import tools.GlobalVariables;

/*
 * Contrôleur pour le menu de choix des courbes
 * Permet de choisir entre les courbes par pièce, par type de données ou pour le solaire
 * Redirige vers les pages correspondantes
 * Permet de revenir au menu principal ou de quitter l'application
 */
public class MenuCourbeController implements Initializable {

    // Fenêtre physique
    private Stage primaryStage;

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
        try {
            FXMLLoader loader = new FXMLLoader(
                    MenuCourbeController.class.getResource("/application/view/showByRoom.fxml"));
            BorderPane root = loader.load();

            Scene scene = new Scene(root, root.getPrefWidth() + 20, root.getPrefHeight() + 10);
            scene.getStylesheets().add(Menu.class.getResource("application.css").toExternalForm());

            primaryStage.setScene(scene);
            primaryStage.setTitle("Fenêtre Courbes par Pièce");

            ShowByRoomController mfc = loader.getController();
            mfc.initContext(primaryStage);

            mfc.displayDialog();

        } catch (Exception e) {
            e.printStackTrace();
            System.exit(-1);
        }
    }

    @FXML
    private void doByData() { // Bouton qui mène à la page de choix des courbes par type de données
                              // (menuCourbeData.fxml)
        try {
            FXMLLoader loader = new FXMLLoader(
                    MenuCourbeController.class.getResource("/application/view/showByData.fxml"));
            BorderPane root = loader.load();

            Scene scene = new Scene(root, root.getPrefWidth() + 20, root.getPrefHeight() + 10);
            scene.getStylesheets().add(Menu.class.getResource("application.css").toExternalForm());

            primaryStage.setScene(scene);
            primaryStage.setTitle("Fenêtre Courbes par Type de Données");

            ShowByDataController mfc = loader.getController();
            mfc.initContext(primaryStage);

            mfc.displayDialog();

        } catch (Exception e) {
            e.printStackTrace();
            System.exit(-1);
        }
    }

    @FXML
    private void doSolar() { // Bouton qui mène à la page de choix des courbes pour le solaire
        try {
            FXMLLoader loader = new FXMLLoader(
                    MenuCourbeController.class.getResource("/application/view/showSolar.fxml"));
            BorderPane root = loader.load();

            Scene scene = new Scene(root, root.getPrefWidth() + 20, root.getPrefHeight() + 10);
            scene.getStylesheets().add(Menu.class.getResource("application.css").toExternalForm());

            primaryStage.setScene(scene);
            primaryStage.setTitle("Fenêtre Panneaux Solaires");

            ShowSolarController mfc = loader.getController();
            mfc.initContext(primaryStage);

            mfc.setPreviousPage("menuCourbe.fxml");

            mfc.displayDialog();

        } catch (Exception e) {
            e.printStackTrace();
            System.exit(-1);
        }
    }

    @FXML
    private void doBack() { // Bouton qui mène à la page précédente (menu.fxml)
        try {
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
}

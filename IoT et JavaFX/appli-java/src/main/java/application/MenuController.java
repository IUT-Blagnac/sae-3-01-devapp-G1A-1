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
import tools.GlobalVariables;

public class MenuController implements Initializable {

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
	private Button btnTest;

	@FXML
	private Button btnConfig;

	@FXML
	private Button btnShow;

	@FXML
	private Button btnChart;

	@FXML
	private Button btnStart;

	@FXML
	private Button btnSolar;

	@FXML
	private Button btnAlert;

	@FXML
	private Button btnQuit;

	@Override
	public void initialize(URL location, ResourceBundle resources) {
	}

	@FXML
	private void doTest() {
		try {
			// Chargement de la nouvelle fenêtre (FXML)
			FXMLLoader loader = new FXMLLoader(
					MenuController.class.getResource("test.fxml"));
			BorderPane root = loader.load();

			// Création d'un nouveau Stage
			Stage testStage = new Stage();
			Scene scene = new Scene(root, root.getPrefWidth() - 300, root.getPrefHeight() - 150);
			scene.getStylesheets().add(Menu.class.getResource("application.css").toExternalForm());

			testStage.setScene(scene);
			testStage.setTitle("Fenêtre de Test");

			// Rendre la fenêtre modale (bloque les interactions avec la fenêtre parent)
			testStage.initModality(javafx.stage.Modality.APPLICATION_MODAL);
			testStage.initOwner(this.primaryStage); // Définit la fenêtre principale comme parent

			// Configuration du contrôleur
			testController testController = loader.getController();
			testController.initContext(testStage);

			testController.displayDialog();

			// Afficher la fenêtre
			testStage.showAndWait(); // Attend que cette fenêtre se ferme avant de rendre la main

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@FXML
	private void doCourbe() { // Bouton qui mène à la page de choix des courbes (menuCourbe.fxml)
		this.primaryStage.hide();

		try {
			FXMLLoader loader = new FXMLLoader(
					MenuController.class.getResource("menuCourbe.fxml"));
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
	private void doSolar() { // Bouton qui mène à la page de choix des courbes pour le solaire
		this.primaryStage.hide();

		try {
			FXMLLoader loader = new FXMLLoader(
					MenuCourbeController.class.getResource("showSolar.fxml"));
			BorderPane root = loader.load();

			Scene scene = new Scene(root, root.getPrefWidth() + 20, root.getPrefHeight() + 10);
			scene.getStylesheets().add(Menu.class.getResource("application.css").toExternalForm());

			primaryStage.setScene(scene);
			primaryStage.setTitle("Fenêtre Panneaux Solaires");

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
	private void doQuit() { // Gestion de la fermeture de la fenêtre
		if (AlertUtilities.confirmYesCancel(this.primaryStage, "Quitter Appli Principale",
				"Etes vous sur de vouloir quitter l'appli ?", null, AlertType.CONFIRMATION)) {
			GlobalVariables.mqttPython.stopPython();
			this.primaryStage.close();
			System.exit(0);
		}
	}
}

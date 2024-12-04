package application.controller;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import tools.GlobalVariables;
import tools.PythonStatusUpdater;

import application.AlertePopup;
import application.Menu;

/*
 * Contrôleur pour le menu principal
 * Permet de naviguer vers les différentes pages de l'application
 * Permet de quitter l'application
 */
public class MenuController implements Initializable {

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
		// Appelle une classe qui va initialiser un thread qui va update le label
		// pythonState en fonction de l'état du mqttPython.
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

	@FXML
	private Label lblPythonState;

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		// démarrage du python
		try {
			GlobalVariables.mqttPython.startPython();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@FXML
	private void doTest() {
		try {
			// Chargement de la nouvelle fenêtre (FXML)
			FXMLLoader loader = new FXMLLoader(
					MenuController.class.getResource("/application/view/test.fxml"));
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
			TestController testController = loader.getController();
			testController.initContext(testStage);

			testController.displayDialog(); // Affichage de la fenêtre

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@FXML
	private void doConfig() {
		try {
			FXMLLoader loader = new FXMLLoader(
					MenuController.class.getResource("/application/view/menuConfig.fxml"));
			BorderPane root = loader.load();

			Scene scene = new Scene(root, root.getPrefWidth() + 20, root.getPrefHeight() + 10);
			scene.getStylesheets().add(Menu.class.getResource("application.css").toExternalForm());

			primaryStage.setScene(scene);
			primaryStage.setTitle("Fenêtre de configuration");

			MenuConfigController mfc = loader.getController();
			mfc.initContext(primaryStage);

			mfc.displayDialog();

		} catch (Exception e) {
			e.printStackTrace();
			System.exit(-1);
		}
	}

	@FXML
	private void doRelancePython() {
		try {
			// Chargement de la nouvelle fenêtre (FXML)
			FXMLLoader loader = new FXMLLoader(
					MenuController.class.getResource("/application/view/relancePython.fxml"));
			BorderPane root = loader.load();

			// Création d'un nouveau Stage
			Stage relaunchStage = new Stage();
			Scene scene = new Scene(root, root.getPrefWidth() - 300, root.getPrefHeight() - 150);
			scene.getStylesheets().add(Menu.class.getResource("application.css").toExternalForm());

			relaunchStage.setScene(scene);
			relaunchStage.setTitle("Relance du python");

			// Rendre la fenêtre modale (bloque les interactions avec la fenêtre parent)
			relaunchStage.initModality(javafx.stage.Modality.APPLICATION_MODAL);
			relaunchStage.initOwner(this.primaryStage); // Définit la fenêtre principale comme parent

			// Configuration du contrôleur
			RelancePythonController relanceController = loader.getController();
			relanceController.initContext(relaunchStage);

			relanceController.displayDialog(); // Affichage de la fenêtre

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@FXML
	private void doVisuDonnees() {
		try {
			FXMLLoader loader = new FXMLLoader(
					MenuController.class.getResource("/application/view/visuDonnees.fxml"));
			BorderPane root = loader.load();

			Scene scene = new Scene(root, root.getPrefWidth() + 20, root.getPrefHeight() + 10);
			scene.getStylesheets().add(Menu.class.getResource("application.css").toExternalForm());

			primaryStage.setScene(scene);
			primaryStage.setTitle("Fenêtre dernières données");

			VisuDonneesController vdc = loader.getController();
			vdc.initContext(primaryStage);

			vdc.displayDialog();

		} catch (Exception e) {
			e.printStackTrace();
			System.exit(-1);
		}
	}

	@FXML
	private void doHistorique() {
		try {
			FXMLLoader loader = new FXMLLoader(
					MenuController.class.getResource("/application/view/alerteHistorique.fxml"));
			BorderPane root = loader.load();

			Scene scene = new Scene(root, root.getPrefWidth() + 20, root.getPrefHeight() + 10);
			scene.getStylesheets().add(Menu.class.getResource("application.css").toExternalForm());

			primaryStage.setScene(scene);
			primaryStage.setTitle("Fenêtre d'historique des alertes");

			AlerteHistoriqueController mfc = loader.getController();
			mfc.initContext(primaryStage);

			mfc.displayDialog();

		} catch (Exception e) {
			e.printStackTrace();
			System.exit(-1);
		}
	}

	@FXML
	private void doCourbe() { // Bouton qui mène à la page de choix des courbes (menuCourbe.fxml)
		try {
			FXMLLoader loader = new FXMLLoader(
					MenuController.class.getResource("/application/view/menuCourbe.fxml"));
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

			mfc.setPreviousPage("menu.fxml");

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

package application;

import application.controller.MenuController;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;

/**
 * Classe principale de l'application
 * Permet de lancer l'application
 */
public class Menu extends Application {

	// Lancement classique d'un application JavaFX
	@Override
	public void start(Stage _primaryStage) {

		Stage primaryStage = _primaryStage;

		try {
			FXMLLoader loader = new FXMLLoader(
					MenuController.class.getResource("/application/view/menu.fxml"));
			BorderPane root = loader.load();

			Scene scene = new Scene(root, root.getPrefWidth() + 20, root.getPrefHeight() + 10);
			scene.getStylesheets().add(Menu.class.getResource("application.css").toExternalForm());

			primaryStage.setScene(scene);
			primaryStage.setTitle("Fenêtre Principale");

			MenuController mfc = loader.getController();
			mfc.initContext(primaryStage);

			mfc.displayDialog();

		} catch (Exception e) {
			e.printStackTrace();
			System.exit(-1);
		}
	}

	public static void runApp() {
		Application.launch();
	}
}

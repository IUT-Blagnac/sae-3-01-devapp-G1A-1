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

public class MenuController implements Initializable {

	// Fenêtre physique
	private Stage primaryStage;

	// Timer
	// private TaskBackground tb;
	// private Timer timer;

	// Thread
	// private RunBackground rb;

	// Manipulation de la fenêtre

	public void initContext(Stage _containingStage) {
		this.primaryStage = _containingStage;
		this.configure();
		// this.validateComponentState();
	}

	public void displayDialog() {

		this.primaryStage.show();

		// Création des données initiales du Diagramme "camemberts" (PieChart)
		// PieChart.Data slice1 = new PieChart.Data("Desktop", 213);
		// PieChart.Data slice2 = new PieChart.Data("Phone", 67);
		// PieChart.Data slice3 = new PieChart.Data("Tablet", 36);

		// ObservableList<PieChart.Data> l = this.piec.getData();
		// l.add(slice1);
		// l.add(slice2);
		// l.add(slice3);

		// Mise à jour PieChart par Thread

		// Création du "code" à exécuter en thread (un Runnable)
		// this.rb = new RunBackground(this, l.size());

		// Création d'un thread pour exécuter notre code de rb (rb.run())
		// Thread t = new Thread(this.rb);

		// Démarrage du thread
		// t.start();

		// Mise à jour PieChart par Timer

		// Crétation de la tâche à réaliser périodiquement
		// this.tb = new TaskBackground(this, l.size());

		// Création du timer qui va lancer la tâche tb régulièrement
		// this.timer = new Timer();

		// Démarrage du timer avec le délai de première exécution et l'intervalle de
		// répétition
		// this.timer.scheduleAtFixedRate(
		// this.tb,
		// 1000L, // delay before first execution
		// 2000L); // time between executions
	}

	// Fonctions internes de gestion de fenêtre
	// private void validateComponentState() {
	// this.lblUn.setText("");
	// this.lblDeux.setText("");
	// this.lblTrois.setText("");
	// }

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
	private void doTest() { // Bouton qui mène à la page de test 
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
	private void doQuit() { // Gestion de la fermeture de la fenêtre
		if (AlertUtilities.confirmYesCancel(this.primaryStage, "Quitter Appli Principale",
				"Etes vous sur de vouloir quitter l'appli ?", null, AlertType.CONFIRMATION)) {

			this.primaryStage.close();
			System.exit(0);
		}
	}

	// Méthode de mise à jour de la fenêtre : appelée par le thread rb ou la tâche
	// du timer tb
	// public void miseAJourPieChart(int _valueToAdd, int _colOfPieChart) {
	// PieChart.Data pied;
	// ObservableList<PieChart.Data> l;

	// l = this.piec.getData();

	// // Mise à jour d'un des camemberts affichés
	// pied = l.get(_colOfPieChart);
	// pied.setPieValue(pied.getPieValue() + _valueToAdd);

	// // Mise à jour des labels
	// pied = l.get(0);
	// this.lblUn.setText(pied.getName() + " : " + pied.getPieValue());
	// pied = l.get(1);
	// this.lblDeux.setText(pied.getName() + " : " + pied.getPieValue());
	// pied = l.get(2);
	// this.lblTrois.setText(pied.getName() + " : " + pied.getPieValue());

	// pied = l.get(_colOfPieChart);
	// System.out.println("Mise à jour de : " + pied.getName() + " : " +
	// _valueToAdd);
	// }
}

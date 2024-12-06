package application.controller;

import application.*;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.ResourceBundle;

import com.fasterxml.jackson.databind.ObjectMapper;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import tools.DataReader;
import tools.GlobalVariables;
import tools.PythonStatusUpdater;

/*
 * Controller for the curve selection menu
 * Allows choosing between curves by room, data type, or for solar
 * Redirects to the corresponding pages
 * Allows returning to the main menu or quitting the application
 */
public class MenuConfigController implements Initializable {

    // Fenêtre physique
    private Stage primaryStage;

    @FXML
    private Button btnBack;

    @FXML
    private GridPane gridPane;

    @FXML
    private Label lblPythonState;

    /**
     * Method to initialize the context of the window
     * 
     * @param _containingStage the stage containing the window
     */
    public void initContext(Stage _containingStage) {
        this.primaryStage = _containingStage;
        this.configure();

        // Ajouter l'overlay à la scène existante
        BorderPane root = (BorderPane) primaryStage.getScene().getRoot();
        StackPane stackPane = new StackPane();
        stackPane.getChildren().add(root);
        primaryStage.getScene().setRoot(stackPane);

        // Allow the alerts to be displayed
        AlertePopup.getAlertPopupInstance(this.primaryStage);

        PythonStatusUpdater.getPSUInstance().setPSULabel(this.lblPythonState);
    }

    public void displayDialog() {
        this.primaryStage.show();
    }

    private void configure() {
        this.primaryStage.setOnCloseRequest(e -> this.closeWindow(e));
    }

    /**
     * Close the window
     * 
     * @param e the window event
     * @return null
     */
    private Object closeWindow(WindowEvent e) {
        this.doQuit();
        e.consume();
        return null;
    }

    @Override
    /**
     * Method to initialize the window
     * 
     * @param location  the location used to resolve relative paths for the root
     *                  object
     * @param resources the resources used to localize the root object
     */
    public void initialize(URL location, ResourceBundle resources) {
        // Dynamique : création des éléments UI
        createUI();
    }

    /**
     * Method to create the UI elements
     */
    private void createUI() {

        // Appel à readJsonFile pour récupérer les valeurs par défaut
        String filePath = GlobalVariables.pythonConfigFilePath;
        DataReader dataReader = new DataReader();
        HashMap<String, Object> jsonMap = dataReader.readJsonFile(filePath);

        // Récupérer les valeurs sous l'objet "max"
        HashMap<String, Object> maxValues = (HashMap<String, Object>) jsonMap.get("max");
        int temperatureMax = (int) maxValues.get("temperature_max");
        int humiditeMax = (int) maxValues.get("humidite_max");
        int tauxMax = (int) maxValues.get("taux_max");

        // Récupérer les valeurs sous l'objet "donnee"
        HashMap<String, Object> donneeValues = (HashMap<String, Object>) jsonMap.get("donnee");
        boolean temperatureChecked = (boolean) donneeValues.get("temperature");
        boolean humiditeChecked = (boolean) donneeValues.get("humidite");
        boolean tauxChecked = (boolean) donneeValues.get("taux");

        // Récupérer les valeurs sous l'objet "salle"
        HashMap<String, Object> salleValues = (HashMap<String, Object>) jsonMap.get("salle");
        String numSalle = (String) salleValues.get("num_salle");

        // Récupérer les valeurs sous l'objet "lecture"
        HashMap<String, Object> lectureValues = (HashMap<String, Object>) jsonMap.get("lecture");
        int frequenceLecture = (int) lectureValues.get("frequence");

        // Création des champs de texte et des labels
        Label labelTemperatureMax = new Label("Température max:");
        TextField tfTemperatureMax = new TextField();
        tfTemperatureMax.setPrefWidth(150);
        tfTemperatureMax.setText(String.valueOf(temperatureMax));

        Label labelHumiditeMax = new Label("Humidité max:");
        TextField tfHumiditeMax = new TextField();
        tfHumiditeMax.setPrefWidth(150);
        tfHumiditeMax.setText(String.valueOf(humiditeMax));

        Label labelTauxMax = new Label("Taux max (CO2):");
        TextField tfTauxMax = new TextField();
        tfTauxMax.setPrefWidth(150);
        tfTauxMax.setText(String.valueOf(tauxMax));

        Label labelFrequenceLecture = new Label("Fréquence de lecture (s):");
        TextField tfFrequenceLecture = new TextField();
        tfFrequenceLecture.setPrefWidth(150);
        tfFrequenceLecture.setText(String.valueOf(frequenceLecture));

        CheckBox cbToutSelectionner = new CheckBox("Tout sélectionner");

        // Création du label pour les salles
        Label labelSalles = new Label("Choisir les salles:");

        // Création d'un ListView pour contenir les CheckBox des salles
        ListView<HBox> listViewSalles = new ListView<>();
        listViewSalles.setPrefHeight(100); // Hauteur fixe du ListView (peut être ajustée)
        listViewSalles.setPrefWidth(150); // Largeur fixe du ListView (peut être ajustée)

        // Conversion de la chaîne en liste de salles
        List<String> salles = GlobalVariables.salles;
        List<String> sallesSelectionnees = Arrays.asList(numSalle.split(","));

        // Ajout des CheckBox pour chaque salle dans le ListView
        for (String salle : salles) {
            CheckBox checkBox = new CheckBox(salle);

            // Récupérer les salles déjà sélectionnées
            checkBox.setSelected(sallesSelectionnees.contains(salle));

            // Ajoutez un écouteur à chaque CheckBox
            checkBox.setOnAction(e -> {
                boolean allSelected = listViewSalles.getItems().stream()
                        .allMatch(hbox -> ((CheckBox) ((HBox) hbox).getChildren().get(0)).isSelected());
                cbToutSelectionner.setSelected(allSelected);
            });

            HBox hbox = new HBox(checkBox);
            hbox.setSpacing(10); // Espacement entre la CheckBox et le texte
            listViewSalles.getItems().add(hbox); // Ajouter le HBox contenant la CheckBox

        }

        // Écouteur pour "Tout sélectionner"
        cbToutSelectionner.setOnAction(e -> {
            boolean isSelected = cbToutSelectionner.isSelected();
            for (HBox hbox : listViewSalles.getItems()) {
                CheckBox checkBox = (CheckBox) hbox.getChildren().get(0);
                checkBox.setSelected(isSelected); // Sélectionner ou désélectionner toutes les CheckBox
            }
        });

        Label labelCapteurs = new Label("Choisir les capteurs:");

        // Création des cases à cocher
        CheckBox cbTemperature = new CheckBox("Température");
        cbTemperature.setSelected(temperatureChecked);

        CheckBox cbHumidite = new CheckBox("Humidité");
        cbHumidite.setSelected(humiditeChecked);

        CheckBox cbTaux = new CheckBox("Taux de CO2");
        cbTaux.setSelected(tauxChecked);

        // Création du bouton de sauvegarde
        Button btnSave = new Button("Sauvegarder");

        // Placement des éléments dans le GridPane
        gridPane.add(labelTemperatureMax, 0, 0);
        gridPane.add(tfTemperatureMax, 1, 0);
        gridPane.add(labelHumiditeMax, 0, 1);
        gridPane.add(tfHumiditeMax, 1, 1);
        gridPane.add(labelTauxMax, 0, 2);
        gridPane.add(tfTauxMax, 1, 2);
        gridPane.add(labelFrequenceLecture, 0, 3);
        gridPane.add(tfFrequenceLecture, 1, 3);
        gridPane.add(labelSalles, 0, 4);
        gridPane.add(listViewSalles, 1, 4); // Ajouter le ListView contenant les CheckBox pour les salles
        gridPane.add(cbToutSelectionner, 2, 4);
        gridPane.add(labelCapteurs, 0, 5);
        gridPane.add(cbTemperature, 1, 5);
        gridPane.add(cbHumidite, 2, 5);
        gridPane.add(cbTaux, 3, 5);
        gridPane.add(btnSave, 1, 6);

        // Configuration des actions sur le bouton de sauvegarde
        btnSave.setOnAction(e -> saveConfiguration(
                tfTemperatureMax, tfHumiditeMax, tfTauxMax, tfFrequenceLecture,
                cbTemperature, cbHumidite, cbTaux, listViewSalles));
    }

    /**
     * Method to save the configuration
     * 
     * @param tfTemperatureMax   the text field for the maximum temperature
     * @param tfHumiditeMax      the text field for the maximum humidity
     * @param tfTauxMax          the text field for the maximum CO2 level
     * @param tfFrequenceLecture the text field for the reading frequency
     * @param cbTemperature      the checkbox for the temperature
     * @param cbHumidite         the checkbox for the humidity
     * @param cbTaux             the checkbox for the CO2 level
     * @param listViewSalles     the list view for the rooms
     */
    private void saveConfiguration(TextField tfTemperatureMax, TextField tfHumiditeMax, TextField tfTauxMax,
            TextField tfFrequenceLecture, CheckBox cbTemperature, CheckBox cbHumidite, CheckBox cbTaux,
            ListView<HBox> listViewSalles) {

        // Récupérer les valeurs de l'UI
        String temperatureMax = tfTemperatureMax.getText();
        String humiditeMax = tfHumiditeMax.getText();
        String tauxMax = tfTauxMax.getText();
        String frequenceLecture = tfFrequenceLecture.getText();

        boolean isTemperatureChecked = cbTemperature.isSelected();
        boolean isHumiditeChecked = cbHumidite.isSelected();
        boolean isTauxChecked = cbTaux.isSelected();

        // Mettre à jour les salles sélectionnées
        StringBuilder selectedSalles = new StringBuilder();
        for (HBox hbox : listViewSalles.getItems()) {
            CheckBox checkBox = (CheckBox) hbox.getChildren().get(0); // Récupère la CheckBox
            if (checkBox.isSelected()) {
                if (selectedSalles.length() > 0) {
                    selectedSalles.append(",");
                }
                selectedSalles.append(checkBox.getText());
            }
        }

        // Préparer l'objet JSON à mettre à jour
        String filePath = GlobalVariables.pythonConfigFilePath;
        DataReader dataReader = new DataReader();
        HashMap<String, Object> jsonMap = dataReader.readJsonFile(filePath);

        // Récupérer l'objet "max" et le mettre à jour
        HashMap<String, Object> maxValues = (HashMap<String, Object>) jsonMap.get("max");
        maxValues.put("temperature_max", Integer.parseInt(temperatureMax));
        maxValues.put("humidite_max", Integer.parseInt(humiditeMax));
        maxValues.put("taux_max", Integer.parseInt(tauxMax));

        // Récupérer l'objet "donnee" et mettre à jour les valeurs des capteurs
        HashMap<String, Object> donneeValues = (HashMap<String, Object>) jsonMap.get("donnee");
        donneeValues.put("temperature", isTemperatureChecked);
        donneeValues.put("humidite", isHumiditeChecked);
        donneeValues.put("taux", isTauxChecked);

        // Récupérer l'objet "salle" et mettre à jour la liste des salles sélectionnées
        HashMap<String, Object> salleValues = (HashMap<String, Object>) jsonMap.get("salle");
        salleValues.put("num_salle", selectedSalles.toString());

        // Récupérer l'objet "lecture" et mettre à jour la fréquence de lecture
        HashMap<String, Object> lectureValues = (HashMap<String, Object>) jsonMap.get("lecture");
        lectureValues.put("frequence", Integer.parseInt(frequenceLecture));

        // Sauvegarder les modifications dans le fichier JSON
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.writeValue(new File(filePath), jsonMap);
            System.out.println("Configuration sauvegardée dans config.json.");
            doBack();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @FXML
    /**
     * Method to go back to the previous page (menu.fxml)
     */
    private void doBack() {
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
    /**
     * Method to quit the application
     */
    private void doQuit() {
        if (AlertUtilities.confirmYesCancel(this.primaryStage, "Quitter Appli Principale",
                "Etes vous sur de vouloir quitter l'appli ?", null, AlertType.CONFIRMATION)) {

            this.primaryStage.close();
            System.exit(0);
        }
    }
}

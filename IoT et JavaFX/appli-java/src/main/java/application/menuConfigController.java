package application;

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
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import tools.DataReader;
import tools.GlobalVariables;

/*
 * Contrôleur pour le menu de choix des courbes
 * Permet de choisir entre les courbes par pièce, par type de données ou pour le solaire
 * Redirige vers les pages correspondantes
 * Permet de revenir au menu principal ou de quitter l'application
 */
public class MenuConfigController implements Initializable {

    // Fenêtre physique
    private Stage primaryStage;

    @FXML
    private Button btnBack;

    @FXML
    private GridPane gridPane;

    // Méthode d'initialisation
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

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        // Dynamique : création des éléments UI
        createUI();
    }

    // Création des éléments de l'interface graphique
    private void createUI() {

        // Appel à readJsonFile pour récupérer les valeurs par défaut
        String filePath = "IoT et JavaFX/appli-python/config.json";
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

        Label labelCapteurs = new Label("Choisir les capteurs:");

        // Création des cases à cocher
        CheckBox cbTemperature = new CheckBox("Température");
        cbTemperature.setSelected(temperatureChecked);

        CheckBox cbHumidite = new CheckBox("Humidité");
        cbHumidite.setSelected(humiditeChecked);

        CheckBox cbTaux = new CheckBox("Taux de CO2");
        cbTaux.setSelected(tauxChecked);

        // Création du label pour les salles
        Label labelSalles = new Label("Choisir les salles:");

        // Création d'un ListView pour contenir les CheckBox des salles
        ListView<HBox> listViewSalles = new ListView<>();
        listViewSalles.setPrefHeight(100); // Hauteur fixe du ListView (peut être ajustée)
        listViewSalles.setPrefWidth(250); // Largeur fixe du ListView (peut être ajustée)

        // Conversion de la chaîne en liste de salles
        List<String> salles = GlobalVariables.salles;
        List<String> sallesSelectionnees = Arrays.asList(numSalle.split(","));

        // Ajout des CheckBox pour chaque salle dans le ListView
        for (String salle : salles) {
            CheckBox checkBox = new CheckBox(salle);

            // Récupérer les salles déjà sélectionnées
            checkBox.setSelected(sallesSelectionnees.contains(salle));

            HBox hbox = new HBox(checkBox);
            hbox.setSpacing(10); // Espacement entre la CheckBox et le texte
            listViewSalles.getItems().add(hbox); // Ajouter le HBox contenant la CheckBox
        }

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
        gridPane.add(labelCapteurs, 0, 4);
        gridPane.add(cbTemperature, 0, 5);
        gridPane.add(cbHumidite, 1, 5);
        gridPane.add(cbTaux, 2, 5);
        gridPane.add(labelSalles, 0, 6);
        gridPane.add(listViewSalles, 1, 6); // Ajouter le ListView contenant les CheckBox pour les salles
        gridPane.add(btnSave, 1, 7);

        // Configuration des actions sur le bouton de sauvegarde
        btnSave.setOnAction(e -> saveConfiguration(
                tfTemperatureMax, tfHumiditeMax, tfTauxMax, tfFrequenceLecture,
                cbTemperature, cbHumidite, cbTaux, listViewSalles));
    }

    // Méthode de sauvegarde des configurations
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
        String filePath = "IoT et JavaFX/appli-python/config.json";
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
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void doBack() { // Bouton qui mène à la page précédente (menu.fxml)
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

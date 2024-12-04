package application.controller;

import javafx.application.Platform;
import javafx.beans.property.SimpleStringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;
import tools.DataReader;
import tools.GlobalVariables;

import java.net.URL;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.ResourceBundle;
import java.util.Timer;
import java.util.TimerTask;
import java.util.stream.Collectors;

import application.Menu;

/**
 * Contrôleur pour l'historique des alertes
 * Permet de filtrer les alertes par salle et par type
 * Permet de revenir au menu principal ou de quitter l'application
 * Permet de réinitialiser les filtres
 * Affiche les alertes dans un tableau
 * Les alertes sont chargées depuis un fichier
 * Les alertes sont filtrées en fonction des critères de filtrage
 */
public class AlerteHistoriqueController implements Initializable {

    private Stage primaryStage;

    // private Timer timer;

    private DatePicker dateFilter; // Ajouter un filtre pour la date


    // Définir tous les composants dynamiquement
    private BorderPane root;
    private HBox topBar;
    private VBox leftBar;
    private BorderPane contentBorderPane;
    private TextField salleFilter;
    private ComboBox<String> typeFilter;
    private Button btnBack;
    private Button btnApplyFilter;
    private Button btnResetFilter; // Nouveau bouton pour réinitialiser les filtres
    private TableView<List<String>> alertesTable;
    private ObservableList<List<String>> alertesList;

    public void initContext(Stage _containingStage) {
        this.primaryStage = _containingStage;
        this.configure();
        Scene scene = new Scene(root, 912, 561);
        primaryStage.setScene(scene);
        primaryStage.setTitle("Application BuildMyPC");
    }

    public void displayDialog() {
        this.primaryStage.show();
    }

    private void configure() {
        this.primaryStage.setOnCloseRequest(e -> this.closeWindow(e));
    }

    private Object closeWindow(WindowEvent e) {
        this.doQuit();
        e.consume();
        return null;
    }

    @FXML
    private void doBack() {
        // Action pour revenir à la fenêtre précédente (menu.fxml)
        try {
            // this.timer.cancel();
            FXMLLoader loader = new FXMLLoader(getClass().getResource("/application/view/menu.fxml"));
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
    private void doQuit() {
        // Action de fermeture de l'application
        GlobalVariables.exitApp(this.primaryStage);
    }

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        root = new BorderPane();

        // Top bar
        topBar = new HBox();
        topBar.setSpacing(10);
        Label labelTitle = new Label("Application BuildMyPC");
        labelTitle.setStyle("-fx-font-size: 32px; -fx-font-weight: bold;");
        topBar.getChildren().add(labelTitle);

        // Left bar for buttons
        leftBar = new VBox();
        btnBack = new Button("Retour");
        btnBack.setOnAction(e -> doBack());
        leftBar.getChildren().add(btnBack);

        // Content (table and filters)
        contentBorderPane = new BorderPane();
        HBox filterBox = new HBox();
        filterBox.setSpacing(10);
        salleFilter = new TextField();
        salleFilter.setPromptText("Filtrer par salle");
        typeFilter = new ComboBox<>(FXCollections.observableArrayList("TEMPERATURE", "HUMIDITE", "CO2"));
        typeFilter.setPromptText("Filtrer par type");
        dateFilter = new DatePicker();
        dateFilter.setPromptText("Filtrer par date"); 

        btnApplyFilter = new Button("Appliquer Filtre");
        btnApplyFilter.setOnAction(e -> appliquerFiltre());

        btnResetFilter = new Button("Réinitialiser Filtre"); // Nouveau bouton
        btnResetFilter.setOnAction(e -> resetFilters()); // Action pour réinitialiser les filtres

        filterBox.getChildren().addAll(salleFilter, typeFilter, dateFilter, btnApplyFilter, btnResetFilter); // Ajouter le bouton de
                                                                                                 // réinitialisation

        // TableView to show the alerts
        alertesTable = new TableView<>();
        TableColumn<List<String>, String> salleColumn = new TableColumn<>("Salle");
        TableColumn<List<String>, String> typeColumn = new TableColumn<>("Type");
        TableColumn<List<String>, String> timestampColumn = new TableColumn<>("Timestamp");

        salleColumn.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().get(0)));
        typeColumn.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().get(1)));
        timestampColumn.setCellValueFactory(cellData -> {
            String timestamp = cellData.getValue().get(2); // Récupérer le timestamp brut
            // Convertir en LocalDateTime puis formater en une chaîne lisible
            LocalDateTime dateTime = LocalDateTime.parse(timestamp);
            String formattedTimestamp = dateTime.format(DateTimeFormatter.ofPattern("dd MMM yyyy HH:mm:ss")); // Exemple
                                                                                                              // de
                                                                                                              // format
            return new SimpleStringProperty(formattedTimestamp); // Retourner la chaîne formatée
        });

        alertesTable.getColumns().add(salleColumn);
        alertesTable.getColumns().add(typeColumn);
        alertesTable.getColumns().add(timestampColumn);

        // Add the filter and table to the content pane
        contentBorderPane.setTop(filterBox);
        contentBorderPane.setCenter(alertesTable);

        // Set the layout to the main root
        root.setTop(topBar);
        root.setLeft(leftBar);
        root.setCenter(contentBorderPane);

        // Initializing alertesList with manually generated data
        // alertesList = FXCollections.<List<String>>observableArrayList(
        // List.of("Salle 101", "TEMPERATURE", "2024-11-28 10:00:00"),
        // List.of("Salle 102", "HUMIDITE", "2024-11-28 10:05:00"),
        // List.of("Salle 103", "CO2", "2024-11-28 10:10:00"),
        // List.of("Salle 101", "TEMPERATURE", "2024-11-28 10:15:00"),
        // List.of("Salle 102", "HUMIDITE", "2024-11-28 10:20:00"));

        // Charger les données depuis un fichier
        alertesList = FXCollections
                .observableArrayList(loadAlertesFromFile("IoT et JavaFX/appli-python/alerts/LOG_ALERTE.jsonl"));

        // Trier les alertes par timestamp
        alertesList = sortAlertesByTimestamp(alertesList);

        alertesTable.setItems(alertesList);

        // timer = new Timer(true);
        // timer.scheduleAtFixedRate(new TimerTask() {
        // @Override
        // public void run() {
        // Platform.runLater(() -> {
        // alertesList = FXCollections
        // .observableArrayList(
        // loadAlertesFromFile("IoT et JavaFX/appli-python/alerts/LOG_ALERTE.jsonl"));
        // alertesList = sortAlertesByTimestamp(alertesList);
        // alertesTable.setItems(alertesList);
        // });
        // }
        // }, 0, 10000);
    }

    private List<List<String>> loadAlertesFromFile(String filename) {
        // Charger les alertes depuis un fichier
        DataReader dataReader = new DataReader();
        List<HashMap<String, Object>> records = dataReader.readJsonLFile(filename);
        alertesList = FXCollections.observableArrayList();
        for (HashMap<String, Object> record : records) {
            String salle = (String) record.get("salle");
            String type = (String) record.get("type");
            String timestamp = (String) record.get("timestamp");
            alertesList.add(List.of(salle, type, timestamp));
        }
        return alertesList;
    }

    @FXML
    private void appliquerFiltre() {
        String salle = salleFilter.getText();
        String type = typeFilter.getValue();
        LocalDate date = dateFilter.getValue(); // Récupérer la date sélectionnée

        List<List<String>> filtered = alertesList.stream()
                .filter(alerte -> (salle.isEmpty() || alerte.get(0).equalsIgnoreCase(salle)) &&
                        (type == null || alerte.get(1).equalsIgnoreCase(type)) &&
                        (date == null || LocalDate.parse(alerte.get(2).substring(0, 10)).equals(date))) // Filtrage par
                                                                                                        // date
                .collect(Collectors.toList());

        alertesTable.setItems(FXCollections.observableArrayList(filtered));
    }

    @FXML
    private void resetFilters() {
        // Réinitialise les filtres
        salleFilter.clear(); // Effacer le champ de texte de la salle
        typeFilter.getSelectionModel().clearSelection(); // Réinitialiser la sélection du type
        dateFilter.setValue(null); // Réinitialiser la date

        // Réinitialiser la table pour afficher toutes les alertes
        alertesTable.setItems(alertesList);
    }

    private ObservableList<List<String>> sortAlertesByTimestamp(ObservableList<List<String>> alertes) {
        return FXCollections.observableArrayList(
                alertes.stream()
                        .sorted((a1, a2) -> {
                            // Comparer les timestamps en utilisant LocalDateTime pour garantir le tri
                            // correct
                            LocalDateTime t1 = LocalDateTime.parse(a1.get(2)); // Parse directement le timestamp
                            LocalDateTime t2 = LocalDateTime.parse(a2.get(2));
                            return t2.compareTo(t1); // Tri décroissant
                        })
                        .collect(Collectors.toList()));
    }
}

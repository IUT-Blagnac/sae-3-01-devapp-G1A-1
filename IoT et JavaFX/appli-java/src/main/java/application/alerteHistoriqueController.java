package application;

import javafx.beans.property.SimpleStringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Scene;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;

import java.net.URL;
import java.util.List;
import java.util.ResourceBundle;
import java.util.stream.Collectors;

/**
 * Contrôleur pour l'historique des alertes
 * Permet de filtrer les alertes par salle et par type
 * Permet de revenir au menu principal ou de quitter l'application
 * Permet de réinitialiser les filtres
 * Affiche les alertes dans un tableau
 * Les alertes sont chargées depuis un fichier
 * Les alertes sont filtrées en fonction des critères de filtrage
 */
public class alerteHistoriqueController implements Initializable {

    private Stage primaryStage;

    // Définir tous les composants dynamiquement
    private BorderPane root;
    private HBox topBar;
    private VBox leftBar;
    private BorderPane contentBorderPane;
    private TextField salleFilter;
    private ComboBox<String> typeFilter;
    private Button btnBack;
    private Button btnApplyFilter;
    private Button btnResetFilter;  // Nouveau bouton pour réinitialiser les filtres
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
            FXMLLoader loader = new FXMLLoader(getClass().getResource("menu.fxml"));
            BorderPane root = loader.load();
            primaryStage.setScene(new Scene(root));
            primaryStage.setTitle("Fenêtre Menu Principal");

            menuController mfc = loader.getController();
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
        if (AlertUtilities.confirmYesCancel(this.primaryStage, "Quitter Appli Principale",
                "Etes vous sur de vouloir quitter l'appli ?", null, AlertType.CONFIRMATION)) {
            this.primaryStage.close();
            System.exit(0);
        }
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

        btnApplyFilter = new Button("Appliquer Filtre");
        btnApplyFilter.setOnAction(e -> appliquerFiltre());

        btnResetFilter = new Button("Réinitialiser Filtre");  // Nouveau bouton
        btnResetFilter.setOnAction(e -> resetFilters());  // Action pour réinitialiser les filtres

        filterBox.getChildren().addAll(salleFilter, typeFilter, btnApplyFilter, btnResetFilter);  // Ajouter le bouton de réinitialisation

        // TableView to show the alerts
        alertesTable = new TableView<>();
        TableColumn<List<String>, String> salleColumn = new TableColumn<>("Salle");
        TableColumn<List<String>, String> typeColumn = new TableColumn<>("Type");
        TableColumn<List<String>, String> timestampColumn = new TableColumn<>("Timestamp");

        salleColumn.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().get(0)));
        typeColumn.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().get(1)));
        timestampColumn.setCellValueFactory(cellData -> new SimpleStringProperty(cellData.getValue().get(2)));

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
        alertesList = FXCollections.<List<String>>observableArrayList(
            List.of("Salle 101", "TEMPERATURE", "2024-11-28 10:00:00"),
            List.of("Salle 102", "HUMIDITE", "2024-11-28 10:05:00"),
            List.of("Salle 103", "CO2", "2024-11-28 10:10:00"),
            List.of("Salle 101", "TEMPERATURE", "2024-11-28 10:15:00"),
            List.of("Salle 102", "HUMIDITE", "2024-11-28 10:20:00")
        );

        alertesTable.setItems(alertesList);
    }

    private List<List<String>> loadAlertesFromFile(String filename) {
        // Commenté pour l'instant, on utilise des données statiques
        return FXCollections.observableArrayList();
    }

    @FXML
    private void appliquerFiltre() {
        String salle = salleFilter.getText();
        String type = typeFilter.getValue();

        List<List<String>> filtered = alertesList.stream()
                .filter(alerte -> (salle.isEmpty() || alerte.get(0).equalsIgnoreCase(salle)) &&
                        (type == null || alerte.get(1).equalsIgnoreCase(type)))
                .collect(Collectors.toList());

        alertesTable.setItems(FXCollections.observableArrayList(filtered));
    }

    @FXML
    private void resetFilters() {
        // Réinitialise les filtres
        salleFilter.clear(); // Effacer le champ de texte de la salle
        typeFilter.getSelectionModel().clearSelection(); // Réinitialiser la sélection du type

        // Réinitialiser la table pour afficher toutes les alertes
        alertesTable.setItems(alertesList);
    }
}

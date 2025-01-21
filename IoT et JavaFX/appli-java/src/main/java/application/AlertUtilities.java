package application;

import java.util.Optional;

import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.ButtonType;
import javafx.stage.Stage;

/**
 * Utility class for alerts
 * Allows managing confirmation and information alerts
 */
public class AlertUtilities {

	/**
	 * Method that show a confirmation alert
	 * 
	 * @param _fen
	 * @param _title
	 * @param _message
	 * @param _content
	 * @param _al
	 * @return
	 */
	public static boolean confirmYesCancel(Stage _fen, String _title, String _message, String _content, AlertType _al) {

		if (_al == null) {
			_al = AlertType.INFORMATION;
		}
		Alert alert = new Alert(_al);
		alert.initOwner(_fen);
		alert.setTitle(_title);
		if (_message == null || !_message.equals(""))
			alert.setHeaderText(_message);
		alert.setContentText(_content);

		Optional<ButtonType> option = alert.showAndWait();
		if (option.isPresent() && option.get() == ButtonType.OK) {
			return true;
		}
		return false;
	}

	/**
	 * Method that show the alert
	 * 
	 * @param _fen
	 * @param _title
	 * @param _message
	 * @param _content
	 * @param _al
	 */
	public static void showAlert(Stage _fen, String _title, String _message, String _content, AlertType _al) {

		if (_al == null) {
			_al = AlertType.INFORMATION;
		}
		Alert alert = new Alert(_al);
		alert.initOwner(_fen);
		alert.setTitle(_title);
		if (_message == null || !_message.equals(""))
			alert.setHeaderText(_message);
		alert.setContentText(_content);

		alert.showAndWait();
	}
}

package tools;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class DataReader {

    public DataReader() {
    }

    /**
     * Reads a JSON Lines (.jsonl) file and deserializes it into a list of HashMaps.
     * 
     * This method processes the entire file, converting each line into a HashMap
     * and collecting all records into a List. Each record in the List corresponds
     * to one line of the JSON Lines file.
     * 
     * @param filePath the path to the JSON Lines file to be read.
     * @return List of HashMap containing all records from the file.
     *         Each record is represented as a HashMap where keys are the JSON field
     *         names and values are the corresponding JSON field values.
     * @throws IOException if an I/O error occurs reading the file.
     * 
     */
    public List<HashMap<String, Object>> readJsonLFile(String filePath) {
        ObjectMapper objectMapper = new ObjectMapper();
        List<HashMap<String, Object>> records = null;
        try {
            // -------------- Read all the jsonl --------------
            List<String> lines = Files.readAllLines(Paths.get(filePath));

            // Map each line to a HashMap and collect them into a List
            records = objectMapper.readValue(
                    "[" + String.join(",", lines) + "]",
                    new TypeReference<List<HashMap<String, Object>>>() {
                    });

        } catch (IOException e) {
            e.printStackTrace();
        }
        return records;
    }

    /**
     * Reads a single JSON file and deserializes it into a HashMap.
     * 
     * This method maps the JSON keys to a HashMap<String, Object>,
     * where keys are the JSON field names and values are the corresponding
     * field values.
     * 
     * To access nested values inside the HashMap (another HashMap inside of a
     * value), you must cast these values as an HashMap<String, Object> before using
     * it.
     * 
     * @param filePath the path to the JSON file to be read.
     * @return HashMap of String and Object containing the JSON data.
     *         Keys are JSON field names, and values are the corresponding JSON
     *         field values.
     * @throws IOException if an I/O error occurs reading the file.
     * 
     */
    public HashMap<String, Object> readJsonFile(String filePath) {
        HashMap<String, Object> jsonMap = null;
        ObjectMapper objectMapper = new ObjectMapper();

        try {
            jsonMap = objectMapper.readValue(
                    new File(filePath), new TypeReference<HashMap<String, Object>>() {
                    });
        } catch (IOException e) {
            e.printStackTrace();
        }
        return jsonMap;
    }

    public static void main(String[] args) {
        // Specify the path to your JSON file
        String filePath = "B103.jsonl";
        DataReader dataReader = new DataReader();
        List<HashMap<String, Object>> records = dataReader.readJsonLFile(filePath);
        HashMap<String, Object> jsonMap = dataReader.readJsonFile("config.json");

        for (HashMap<String, Object> record : records) {
            System.out.println("Record: " + record);

            // Example: Access specific fields
            double temperature = (double) record.get("temperature");
            double humidity = (double) record.get("humidite");
            int co2 = (int) record.get("co2");
            String timestamp = (String) record.get("timestamp");

            System.out.printf("Temperature: %.1f, Humidity: %.1f, CO2: %d, Timestamp: %s%n",
                    temperature, humidity, co2, timestamp);
        }
        for (Map.Entry<String, Object> entry : jsonMap.entrySet()) {
            System.out.println("Key: " + entry.getKey() + " | Value: " + entry.getValue());
        }
    }
}

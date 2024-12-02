package tools;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import org.json.JSONObject;

public class SolarDataReader {

    private static final String FILE_PATH = "IOT et JavaFX/appli-python/datas/DONNEES_SOLAIRES.jsonl";

    public static Map<String, Double> loadSummaryData() {
        Map<String, Double> summaryData = new HashMap<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            String lastLine = null;

            // Trouver la dernière ligne
            while ((line = reader.readLine()) != null) {
                lastLine = line;
            }

            if (lastLine != null) {
                JSONObject json = new JSONObject(lastLine);
                summaryData.put("lastYearData", json.getDouble("lastYearData"));
                summaryData.put("lastMonthData", json.getDouble("lastMonthData"));
                summaryData.put("lastDayData", json.getDouble("lastDayData"));
                summaryData.put("currentPower", json.getDouble("currentPower"));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return summaryData;
    }

    public static List<Map.Entry<LocalTime, Double>> loadGraphData() {
        List<Map.Entry<LocalTime, Double>> graphData = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;

            while ((line = reader.readLine()) != null) {
                JSONObject json = new JSONObject(line);
                String timestamp = json.getString("timestamp");
                LocalTime time = LocalTime.parse(timestamp.split("T")[1].split("\\.")[0]);
                double currentPower = json.getDouble("currentPower");

                graphData.add(Map.entry(time, currentPower));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return graphData;
    }
}

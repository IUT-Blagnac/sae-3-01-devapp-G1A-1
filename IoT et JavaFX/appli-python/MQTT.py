import paho.mqtt.client as mqtt
import json
import os
from datetime import datetime
import time
import threading

# Lecture de la configuration depuis le fichier config.json avec os.open et os.read
fd_config = os.open('IoT et JavaFX/appli-python/config.json', os.O_RDONLY)
contenu_config = os.read(fd_config, os.path.getsize('IoT et JavaFX/appli-python/config.json')).decode('utf-8')
os.close(fd_config)
configuration = json.loads(contenu_config)

# Construction des topics MQTT
num_salles = configuration['salle']['num_salle'].split(',')
chemin_salle_mqtt = "AM107/by-room/+/data"
chemin_solaire_mqtt = "solaredge/blagnac/overview"

# Initialisation des listes et variables nécessaires
donnees_salle = {}  # Pour les salles
donnees_solaire = {"currentPower": [], 
                  "lastYearData": [],
                   "lastMonthData": [],
                   "lastDayData": []}  # Pour les panneaux solaires (liste des 10 dernières valeurs)
# consommation_max = configuration['max']['consommation_max']  # Nouvelle limite pour les panneaux solaires

valeurs_max = [
    configuration['max']['temperature_max'],
    configuration['max']['humidite_max'],
    configuration['max']['taux_max']
]
choix_donnees = [
    configuration['donnee']['temperature'],
    configuration['donnee']['humidite'],
    configuration['donnee']['taux']
]
frequence_lecture = configuration['lecture']['frequence']

# Connexion au serveur MQTT
client_mqtt = mqtt.Client()
client_mqtt.connect("mqtt.iut-blagnac.fr", 1883)
client_mqtt.subscribe(chemin_salle_mqtt)
client_mqtt.subscribe(chemin_solaire_mqtt)  # Souscription au topic des panneaux solaires

# Fonction pour écrire dans un fichier JSONL
def ecrire_jsonl(nom_fichier, data):
    data_line = json.dumps(data) + "\n"
    fd = os.open(nom_fichier, os.O_WRONLY | os.O_APPEND | os.O_CREAT, 0o644)
    os.write(fd, data_line.encode('utf-8'))
    os.close(fd)

# Fonction pour mettre à jour les données de température, d'humidité et de taux de CO2
def mise_a_jour_donnees(temp, hum, taux, salle):
    global donnees_salle
    # Mise à jour des données pour la salle courante
    if str(salle) not in donnees_salle:
        donnees_salle[str(salle)] = [[], [], [], 0, 0, 0]
    for i in range(3):
        donnees_salle[str(salle)][i].append(round([temp, hum, taux][i], 2))
    # Suppression des anciennes valeurs si la liste atteint la taille maximale de 10
    for i in range(3):
        if len(donnees_salle[str(salle)][i]) > 10:
            del donnees_salle[str(salle)][i][0]
    # Calcul des nouvelles moyennes
    for i in range(3, 6):
        donnees_salle[str(salle)][i] = sum(donnees_salle[str(salle)][i - 3]) / len(donnees_salle[str(salle)][i - 3])

# Fonction pour mettre à jour les alertes pour les salles
def mise_a_jour_alertes(salle):
    global donnees_salle
    alerte_message = []
    for i in range(3):
        if donnees_salle[str(salle)][i + 3] > valeurs_max[i] and choix_donnees[i]:
            alerte_message.append({
                "salle": salle,
                "type": ["TEMPERATURE", "HUMIDITE", "CO2"][i],
                "timestamp": datetime.now().isoformat()
            })
    if alerte_message:
        for alerte in alerte_message:
            ecrire_jsonl("IoT et JavaFX/appli-python/alerts/LOG_ALERTE.jsonl", alerte)

# Fonction pour gérer les données des panneaux solaires
def mise_a_jour_donnees_solaires(currentPower, last_year_data, last_month_data, last_day_data):
    global donnees_solaire
    # Ajouter la nouvelle valeur
    donnees_solaire["currentPower"].append(currentPower)
    donnees_solaire["lastYearData"].append(last_year_data)
    donnees_solaire["lastMonthData"].append(last_month_data)
    donnees_solaire["lastDayData"].append(last_day_data)
    # Limiter à 10 valeurs maximum
    if len(donnees_solaire["currentPower"]) > 10:
        donnees_solaire["currentPower"].pop(0)

# Fonction pour gérer les alertes des panneaux solaires
# def mise_a_jour_alertes_solaires():
#     moyenne = sum(donnees_solaire["currentPower"]) / len(donnees_solaire["currentPower"])
#     if moyenne > consommation_max:
#         alerte_message = {
#             "type": "SOLAIRE",
#             "alert": "CONSO_MAX",
#             "timestamp": datetime.now().isoformat(),
#             "moyenne": moyenne
#         }
#         ecrire_jsonl("IoT et JavaFX/LOG_ALERTE_SOLAIRE.jsonl", alerte_message)
#         print("ALERTE SOLAIRE : CONSOMMATION TROP ÉLEVÉE")

# Fonction appelée lorsqu'un message est reçu
def reception_message(mqttc, obj, msg):
    global donnees_solaire
    msg_json = json.loads(msg.payload)
    try:
        # Gestion des messages pour les salles
        if msg.topic.startswith("AM107/by-room"):
            salle = msg_json[1]["room"]
            if salle in num_salles:
                temp, hum, taux = [round(msg_json[0][key], 2) for key in ["temperature", "humidity", "co2"]]
                mise_a_jour_donnees(temp, hum, taux, salle)
                mise_a_jour_alertes(salle)
                print(f"SALLE {salle} PRISE EN CHARGE")
                # Sauvegarde des données dans un fichier JSONL spécifique à la salle
                fichier_salle = f"IoT et JavaFX/appli-python/datas/captor/{salle}.jsonl"
                data_message = {
                    "temperature": temp,
                    "humidite": hum,
                    "co2": taux,
                    "timestamp": datetime.now().isoformat()
                }
                ecrire_jsonl(fichier_salle, data_message)
            else:
                print(f"SALLE {salle} NON PRISE EN CHARGE")
        # Gestion des messages pour les panneaux solaires
        elif msg.topic == "solaredge/blagnac/overview":
            last_year_data = msg_json.get("lastYearData", {}).get("energy", None)
            last_month_data = msg_json.get("lastMonthData", {}).get("energy", None)
            last_day_data = msg_json.get("lastDayData", {}).get("energy", None)
            currentPower = msg_json.get("currentPower", {}).get("power", None)
            if currentPower is not None:
                mise_a_jour_donnees_solaires(currentPower, last_year_data, last_month_data, last_day_data)
                # mise_a_jour_alertes_solaires()
                print(f"DONNEES SOLAIRES RECUES : {currentPower, last_year_data, last_month_data, last_day_data}")
                # Sauvegarde des données solaires dans un fichier JSONL
                solaire_message = {
                    "lastYearData": last_year_data,
                    "lastMonthData": last_month_data,
                    "lastDayData": last_day_data,
                    "currentPower": currentPower,
                    "timestamp": datetime.now().isoformat()
                }
                ecrire_jsonl("IoT et JavaFX/appli-python/datas/solar/DONNEES_SOLAIRES.jsonl", solaire_message)
    except KeyError as e:
        print("MESSAGE INVALIDE")

# Fonction appelée périodiquement pour gérer les messages MQTT
def handler():
    print("-------------------------------")
    print("Alarme déclenchée!")
    client_mqtt.on_message = reception_message
    print('LECTURE EN COURS, AFFICHAGE DES ALERTES')
    client_mqtt.loop_start()
    time.sleep(2)
    client_mqtt.loop_stop()

print('OK java', flush=True)

while True:
    # Exécutez la fonction handler dans un thread toutes les frequence_lecture secondes
    timer_thread = threading.Timer(frequence_lecture, handler)
    timer_thread.start()
    timer_thread.join()  # Attendre la fin du thread avant de passer à la prochaine itération

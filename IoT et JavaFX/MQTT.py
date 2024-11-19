import paho.mqtt.client as mqtt
import json
import datetime
import os

# Lire le fichier de configuration
def read_config_file():
    with open('config.json', 'r') as file:
        config = json.load(file)

    # Extraire les paramètres MQTT et les seuils d'alerte
    param = config['MQTT']
    nbValDansMoy = int(param['nombreValeursDansMoyenne'])
    mqttServer = param['host']
    mqttPort = param['port']
    mqttKeepAlive = param['keepalive']
    topics = param['topics']
    seuils = config['seuils']
    return nbValDansMoy, mqttServer, mqttPort, mqttKeepAlive, topics, seuils


# Calculer la moyenne des valeurs pour une liste de dictionnaires
def get_moyenne(liste):
    moy = liste[0].copy()
    for key in moy:
        moy[key] = 0
    for dico in liste:
        for key in dico:
            moy[key] += dico[key]
    for key in moy:
        moy[key] /= len(liste)
    return moy

# Écrire les données dans un fichier de log
def write_in_file(data,topic):
    data['date'] = datetime.datetime.now().isoformat()
    datas = json.dumps(data, indent=4)
    os.makedirs("datas", exist_ok=True)
    # creates "datas" folder if it doesn't already exist
    with open("datas/"+topic+".jsonl", "a", encoding="utf-8") as outfile:
        # I use a jsonl format to facilitate insertion of new datas as each line is a new set of datas
        # 'a' open the file at the end for appening and creates it if it doesn't exist
        json.dump(data,outfile)
        outfile.write("\n")

# Détecter et enregistrer les alertes
def check_alerts(data, topic, seuils):
    alerts = {}
    for key, value in data.items():
        if key in seuils and value > seuils[key]:
            alerts[key] = value
    if alerts:
        alerts['date'] = datetime.datetime.now().isoformat()
        os.makedirs("alerts", exist_ok=True)
        with open(f"alerts/{topic}_alerts.jsonl", "a", encoding="utf-8") as alert_file:
            json.dump(alerts, alert_file)
            alert_file.write("\n")
        print(f"Alert triggered for {topic}: {alerts}")

# callback appele lors de la reception d'un message
def get_data(mqttc, obj, msg):
    print("______________")
    topic = msg.topic.split("/")[2]
    topic_structure = msg.topic.split("/")[0]
        
    # Traiter les données en fonction de la structure du topic
    if topic_structure == "AM107":
        data = json.loads(msg.payload)[0]  # Récupérer la case [0] dans le tableau
        
        print(f"Received data on topic {msg.topic}: {data}")
        lastValues[topic] = lastValues.get(msg.topic, [])
        lastValues[topic].append(data)
                
        if len(lastValues[topic]) > nbValDansMoy:
            lastValues[topic].pop(0)
            print("//////////\n"+str(get_moyenne(lastValues[topic])))

        write_in_file(data,topic)
        check_alerts(data, topic, seuils)
            
    elif topic_structure == "solaredge":
        data = json.loads(msg.payload)  # Liste directe
        
        print(f"Received data on topic {msg.topic}: {data}")
        write_in_file(data,topic_structure)
        check_alerts(data, topic_structure, seuils)
    else:
        print(f"Structure inconnue pour le topic {msg.topic}")
        return
    
# Initialisation
lastValues = {}
nbValDansMoy, mqttServer, mqttPort, mqttKeepAlive, topics, seuils = read_config_file()

mqttc = mqtt.Client()
mqttc.connect(mqttServer, port=mqttPort, keepalive=mqttKeepAlive)

# S'abonner dynamiquement aux topics définis dans la configuration
for topic in topics:
    mqttc.subscribe(topic)
    
# mqttc.subscribe("AM107/by-deviceName/"+adrBroker+"/data", 0)

mqttc.on_message = get_data

print("Starting MQTT data handler...")
mqttc.loop_forever()
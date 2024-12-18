import paho.mqtt.client as mqtt
import time

# Callback for handling the connection
def on_connect(client, userdata, flags, rc):
    if rc == 0:
        client.connection_status = "OK"
    else:
        client.connection_status = "NOK"

# Test the connection to the MQTT broker
def test_connexion():
    # Create an MQTT client instance
    client = mqtt.Client()

    # Set a default value for connection status
    client.connection_status = "NOK"

    # Set the on_connect callback
    client.on_connect = on_connect

    try:
        # Try to connect to the broker
        client.connect("mqtt.iut-blagnac.fr", 1883)
        
        # Start the MQTT client loop to handle callbacks
        client.loop_start()

        # Wait a moment to allow the callback to process
        time.sleep(2)

        # Stop the loop and disconnect from the broker
        client.loop_stop()
        client.disconnect()
        
    except Exception as e:
        # Handle exceptions (e.g., connection failure)
        print(f"Error: {e}")

    # Return and print the connection status
    print(client.connection_status)

# Run the connection test
test_connexion()

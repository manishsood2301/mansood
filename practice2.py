import json

# 1. Create a structured device dictionary
my_device = {
    "DeviceName": "HSBC-TOR-01",
    "OSVersion" : "Win11 25H2",
    "Compliant": True,
    "SyncDays": 3
}

# 2. Convert dictionary TO a JSON string (json.dumps = "dump string")
json_text = json.dumps(my_device, indent=2)
print("--- Raw JSON Text ---")
print(json_text)

# 3. Convert JSON string BACK into a Python dictionary (json.loads = "load string")
parsed_dict = json.loads(json_text)
print(f"\nDevice Name read from JSON: {parsed_dict['DeviceName']}")
print(f"OS Version read from JSON: {parsed_dict['OSVersion']}")
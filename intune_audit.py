import json

def get_intune_audit_report(devices, threshold=90):
    report = []

    for device in devices:
        # Condition logic to classify device action
        if device["daysSinceLastSync"] >= threshold:
            action = "RETIRE & RECLAIM LICENSE"
        elif device["complianceState"] != "compliant":
            action = "TRIGGER REMEDIATION"
        else:
            action = "HEALTHY"

        # Handle null/unassigned primary user safely
        owner = device["userPrincipalName"] if device["userPrincipalName"] else "Unassigned"

        report.append({
            "DeviceName": device["deviceName"],
            "Owner": owner,
            "Compliance": device["complianceState"],
            "DaysInactive": device["daysSinceLastSync"],
            "RecommendedStep": action
        })

    return report

try:
    print("Loading simulated Intune inventory with Python...")
    with open("intune_devices.json", "r", encoding="utf-8") as file:
        device_list = json.load(file)

    audit_results = get_intune_audit_report(device_list, threshold=90)

    for item in audit_results:
        print(f"{item['DeviceName']} | {item['Owner']} | {item['DaysInactive']}d | {item['RecommendedStep']}")

except Exception as err:
    print(f"Audit failed: {err}")

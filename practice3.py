# 1. Define a reusable function with parameters
def get_device_status(device_name, days_inactive):
    if days_inactive > 90:
        return f"{device_name} -> RETIRE ({days_inactive} days inactive)"
    return f"{device_name} -> ACTIVE ({days_inactive} days inactive)"

# 2. Wrap execution in try/except for safety
try:
    print(get_device_status("HSBC-TOR-01", 12))
    print(get_device_status("HSBC-MIS-02", 104))

    # Trigger an intentional error to see 'except' in action
    with open("missing_file.json", "r") as f:
        data = f.read()
except Exception as err:
    print(f"Caught error safely: {err}")

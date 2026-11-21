import requests
from datetime import datetime

url = "https://api.github.com/users/octocat"

try:
    print("Fetching live REST API data with Python...")
    response = requests.get(url, timeout=10)
    response.raise_for_status()
    
    data = response.json()
    
    user_summary = {
        "UserName": data["name"],
        "Login": data["login"],
        "Company": data["company"],
        "Location": data["location"],
        "PublicRepos": data["public_repos"],
        "CheckedAt": datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    }
    
    for key, value in user_summary.items():
        print(f"{key}: {value}")
        
except requests.exceptions.RequestException as err:
    print(f"API request failed: {err}")

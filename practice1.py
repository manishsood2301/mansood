# A list of 3 device names
devices = ["LAPTOP-01", "LAPTOP-02", "LAPTOP-03","LAPTOP-04"]

# Loop through each item one at a time
for item in devices:
    if item == "LAPTOP-02":
        print(f"{item} needs patching!")
    elif item == "LAPTOP-04":
        print(f"{item} is retired!")
    else:
        print(f"{item} is healthy.")

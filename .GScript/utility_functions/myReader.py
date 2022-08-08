#!/usr/bin/env python3

import  json

def write_json(data, filename = "myGNotes.json"):
    with open(filename, "w") as f:
        json.dump(data, f, indent = 4)


with open ("myGNotes.json") as json_file:
    data = json.load(json_file)
    temp = data["names"]
    y = {"firstName": "Ghasak", "age": 39}
    temp .append(y)


write_json(data)





from flask import Flask
import json
import requests
from services import service

app = Flask(__name__)

@app.route("/")
def get_something():
    return "<h1>Hello World</h1>"


@app.route("/other")
def other_test():
    return {"message": 'I am another end point'}


if __name__ == '__main__':
	app.run(host="0.0.0.0", debug=True)
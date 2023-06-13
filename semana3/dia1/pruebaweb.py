from flask import Flask,request

app = Flask(__name__);

@app.route('/')
def index():
    return '<h1>Hola Mundo</h1>'

app.run(debug=True);

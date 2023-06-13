from flask import Flask,render_template,request
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'db_movilidad_escolar'

mysql = MySQL(app)


@app.route("/")
def index():
    return render_template('index.html')

@app.route("/colegios")
def colegios():
    cursor = mysql.connection.cursor()
    sql = "select * from tbl_colegio"

    cursor.execute(sql)
    data = cursor.fetchall()

    cursor.close()

    return render_template('colegios.html',colegios=data)

app.run(debug=True)
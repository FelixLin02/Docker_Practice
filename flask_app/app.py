from flask import Flask, jsonify, render_template
from flask_cors import CORS
import pymysql

app = Flask(__name__)
CORS(app)

def conn():
    return pymysql.connect(
        host="mysql",
        user="root",
        password="rootpw",
        database="titanic_db",
        cursorclass=pymysql.cursors.DictCursor
    )

@app.route("/passengers")
def passengers():
    with conn() as db, db.cursor() as cur:
        cur.execute("SELECT * FROM passengers LIMIT 10;")
        return jsonify(cur.fetchall())

@app.route("/table")
def table():
    with conn() as db, db.cursor() as cur:
        cur.execute("SELECT * FROM passengers LIMIT 100;")
        rows = cur.fetchall()
    cols = list(rows[0].keys()) if rows else []
    return render_template("table.html", rows=rows, cols=cols)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

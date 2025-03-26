from datetime import datetime
from flask import render_template, Flask, jsonify, request
from Moviebase import app
from flask_mysqldb import MySQL
from werkzeug.security import generate_password_hash
from flask import session, redirect, url_for, flash
from werkzeug.security import check_password_hash

# MySQL Konfiguration
app.secret_key = "super_secret_key"
app.config["MYSQL_HOST"] = "localhost"  # Host
app.config["MYSQL_USER"] = "RoNa"  # Benutzer
app.config["MYSQL_PASSWORD"] = "1234"  # Passwort
app.config["MYSQL_DB"] = "moviebase"  # Name der Datenbank
app.config["MYSQL_CURSORCLASS"] = ("DictCursor")

mysql = MySQL(app)


@app.route("/")
@app.route("/home")
# Startmethode ruft Loginseite auf
def home():
    return render_template("login.html")


@app.route("/showMovies", methods=["GET"])
# ruft Filmdaten auf aus der Datenbank auf und zeigt sie an
def showMovies():
    try: # versucht Daten zu laden
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM movies")  
        movies = cur.fetchall()
        cur.close()
    except Exception as e: # Fehler beim Datenladen
        return f"Datenbankfehler: {str(e)}"

    return render_template( # stellt Filmseite dar
        "moviepage.html", title="Moviebase", year=datetime.now().year, movies=movies
    )


@app.route("/process", methods=["POST"])
def process(): # zeigt die ADD_Movie Seite an
    return render_template("addmovies.html")


@app.route("/register", methods=["GET"])
def register():
    return render_template("register.html")


@app.route("/insert", methods=["POST"])
def insert_film(): # speichert die Filme in die Datenbank
    daten = request.form

    titel = daten["title"]
    jahr = daten["year"]
    genre = daten["genre"]
    beschreibung = daten["description"]
    bewertung = daten["rating"]

    cursor = mysql.connection.cursor()
    sql = "INSERT INTO movies (title, year, genre, description, rating) VALUES (%s, %s, %s, %s, %s)"
    cursor.execute(sql, (titel, jahr, genre, beschreibung, bewertung))
    mysql.connection.commit()
    cursor.close()

    return showMovies()


# Login
@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST": 
        email = request.form["email"]
        password = request.form["password"]

        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM logindaten WHERE email = %s", (email,))
        user = cursor.fetchone()
        cursor.close()

        if user and check_password_hash(user["password"], password): # wenn Passwort korrekt.....   
            session[user["email"]] = email
            return redirect(url_for("showMovies")) # öffne Filmübersicht
        else:
            return "Login fehlgeschlagen" # sonst Login fehlgeschlagen

    return render_template("login.html")


# Registrierung
@app.route("/registerfinal", methods=["POST"])
def registerfinal():
    daten = request.form

    Benutzter = daten["email"]
    password = daten["password"]
    hashed_password = generate_password_hash(password)  # Passwortverschlüssung
    try: # versucht Logindaten einzutragen, prüft ob Benutztername eindeutig ist
        cursor = mysql.connection.cursor()
        sql = "INSERT INTO logindaten (email, password) VALUES (%s, %s)"
        cursor.execute(sql, (Benutzter, hashed_password))
        mysql.connection.commit()
        cursor.close()
    except Exception as e:
        return f"Datenbankfehler: {str(e)}"

    return showMovies() # zurück zur Moviebase


if __name__ == "__main__": # startet die Applikation
    app.run(debug=True)

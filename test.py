# import db
import mysql.connector
# import os

from flask import Flask, session

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="",
  database="ip_camera"
)
# database=db.db("localhost","root","","ip_camera")
# mydb = database.mysqlConnect();
mycursor = mydb.cursor()

mycursor.execute("SHOW TABLES")

for x in mycursor:
  print(x)


# app = Flask(__name__)
# app.secret_key = os.urandom(24)
# # session.pop('username',None)
# @app.route('/a')
# def a():
#     session['my_var'] = 'my_value'
#     return redirect(url_for('b'))

# @app.route('/b')
# def b():
#     my_var = session.get('my_var', None)
#     return my_var

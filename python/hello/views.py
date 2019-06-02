from django.shortcuts import render
from django.http import HttpResponse

from flask import Flask, session, redirect

import subprocess

from .models import Greeting

import sys
import db 
import mysql.connector
import os

import hello.views
from django.http import HttpResponseRedirect

from opencv_face_recognition.recognize import *

from os import listdir
from os.path import isfile, join
import shutil #cut and paste

import json

app = Flask(__name__)
app.secret_key = os.urandom(24)

database=db.db("localhost","root","","ip_camera")
mydb = database.mysqlConnect()
mycursor = mydb.cursor(buffered=True)

APP_ID = "001"

# Create your views here.
def index(request):


    if 'email' in request.session:
        mycursor.execute("SELECT * FROM users WHERE email = '" + request.session['email']+"'")
        myresult = mycursor.fetchall()

        if len(myresult) == 1:
            row = myresult[0]
            request.session['email'] = row[1]
            return render(request, "index.html",{"greetings":request,"user":row,"images":database.getImageData(row[1],mycursor),"states":database.getStateName(mycursor), "app":database.getAppName(APP_ID,mycursor)})
        else:
            return render(request, "login.html",{"greetings":"hello"})

    if request.method == 'POST':
        
        email = request.POST.get('email')
        password = request.POST.get('password')

        mycursor.execute("SELECT * FROM users WHERE email = '" + email + "' AND password = '"+ password+"'")
        myresult = mycursor.fetchall()

        if len(myresult) == 1:
            row = myresult[0]
            request.session['email'] = row[1]
            return render(request, "index.html",{"greetings":request,"user":row,"images":database.getImageData(row[1],mycursor),"states":database.getStateName(mycursor), "app":database.getAppName(APP_ID,mycursor)})
        else:
            return render(request, "login.html",{"greetings":"hello"})
        
    # return HttpResponse('Hello from Python!')
    else :
        return render(request, "login.html",{"greetings":"hello"})


def logout(request):
    # return HttpResponse('Hello from Python!')
    request.session.pop('email', None)
    return HttpResponseRedirect('/')

def test(request):
    # return HttpResponse('Hello from Python!')
    array = "(56, '001', 'photo_2019-05-18_19-55.jpg', datetime.datetime(2019, 5, 18, 19, 55), datetime.datetime(2019, 5, 27, 0, 7, 52), './hello/static/images/camera/read/', 0, 1, 14, 56, 'new', None, datetime.datetime(2019, 5, 27, 20, 32, 19))"
    json_cities = json.dumps(array)
    return render(request, "test.html",{"greetings":array})

def read(request):
    # mypath = "./opencv_face_recognition/images"
    mypath = "./hello/static/images/camera"
    onlyfiles = [f for f in listdir(mypath + "/unread") if isfile(join(mypath+"/unread", f))]

    for x in onlyfiles:
        faces, state = recognizer(x)
        database.insertImage(x,str(state),mypath,str(len(faces)),mycursor)
        if len(faces) > 0:
            img_id = database.getImageId(x,mycursor)
            for f in faces:
                database.insertFace(str(img_id),f,mycursor)

        shutil.move(mypath + "/unread/" + x, mypath + "/read" )
    return render(request, "test.html",{"greetings":"TEST"})

def update(request):
    
    if request.method == 'POST':
        update_type = request.POST.get('update_type')
        sql = ""
        if update_type == "trigger_name":
            query_id = request.POST.get('query_id')
            new_name = request.POST.get('new_name')

            if new_name:
                sql = "UPDATE `recognize_image` SET `rec_name` = '" + new_name +"',`name_update` = CURRENT_TIMESTAMP  WHERE `recognize_image`.`rec_id` = " + query_id
        
        if update_type == "add_trigger_name":
            img_id = request.POST.get('query_id')
            name = request.POST.get('new_name')
            database.insertFace(str(img_id),name,mycursor)

        if sql:
            mycursor.execute(sql)
            mydb.commit()

    return HttpResponseRedirect('/')

def profile(request):

    if 'email' in request.session:
        mycursor.execute("SELECT * FROM users WHERE email = '" + request.session['email']+"'")
        myresult = mycursor.fetchall()

        if len(myresult) == 1:
            row = myresult[0]
            request.session['email'] = row[1]
            return render(request, "profile.html",{"greetings":request,"user":row})
        else:
            return render(request, "login.html",{"greetings":"hello"})
    else:
        return render(request, "login.html",{"greetings":"hello"})


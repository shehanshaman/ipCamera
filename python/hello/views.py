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

app = Flask(__name__)
app.secret_key = os.urandom(24)

database=db.db("localhost","root","","ip_camera")
mydb = database.mysqlConnect()
mycursor = mydb.cursor()

# Create your views here.
def index(request):


    if 'email' in request.session:
        mycursor.execute("SELECT * FROM users WHERE email = '" + request.session['email']+"'")
        myresult = mycursor.fetchall()

        if len(myresult) == 1:
            row = myresult[0]
            request.session['email'] = row[1]
            return render(request, "index.html",{"greetings":request,"user":row,"images":database.getImageData(row[1],mycursor),"states":database.getStateName(mycursor)})
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
            return render(request, "index.html",{"greetings":request,"user":row,"images":database.getImageData(row[1],mycursor),"states":database.getStateName(mycursor)})
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
    return render(request, "test.html",{"greetings":database.getStateName(mycursor)})

def read(request):
    mypath = "./opencv_face_recognition/images"
    onlyfiles = [f for f in listdir(mypath + "/unread") if isfile(join(mypath+"/unread", f))]

    for x in onlyfiles:
        faces, state = recognizer(x)
        database.insertImage(x,str(state),mypath,str(len(faces)),mycursor)
        if len(faces) > 0:
            img_id = database.getImageId(x,mycursor)
            for f in faces:
                database.insertFace(str(img_id),f,mycursor)

        # shutil.move(mypath + "/unread/" + x, mypath + "/read" )
    return render(request, "test.html",{"greetings":"TEST"})


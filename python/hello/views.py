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
            row = myresult[0];
            request.session['email'] = row[1]
            return render(request, "index.html",{"greetings":request,"user":row})
        else:
            return render(request, "login.html",{"greetings":"hello"})

    if request.method == 'POST':
        
        email = request.POST.get('email')
        password = request.POST.get('password')

        mycursor.execute("SELECT * FROM users WHERE email = '" + email + "' AND password = '"+ password+"'")
        myresult = mycursor.fetchall()

        if len(myresult) == 1:
            row = myresult[0];
            request.session['email'] = row[1]
            return render(request, "index.html",{"greetings":request,"user":row})
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
    return render(request, "test.html",{"greetings":"hello"})

def read(request):
	
    proc = subprocess.Popen(["python", "./staticfiles/read.py"], stdout=subprocess.PIPE, shell=True)
    (out, err) = proc.communicate()
	
	
	# print ("program output:", out)
    
    return render(request, "test.html",{"greetings":out.decode('ascii')})


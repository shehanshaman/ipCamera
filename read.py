from os import listdir
from os.path import isfile, join
import shutil #cut and paste

import os
import subprocess

import mysql.connector
# import db

mydb = mysql.connector.connect(
					  host="localhost",
					  user="root",
					  passwd="",
					  database="ip_camera"
					) 

# database=db.db("localhost","root","","ip_camera")
# mydb = database.mysqlConnect()
mycursor = mydb.cursor()

# mypath = "./opencv-face-recognition/images"

print(mycursor.execute("SELECT * FROM `users`"))

# onlyfiles = [f for f in listdir(mypath + "/unread") if isfile(join(mypath+"/unread", f))]

# for x in onlyfiles:
#   # print(x)
#   array = x.split(".")[0].split("_")
#   dateTimeStr = array[1] + " " + array[2]
#   appId = "001"
#   print(dateTimeStr)
  # proc = subprocess.Popen(["python", "./opencv-face-recognition/recognize.py", "--detector", "./opencv-face-recognition/face_detection_model", "--embedding-model", "./opencv-face-recognition/openface_nn4.small2.v1.t7" ,"--recognizer" ,"./opencv-face-recognition/output/recognizer.pickle" ,"--le" ,"./opencv-face-recognition/output/le.pickle", "--image" ,"./opencv-face-recognition/images/"+x], stdout=subprocess.PIPE, shell=True)
  # (out, err) = proc.communicate()
  # print ("program output:", out)
  # shutil.move(mypath + "/unread/" + x, mypath + "/read" )
# print(onlyfiles)

# myCmd = 'python test2.py'
# output = os.system(myCmd)


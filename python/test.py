# from os import listdir
# from os.path import isfile, join
# import shutil #cut and paste

# import os
# import subprocess

# mypath = "E:\\Campus\\Training Period\\ipCamera\\images"

# onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]

# for x in onlyfiles:
#   print(x)
#   # shutil.move(mypath + "\\" + x, mypath + "\\read" )
# # print(onlyfiles)

# # myCmd = 'python test2.py'
# # output = os.system(myCmd)
# proc = subprocess.Popen(["python", "./opencv-face-recognition/recognize.py", "--detector", "./opencv-face-recognition/face_detection_model", "--embedding-model", "./opencv-face-recognition/openface_nn4.small2.v1.t7" ,"--recognizer" ,"./opencv-face-recognition/output/recognizer.pickle" ,"--le" ,"./opencv-face-recognition/output/le.pickle", "--image" ,"./opencv-face-recognition/images/adrian.jpg"], stdout=subprocess.PIPE, shell=True)
# (out, err) = proc.communicate()
# print ("program output:", out)

from opencv_face_recognition.recognize import *
re,sta = recognizer("photo_2019-05-18_19-55.jpg")
print(re)
print(sta)

# import cv2 as cv

# # Read image from your local file system
# original_image = cv.imread('./opencv_face_recognition/images/unread/photo_2019-05-18_19-55.jpg')

# # Convert color image to grayscale for Viola-Jones
# grayscale_image = cv.cvtColor(original_image, cv.COLOR_BGR2GRAY)

# # Load the classifier and create a cascade object for face detection
# face_cascade = cv.CascadeClassifier('./opencv_face_recognition/cascade/haarcascade_frontalface_default.xml')
# detected_faces = face_cascade.detectMultiScale(grayscale_image)
# print(detected_faces)
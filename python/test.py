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

print(recognizer("hi"))
# USAGE
# python recognize.py --detector face_detection_model \
#	--embedding-model openface_nn4.small2.v1.t7 \
#	--recognizer output/recognizer.pickle \
#	--le output/le.pickle --image images/adrian.jpg

# import the necessary packages
import numpy as np
import argparse
import imutils
import pickle
import cv2
import os

def hasFaces(img_name):

	original_image = cv2.imread('./opencv_face_recognition/images/unread/' + img_name)

	# Convert color image to grayscale for Viola-Jones
	grayscale_image = cv2.cvtColor(original_image, cv2.COLOR_BGR2GRAY)

	# Load the classifier and create a cascade object for face detection
	face_cascade = cv2.CascadeClassifier('./opencv_face_recognition/cascade/haarcascade_frontalface_default.xml')
	detected_faces = face_cascade.detectMultiScale(grayscale_image)
	
	if len(detected_faces) > 0:
		return True
	else :
		False


def recognizer(img_name):
	# Motiin 0 | Unknown = 1 | Detected = 2

	if not hasFaces(img_name):
		return [],0

	path = "./opencv_face_recognition/"

	args = dict()
	args["detector"] =path + "face_detection_model"
	args["embedding_model"] = path + "openface_nn4.small2.v1.t7"
	args["recognizer"] = path + "output/recognizer.pickle"
	args["le"] = path + "output/le.pickle"
	args["image"] = path + "images/unread/" + img_name
	args["confidence"] = 0.5

	# load our serialized face detector from disk
	print("[INFO] loading face detector...")
	protoPath = os.path.sep.join([args["detector"], "deploy.prototxt"])
	modelPath = os.path.sep.join([args["detector"],
		"res10_300x300_ssd_iter_140000.caffemodel"])
	detector = cv2.dnn.readNetFromCaffe(protoPath, modelPath)

	# load our serialized face embedding model from disk
	print("[INFO] loading face recognizer...")
	embedder = cv2.dnn.readNetFromTorch(args["embedding_model"])

	# load the actual face recognition model along with the label encoder
	recognizer = pickle.loads(open(args["recognizer"], "rb").read())
	le = pickle.loads(open(args["le"], "rb").read())

	# load the image, resize it to have a width of 600 pixels (while
	# maintaining the aspect ratio), and then grab the image dimensions
	image = cv2.imread(args["image"])
	image = imutils.resize(image, width=600)
	(h, w) = image.shape[:2]

	# construct a blob from the image
	imageBlob = cv2.dnn.blobFromImage(
		cv2.resize(image, (300, 300)), 1.0, (300, 300),
		(104.0, 177.0, 123.0), swapRB=False, crop=False)

	# apply OpenCV's deep learning-based face detector to localize
	# faces in the input image
	detector.setInput(imageBlob)
	detections = detector.forward()

	name_array = []

	# loop over the detections
	for i in range(0, detections.shape[2]):
		# extract the confidence (i.e., probability) associated with the
		# prediction
		confidence = detections[0, 0, i, 2]

		# filter out weak detections
		if confidence > args["confidence"]:
			# compute the (x, y)-coordinates of the bounding box for the
			# face
			box = detections[0, 0, i, 3:7] * np.array([w, h, w, h])
			(startX, startY, endX, endY) = box.astype("int")

			# extract the face ROI
			face = image[startY:endY, startX:endX]
			(fH, fW) = face.shape[:2]

			# ensure the face width and height are sufficiently large
			if fW < 20 or fH < 20:
				continue

			# construct a blob for the face ROI, then pass the blob
			# through our face embedding model to obtain the 128-d
			# quantification of the face
			faceBlob = cv2.dnn.blobFromImage(face, 1.0 / 255, (96, 96),
				(0, 0, 0), swapRB=True, crop=False)
			embedder.setInput(faceBlob)
			vec = embedder.forward()

			# perform classification to recognize the face
			preds = recognizer.predict_proba(vec)[0]
			j = np.argmax(preds)
			proba = preds[j]
			name = le.classes_[j]
			# print(name)
			name_array.append(name)

			# draw the bounding box of the face along with the associated
			# probability
			text = "{}: {:.2f}%".format(name, proba * 100)
			y = startY - 10 if startY - 10 > 10 else startY + 10
			cv2.rectangle(image, (startX, startY), (endX, endY),
				(0, 0, 255), 2)
			cv2.putText(image, text, (startX, y),
				cv2.FONT_HERSHEY_SIMPLEX, 0.45, (0, 0, 255), 2)

	# show the output image
	# cv2.imshow("Image", image)
	# cv2.waitKey(0)
	if len(name_array) > 0 : 
		return name_array,2
	else :
		return name_array,1

# print(recognizer("hi"))


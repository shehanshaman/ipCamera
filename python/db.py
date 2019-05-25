import mysql.connector

class db:

	host = None
	user = None
	passwd = None
	database = None
	
	def __init__(self, host,user,passwd,database):
		
		self.host = host
		self.user = user
		self.passwd = passwd
		self.database = database


	def mysqlConnect(self):
		self.mydb = mysql.connector.connect(
					  host=self.host,
					  user=self.user,
					  passwd=self.passwd, 
					  database=self.database
					)
		return self.mydb

	def insertImage(self,name,mypath,faces,mycursor):
		array = name.split(".")[0].split("_")
		dateTimeStr = array[1] + " " + array[2]
		appId = "001"
		query = "INSERT INTO `image_data` (`image_id`, `app_id`, `image_name`, `image_capture`, `image_created`, `image_path`, `faces`) VALUES (NULL, '" + appId + "', '" + name +"', '" + dateTimeStr +"', CURRENT_TIMESTAMP, '"+ mypath +"/read/', " + faces +")"
		mycursor.execute(query)
		self.mydb.commit()
		
	def getImageId(self,name,mycursor):
		query = "SELECT image_id FROM `image_data` WHERE image_name = '" + name + "'"
		mycursor.execute(query)
		myresult = mycursor.fetchone()

		return myresult[0]

	def insertFace(self,img_id,rec_name,mycursor):
		query = "INSERT INTO `recognize_image` (`rec_id`, `img_id`, `rec_name`, `name_update`, `update_time`) VALUES (NULL, " + img_id + ", '" + rec_name +"', NULL, CURRENT_TIMESTAMP)"
		mycursor.execute(query)
		self.mydb.commit()

	def getUserId(self,email,mycursor):
		query = "SELECT user_id FROM `users` WHERE email = '" + email + "'"
		mycursor.execute(query)
		myresult = mycursor.fetchone()
		return myresult[0]

	def getAppId(self,email,mycursor):
		query = "SELECT app_id FROM `app_tbl` WHERE app_user_id = " + str(self.getUserId(email,mycursor)) + ""
		mycursor.execute(query)
		myresult = mycursor.fetchone()
		return myresult[0]

	def getImageData(self,email,mycursor):
		appId = self.getAppId(email,mycursor)
		query = "SELECT * FROM image_data LEFT JOIN recognize_image ON image_data.image_id = recognize_image.img_id WHERE image_data.app_id = '" + str(appId) + "' UNION SELECT * FROM image_data RIGHT JOIN recognize_image ON image_data.image_id = recognize_image.img_id WHERE image_data.app_id = '" + str(appId) + "'"
		mycursor.execute(query)
		myresult = mycursor.fetchall()
		return myresult

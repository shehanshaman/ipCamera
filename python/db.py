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
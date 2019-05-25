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
		
		
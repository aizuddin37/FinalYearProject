#!/usr/bin/env python3

# version 6.0

# requirement (Debian)
# sudo apt-get install python3-pip
# pip3 install flask
# pip3 install flask_restful
# pip3 install requests
# pip3 install mysql-connector-python
# pip3 install daemonize
# pip3 install wand libmagickwand-dev
# apt-get install libmagickwand-dev
# pip3 install Pillow


from flask import Flask, jsonify, make_response, redirect, flash, url_for, send_file
from flask_restful import Api, Resource, reqparse, request
import requests
import mysql.connector
from mysql.connector import Error
from mysql.connector import errorcode
from datetime import datetime
import logging
import os, sys
# from daemonize import Daemonize
# from random import randint
# from werkzeug.utils import secure_filename
# import subprocess
# import smtplib, ssl
# from email import encoders
# from email.mime.base import MIMEBase
# from email.mime.multipart import MIMEMultipart
# from email.utils import formatdate
# from email.mime.text import MIMEText
# from PIL import Image
import io

def main():
    # create a flask application
    app = Flask(__name__)
    api = Api(app)

    class DBHelper:
      def getDBConnection(self):
        try:
          con = mysql.connector.connect(host='94.237.78.193',
                                        database='DIDI',
                                        user='didi',
                                        password='KemamanPass123')
          print("DBHelper : Successfully connected to database")
          return con
        except mysql.connector.Error as error:
          print("DBHelper : Error connecting to database : {}".format(error))

    
    class CREATE_PROFILE(Resource):
      def post(self):
        argList = request.args 
        try:
          con = DBHelper.getDBConnection(self)
          
          updateQuery = """
                        INSERT INTO DIDI.justmarry_user
                        (FIRST_NAME, LAST_NAME, EMAIL, PASSWORD)
                        VALUES ( %s, %s, %s, %s);"""

          args= (argList.get('firstName'), argList.get('lastName'),
              argList.get('email'), 
              argList.get('password'));

          cursor = con.cursor( buffered=True , dictionary=True)
          cursor.execute(updateQuery, args)
          con.commit()
          args= (argList.get('email'),);
          getResultQuery = """SELECT FIRST_NAME,LAST_NAME,EMAIL FROM DIDI.justmarry_user WHERE EMAIL=%s; """

          cursor.execute(getResultQuery,args)                   
          result_set = cursor.fetchone()

          print("User profile updated - " + str(result_set))
          cursor.close()
          return make_response(jsonify(result_set), 200)
        except Exception as e:
          print("Error : " + str(e), 400)
          return "Error : " + str(e), 400
        
        

        
       

       

        # http://localhost:83/bestpay/api/update_profile?fullName=John&idNumber=871112116565&phoneNo=60183245656&email=raf@kemaman.org&userID=609
        # todo : replace email with userID for reference when auth API is fixed (requires userID)

    class UPDATE_PROFILE(Resource):
      def get(self):
        argList = request.args 
        try:
          con = DBHelper.getDBConnection(self)
          
          updateQuery = """
                        UPDATE DIDI.justmarry_user
                        SET FIRST_NAME=%s,LAST_NAME=%s,EMAIL=%s
                        WHERE EMAIL=%s; """

          args= (argList.get('firstName'),argList.get('lastName'),argList.get('email'),argList.get('email'),);

          cursor = con.cursor( buffered=True , dictionary=True)
          cursor.execute(updateQuery, args)
          con.commit()

          getResultQuery = """SELECT FIRST_NAME,LAST_NAME, EMAIL
                            from DIDI.justmarry_user WHERE EMAIL=%s;"""

          args= (argList.get('email'),);

          cursor.execute(getResultQuery, args)                   
          result_set = cursor.fetchone()

          print("User profile updated - " + str(result_set))
          cursor.close()
          return make_response(jsonify(result_set), 200)
        except Exception as e:
          print("Error : " + str(e), 400)
          return "Error : " + str(e), 400
       
    class LOGIN_ACC(Resource):
          def get(self):
            argList = request.args 
            try:
              con = DBHelper.getDBConnection(self)

              checkExistAccQuery = """
                        SELECT  EMAIL  FROM DIDI.justmarry_user A
                        WHERE ( A.EMAIL = %s AND A.PASSWORD =%s )
                        ;"""                   

              cursor = con.cursor( buffered=True , dictionary=True)
              cursor.execute(checkExistAccQuery, (
                request.args.get('email'),request.args.get('password'),))
              row = cursor.fetchone()
              # return make_response("Resp : " + str(cursor.statement), 200) # debug
              # return make_response("Resp : " + str(row), 200) # debug
              if row:
                error = ""
                # return make_response("Resp : " + idNo, 200)
                email = str(row['EMAIL'])
                return make_response("login successful", 200)
              else:
                # empty result
                return make_response("Fail to login", 400)
              print("An account exist with the following details : " + str(row))
              cursor.close()
            except Exception as e:
              print("Error : " + str(e), 400)
              return make_response("Error : " + str(e), 400)


    class CHECK_SELANGOR(Resource):
          def get(self):
            argList = request.args 
            try:
              con = DBHelper.getDBConnection(self)
              tempquery="""
                        SELECT  *  FROM DIDI.PredictedCities P
                        WHERE P.Name = 'Selangor, Malaysia' AND STR_TO_DATE(Date_time ,'%d/%m/%Y')>%s AND STR_TO_DATE(Date_time ,'%d/%m/%Y')<%s
                        
                         
                        """ 
                            

              cursor = con.cursor( buffered=True , dictionary=True)
              cursor.execute( tempquery,(request.args.get('startDate'),request.args.get('endDate'),))
              result = cursor.fetchall()
              print("Selangor : " + " : " + str(result))
              cursor.close()
              return make_response(jsonify(result), 200)
            except Exception as e:
              print("Error : " + str(e), 400)
              return "Error : " + str(e), 400

    class CHECK_JOHOR(Resource):
          def get(self):
            argList = request.args
            try:
              con = DBHelper.getDBConnection(self)
              tempquery="""
                        SELECT  *  FROM DIDI.PredictedCities P
                        WHERE P.Name = 'Johor Bahru, Johor' AND STR_TO_DATE(Date_time ,'%d/%m/%Y')>%s AND STR_TO_DATE(Date_time ,'%d/%m/%Y')<%s


                        """


              cursor = con.cursor( buffered=True , dictionary=True)
              cursor.execute( tempquery,(request.args.get('startDate'),request.args.get('endDate'),))
              result = cursor.fetchall()
              print("Selangor : " + " : " + str(result))
              cursor.close()
              return make_response(jsonify(result), 200)
            except Exception as e:
              print("Error : " + str(e), 400)
              return "Error : " + str(e), 400


    class CHECK_PINANG(Resource):
          def get(self):
            argList = request.args
            try:
              con = DBHelper.getDBConnection(self)
              tempquery="""
                        SELECT  *  FROM DIDI.PredictedCities P
                        WHERE P.Name = 'Pulau Pinang, Mala' AND STR_TO_DATE(Date_time ,'%d/%m/%Y')>%s AND STR_TO_DATE(Date_time ,'%d/%m/%Y')<%s


                        """


              cursor = con.cursor( buffered=True , dictionary=True)
              cursor.execute( tempquery,(request.args.get('startDate'),request.args.get('endDate'),))
              result = cursor.fetchall()
              print("Selangor : " + " : " + str(result))
              cursor.close()
              return make_response(jsonify(result), 200)
            except Exception as e:
              print("Error : " + str(e), 400)
              return "Error : " + str(e), 400

    class CHECK_KOTA_BHARU(Resource):
          def get(self):
            argList = request.args
            try:
              con = DBHelper.getDBConnection(self)
              tempquery="""
                        SELECT  *  FROM DIDI.PredictedCities P
                        WHERE P.Name = 'Kota Bharu, Kelant' AND STR_TO_DATE(Date_time ,'%d/%m/%Y')>%s AND STR_TO_DATE(Date_time ,'%d/%m/%Y')<%s


                        """


              cursor = con.cursor( buffered=True , dictionary=True)
              cursor.execute( tempquery,(request.args.get('startDate'),request.args.get('endDate'),))
              result = cursor.fetchall()
              print("Selangor : " + " : " + str(result))
              cursor.close()
              return make_response(jsonify(result), 200)
            except Exception as e:
              print("Error : " + str(e), 400)
              return "Error : " + str(e), 400

    class CHECK_TERENGGANU(Resource):
          def get(self):
            argList = request.args
            try:
              con = DBHelper.getDBConnection(self)
              tempquery="""
                        SELECT  *  FROM DIDI.PredictedCities P
                        WHERE P.Name = 'Kuala Terengganu, ' AND STR_TO_DATE(Date_time ,'%d/%m/%Y')>%s AND STR_TO_DATE(Date_time ,'%d/%m/%Y')<%s


                        """


              cursor = con.cursor( buffered=True , dictionary=True)
              cursor.execute( tempquery,(request.args.get('startDate'),request.args.get('endDate'),))
              result = cursor.fetchall()
              print("Selangor : " + " : " + str(result))
              cursor.close()
              return make_response(jsonify(result), 200)
            except Exception as e:
              print("Error : " + str(e), 400)
              return "Error : " + str(e), 400


    class SEARCH_HISTORY(Resource):
          def get(self):
            argList = request.args
            try:
              con = DBHelper.getDBConnection(self)
              tempquery="""
                        SELECT  *  FROM DIDI.WeatherHistory W
                        WHERE  STR_TO_DATE(Date_time ,'%d/%m/%Y') = %s


                        """


              cursor = con.cursor( buffered=True , dictionary=True)
              cursor.execute( tempquery,(request.args.get('searchDate'),))
              result = cursor.fetchall()
              print("Selangor : " + " : " + str(result))
              cursor.close()
              return make_response(jsonify(result), 200)
            except Exception as e:
              print("Error : " + str(e), 400)
              return "Error : " + str(e), 400




    class CHECK_EXIST_ACC(Resource):
          def get(self):
            argList = request.args
            try:
              con = DBHelper.getDBConnection(self)

              checkExistAccQuery = """
                        SELECT  EMAIL FROM DIDI.justmarry_user A
                        WHERE ( A.EMAIL = %s );"""

              cursor = con.cursor( buffered=True , dictionary=True)
              cursor.execute(checkExistAccQuery, (
                request.args.get('email'),))
              row = cursor.fetchone()
              # return make_response("Resp : " + str(cursor.statement), 200) # debug
              # return make_response("Resp : " + str(row), 200) # debug
              if row:
                error = ""
                # return make_response("Resp : " + idNo, 200)
                email = str(row['EMAIL'])


                if (email == str(request.args.get('email'))):
                  error = "email "
                  return make_response("An account with the provided " + error + "already exist", 200)
                # return make_response("Error - An account exist with the following details : " + str(row), 200)
              else:
                # empty result
                return make_response("Success - No duplicate", 200)

              print("An account exist with the following details : " + str(row))
              cursor.close()
            except Exception as e:
              print("Error : " + str(e), 400)
              return make_response("Error : " + str(e), 400)

    api.add_resource(LOGIN_ACC, "/justmarry/api/login_account")
    api.add_resource(CREATE_PROFILE, "/justmarry/api/create_account")
    api.add_resource(UPDATE_PROFILE, "/justmarry/api/update_account")
    api.add_resource(CHECK_EXIST_ACC, "/justmarry/api/check_existing_account")
    api.add_resource(CHECK_SELANGOR, "/justmarry/api/check_selangor")
    api.add_resource(CHECK_JOHOR, "/justmarry/api/check_johor")
    api.add_resource(CHECK_PINANG, "/justmarry/api/check_pinang")
    api.add_resource(CHECK_KOTA_BHARU, "/justmarry/api/check_kb")
    api.add_resource(CHECK_TERENGGANU, "/justmarry/api/check_kt")
    api.add_resource(SEARCH_HISTORY, "/justmarry/api/check_history")



    # run the app on specific port
    app.run(host='0.0.0.0', port=89)

if __name__ == '__main__':
    # justmarry_api=os.path.basename(sys.argv[0])
    # here=os.path.dirname(os.path.abspath(__file__))

    # pidfile=here + '/justmarry_api_pid'
    # daemon=Daemonize(app=bestpay_api,pid=pidfile, action=main)
    # daemon.start()
  main();
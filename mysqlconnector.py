import mysql.connector
from mysql.connector import errorcode
import pandas as pd
import numpy as np
import datetime

credit = pd.read_excel("C:/Users/Papa Ba GAYE/Desktop/Ventes.xlsx")
# print(credit)

# def ajouter(table):
#   for sex, nom, date, pu, qte in zip(credit["CodeClient"], credit["CodeProduit"], credit["DateVente"],  credit["PrixUnitaire"], credit["Quantité"]):
#     request = "INSERT into %s (CodeClient, CodeProduit, DateVente, PrixUnitaire, Quantité) VALUES (%s, %s, %s, %s, %s)"
#     cursor.execute(request, (table, sex, nom, date, pu, qte))
#     conn.commit()

connection_params = {
    'host': "localhost",
    'user': "root",
    'password': "",
    'database': "bi2",
}

try:
  conn = mysql.connector.connect(host = "localhost", user = "root", password = "", database = "bi2",)
  cursor = conn.cursor()

  ##################################################################################################
  
  for sex, nom, date, pu, qte in zip(credit["CodeClient"], credit["CodeProduit"], credit["DateVente"],  credit["PrixUnitaire"], credit["Quantité"]):
    request = "INSERT into SRC_Vente (CodeClient, CodeProduit, DateVente, PrixUnitaire, Quantité) VALUES (%s, %s, %s, %s, %s)"
    cursor.execute(request, (sex, nom, date, pu, qte))
    conn.commit()

  for sex, nom, date, pu, qte in zip(credit["CodeClient"], credit["CodeProduit"], credit["DateVente"],  credit["PrixUnitaire"], credit["Quantité"]):
    if type(sex) != str or type(nom) != str or type(pu) != int or type(qte) != int or type(date)!= datetime.datetime: #  or date!="%Y-%m-%d"
      request = "INSERT into REJET_Vente (CodeClient, CodeProduit, DateVente, PrixUnitaire, Quantité) VALUES (%s, %s, %s, %s, %s)"
      cursor.execute(request, (sex, nom, date, pu, qte))
      conn.commit()
    else:
      pass

  for sex, nom, date, pu, qte in zip(credit["CodeClient"], credit["CodeProduit"], credit["DateVente"],  credit["PrixUnitaire"], credit["Quantité"]):
    if type(sex) == str and type(nom) == str and type(pu) == int and type(qte) == int:
      request = "INSERT into SAS_Vente (CodeClient, CodeProduit, DateVente, PrixUnitaire, Quantité) VALUES (%s, %s, %s, %s, %s)"
      cursor.execute(request, (sex, nom, date, pu, qte))
      conn.commit()
    else:
      pass

  #################################################################################################
  request = "SELECT * from SRC_Vente"
  cursor.execute(request)

  all = cursor.fetchall()

  print("SRC_Vente")
  for i in all:
    print(f"ID : {i[0]} - Nom : {i[3]} - Sexe : {i[2]}")

  #################################################################################################
  request = "SELECT * from SAS_Vente"
  cursor.execute(request)

  all = cursor.fetchall()

  print("SAS_Vente")
  for i in all:
    print(f"ID : {i[0]} - Nom : {i[3]} - Sexe : {i[2]}")

  #################################################################################################
  request = "SELECT * from REJET_Vente"
  cursor.execute(request)

  all = cursor.fetchall()

  print("REJET_Vente")
  for i in all:
    print(f"ID : {i[0]} - Nom : {i[3]} - Sexe : {i[2]}")

except mysql.connector.Error as e:
  if e.errno == errorcode.ER_ACCESS_DENIED_ERROR:
    print("Incorrrect")
  elif e.errno == errorcode.ER_BAD_DB_ERROR:
    print("La base de données nexiste pas")
  else:
    print('Allumer votre server\n', e)
  exit()

import pyodbc
import pandas as pd
import datetime

credit = pd.read_excel("C:/Users/Papa Ba GAYE/Desktop/Ventes.xlsx")

conn = pyodbc.connect(
    "Driver={SQL Server Native Client 11.0};"
    "Server=DESKTOP-LB0UN21\SQLEXPRESS;"
    "Database=TPBI;"
    "Trusted_Connection=yes;"
)

cursor = conn.cursor()

#======================================================================================================================================================#
id_ = 1
for sex, nom, date, pu, qte in zip(credit["CodeClient"], credit["CodeProduit"], credit["DateVente"],  credit["PrixUnitaire"], credit["Quantité"]):
  if type(sex) == str and type(nom) == str and type(pu) == int and type(qte) == int and type(date) == datetime.datetime:
    request = "INSERT into SRC_Vente (id, CodeClient, CodeProduit, DateVente, PrixUnitaire, Quantité) VALUES (?, ?, ?, ?, ?, ?)"
    cursor.execute(request, (id_, sex, nom, date, pu, qte))
    conn.commit()
    id_ = id_ + 1
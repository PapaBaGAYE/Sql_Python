# Mysql_Python

### MySQL
**Business Intelligence Course**<br>
Auteur : **@Papa Ba GAYE**

```
CREATE TABLE `SRC_Vente` ( 
  `id` INT NOT NULL,
  `CodeClient` VARCHAR(20) NOT NULL,
  `CodeProduit` VARCHAR(20) NOT NULL, 
  `DateVente` DATE NULL,
  `PrixUnitaire` INT NULL,
  `Quantité` INT NULL,
PRIMARY KEY (`id`));
```

```
CREATE TABLE `SAS_Vente` ( 
    `id` INT NOT NULL,
  `CodeClient` VARCHAR(20) NOT NULL,
  `CodeProduit` VARCHAR(20) NOT NULL, 
  `DateVente` DATE NULL,
  `PrixUnitaire` INT NULL,
  `Quantité` INT NULL,
PRIMARY KEY (`id`));
```

```
CREATE TABLE `REJET_Vente` ( 
    `id` INT NOT NULL,
  `CodeClient` VARCHAR(20) NOT NULL,
  `CodeProduit` VARCHAR(20) NOT NULL, 
  `DateVente` DATE NULL,
  `PrixUnitaire` INT NULL,
  `Quantité` INT NULL,
PRIMARY KEY (`id`));
```

### SQL Server
```
SELECT TOP (1000) [id]
      ,[CodeClient]
      ,[CodeProduit]
      ,[DateVente]
      ,[PrixUnitaire]
      ,[Quantité]
  FROM [TPBI].[dbo].[SRC_Vente]

CREATE TABLE SRC_Vente ( 
  id INT NOT NULL,
  CodeClient VARCHAR(20),
  CodeProduit VARCHAR(20), 
  DateVente DATE,
  PrixUnitaire INT,
  Quantité INT,
PRIMARY KEY (id));

CREATE TABLE SAS_Vente ( 
  id INT NOT NULL,
  CodeClient VARCHAR(20),
  CodeProduit VARCHAR(20), 
  DateVente DATE,
  PrixUnitaire INT,
  Quantité INT,
PRIMARY KEY (id));

CREATE TABLE REJET_Vente ( 
  id INT NOT NULL,
  CodeClient VARCHAR(20),
  CodeProduit VARCHAR(20), 
  DateVente DATE,
  PrixUnitaire INT,
  Quantité INT,
PRIMARY KEY (id));
```

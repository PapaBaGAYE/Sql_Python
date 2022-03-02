# Mysql_Python

```
CREATE TABLE `SRC_Vente` ( 
  `CodeClient` VARCHAR(20) NOT NULL,
  `CodeProduit` VARCHAR(20) NOT NULL, 
  `DateVente` DATE NULL,
  `PrixUnitaire` INT NULL,
  `Quantité` INT NULL,
PRIMARY KEY (`CodeClient`));

CREATE TABLE `SAS_Vente` ( 
  `CodeClient` VARCHAR(20) NOT NULL,
  `CodeProduit` VARCHAR(20) NOT NULL, 
  `DateVente` DATE NULL,
  `PrixUnitaire` INT NULL,
  `Quantité` INT NULL,
PRIMARY KEY (`CodeClient`));

CREATE TABLE `REJET_Vente` ( 
  `CodeClient` VARCHAR(20) NOT NULL,
  `CodeProduit` VARCHAR(20) NOT NULL, 
  `DateVente` DATE NULL,
  `PrixUnitaire` INT NULL,
  `Quantité` INT NULL,
PRIMARY KEY (`CodeClient`));
```

--====================================CREATION DES TABLES====================================
CREATE TABLE `Produit` ( 
  `IdProduit` INT NOT NULL,
  `CodeProduit` VARCHAR(20) NOT NULL, 
  `libelléProduit` VARCHAR(20) NOT NULL,
  `Marque` VARCHAR(20) NOT NULL,
PRIMARY KEY (`IdProduit`)
);

CREATE TABLE `Vendeur` ( 
  `IdVendeur` INT NOT NULL,
  `matricule` VARCHAR(20) NOT NULL, 
  `nomVendeur` VARCHAR(20) NOT NULL,
  `Ville` VARCHAR(20) NOT NULL,
  `Genre` VARCHAR(10) NOT NULL,
  `Salaire` INT NOT NULL,
PRIMARY KEY (`IdVendeur`)
);

CREATE TABLE `Client` ( 
  `IdClient` INT NOT NULL,
  `codeClient` VARCHAR(20) NOT NULL, 
  `nomClient` VARCHAR(20) NOT NULL,
PRIMARY KEY (`IdClient`)
);

CREATE TABLE `Date` ( 
  `IdDate` INT NOT NULL, 
  `date` DATE NOT NULL, 
  `mois` INT NOT NULL,
  `année` INT NOT NULL,
PRIMARY KEY (`IdDate`)
);

CREATE TABLE `Vente` (
  `IdProduit` INT NOT NULL,
  `IdDate` INT NOT NULL, 
  `IdClient` INT NOT NULL,
  `IdVendeur` INT NOT NULL,
  `Quantité` INT NOT NULL,
  `PrixUnitaire` INT NOT NULL,
  FOREIGN KEY (`IdProduit`) REFERENCES `Produit` (`IdProduit`),
  FOREIGN KEY (`IdDate`) REFERENCES `Date` (`IdDate`),
  FOREIGN KEY (`IdClient`) REFERENCES `Client` (`IdClient`),
  FOREIGN KEY (`IdVendeur`) REFERENCES `Vendeur` (`IdVendeur`)
);

CREATE TABLE `BNNE` ( 
  `CodeProduit` VARCHAR(20) NOT NULL,
  `CodeClient` VARCHAR(20) NOT NULL, 
  `nomClient` VARCHAR(20) NOT NULL,
  `matricule` VARCHAR(20) NOT NULL,
  `date` DATE NOT NULL,
  `PrixUnitaire` INT NOT NULL,
  `Quantité` INT NOT NULL
);

-- Insersion et affichages de quelques données dans les tables

    -- BNNE
INSERT INTO BNNE (CodeProduit, CodeClient, nomClient, matricule, date, PrixUnitaire, Quantité) VALUES 
('PRO1', 'C1', 'Aliou', 'C197', '2022-03-14', 240000, 1),
('PRO2', 'C2', 'Oumar', 'C198', '2022-03-15', 100000, 2),
('PRO3', 'C3', 'Papa', 'C199', '2022-03-15', 100000, 5),
('PRO4', 'C4', 'Maimouna', 'C200', '2022-03-17', 340000, 1),
('PRO5', 'C5', 'Aly', 'C201', '2022-03-17', 5000, 1);

    -- Client
INSERT INTO Client(IdClient, codeClient, nomClient) VALUES 
(1, 'C1', 'Aliou'),
(2, 'C2', 'Oumar'),
(3, 'C3', 'Papa'),
(4, 'C4', 'Maimouna'),
(5, 'C5', 'Aly');

    -- Date
INSERT INTO Date(IdDate, date, mois, année) VALUES 
(1, '2022-03-13', 3, 2022),
(2, '2022-03-14', 3, 2022),
(3, '2022-03-15', 3, 2022),
(4, '2022-03-16', 3, 2022),
(5, '2022-03-17', 3, 2022);

    -- Produit
INSERT INTO Produit(IdProduit, CodeProduit, libelléProduit, Marque) VALUES 
(1, 'PRO1', 'Telephone', 'Iphone'), 
(2, 'PRO2', 'Telephone', 'TECNO'),
(3, 'PRO3', 'Telephone', 'SAMSUNG'),
(4, 'PRO4', 'Ordinateur', 'Mac'),
(5, 'PRO5', 'Chargeur', 'Unknow');

    -- Vendeur
INSERT INTO Vendeur(IdVendeur, matricule, nomVendeur, Ville, Genre, Salaire) VALUES 
(1, 'C197', 'Ibrahima', 'Thies', 'M', 240000), 
(2, 'C198', 'Eya', 'Tunis', 'F', 200000),
(3, 'C199', 'Eya', 'Tunis', 'F', 500000),
(4, 'C200', 'Eya', 'Tunis', 'F', 340000),
(5, 'C201', 'Shams', 'Tamba', 'M', 5000);

--=============================AFFICHACHE====================================
SELECT *
  FROM BNNE;

SELECT *
  FROM Client;

SELECT *
  FROM Date;

SELECT *
  FROM Produit;

SELECT *
  FROM Vendeur;

--=============================REQUETTE====================================
-- Requête SQL de chargement de la table Vente à partir de la table BNNE.

INSERT INTO Vente (IdProduit, IdDate, IdClient, IdVendeur, PrixUnitaire, Quantité)
SELECT IdProduit, IdDate, IdClient, IdVendeur, PrixUnitaire, Quantité
FROM BNNE, Produit, Vendeur, Client, Date
WHERE BNNE.CodeProduit = Produit.CodeProduit 
  AND BNNE.nomClient = Client.nomClient 
  AND BNNE.date = Date.date 
  AND BNNE.matricule = Vendeur.matricule;


SELECT *
  FROM Vente;

INSERT INTO Produit (IdProduit, CodeProduit, libelléProduit, Marque)
SELECT IdProduit, CodeProduit, libelléProduit, Marque
FROM BNNE
WHERE BNNE.CodeProduit = Produit.CodeProduit 
  
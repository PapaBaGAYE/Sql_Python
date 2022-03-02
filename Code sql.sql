DECLARE 
i INTEGER, 
Taille INTEGER

SET i = 1;
SET Taille= (select count(*) from SRC_vente) ;
WHILE i <= Taille
BEGIN
    BEGIN TRY
    INSERT INTO SAS_Vente (NumLigne, CodeClient, CodeProduit, DateVente, PrixUnitaire, Quantité)
    SELECT CodeClient, CodeProduit, DateVente, PrixUnitaire, Quantité FROM SRC_Vente where NumLigne = i
    END TRY
    BEGIN CATCH
    INSERT INTO REJET_Vente (NumLigne, CodeClient, CodeProduit, DateVente, PrixUnitaire, Quantité, motif_rejet)
    SELECT CodeClient, CodeProduit, DateVente, PrixUnitaire, Quantité, MESSAGE_ERROR() FROM SRC_Vente where NumLigne = i
    END CATCH
  SET i = i + 1;
END

Alter table SRC_vente add NumLigne INT Identify(1, 1)

-- https://www.microsoft.com/fr-fr/sql-server/sql-server-downloads | express
    -- Télecharger le média
-- https://www.microsoft.com/fr-FR/download/details.aspx?id=58494

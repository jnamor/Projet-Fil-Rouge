CREATE DATABASE Fil_Rouge ;
USE Fil_Rouge ;

CREATE TABLE Catégorie(
   Code_Catégorie CHAR(1),
   Catégorie CHAR(8),
   PRIMARY KEY(Code_Catégorie)
);

CREATE TABLE Année(
   Code_Année CHAR(4),
   PRIMARY KEY(Code_Année)
);

CREATE TABLE Pays(
   Area_Code CHAR(3),
   Area CHAR(52),
   PRIMARY KEY(Area_Code)
);

CREATE TABLE Météo(
   Area_Code CHAR(3),
   Code_Année CHAR(4),
   Temperature_C CHAR(5),
   Rainfall_MM CHAR(5),
   PRIMARY KEY(Area_Code, Code_Année),
   FOREIGN KEY(Area_Code) REFERENCES Pays(Area_Code),
   FOREIGN KEY(Code_Année) REFERENCES Année(Code_Année)
);

CREATE TABLE Details_Pays(
   Area_Code CHAR(3),
   Code_Année CHAR(4),
   Populations CHAR(20),
   Sous_nutrition CHAR(10),
   Investissement_Alimentaire CHAR(10),
   Life_expectancy_at_birth__Both_ CHAR(4),
   Life_expectancy_at_age_60__Both CHAR(4),
   Healthy_life_expectancy_at_birth__Both_ CHAR(4),
   Healthy_life_expectancy_at_age_60__Both_ CHAR(4),
   PRIMARY KEY(Area_Code, Code_Année),
   FOREIGN KEY(Code_Année) REFERENCES Année(Code_Année),
   FOREIGN KEY(Area_Code) REFERENCES Pays(Area_Code)
);

CREATE TABLE Produit(
   Code_Produit CHAR(4),
   Item CHAR(28),
   Code_Catégorie CHAR(1) NOT NULL,
   PRIMARY KEY(Code_Produit),
   FOREIGN KEY(Code_Catégorie) REFERENCES Catégorie(Code_Catégorie)
);

CREATE TABLE Terres(
   Area_Code CHAR(3),
   Code_Année CHAR(4),
   Arable_land CHAR(10),
   Land_under_permanent_crops CHAR(10),
   Cropland CHAR(10),
   Land_under_perm__meadows_and_pastures CHAR(10),
   Agriculture_area_actually_irrigated CHAR(10),
   Land_area_equipped_for_irrigation CHAR(10),
   Agriculture_area_under_organic_agric_ CHAR(10),
   PRIMARY KEY(Area_Code, Code_Année),
   FOREIGN KEY(Area_Code) REFERENCES Pays(Area_Code),
   FOREIGN KEY(Code_Année) REFERENCES Année(Code_Année)
);

CREATE TABLE Bilan_Alimentaire(
   Area_Code CHAR(3),
   Code_Année CHAR(4),
   Code_Produit CHAR(4),
   Production CHAR(10),
   Import_Quantity CHAR(10),
   Stock_Variation CHAR(10),
   Domestic_supply_quantity CHAR(10),
   Processing CHAR(10),
   Residuals CHAR(10),
   Food CHAR(10),
   Food_supply_quantity__kg_capita_yr_ CHAR(10),
   Food_supply__kcal_capita_day_ CHAR(10),
   Protein_supply_quantity__g_capita_day_ CHAR(10),
   Fat_supply_quantity__g_capita_day_ CHAR(10),
   Export_Quantity CHAR(10),
   Losses CHAR(10),
   Feed CHAR(10),
   Seed CHAR(10),
   Other_uses__non_food_ CHAR(10),
   Tourist_consumption CHAR(10),
   Unit CHAR(20),
   Valeur CHAR(15),
   PRIMARY KEY(Area_Code, Code_Année, Code_Produit),
   FOREIGN KEY(Code_Produit) REFERENCES Produit(Code_Produit),
   FOREIGN KEY(Code_Année) REFERENCES Année(Code_Année),
   FOREIGN KEY(Area_Code) REFERENCES Pays(Area_Code)
);


SELECT * FROM Bilan_Alimentaire ;
SELECT COUNT(*) FROM Bilan_Alimentaire ;

SELECT Bilan_Alimentaire.* 
FROM Bilan_Alimentaire 
LEFT JOIN Pays 
  ON Pays.Area_Code = Bilan_Alimentaire.Area_Code 
WHERE Pays.Area_Code IS NULL ;

SET GLOBAL FOREIGN_KEY_CHECKS=0 ;
SET GLOBAL FOREIGN_KEY_CHECKS=1 ;

SELECT Area_Code, ROUND(SUM(Production)) AS "Production" FROM Bilan_Alimentaire WHERE Area_Code < 2 ;
SELECT * FROM Bilan_Alimentaire WHERE Area_Code < 2 ;
SELECT * FROM Pays ;
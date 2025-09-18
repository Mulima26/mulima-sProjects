
Create table Crops(
CropID INT PRIMARY KEY IDENTITY(1,1),
CropName Varchar(50) NOT NULL,
Season TEXT,
CropType TEXT,
);

INSERT INTO Crops(CropName,Season,CropType)
VALUES('Maize','Rainy Season','Cereal'),
('Sorghum','Rainy Season','Cereal'),
('Millet','Rainy Season','Cereal'),
('Cassava','Hot Season','Edible root'),
('Groundnuts','Rainy Season','Legume'),
('Lettuce','Autumn Season','Vegetable'),
('Rice','Spring Season','Cereal'),
('Beans','Rainy Season','Legume'),
('Apples','Summer Season','Fruit'),
('Banana','All year round','Bulb'),
('Cabbage','fall Season','Vegetable'),
('Rape','All year round','vegetable'),
('Onion','All year round','bulb'),
('Oranges','Rain Season','Fruit'),
('Tomato','All year round','Vegetable/Fruit');

select*from crops

Create table Animal(
AnimalID INT PRIMARY KEY IDENTITY(20,3),
AnimalName Varchar(25),
AType varchar(100),

);

INSERT INTO ANIMAL(AnimalName,AType)
VALUES('Goat','For sale'),
('Fish','For Keeping'),
('Chicken','For sale'),
('Cow','For sale'),
('Pig','For sale'),
('Guinea Fowls','For sale'),
('Turkey','For Keeping'),
('Horse','For sale'),
('Bull','For keeping'),
('Guinea Pig','For sale'),
('Dogs','For Keeping'),
('Quail','For sale'),
('Sheep','For sale'),
('Cat','For keeping'),
('Duck','For sale');

select*from animal



CREATE TABLE Products(
ProdID INT PRIMARY KEY IDENTITY(1,2) NOT NULL,
ProdName VARCHAR(50)NOT NULL,
AnimalID int FOREIGN KEY REFERENCES Animal(AnimalID),
Price VARCHAR(1000) NOT NULL,
);


INSERT INTO Products(ProdName,AnimalID,Price)
VALUES('Goat Meat','20','K100'),
('Full Chicken','26','K150'),
('Chicken Wings','26','K80'),
('Chicken offals','26','K200'),
('Chicken Sausage','26','K100'),
('Beef Sausage','29','K100'),
('Cow Offals','29','K100'),
('Milk','29','K190'),
('Beef','29','K100'),
('Pork','32','K70'),
('Polony','32','K100'),
('Turkey meat','38','K100'),
('Eggs','26','K50'),
('Fish Fillet','23','K100'),
('Quail meat','53','K135');

Select*from Products


--Removed yieldID fk--
Create table Activities(
ActivityID VARCHAR(25) PRIMARY KEY ,
ActivityName VARCHAR(60) NOT NULL,
CropID int FOREIGN KEY REFERENCES Crops(CropID),
);

INSERT INTO Activities(ActivityID,ActivityName,CropID)
VALUES('P10','Planting','1'),
('DI7','Drip Irrigation','2'),
('MI2','Micro Irrigation','4'),
('H1','Harvest','3'),
('F50','Fertilizing','6'),
('F51','Fertilizing','7'),
('P4','Planting','5'),
('DI3','Drip Irrigation','9'),
('P1','Planting','10'),
('DI4','Drip Irrigation','8'),
('DI6','Drip Irrigation','11'),
('F09','Fertilization','13'),
('P5','Planting','14'),
('S9','Sub Irrigation','15'),
('DI9','Drip Irrigation','12');

Select*from activities


Create table Farmer (
FarmerID int primary key identity(1,1) not null,
OwnersName VARCHAR(80) ,
PhoneNo VARCHAR(12) UNIQUE,
NRC VARCHAR(11) UNIQUE,
Email varchar(255) UNIQUE,
CropID INT FOREIGN KEY REFERENCES Crops(CropID),
ProdID INT FOREIGN KEY REFERENCES Products(ProdID),
AnimalID INT FOREIGN KEY REFERENCES Animal(AnimalID),
ActivityID VARCHAR(25) FOREIGN KEY REFERENCES Activities(ActivityID),
Profit DECIMAL(10,2));

INSERT INTO Farmer(OwnersName,PhoneNo,NRC,Email,CropID,ProdID,AnimalID,ActivityID,Profit)
Values('John Mwanza', '0978821213', '610211/10/5','john@gmail.com','4','3','20','DI3','100.00'),
('Jessy Maiyn', '0763392980', '776233/10/2','jessy@gmail.com','1','9','26','DI4','190.00'),
('Purity Banda', '0978844493', '910331/4/4','purrii@gmail.com','7','7','26','DI6','100.00'),
('Mayhem Salome', '0779921200', '876311/10/1','mayhem@gmail.com','9','5','20','DI7','50.00'),
('Michael Chipili', '0957821213', '220211/10/1','michael29@gmail.com','3','3','29','DI9','160.00'),
('Chanda Johns', '0978821345', '910671/13/1','chandaj@gmail.com','8','13','29','F09','180.00'),
('Muchindu Milimo', '0789821213', '245212/10/1','muchii@gmail.com','11','9','26','F50','105.00'),
('Getrude Phiri', '0978821443', '498711/7/1',' getrude@gmail.com','2','19','32','F51','120.00'),
('Regina Habanyama', '0966441221', '914411/10/1','reggie@gmail.com','5','17','53','H1','135.00'),
('James Dahome', '0967821219', '670211/2/3','james@gmail.com','12','15','38','MI2','170.00'),
('Mainza Chona', '0975521283', '910555/1/1','mainzac@gmail.com','15','27','26','P1','200.00'),
('Juliet Chongo', '0978898213', '910443/7/2','juliet@gmail.com','13','29','26','P10','20.00'),
('Lutangu Lubosi', '0976681213', '333211/1/1','lutangu@gmail.com','14','23','32','P4','180.00'),
('Gilbert Mainza', '0978821333', '860212/3/1','gilbert@gmail.com','6','21','32','P5','150.00'),
('Brenda Chabala', '0966821214', '710211/9/1','brenda@gmail.com','6','21','38','S9','90.00');

SELECT *FROM Farmer

Create table Yield (
YieldID int PRIMARY KEY IDENTITY (1,1),
CropID int FOREIGN KEY REFERENCES Crops(CropID),
FarmerID int FOREIGN KEY REFERENCES FARMER(FarmerID),
YieldType VARCHAR(50) NOT NULL,
YieldSize int NOT NULL,
Y_Year DATE NOT NULL,
);

INSERT INTO Yield(CropID,FarmerID,YieldType,YieldSize,Y_Year)
VALUES('1','1','Sale','300','2023-01-03'),
('2','2','Sale','40','2021-02-11'),
('3','3','Sale','100','2023-05-03'),
('4','4','Consumption','80','2013-02-02'),
('5','5','Sale','300','2023-04-04'),
('6','6','Sale','500','2022-01-03'),
('7','7','Consumption','10','2022-04-12'),
('8','8','Consumption','20','2022-09-09'),
('9','9','Sale','100','2023-07-07'),
('10','10','Sale','210','2018-03-08'),
('11','11','Sale','100','2011-08-02'),
('12','12','Sale','100','2019-02-05'),
('13','13','Consumption','1000','2021-07-07'),
('14','14','Sale','450','2003-03-05'),
('15','15','Consumption','300','2015-06-06');

Select*from Yield


Create table Farm(
FarmID int Primary key identity (4,1) not null,
FarmName varchar(100),
FarmType text,
FLocation VARCHAR(80),
FarmerID int FOREIGN KEY REFERENCES FARMER(FarmerID),
YieldID int FOREIGN KEY REFERENCES Yield(YieldID)
);

Insert into Farm(FarmName,FarmType,FLocation,FarmerID,YieldID)
Values('Mainza Farms','Commercial Farm','Gwembe','1','1'),
('G George Farms','Subsistence Farm','Lusaka','2','4'),
('Fatima Farms','Subsistence Farm','Lusaka','3','7'),
('Dimba Farms','Subsistence Farm','Chikuni','4','8'),
('Kalimba Farms','Commercial Farm','Lusaka','5','2'),
('Zambeef Farms','Commercial Farm','Lusaka','6','3'),
('Brenda Farms','Subsistence Farm','Mpika','7','5'),
('James Farm','Subsistence Farm','Chirundu','8','6'),
('Agriserve Agro','Commercial Farm','Lusaka','9','9'),
('Michael Farm','Subsistence Farm','Chongwe','10','10'),
('Lake Harvest Farm','Commercial Farm','Lusaka','11','12'),
('Phiri Farms','Subsistence Farm','Mongu','12','13'),
('Fruit and veg city','Commercial Farm','Chipata','13','15'),
('Chongo Farms','Subsistence Farm','Ndola','14','11'),
('Chona Farms','Commercial Farm','Solwezi','15','14');

SELECT *FROM FARM


/*Q2. Query displaying the total yield for each type of crop for each farmer in the yr 2022 */

SELECT f.OwnersName,f.FarmerID,c.CropName, c.CropID, SUM(y.YieldSize) AS OverallYield2022
FROM Farmer f
INNER JOIN Yield y ON f.FarmerID = y.FarmerID
INNER JOIN Crops c ON y.CropID = c.CropID
WHERE YEAR(y.Y_Year) = 2022
GROUP BY f.OwnersName,f.FarmerID, c.CropID,c.CropName
ORDER BY f.OwnersName,f.FarmerID,c.CropName, c.CropID;



/* Q3. Query showing displaying total crop yield for farmers who have performed "Drip Irrigation" activities*/
SELECT f.FarmerID, f.OwnersName,a.ActivityName, SUM(y.YieldSize) AS TotalCropYield
FROM Farmer f
JOIN Activities a ON f.ActivityID = a.ActivityID
JOIN Yield y ON f.FarmerID = y.YieldID
WHERE a.ActivityName = 'drip irrigation'
GROUP BY f.FarmerID, f.OwnersName, ActivityName;

/*Q4. Query to define a stored procedure that can create a new membership record whenever a new farmer is added to db */ 
/* Placing 'GO' batch (Separation statement) without this sql statements for this view cannot run */
GO
CREATE PROCEDURE AddMember
(
    @OwnersName VARCHAR(80),
    @PhoneNo VARCHAR(12),
    @NRC VARCHAR(11),
    @Email VARCHAR(255),
    @CropID INT,
    @ProdID INT,
    @AnimalID INT,
    @ActivityID VARCHAR(25),
    @Profit DECIMAL(10,2)
)
AS
BEGIN
   /*Inserting a new farmer record into the Farmer table*/
    INSERT INTO Farmer(OwnersName, PhoneNo, NRC, Email, CropID, ProdID, AnimalID, ActivityID,  Profit)
    VALUES (@OwnersName, @PhoneNo, @NRC, @Email, @CropID, @ProdID, @AnimalID, @ActivityID,  @Profit);
END;
GO
/*EXAMPLE*/
/* EXEC Statement to Call the stored procedure in order to add a new farmer*/
EXEC AddMember
    @OwnersName = 'Josephine Lubasi',
    @PhoneNo = '0977873398',
    @NRC = '661785/9/3',
    @Email = 'jossy@gmail.com',
    @CropID = '5',  
    @ProdID = '27',  
    @AnimalID = '32', 
    @ActivityID = 'P10', 
    @Profit = '250.00';

	/*Josephine has been added to the farmer table. Display Farmer details to check*/
	select*from Farmer

	/* Q5. Create a view for average yield per crop across all farmers in previous year*/
	/* Placing batch (Separation statement) without this sql statements for this view cannot run */
	GO 
	CREATE VIEW AverageYieldPerCrop AS
SELECT all c.CropID, AVG(y.YieldSize) AS AverageYield
FROM Crops c
JOIN Yield y ON c.CropID = y.CropID
WHERE YEAR(y.Y_Year) = YEAR(GETDATE()) - 1
GROUP BY c.CropID;
 GO

 SELECT * FROM AverageYieldPerCrop;

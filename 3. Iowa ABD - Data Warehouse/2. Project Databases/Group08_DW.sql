CREATE DATABASE [BI_PROJECT_DW];
GO

USE [BI_PROJECT_DW];
GO

CREATE TABLE Dim_Product (
SK_Product INT identity(1, 1) PRIMARY KEY,
BK_Product INT NOT NULL,
Item_Description NVARCHAR (300) NOT NULL,
Category_Name NVARCHAR (300) NOT NULL,
Sub_Category_Name NVARCHAR (300) NOT NULL,
Pack INT NOT NULL,
Bottle_Volume INT NOT NULL,
State_Bottle_Cost DECIMAL (18,2)NOT NULL,
State_Bottle_Retail DECIMAL (18,2)NOT NULL,
SCD_Start_Date DATETIME NOT NULL,
SCD_End_Date DATETIME NOT NULL
);

CREATE TABLE Dim_Store (
SK_Store INT identity(1, 1) PRIMARY KEY,
BK_Store INT NOT NULL,
Store_Name NVARCHAR (300) NOT NULL,
Proper_Address NVARCHAR (300) NOT NULL,
City NVARCHAR (300) NOT NULL,
Zip_Code INT NOT NULL,
County_Number INT NOT NULL,
County NVARCHAR (300) NOT NULL,
SCD_Start_Date DATETIME NOT NULL,
SCD_End_Date DATETIME NOT NULL
);

CREATE TABLE Dim_Vendor (
SK_Vendor INT identity(1, 1) PRIMARY KEY,
BK_Vendor INT NOT NULL,
Vendor_Name NVARCHAR (300) NOT NULL,
Manager_Name NVARCHAR (300) NOT NULL,
Contact_Details NVARCHAR (300) NOT NULL,
SCD_Start_Date DATETIME NOT NULL,
SCD_End_Date DATETIME NOT NULL
);

CREATE TABLE Dim_Date (
SK_Date INT PRIMARY KEY,
Proper_Date DATE NOT NULL,
Full_Date NVARCHAR (50) NOT NULL,
Day_Number INT NOT NULL,
Day_Name NVARCHAR (50) NOT NULL,
Month_Number INT NOT NULL,
Month_Name NVARCHAR (50) NOT NULL,
Trimester_Number INT NOT NULL,
Trimester_Name NVARCHAR (50) NOT NULL,
Semester_Number INT NOT NULL,
Semester_Name NVARCHAR (50) NOT NULL,
Year INT NOT NULL
);

CREATE TABLE Dim_Shipping (
SK_Shipping INT identity(1, 1) PRIMARY KEY,
BK_Shipping INT NOT NULL,
Carrier_Name NVARCHAR (300) NOT NULL,
Shipping_Category NVARCHAR (300) NOT NULL,
Shipping_Class NVARCHAR (300),
SCD_Start_Date DATETIME NOT NULL,
SCD_End_Date DATETIME NOT NULL
);

CREATE TABLE Fact_Sales (
FK_Date INT FOREIGN KEY REFERENCES Dim_Date (SK_Date),
FK_Vendor INT FOREIGN KEY REFERENCES Dim_Vendor (SK_Vendor),
FK_Product INT FOREIGN KEY REFERENCES Dim_Product (SK_Product),
FK_Store INT FOREIGN KEY REFERENCES Dim_Store (SK_Store),
FK_Shipping INT FOREIGN KEY REFERENCES Dim_Shipping (SK_Shipping),
Sales_Quantity INT NOT NULL,
Sales_Amount DECIMAL (18,2) NOT NULL,
Cost_Amount DECIMAL (18,2) NOT NULL,
Profit_Amount DECIMAL (18,2) NOT NULL
	CONSTRAINT PK_Fact_Sales PRIMARY KEY (
		FK_Date ASC,
		FK_Vendor ASC,
		FK_Product ASC,
		FK_Store ASC,
		FK_Shipping ASC
		)
	);
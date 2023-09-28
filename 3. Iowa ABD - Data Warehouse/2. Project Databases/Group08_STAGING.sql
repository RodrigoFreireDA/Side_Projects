CREATE DATABASE [BI_PROJECT_STG];
GO

USE [BI_PROJECT_STG];
GO

CREATE TABLE Stg_Dim_Product (
BK_Product INT PRIMARY KEY,
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

CREATE TABLE Stg_Dim_Store (
BK_Store INT PRIMARY KEY,
Store_Name NVARCHAR (300) NOT NULL,
Proper_Address NVARCHAR (300) NOT NULL,
City NVARCHAR (300) NOT NULL,
Zip_Code INT NOT NULL,
County_Number INT NOT NULL,
County NVARCHAR (300) NOT NULL,
SCD_Start_Date DATETIME NOT NULL,
SCD_End_Date DATETIME NOT NULL
);

CREATE TABLE Stg_Dim_Vendor (
BK_Vendor INT PRIMARY KEY,
Vendor_Name NVARCHAR (300) NOT NULL,
Manager_Name NVARCHAR (300) NOT NULL,
Contact_Details NVARCHAR (300) NOT NULL,
SCD_Start_Date DATETIME NOT NULL,
SCD_End_Date DATETIME NOT NULL
);

CREATE TABLE Stg_Dim_Date (
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

CREATE TABLE Stg_Dim_Shipping (
BK_Shipping INT PRIMARY KEY,
Carrier_Name NVARCHAR (300) NOT NULL,
Shipping_Category NVARCHAR (300) NOT NULL,
Shipping_Class NVARCHAR (300),
SCD_Start_Date DATETIME NOT NULL,
SCD_End_Date DATETIME NOT NULL
);

CREATE TABLE Stg_Fact_Sales (
FK_Date DATE,
FK_Vendor INT,
FK_Product INT,
FK_Store INT,
FK_Shipping INT,
Sales_Quantity INT NOT NULL,
Sales_Amount DECIMAL (18,2) NOT NULL,
Cost_Amount DECIMAL (18,2) NOT NULL,
Profit_Amount DECIMAL (18,2) NOT NULL,
	CONSTRAINT PK_Fact_Sales PRIMARY KEY (
		FK_Date ASC,
		FK_Vendor ASC,
		FK_Product ASC,
		FK_Store ASC,
		FK_Shipping ASC
		)
	);


/* **********************************************************
 *
 * Create Log table for ETL errors so that we can
 * save errors from each individual ETL run into
 * the Staging Area.
 * **********************************************************/

CREATE TABLE Log_Stg_Errors (
    Log_Id INT identity(1, 1) PRIMARY KEY,
	Etl_Name NVARCHAR(50) NULL,
	Error NVARCHAR(max) NULL,
	Source NVARCHAR(100) NULL
	);


/* **********************************************************
 *
 * Create Log table for ETL action to save information 
 * regarding each individual ETL run into the Staging Area.
 * 
 *   
 * **********************************************************/

CREATE TABLE Log_Stg_Etl (
	Log_Id INT identity(1, 1) PRIMARY KEY,
	Etl_Name NVARCHAR(50) NULL,
	Etl_Desc NVARCHAR(50) NULL
	);
-- MODULE : B9DA102 Data Storage Solutions for Data Analytics
-- GROUP B (Slot 4)

-- Subramaniam Kazhuparambil (10524303)
-- Rahul Ramchandra Uppari (10523807)
-- Deeksha Sharma (10522688) 
-- Mohit Singh (10525046)

-- CREATE QUERIES for creating the Dimensions and Fact Tables of the Data Warehouse --

--CREATE DATABASE carCrashDW
--GO

--USE carCrashDW
--GO

CREATE TABLE Vehicle_Dim 
( VehicleKey INT NOT NULL IDENTITY,
VehicleID NVARCHAR(255),
VehicleBodyType VARCHAR(100),
VehicleDamageExtent VARCHAR(50),
VehicleMovement VARCHAR(50),
SpeedLimit INT,
DriverlessVehicle VARCHAR(50),
ParkedVehicle VARCHAR(50),
VehicleYear INT, 
EquipmentProblem VARCHAR(MAX),
PRIMARY KEY (VehicleKey));
GO

CREATE TABLE Driver_Dim
( PersonKey INT NOT NULL IDENTITY,
PersonID NVARCHAR(255),
DriverLicenseState VARCHAR(MAX),
InjurySeverity VARCHAR(255),
DriverDistractedBy VARCHAR(255),
DriverSubstanceAbuse VARCHAR(255),
DriverAtFault VARCHAR(255),
NonMotoristSubstanceAbuse VARCHAR(255),
PRIMARY KEY (PersonKey));
GO

CREATE TABLE CrashConditions_Dim
( CrashConditionsKey INT NOT NULL IDENTITY,
LocalCaseNumber NVARCHAR(255),
StreetName NVARCHAR(255),
StreetType NVARCHAR(255),
TrafficControl NVARCHAR(255),
CollisionType NVARCHAR(255),
Weather NVARCHAR(255),
SurfaceCondition NVARCHAR(255),
Light NVARCHAR(255),
PRIMARY KEY (CrashConditionsKey));
GO

CREATE TABLE CaseDetail_Dim
( CaseKey INT NOT NULL IDENTITY,
ReportNumber NVARCHAR(255),
AgencyName VARCHAR(255),
ACRSReportType VARCHAR(255),
PRIMARY KEY (CaseKey));
GO

CREATE TABLE CarCrashDate_Dim
( CarCrashDateKey INT NOT NULL IDENTITY,
CrashDate DATE,
DayOfWeek_ CHAR(15),
DayType CHAR(20),
DayOfMonth_ INT,
Month_	CHAR(10),
Quarter_ CHAR(2),
Year_ INT,
PRIMARY KEY (CarCrashDateKey));
GO

CREATE TABLE CrashAnalysis_Fact
( VehicleKey INT,
PersonKey INT, 
CrashConditionsKey INT, 
CaseKey INT,
CarCrashDateKey INT,
TimeOfDay TIME(0),
PRIMARY KEY (VehicleKey, PersonKey, CrashConditionsKey, CaseKey, CarCrashDateKey),
FOREIGN KEY (VehicleKey) REFERENCES Vehicle_Dim (VehicleKey),
FOREIGN KEY (PersonKey) REFERENCES Driver_Dim (PersonKey),
FOREIGN KEY (CrashConditionsKey) REFERENCES CrashConditions_Dim (CrashConditionsKey),
FOREIGN KEY (CaseKey) REFERENCES CaseDetail_Dim (CaseKey),
FOREIGN KEY (CarCrashDateKey) REFERENCES CarCrashDate_Dim (CarCrashDateKey)
);
GO
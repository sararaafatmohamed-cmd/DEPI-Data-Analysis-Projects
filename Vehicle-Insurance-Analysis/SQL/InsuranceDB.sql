--Create Database
Create DataBase VehicleInsuranceDB
use VehicleInsuranceDB

--USE Database
Create Schema Insurance;

--Create table Dim_Customer
Create Table Insurance.Dim_Customer(
Customer varchar(30) primary key,
State varchar(50),
Education varchar(50),
EmploymentStatus varchar(50),
Gender varchar(1),
Location_Code varchar(50),
Marital_Status varchar(50))

--Create table Dim_Date
Create table Insurance.Dim_Date(
Full_Date date primary key,
Year int,
Month int,
Quarter int,
Day int,
Month_Name varchar(50))


--Create table Dim_Policy
Create table Insurance.Dim_Policy(
Policy_ID varchar(30) primary key,
Policy varchar(50),
Policy_Type varchar(50),
Renew_Offer_Type varchar(30),
Sales_Channel varchar(30),
Vehicle_Class varchar(30),
Vehicle_Size varchar(30),
Coverage varchar(30))

--Create table Fact_Insurance
Create table Insurance.Fact_Insurance(
Customer varchar(30) foreign key references Insurance.Dim_Customer(Customer),
Policy_ID varchar(30) foreign key references Insurance.Dim_Policy(Policy_ID),
primary key (Customer,Policy_ID),
Customer_Lifetime_Value DECIMAL(18,2),
Response varchar(3),
Effective_To_Date date references Insurance.Dim_Date(Full_Date) ,
Income int,
Monthly_Premium_Auto INT,
Months_Since_Last_Claim int,
Months_Since_Policy_Inception int,
Number_of_Open_Complaints int,
Number_of_Policies int,
Total_Claim_Amount DECIMAL(18,2))


--Select ALL Data IN tables
select * from Insurance.Dim_Customer;

select * from Insurance.Dim_Date;

select * from Insurance.Dim_Policy;

select * from Insurance.Fact_Insurance;

---Select Count DAta in Tables

SELECT COUNT(*) FROM Insurance.Dim_Customer;
SELECT COUNT(*) FROM Insurance.Dim_Date;
SELECT COUNT(*) FROM Insurance.Dim_Policy;
SELECT COUNT(*) FROM Insurance.Fact_Insurance;

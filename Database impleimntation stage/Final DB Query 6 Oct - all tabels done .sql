create Table Population (
Zipcode_ID int primary key ,
Population_Num int check (Population_Num>0 ));


create table Location (
Location_ID int IDENTITY  primary Key ,
City Varchar(50) ,
Zipcode int foreign key references Population(Zipcode_ID),
Latitude FLOAT,
Longitude FLOAT
);



CREATE TABLE Churn_Category(
Churn_Category_ID INT PRIMARY KEY ,
Churn_Category VARCHAR(50) CHECK (Churn_Category IN 
('Competitor','Dissatisfaction','Price', 'Attitude', 'Other')));



CREATE TABLE Churn_Reason(
    Churn_Reason_ID INT PRIMARY KEY,
    Churn_Category_ID INT foreign key references Churn_Category(Churn_Category_ID),
    Churn_Reason VARCHAR(150) CHECK (
        Churn_Reason IN (
            'Competitor offered more data', 'Competitor made better offer',
            'Limited range of services', 'Extra data charges', 'Competitor had better devices',
            'Dont know', 'Service dissatisfaction', 'Lack of affordable download/upload speed',
            'Product dissatisfaction', 'Long distance charges', 'Poor expertise of online support',
            'Attitude of support person', 'Network reliability', 'Competitor offered higher download speeds',
            'Moved', 'Price too high', 'Attitude of service provider', 'Poor expertise of phone support',
            'Deceased', 'Lack of self-service on Website')));



CREATE TABLE Contract (
    Contract_ID INT PRIMARY KEY,
    Contract_Type VARCHAR(50) CHECK 
	(Contract_Type IN ('Month-to-Month', 'One Year', 'Two Year'))
);




CREATE TABLE Status (
    Status_ID INT PRIMARY KEY,
    Customer_Status VARCHAR(50) CHECK 
	(Customer_Status IN ('Churned', 'Stayed', 'Joined'))
);



create table Customer(
Customer_ID int Primary Key, 
Location_ID int foreign key references Location(Location_ID), 
Status_ID int foreign key references Status(Status_ID),
Churn_reason_ID int foreign key references Churn_Reason(Churn_Reason_ID), 
Contract_ID int foreign key references Contract(Contract_ID), 
Number_Of_Referrals int Default 0, 
Referred_A_Friend bit Default 0 CHECK(Referred_A_Friend in (0,1)),
Gender varchar(10) Default 'Male' CHECK(Gender in ('Famale','Male')), 
Age int CHECK(Age between 18 and 120),
Married bit Default 0 CHECK(Married in (0,1)), 
Dependents bit Default 0 CHECK(Dependents in (0,1)), 
Number_Of_Dependents int Default 0,
Quarter varchar(10), 
Tenure_In_Months int, 
Offer varchar(10) CHECK(Offer in ('A','B','C','D','E','None')), 
Paperless_Billing bit Default 0 CHECK(Paperless_Billing in (0,1)) , 
Payment_Method varchar(50) Default 'Bank_Transfe' CHECK
(Payment_Method in ('Bank Withdrawal', 'Credit Card', 'Mailed Check')),
Monthly_Charge Float,
Total_Charges Float, 
Total_Refunds Float, 
Total_Revenue Float, 
CLTV Float, 
Churn_Score int CHECK(Churn_Score between 0 and 100), 
Satisfaction_Score int CHECK(Satisfaction_Score between 1 and 5));




CREATE TABLE Internet_Service (
    Internet_Service_ID INT PRIMARY KEY,
    Internet_Type VARCHAR(50) CHECK 
	(Internet_Type IN ('Cable', 'DSL', 'Fiber optic'))
);


create Table Phone_Service (
Phone_Service_ID int PRIMARY KEY ,
Customer_Id int foreign key references Customer(Customer_ID)  ,
Multiple_Lines bit Default 0 check (Multiple_Lines in(0,1)) ,
Avg_Monthly_Long_Distance_Charges decimal(10,3) CHECK 
(Avg_Monthly_Long_Distance_Charges >= 0),
Total_Long_Distance_Charges decimal(10,3) CHECK 
(Total_Long_Distance_Charges >= 0)
);

CREATE TABLE Customer_Internet (
	Customer_ID int foreign key references Customer(Customer_ID), 
	Internet_Service_ID int foreign key references Internet_Service(Internet_Service_ID),
	PRIMARY KEY (Customer_ID, Internet_Service_ID),
    Online_Security bit Default 0 CHECK(Online_Security in (0,1)),
    Online_Backup bit Default 0 CHECK(Online_Backup in (0,1)),
	Device_Pro_Plan bit Default 0 CHECK(Device_Pro_Plan in (0,1)),
	Premium_TSupport bit Default 0 CHECK(Premium_TSupport in (0,1)),
	Streaming_TV bit Default 0 CHECK(Streaming_TV in (0,1)),
	Streaming_Movies bit Default 0 CHECK(Streaming_Movies in (0,1)),
	Streaming_Music bit Default 0 CHECK(Streaming_Music in (0,1)),
	Unlimited_Data bit Default 0 CHECK(Unlimited_Data in (0,1)),
	Avg_Monthly_GB int Default 0,
    Total_Extra_Data_Charges int Default 0,
);



CREATE TABLE Call(
Call_ID int primary key ,
Customer_Id INT FOREIGN KEY REFERENCES Customer (Customer_ID),
Agent VARCHAR(50),
Date_Of_Call DATE ,
Time_Of_Call TIME,
Resolved bit Default 0 CHECK(Resolved in (0,1)),
Answered bit Default 0 CHECK(Answered in (0,1)),
Topic varchar(50)  CHECK(Topic in 
('Contract related','Technical Support', 'Payment related', 'Admin Support', 'Streaming')),
Speed_Of_Answer_In_Seconds int CHECK (Speed_Of_Answer_In_Seconds >= 0),
Duration Time ,
Satisfaction_Rating int CHECK (Satisfaction_Rating BETWEEN 1 AND 5),
)	

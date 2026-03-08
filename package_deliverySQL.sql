create database PackageDelivery;
 
use PackageDelivery;

/***********************************************tables***********************************************/
/*Employee*/
create table Employee(
	identificationID int not null primary key auto_increment,
    Name varchar(50) not null,
    Paternal_Surname varchar(50) not null,
	Marternal_Surname varchar(50),
	Date_Birth date,
	PositionID int not null,
	Employee_Salary decimal(10,2) not null,
	OfficeID int not null,
	Address_EmployeeID  int not null,
	Phone_EmployeeID int not null,
	Email_EmployeeID int not null, 
	StatusID int not null,
	Record_Date Date,
	Record_User_Name varchar(50) not null
);

create table Employee_Position(
	PositionID int not null primary key auto_increment,
	identificationID int not null, 
    Position varchar(50) not null
);

create table Employee_Status(
	StatusID int not null primary key auto_increment,
    IdentificationID int not null,
    Status varchar(10) not null
);

create table Address_Employee(
	Address_EmployeeID int not null primary key auto_increment,
    IdentificationID int not null,
    Country varchar(75) not null,
    Province varchar(75) not null,
    Canton varchar(75) not null,
    Distric varchar(75) not null,
    Street varchar(75) not null
);

create table Office_Employee(
	OfficeID int not null primary key auto_increment,
    IdentificationID int not null,
    Assigned_Office varchar(50) not null,
    Office_Location varchar(75) not null
);

create table Email_Employee(
	Email_EmployeeID int not null primary key auto_increment,
    IdentificationID int not null,
    Email_1 varchar(255) not null,
    Email_2 varchar(255)
);

create table Phone_Employee(
	Phone_EmployeeID int not null primary key auto_increment,
    IdentificationID int not null,
    Phone_1 varchar(20) not null,
    Phone_2 varchar(20)
);

/*Package*/

create table Package(
	Package_NumID int not null primary key auto_increment,
	Package_Description varchar(255) not null,
	Office_Location varchar(255) not null,
	Process_Employee int not null,
	CustomerID int not null,
	Shipping_TypeID int not null,
	Package_StatusID int not null,
	Registration_Date date,
	Registration_User_Name varchar(50) not null	
);

create table Shipping_Type (
	Shipping_typeID int not null primary key auto_increment,
    Package_NumID int not null,
    Shipping_Type varchar(15) not null
);

create table Package_Status(
	Package_StatusID int not null primary key auto_increment,
    Package_NumID int not null,
    Package_Status varchar(25) not null
);

create table Customer(
	CustomerID int not null primary key auto_increment,
    Package_NumID int not null,
    Customer_Name  varchar(50) not null,
    Customer_Identification varchar(20) not null,
    Customer_PhoneID int not null,
    Customer_Addresses varchar(255) not null,
    Customer_EmailID int not null,
    Customer_TypeID int not null,
    Customer_StatusID int not null
);

create table Customer_Type(
	Costumer_TypeID int not null primary key auto_increment,
    CustomerID int not null,
    Customer_Type varchar(20) not null
);

create table Customer_Status(
	Customer_StatusID int not null primary key auto_increment,
    CustomerID int not null,
    Customer_Status varchar(20) not null
);

create table Customer_Phone(
	Customer_PhoneID int not null primary key auto_increment,
    CustomerID int not null,
    Customer_Phone_1 varchar(20) not null,
    Customer_Phone_2 varchar(20) 
);

create table Customer_Email(
	Customer_Email_ID int not null primary key auto_increment,
	CustomerID int not null,
    Customer_Email_1 varchar(255) not null,
    Customer_Email_2 varchar(255)
);

/*Package_Billing*/

create table Package_Billing (
	Invoice_NumberID  int not null primary key auto_increment,
    CustomerID int not null,
    Invoice_Date date,
    DetailsID int not null,
    Registration_Date date,
    Registration_User_Name varchar(50) not null,
    Package_Billing_StatusID int not null
);

create table Package_Billing_Status(
	Package_Billing_StatusID int not null primary key auto_increment,
    Invoice_NumberID int not null,
    Status_Billing varchar(20) not null
);

create table Details(
	DetailsID int not null primary key auto_increment,
    Invoice_NumberID int not null,
    Package_NumberID int not null,
    Shipping_Cost decimal(10,2) not null,
    VAT_Cost decimal(10,2),
    Total_Before_Tax decimal(10,2),
    Invoice_Total decimal(10,2) 
);

/*Vehicle_Inventory*/

create table Vehicle_Inventory(
	Internal_NumberID int not null primary key auto_increment,
    License_Plate varchar(15) not null,
    BrandID int not null,
    Model varchar(50) not null,
    Stock int not null,
    MaintenanceID int not null,
    TypeID int not null,
    StatusID int not null,
    Registration_Date date,
    Registration_User_Name varchar(50) not null
);

create table Maintenance(
	MaintenanceID int not null primary key auto_increment,
    Internal_numberID int not null,
    Maintenance_Date date,
    Maintenance_Description varchar(255) not null,
    Maintenance_type varchar(50) not null
);

create table Brand(
	BrandID int not null primary key auto_increment,
    Internal_numberID int not null,
    Brand varchar(50) not null
);

create table Type_Vehicle(
	TypeID int not null primary key auto_increment,
    Internal_numberID int not null,
    Vehicle_Type varchar(20) not null
);

create table Status_Vehicle(
	StatusID int not null primary key auto_increment,
    Internal_numberID int not null,
    Vehicle_Status varchar(20) not null
);

/***********************************************Insert Data Table***********************************************/

/*Employee table*/

INSERT INTO Employee (Name, Paternal_Surname, Marternal_Surname, Date_Birth, PositionID, Employee_Salary, OfficeID, Address_EmployeeID, Phone_EmployeeID, Email_EmployeeID, StatusID, Record_Date, Record_User_Name)
VALUES 
('María', 'Wang', 'Li', '1990-05-15', 1, 70000.00, 1, 1, 1, 1, 1, '2023-12-12', 'Admin'),
('Nushi', 'Zhang', 'Chen', '1985-08-22', 2, 80000.00, 2, 2, 2, 2, 2, '2023-12-12', 'Admin'),
('Mohammed', 'Liu', 'Devi', '1995-02-10', 3, 65000.00, 3, 3, 3, 3, 3, '2023-12-12', 'Admin'),
('José', 'Yang', 'Huang', '1991-04-05', 4, 52000.00, 4, 4, 4, 4, 4, '2023-12-12', 'Admin'),
('Muhammad', 'Singh', 'Wu', '1988-11-15', 5, 88000.00, 5, 5, 5, 5, 5, '2023-12-12', 'Admin');

INSERT INTO Employee_Position (identificationID, Position)
VALUES
(1, 'Manager'),
(2, 'Developer'),
(3, 'HR Specialist'),
(4, 'Sales Representative'),
(5, 'Marketing Specialist');

INSERT INTO Employee_Status (IdentificationID, Status)
VALUES
(1, 'Active'),
(2, 'Active'),
(3, 'Active'),
(4, 'Active'),
(5, 'Inactive');

INSERT INTO Address_Employee (IdentificationID, Country, Province, Canton, Distric, Street)
VALUES
(1, 'Costa Rica', 'San Jose ', 'Escazú', 'San Sebastián', 'Autopista Bernardo Soto'),
(2, 'Costa Rica', 'San Jose', 'Tibás', 'Carmen', 'Avenida 0as'),
(3, 'Costa Rica', 'San Jose', 'Aserrí', 'Merced', 'Boulevard Los Malinches'),
(4, 'Costa Rica', 'San Jose', 'Tibás', 'Hospital', 'Bulevar Aeropuerto'),
(5, 'Costa Rica', 'San Jose', 'Desamparados', 'Catedral', 'Calle Carranza');

INSERT INTO Office_Employee (IdentificationID, Assigned_Office, Office_Location)
VALUES
(1, 'Office 2', 'San Jose'),
(2, 'Office 5', 'San Jose'),
(3, 'Office 3', 'San Jose'),
(4, 'Office 4', 'San Jose'),
(5, 'Office 1', 'San Jose');

INSERT INTO Email_Employee (IdentificationID, Email_1, Email_2)
VALUES
(1,'mariawangli@gmail.com','mariawangli@gmail.com'),
(2,'nushizhangchen1990@gmail.com','wanglinushi@gmail.com'),
(3,'mohammedliudevi1985@gmail.com','mohammedliudevi@gmail.com'),
(4,'joseyanghuang1978@gmail.com','joseyanghuang@gmail.com'),
(5,'muhammadsinghwu1992@gmail.com',null);

INSERT INTO Phone_Employee (IdentificationID, Phone_1, Phone_2)
VALUES
(1, '111-222-3333', '444-555-6666'),
(2, '777-888-9999', null),
(3, '333-444-5555', null),
(4, '999-000-1111', '222-333-4444'),
(5, '666-777-8888', '888-999-0000');

/***********************************************Vehicle_Inventory***********************************************/

INSERT INTO Vehicle_Inventory (License_Plate, BrandID, Model, Stock, MaintenanceID, TypeID, StatusID, Registration_Date, Registration_User_Name)
VALUES  
('ABC123', 1, 'Toyota Camry', 5, 1, 1, 1, '2022-01-10', 'John Doe'),
('XYZ456', 2, 'Honda Civic', 3, 2, 2, 2, '2022-02-05', 'Jane Smith'),
('MOT789', 3, 'Harley-Davidson Sportster', 2, 3, 3, 3, '2022-03-20', 'Bob Johnson'),
('SUV987', 4, 'Ford Explorer', 4, 4, 4, 4, '2022-04-15', 'Alice Brown'),
('PQR789', 5, 'Chevrolet Malibu', 6, 5, 5, 5, '2022-05-12', 'Eva Green');

INSERT INTO Maintenance (Internal_numberID, Maintenance_Date, Maintenance_Description, Maintenance_type)
VALUES 
(1, '2023-02-15', 'Routine checkup', 'General Review'),
(2, '2023-04-20', 'Oil change and tire rotation', 'Oil Change'),
(3, '2023-01-05', 'Inspect brakes and lights', 'General Review'),
(4, '2023-06-12', 'Replace worn-out tires', 'Tire Change'),
(5, '2023-07-22', 'Check engine and transmission', 'General Review');

INSERT INTO Brand (Internal_numberID, Brand)
VALUES 
(1, 'Toyota'),
(2, 'Honda'),
(3, 'Harley-Davidson'),
(4, 'Ford'),
(5, 'Chevrolet');

INSERT INTO Type_Vehicle (Internal_numberID, Vehicle_Type)
VALUES 
(1, 'Sedan'),
(2, 'Sedan'),
(3, 'Motorcycle'),
(4, 'SUV'),
(5, 'SUV');

INSERT INTO Status_Vehicle (Internal_numberID, Vehicle_Status)
VALUES 
(1, 'Priority'),
(2, 'Normal'),
(3, 'Priority'),
(4, 'Normal'),
(5, 'Normal');

/*Package*/

INSERT INTO Package (Package_Description, Office_Location, Process_Employee, CustomerID, Shipping_TypeID, Package_StatusID, Registration_Date, Registration_User_Name)
VALUES 
('Big box', 'San Jose Office', 1, 1, 1, 1, '2022-01-10', 'John Doe'),
('Medium box', 'San Jose Office', 2, 2, 2, 2, '2022-02-05', 'Jane Smith'),
('Small box', 'San Jose Office', 3, 3, 3, 3, '2022-03-20', 'Bob Johnson'),
('Big box', 'San Jose Office', 4, 4, 4, 4, '2022-04-15', 'Alice Brown'),
('Medium box', 'San Jose Office', 5, 5, 5, 5, '2022-05-12', 'Eva Green');

INSERT INTO Shipping_Type (Package_NumID, Shipping_Type)
VALUES 
(1, 'Priority'),
(2, 'Normal'),
(3, 'economic'),
(4, 'economic'),
(5, 'Normal');

INSERT INTO Package_Status (Package_NumID, Package_Status)
VALUES 
(1, 'Delivered to customer'),
(2, 'Delivered to customer'),
(3, 'In Transit'),
(4, 'In Office'),
(5, 'In Office');

INSERT INTO Customer (Package_NumID, Customer_Name, Customer_Identification, Customer_PhoneID, Customer_Addresses, Customer_EmailID, Customer_TypeID, Customer_StatusID)
VALUES 
(1, 'John Doe', '119060719', 1, '123 Main St, Cityville', 1, 1, 1),
(2, 'Jane Smith', '116578934', 2, '456 Oak St, Townsville', 2, 2, 2),
(3, 'Bob Johnson', '114937508', 3, '789 Pine St, Villagetown', 3, 3, 3),
(4, 'Alice Brown', '116584930', 4, '987 Elm St, Hamletville', 4, 4, 4),
(5, 'Eva Green', '113284590', 5, '789 Birch St, Countryside', 5, 5, 5);

INSERT INTO Customer_Type (CustomerID, Customer_Type)
VALUES 
(1, 'Normal'),
(2, 'VIP'),
(3, 'Normal'),
(4, 'VIP'),
(5, 'Normal');

INSERT INTO Customer_Status (CustomerID, Customer_Status)
VALUES 
(1, 'Active'),
(2, 'Active,'),
(3, 'Active'),
(4, 'Active'),
(5, 'Active');

INSERT INTO Customer_Phone (CustomerID, Customer_Phone_1, Customer_Phone_2)
VALUES 
(1, '123-456-7890', null),
(2, '234-567-8901', '876-543-2109'),
(3, '345-678-9012', null),
(4, '456-789-0123', '654-321-0987'),
(5, '567-890-1234', '543-210-9876');

/*Package_billing*/

INSERT INTO Package_Billing (CustomerID, Invoice_Date, DetailsID, Registration_Date, Registration_User_Name, Package_Billing_StatusID)
VALUES 
(1, '2022-01-10', 1, '2022-01-15', 'John Doe', 1),
(2, '2022-02-05', 2, '2022-02-10', 'Jane Smith', 2),
(3, '2022-03-20', 3, '2022-03-25', 'Bob Johnson', 3),
(4, '2022-04-15', 4, '2022-04-20', 'Alice Brown', 4),
(5, '2022-05-12', 5, '2022-05-15', 'Eva Green', 5);

INSERT INTO Package_Billing_Status (Invoice_NumberID, Status_Billing)
VALUES 
(1, 'Paid'),
(2, 'Pending'),
(3, 'Paid'),
(4, 'Pending'),
(5, 'Paid');

INSERT INTO Details (Invoice_NumberID, Package_NumberID, Shipping_Cost, VAT_Cost, Total_Before_Tax, Invoice_Total)
VALUES 
(1, 1, 25.00, null, null, null),
(2, 2, 15.50, null, null, null),
(3, 3, 30.00, null, null, null),
(4, 4, 20.00, null, null, null),
(5, 5, 35.50, null, null, null);


/**********************************************Foreing key**********************************************/

/*Foreing key Employee*/

alter table employee add foreign key (PositionID) references Employee_Position (PositionID);
Alter table employee add foreign key (OfficeID) references Office_Employee (OfficeID);
Alter table employee add foreign key (Address_EmployeeID) references Address_Employee (Address_EmployeeID);
Alter table employee add foreign key (Phone_EmployeeID) references Phone_Employee(Phone_EmployeeID);
Alter table employee add foreign key (Email_EmployeeID) references Email_Employee (Email_EmployeeID);
Alter table employee add foreign key (StatusID) references Employee_Status (StatusID);

alter table Employee_Position add foreign key (IdentificationID) references Employee(IdentificationID);

alter table Employee_Status add foreign key (IdentificationID) references Employee(IdentificationID);

alter table Address_Employee add foreign key (IdentificationID) references Employee(IdentificationID);

alter table Office_Employee add foreign key (IdentificationID) references Employee(IdentificationID);

alter table Email_Employee add foreign key (IdentificationID) references Employee (IdentificationID);

alter table Phone_Employee add foreign key (IdentificationID) references Employee (IdentificationID);

/*Foreing key Package*/

alter table Package add foreign key (Process_Employee) references Employee (IdentificationID);
alter table Package add foreign key (CustomerID) references Customer (CustomerID);
alter table Package add foreign key (Shipping_TypeID) references Shipping_Type (Shipping_TypeID);
alter table Package add foreign key (Package_StatusID) references Package_Status(Package_StatusID);

alter table Shipping_Type add foreign key (Package_NumID) references Package (Package_NumID);

alter table Package_Status add foreign key (Package_NumID) references Package (Package_NumID);

alter table Customer add foreign key (Package_NumID) references Package (Package_NumID);
alter table Customer add foreign key (Customer_PhoneID) references Customer_Phone (Customer_PhoneID);
alter table Customer add foreign key (Customer_EmailID) references Customer_Email (Customer_Email_ID);/*erroor, tengo que realizar el insert de email*/
alter table Customer add foreign key (Customer_TypeID) references Customer_Type (Costumer_TypeID);
alter table Customer add foreign key (Customer_StatusID) references Customer_Status (Customer_StatusID);

alter table Customer_Type add foreign key (CustomerID) references Customer (CustomerID);

alter table Customer_Status add foreign key (CustomerID) references Customer (CustomerID);

alter table Customer_Phone add foreign key (CustomerID) references Customer (CustomerID);

alter table Customer_Email add foreign key (CustomerID) references Customer (CustomerID);

/*Foreing key Package_Billing*/

alter table Package_Billing add foreign key (CustomerID) references Customer (CustomerID);
alter table Package_Billing add foreign key (DetailsID) references Details (DetailsID); 
alter table Package_Billing add foreign key (Package_Billing_StatusID) references Package_Billing_Status (Package_Billing_StatusID);

alter table Package_Billing_Status add foreign key (Invoice_NumberID) references Package_Billing (Invoice_NumberID);

alter table Details add foreign key (Invoice_NumberID) references Package_Billing (Invoice_NumberID);

/*Foreing key Vehicle_Inventory*/

alter table Vehicle_Inventory add foreign key (BrandID) references Brand (BrandID);
alter table Vehicle_Inventory add foreign key (MaintenanceID) references Maintenance (MaintenanceID);
alter table Vehicle_Inventory add foreign key (TypeID) references Type_Vehicle (TypeID);
alter table Vehicle_Inventory add foreign key (StatusID) references Status_Vehicle (StatusID);

alter table Maintenance add foreign key (Internal_numberID) references Vehicle_Inventory (Internal_numberID);

alter table Brand add foreign key (Internal_numberID) references Vehicle_Inventory (Internal_numberID);

alter table Type_Vehicle add foreign key (Internal_numberID) references Vehicle_Inventory (Internal_numberID);

alter table Status_Vehicle add foreign key (Internal_numberID) references Vehicle_Inventory (Internal_numberID);


/***********************************************Logs***********************************************/

create table Log_Customer (
	CustomerID int not null primary key auto_increment,
    Customer_Name  varchar(50) not null,
    Customer_Identification varchar(20) not null,
    Customer_Phone_1 varchar(20) not null,
    Customer_Phone_2 varchar(20),
    Customer_Addresses varchar(255) not null,
    Customer_Email_1 varchar(255) not null,
    Customer_Email_2 varchar(255),
    Customer_Type varchar(20) not null,
	Customer_Status varchar(20) not null,
    Move_type varchar(30) not null
    );

create table Log_Employee (
	identificationID int not null primary key auto_increment,
    Name varchar(50) not null,
    Paternal_Surname varchar(50) not null,
	Marternal_Surname varchar(50),
	Date_Birth date,
    Position_employee varchar(50) not null,
    Employee_Salary_Old decimal(10,2) not null,
    Employee_Salary_New decimal(10,2) not null,
    Assigned_Office varchar(50) not null,
    Office_Location varchar(75) not null,
    Country varchar(75) not null,
    Province varchar(75) not null,
    Canton varchar(75) not null,
    Distric varchar(75) not null,
    Street varchar(75) not null,
	Phone_1 varchar(20) not null,
    Phone_2 varchar(20),
	Email_1 varchar(255) not null,
    Email_2 varchar(255),
    Status_employee varchar(10) not null,
	Record_Date Date,
	Record_User_Name varchar(50) not null,
    Move_type varchar(30) not null
    );
    
create table Log_Package(
	Package_NumID int not null primary key auto_increment,
	Package_Description varchar(255) not null,
	Office_Location varchar(255) not null,
	Process_Employee int not null,
	CustomerID int not null,
	Shipping_Type varchar(15) not null,
	Package_Status varchar(25) not null,
	Registration_Date date,
	Registration_User_Name varchar(50) not null,	
    Move_type varchar(30) not null
);

create table Log_Package_Billing(
	Invoice_NumberID  int not null primary key auto_increment,
    CustomerID int not null,
    Invoice_Date date,
    Registration_Date date,
    Registration_User_Name varchar(50) not null,
    Package_Billing_StatusID int not null,
    Package_NumberID int not null,
    Shipping_Cost decimal(10,2) not null,
    VAT_Cost decimal(10,2),
    Total_Before_Tax decimal(10,2),
    Invoice_Total decimal(10,2),
    Status_Billing varchar(20) not null,
    Move_type varchar(30) not null
);

/***********************************************Store Procedure***********************************************/
delimiter //
create procedure final_billing (
	in d_Invoice_NumberID int, 
    in d_Total_Before_Tax decimal(10,2), 
    in d_Shipping_Cost decimal(10,2), 
    in d_VAT_Cost decimal(10,2), 
    out d_Invoice_Total decimal(10,2))
    
begin 
	declare v_Total_Before_Tax decimal(10,2);
	declare v_Shipping_Cost decimal(10,2);
    declare v_VAT_Cost decimal(10,2);
	declare v_Invoice_Total decimal(10,2);
    
    select Total_Before_Tax, Shipping_Cost, VAT_Cost 
    into v_Total_Before_Tax, v_Shipping_Cost, v_VAT_Cost
    from Details 
    where Invoice_NumberID = d_Invoice_NumberID;
        
	if D.Invoice_NumberID = 1 then 
		set v_Total_Before_Tax = v_Shipping_Cost;
        set v_VAT_Cost = (v_Total_Before_Tax * 0.13);
        set v_Invoice_Total = (v_Total_Before_Tax + v_VAT_Cost);
		
	update 
		Details
	set 
		Total_Before_Tax = v_Total_Before_Tax,
		VAT_Cost = v_VAT_Cost,
        Invoice_Total = d_Invoice_Total
	where 
		Invoice_NumberID = d_Invoice_NumberID;
		set d_Invoice_NumberID = v_Invoice_Total;
	end if;
end //

delimiter ;

set @d_Invoice_NumberID = 0;
call final_billing(1, 1, 25.00, null, @d_Invoice_NumberID);
select @d_Invoice_NumberID;

/***********************************************Trigger***********************************************/

/*********************************************Insert ******************************************/
delimiter //

create trigger Log_Package_Trigger
after insert on Package
for each row
begin 
	insert into Log_Package (
		Package_NumID,
		Package_Description,
		Office_Location,
		Process_Employee,
		CustomerID,
		Shipping_Type,
		Package_Status,
		Registration_Date,
		Registration_User_Name,
		Move_type
    )
	values (
		new.Package_NumID,
		new.Package_Description,
		new.Office_Location,
		new.Process_Employee,
		new.CustomerID,
		new.Shipping_Type,
		new.Package_Status,
		new.Registration_Date,
		new.Registration_User_Name,
		new.Move_type
	);
end;
//

delimiter ;

insert into Package (
    Package_NumID,
    Package_Description,
    Office_Location,
    Process_Employee,
    CustomerID,
    Shipping_Type,
    Package_Status,
    Registration_Date,
    Registration_User_Name,
    Move_type
) 
	values (
	6,
    'Big box', 
    'San jose',
    5,
    4,
    25.00,
	'In Office',
    '12-12-2023',
    'Jose Miguel Fernandez',
    'xd'
);

select * from Log_Package;

/*********************************************update ******************************************/
delimiter //

create trigger Log_Employee_Trigger
after update on Employee
for each row
begin 
    if old.Employee_Salary <> new.Employee_Salary then
        insert into Log_Employee(
            identificationID,
            Name,
            Paternal_Surname,
            Marternal_Surname,
            Date_Birth,
            Position_employee,
            Employee_Salary_Old,
            Employee_Salary_New,
            Assigned_Office,
            Office_Location,
            Country,
            Province,
            Canton,
            Distric,
            Street,
            Phone_1,
            Phone_2,
            Email_1,
            Email_2,
            Status_employee,
            Record_Date,
            Record_User_Name,
            Move_type)
    
        values (old.identificationID,
                old.Name,
                old.Paternal_Surname,
                old.Marternal_Surname,
                old.Date_Birth,
                old.Position_employee,
                old.Employee_Salary_Old,
                new.Employee_Salary,
                old.Assigned_Office,
                old.Office_Location,
                old.Country,
                old.Province,
                old.Canton,
                old.Distric,
                old.Street,
                old.Phone_1,
                old.Phone_2,
                old.Email_1,
                old.Email_2,
                old.Status_employee,
                old.Record_Date,
                old.Record_User_Name,
                old.Move_type);
    end if;
end;
//

delimiter ;

update Employee set Employee_Salary = 60000 where identificationID = 1;

select * from Log_Employee;
/*********************************************update ******************************************/
delimiter //

create trigger Log_CustomerTrigger
after update on Customer
for each row
begin 
    insert into Log_Customer (
        CustomerID,
        Customer_Name,
        Customer_Identification,
        Customer_Phone_1,
        Customer_Phone_2,
        Customer_Addresses,
        Customer_Email_1,
        Customer_Email_2,
        Customer_Type,
        Customer_Status,
        Move_type
    )
    values (
        new.CustomerID,
        new.Customer_Name,
        new.Customer_Identification,
        new.Customer_Phone_1,
        new.Customer_Phone_2,
        new.Customer_Addresses,
        new.Customer_Email_1,
        new.Customer_Email_2,
        new.Customer_Type,
        new.Customer_Status,
        new.Move_type
    );
end;
//
delimiter ;

update Customer set Customer_Phone_1 = '358-789-0123' where CustomerID = 1;

select * from Log_Customer;
/*********************************************delete ******************************************/
delimiter //

create trigger Log_Package_Billing_Delete_Trigger
after delete on Package_Billing
for each row
begin
    insert into Log_Package_Billing (
        CustomerID,
        Invoice_Date,
        Registration_Date,
        Registration_User_Name,
        Package_Billing_StatusID,
        Package_NumberID,
        Shipping_Cost,
        VAT_Cost,
        Total_Before_Tax,
        Invoice_Total,
        Status_Billing,
        Move_type
    )
    values (
        old.CustomerID,
        old.Invoice_Date,
        old.Registration_Date,
        old.Registration_User_Name,
        old.Package_Billing_StatusID,
        old.Package_NumberID,
        old.Shipping_Cost,
        old.VAT_Cost,
        old.Total_Before_Tax,
        old.Invoice_Total,
        old.Status_Billing,
        old.Move_type
    );
end;
//

delimiter ;

delete from Package_Billing where Shipping_Cost = 0;

select * from Log_Package_Billing;











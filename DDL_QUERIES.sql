-- create statement

-- create all the tables in our database (customer, transaction, employee, account, loan, and branches)

-- customer table
create table customers(
	customerID int Primary key,
	firstName varchar (255),
	lastName varchar (255),
	dateOfBirth Date,
	address text,
	city varchar (255),
	PhoneNumber varchar (20)
);

-- create account table
create table accounts(
	accountNumber int Primary key,
	customerId int,
	accountType varchar (20),
	balance decimal (15,2),
	dateOpened date,
	foreign key (customerid) references customers(customerid)
);

-- create branch table
create table branches(
	branchId int primary key,
	branchName varchar(255),
	branchAddress varchar(255),
	branchPhoneNumber varchar(20)
);

-- create transaction table
create table transactions(
	transactionId int primary key,
	accountNumber int,
	transactionType varchar(255),
	amount decimal(10,2),
	transactionDate date,
	foreign key (accountNumber) references accounts(accountNumber)
);

-- create employee table
create table employees(
	employeeId int primary key,
	Name varchar (255),
	position varchar (255),
	branchId int,
	hireDate date,
	foreign key (branchid) references branches(branchId)
);

-- create loan table
create table loans(
	loanId int primary key,
	customerId int,
	loanamount decimal(15,2),
	loantype varchar (30),
	issueDate date,
	interest decimal(3,2),
	foreign key (customerId) references customers(customerId)
);

-- Alter statement
-- question 1
alter table customers add email varchar (255), add phoneNumber varchar (20);

-- alter loan table to change decimal to float
-- question 2
alter table loan alter column interest type float;

-- unique phone number checks where 2 numbers do not exist
alter table customers add unique(phoneNumber);

-- update statements
-- allows to update or insert into a record
update accounts
set balance = balance + 500 -- adding 500 into the balance for 1 customer
where customerId = 2;

-- Drop statement

Drop Table employees;

Alter table loan drop constraint loan_customerId_fkey;
Alter table accounts drop constraint accounts_customerId_fkey;

Drop Table customers;

Drop Table accounts;

Drop Table loan;

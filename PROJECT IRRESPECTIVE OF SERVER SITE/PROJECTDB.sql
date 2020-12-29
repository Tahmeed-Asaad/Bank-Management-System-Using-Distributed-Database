clear screen;

drop table branch cascade constraints;
drop table employee cascade constraints;
drop table customer cascade constraints;
drop table transaction cascade constraints;

create table branch(
	BID number,
	location varchar2(30),
	primary key (BID)
);

create table employee(
	EID number,
	Ename varchar2(16),
	salary number,
	designation varchar2(25),
	BID number,
	primary key(EID),
	foreign key(BID) references branch(BID)
);

create table customer(
	Account_number number,
	Customer_name varchar2(30),
	balance number,
	address varchar2(30),
	BID number,
	primary key(Account_number),
	foreign key(BID) references branch(bid)
);

create table transaction(
	tid number,
	deposit number,
	withdraw number,
	transaction_date date,
	EID number,
	Account_number number,
	primary key(tid),
	foreign key(EID) references employee(EID),
	foreign key(Account_number) references customer(Account_number)
);


insert into branch (BID,location) values(1,'Uttara');
insert into branch (BID,location) values(2,'Tejgaon');
insert into branch (BID,location) values(3,'Mohammadpur');	

select *from branch;


insert into employee (EID,Ename,salary,designation,BID) values (1, 'Tahmeed Asad', 80000, 'Card Operations Manager',2);
insert into employee (EID,Ename,salary,designation,BID) values (2, 'Anim Chowdhury', 85000, 'branch Manager',1); 
insert into employee (EID,Ename,salary,designation,BID) values (3, 'Shahana Alam', 200000, 'Financial Director',3);
insert into employee (EID,Ename,salary,designation,BID) values (4, 'Tanjila Broti', 95000, 'Managing Director',1);
insert into employee (EID,Ename,salary,designation,BID) values (5, 'Iffatun Nesa', 88000, 'Project Manager', 2);
insert into employee (EID,Ename,salary,designation,BID) values (6, 'Saad Chowdhury ', 75000, 'Marketing Manager',3);
insert into employee (EID,Ename,salary,designation,BID) values	(7, 'Antora Alam', 100000, 'ATM Specialist', 2);
insert into employee (EID,Ename,salary,designation,BID) values  (8, 'Michael Scott', 50000,'Regional Manager Scranton', 1);


select *from employee;

commit;


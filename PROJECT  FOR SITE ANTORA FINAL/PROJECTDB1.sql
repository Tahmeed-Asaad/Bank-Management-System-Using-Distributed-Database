

drop table branch cascade constraints;
drop table employee1 cascade constraints;

create table branch(
	BID number,
	location varchar2(30),
	primary key (BID)
);

create table employee1(
	EID number,
	Ename varchar2(16),
	salary number,
	designation varchar2(23),
	BID number,
	primary key(EID),
	foreign key(BID) references branch(BID) ON DELETE CASCADE 
);


insert into branch (BID,location) values(1,'Uttara');
insert into branch (BID,location) values(2,'Tejgaon');
insert into branch (BID,location) values(3,'Mohammadpur');	

select *from branch;

commit;





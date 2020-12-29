/*employee1 has records of salary<86500*/

create or replace procedure frag
	is

	Eeid number;
	Eename varchar2(16);
	Esalary number;
	Edesignation varchar2(23);
	Ebid number;

	cursor insert_employee1 is
	select *from employee where salary<86500;

	cursor insert_employee2 is
	select *from employee  where salary>=86500;

	begin
	open insert_employee1;
	loop
		fetch insert_employee1 into Eeid,Eename,Esalary,Edesignation,Ebid;
		exit when insert_employee1%notfound;
		dbms_output.put_line(Eeid||' '||Eename||' '||Esalary||' '||Edesignation||' '||Ebid);
		insert into employee1 (EID,Ename,salary,designation,BID) values (Eeid,Eename,Esalary,Edesignation,Ebid);
	end loop;	
	close insert_employee1;

		open insert_employee2;

	loop
		fetch insert_employee2 into Eeid,Eename,Esalary,Edesignation,Ebid;
		exit when insert_employee2%notfound;
		dbms_output.put_line(Eeid||' '||Eename||' '||Esalary||' '||Edesignation||' '||Ebid);
		insert into employee2 (EID,Ename,salary,designation,BID) values (Eeid,Eename,Esalary,Edesignation,Ebid);
	end loop;	
	close insert_employee2;
end frag;
/


--7.Select all the customer's details who were involved in transaction in a certain range of time.(Done).
create or replace procedure transact_details_by_date_cust(a_date in date,b_date in date)
	is

	cursor mycursor is 
	select *from customer where Account_number in 
	(select Account_number from transaction where
	 transaction_date>=a_date AND transaction_date<=to_date(b_date));
	
	CAC number;
	Cname varchar2(20);
	Cbalance number;
	Caddress varchar2(16);
	CBID number;

	begin

	open mycursor;
	dbms_output.put_line('Ac_NO'||'  '||'Name'||'     '||'  Balance'||'    '||'Address'||'    '||'Branch');
	DBMS_OUTPUT.NEW_LINE;
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	loop
		fetch mycursor into CAC,Cname,Cbalance,Caddress,CBID;
		exit when mycursor%notfound;
		dbms_output.put_line(CAC||'   '||Cname||'   '||Cbalance||'   '||Caddress||'     '||CBID);
	end loop;
	close mycursor;

	end transact_details_by_date_cust;
	/	

--6.Select all the employee's details who were involved in transaction in a certain range of time.(Done)
create or replace procedure transact_details_by_date_emp(a_date in date,b_date in date)
	is

	cursor mycursor is 
	select *from employee where EID in 
	(select EID from transaction where
	 transaction_date>=a_date AND transaction_date<=to_date(b_date));
	
	X1 mycursor%ROWTYPE;

	begin

	open mycursor;
	dbms_output.put_line('EID'||'  '||'Name'||'     '||'  Salary'||'    '||'Designation'||'    '||'Branch');
	DBMS_OUTPUT.NEW_LINE;
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	loop
		fetch mycursor into X1;
		exit when mycursor%notfound;
		dbms_output.put_line(X1.EID||'   '||X1.Ename||'   '||X1.salary||'   '||X1.designation||'     '||X1.BID);
	end loop;
	close mycursor;

	end transact_details_by_date_emp;
	/	


	--2.Select all employees of branch Tejgaon.(DONE).
create or replace procedure select_emp_branch(B in varchar2)
	is

	cursor mycursor is 
	select *from employee where BID in 
	(select BID from branch where location like '%'||B||'%');
	
	X1 mycursor%ROWTYPE;

	begin

	open mycursor;
	dbms_output.put_line('EID'||'  '||'Name'||'     '||'  Salary'||'    '||'Designation'||'    '||'Branch');
	DBMS_OUTPUT.NEW_LINE;
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	loop
		fetch mycursor into X1;
		exit when mycursor%notfound;
		dbms_output.put_line(X1.EID||'   '||X1.Ename||'   '||X1.salary||'   '||X1.designation||'     '||X1.BID);
	end loop;
	close mycursor;

	end select_emp_branch;
	/	


	--4.Select the list of employees who were involved in the transaction of customer Saiful Islam.(DONE).
create or replace procedure select_emp_hand_cust(B in varchar2)
	is

	cursor mycursor is 
	select *from employee where EID in 
	(select EID from transaction where Account_number in(select Account_number from customer where customer_name like '%'||B||'%'));
	
	X1 mycursor%ROWTYPE;

	begin

	open mycursor;
	dbms_output.put_line('EID'||'  '||'Name'||'     '||'  Salary'||'    '||'Designation'||'    '||'Branch');
	DBMS_OUTPUT.NEW_LINE;
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	loop
		fetch mycursor into X1;
		exit when mycursor%notfound;
		dbms_output.put_line(X1.EID||'   '||X1.Ename||'   '||X1.salary||'   '||X1.designation||'     '||X1.BID);
	end loop;
	close mycursor;

	end select_emp_hand_cust;
	/	


	--5.Select the list of customers handled by employee Iffatun Nesa.(DONE).
create or replace procedure select_cust_of_emp(B in varchar2)
	is

	cursor mycursor is 
	select *from customer where Account_number in 
	(select Account_number from transaction where EID in(select EID from employee where Ename like '%'||B||'%'));
	
	X1 mycursor%ROWTYPE;

	begin

	open mycursor;
	dbms_output.put_line('Ac_NO'||'  '||'Name'||'     '||'  Balance'||'    '||'Address'||'    '||'Branch');
	DBMS_OUTPUT.NEW_LINE;
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	loop
		fetch mycursor into X1;
		exit when mycursor%notfound;
		dbms_output.put_line(X1.Account_number||' '||X1.Customer_name||' '||X1.balance||' '||X1.address||' '||X1.bid);
	end loop;
	close mycursor;

	end select_cust_of_emp;
	/	


--1.Select all customers of branch Uttara.(DONE).

create or replace procedure select_cust_branch(B in varchar2)
	is

	cursor mycursor is 
	select *from customer where BID in 
	(select BID from branch where location like '%'||B||'%');
	
	X1 mycursor%ROWTYPE;

	begin

	open mycursor;
	dbms_output.put_line('Ac_NO'||'  '||'Name'||'     '||'  Balance'||'    '||'Address'||'    '||'Branch');
	DBMS_OUTPUT.NEW_LINE;
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	loop
		fetch mycursor into X1;
		exit when mycursor%notfound;
		dbms_output.put_line(X1.Account_number||' '||X1.Customer_name||' '||X1.balance||' '||X1.address||' '||X1.bid);
	end loop;
	close mycursor;

	end select_cust_branch;
	/

--8.Select all the transaction details that occured in a certain range of time.
create or replace procedure transact_details_by_date(a_date in date,b_date in date)
	is


 	cursor mycursor is	select *from transaction where
	transaction_date>=a_date AND transaction_date<=to_date(b_date);
	
	X1 mycursor%ROWTYPE;

	begin

	open mycursor;
	dbms_output.put_line('TID'||' '||'Deposit'||' '||' Withdraw'||' '||'Date'||' '||'EID'||' '||'Account_number');
	DBMS_OUTPUT.NEW_LINE;
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	loop
		fetch mycursor into X1;
		exit when mycursor%notfound;
		dbms_output.put_line(X1.TID||' '||X1.Deposit||' '||X1.Withdraw||' '||X1.transaction_date||' '||X1.eid||' '||X1.Account_number);
	end loop;
	close mycursor;

	end transact_details_by_date;
	/

	--3 Select all transactions occured at branch Mohammadpur.

	create or replace procedure transact_details_at_branch(B in varchar2)
	is


 	cursor mycursor is	select *from transaction where EID IN(
 	(select EID from employee where BID IN(select BID from branch where location like '%'||B||'%')));
	

	X1 mycursor%ROWTYPE;

	begin

	open mycursor;
	dbms_output.put_line('TID'||' '||'Deposit'||' '||' Withdraw'||' '||'Date'||' '||'EID'||' '||'Account_number');
	DBMS_OUTPUT.NEW_LINE;
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	loop
		fetch mycursor into X1;
		exit when mycursor%notfound;
		dbms_output.put_line(X1.TID||' '||X1.Deposit||' '||X1.Withdraw||' '||X1.transaction_date||' '||X1.eid||' '||X1.Account_number);
	end loop;
	close mycursor;

	end transact_details_at_branch;
	/

	--9.Select total employees of branch Tejgaon.

	create or replace function total_emp_branch(B in varchar2)
		return number 
		is

		total_employee number;
		brannch_id number;

		begin

		select bid into brannch_id from branch where location like '%'||B||'%';

		select count(distinct eid) into total_employee from employee where bid in (brannch_id);

		return total_employee;
		end total_emp_branch;
		/

	--10.Select total customers of branch Uttara. 
	
		create or replace function total_cust_branch(B in varchar2)
		return number 
		is

		total_employee number;
		brannch_id number;

		begin

		select bid into brannch_id from branch where location like '%'||B||'%';

		select count(distinct Account_number) into total_employee from customer where bid in (brannch_id);

		return total_employee;
		end total_cust_branch;
		/

--11.Select total transactions that occured in a certain branch.

	create or replace function total_transact_branch(B in varchar2)
		return number 
		is

		total_employee number;
		brannch_id number;

		cursor mycursor(Ebid number) is

		select count(distinct tid) from transaction where eid in (select distinct eid from employee where bid in(Ebid));

		begin

		select bid into brannch_id from branch where location like '%'||B||'%';

		open mycursor(brannch_id);
		fetch mycursor into total_employee;
		close mycursor;

		return total_employee;
		end total_transact_branch;
		/
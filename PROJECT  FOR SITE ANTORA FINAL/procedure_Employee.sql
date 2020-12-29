create or replace procedure emp_salary_above(EEsalary in number)
	is

	Eeid number;
	Eename varchar2(16);
	Esalary number;
	Edesignation varchar2(23);
	Ebid number;

	cursor hello1 is
	select *from employee@site_linkTahmeed where salary>=EEsalary;


	BEGIN
	OPEN hello1;
	dbms_output.put_line('EID'||'  '||'Name'||'     '||'  Salary'||'    '||'Designation'||'    '||'Branch');
	DBMS_OUTPUT.NEW_LINE;
	DBMS_OUTPUT.PUT_LINE(CHR(10));

	loop

		fetch hello1 into Eeid,Eename,Esalary,Edesignation,Ebid;
		exit when hello1%notfound;
		dbms_output.put_line(Eeid||' '||Eename||' '||Esalary||' '||Edesignation||' '||Ebid);

	end loop;
	CLOSE hello1;

	EXCEPTION
	WHEN no_data_found THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
       

	end emp_salary_above;
	/

	create or replace procedure emp_bid(bbid in number)
	is

	Eeid number;
	Eename varchar2(16);
	Esalary number;
	Edesignation varchar2(23);
	Ebid number;

	cursor hello1 is
	select *from employee@site_linkTahmeed where bid=bbid;


	BEGIN
	OPEN hello1;
	dbms_output.put_line('EID'||'  '||'Name'||'     '||'  Salary'||'    '||'Designation'||'    '||'Branch');
		DBMS_OUTPUT.NEW_LINE;
		DBMS_OUTPUT.PUT_LINE(CHR(10));

	loop

		fetch hello1 into Eeid,Eename,Esalary,Edesignation,Ebid;
		exit when hello1%notfound;
		dbms_output.put_line(Eeid||' '||Eename||' '||Esalary||' '||Edesignation||' '||Ebid);

	end loop;
	CLOSE hello1;

	EXCEPTION
	WHEN no_data_found THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');

	end emp_bid;
	/

	create or replace procedure emp_desig(ddesig in varchar2)
	is

	Eeid number;
	Eename varchar2(16);
	Esalary number;
	Edesignation varchar2(23);
	Ebid number;

	cursor hello1 is
	select *from employee@site_linkTahmeed where designation like '%'||ddesig||'%';


	BEGIN
	OPEN hello1;
	dbms_output.put_line('EID'||'  '||'Name'||'     '||'  Salary'||'    '||'Designation'||'    '||'Branch');
		DBMS_OUTPUT.NEW_LINE;
		DBMS_OUTPUT.PUT_LINE(CHR(10));

	loop

		fetch hello1 into Eeid,Eename,Esalary,Edesignation,Ebid;
		exit when hello1%notfound;
		dbms_output.put_line(Eeid||' '||Eename||' '||Esalary||' '||Edesignation||' '||Ebid);

	end loop;
	CLOSE hello1;
	EXCEPTION
	WHEN no_data_found THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
	end emp_desig;
	/


	create or replace procedure emp_id(eeeid in number)
	is

	Eeid number;
	Eename varchar2(16);
	Esalary number;
	Edesignation varchar2(23);
	Ebid number;

	cursor hello2 is
	select *from employee@site_linkTahmeed where eid=eeeid;


	BEGIN
	OPEN hello2;
	dbms_output.put_line('EID'||'  '||'Name'||'     '||'  Salary'||'    '||'Designation'||'    '||'Branch');
		DBMS_OUTPUT.NEW_LINE;
		DBMS_OUTPUT.PUT_LINE(CHR(10));

	loop

		fetch hello2 into Eeid,Eename,Esalary,Edesignation,Ebid;
		exit when hello2%notfound;
		dbms_output.put_line(Eeid||' '||Eename||' '||Esalary||' '||Edesignation||' '||Ebid);

	end loop;
	CLOSE hello2;
	EXCEPTION
	WHEN no_data_found THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
	end emp_id;
	/
	create or replace procedure emp_name(eeename in varchar2)
	is

	Eeid number;
	Eename varchar2(16);
	Esalary number;
	Edesignation varchar2(23);
	Ebid number;

	cursor hello1 is
	select *from employee@site_linkTahmeed where ename like '%'||eeename||'%';


	BEGIN
	OPEN hello1;
	dbms_output.put_line('EID'||'  '||'Name'||'     '||'  Salary'||'    '||'Designation'||'    '||'Branch');
		DBMS_OUTPUT.NEW_LINE;
		DBMS_OUTPUT.PUT_LINE(CHR(10));
	loop
		fetch hello1 into Eeid,Eename,Esalary,Edesignation,Ebid;
		exit when hello1%notfound;
		dbms_output.put_line(Eeid||' '||Eename||' '||Esalary||' '||Edesignation||' '||Ebid);

	end loop;
	CLOSE hello1;
	EXCEPTION
	WHEN no_data_found THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
	end emp_name;
	/

--TAHMEED
	create or replace procedure select_all_employee
		is

		cursor mycursor is
		select *from employee@site_linkTahmeed;

		X1 mycursor%ROWTYPE;

		BEGIN

		OPEN mycursor;
		dbms_output.put_line('EID'||'  '||'Name'||'     '||'  Salary'||'    '||'Designation'||'    '||'Branch');
		DBMS_OUTPUT.NEW_LINE;
		DBMS_OUTPUT.PUT_LINE(CHR(10));

		loop
		 fetch mycursor into X1;
		 exit when mycursor%notfound;
		dbms_output.put_line(X1.EID||' '||X1.Ename||' '||X1.salary||' '||X1.designation||' '||X1.bid);
		end loop;
		 CLOSE mycursor;
	EXCEPTION
	WHEN no_data_found THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
	end select_all_employee;
	/	 


		create or replace procedure select_all_employee1
		is

		cursor mycursor is
		select *from employee1;

		X1 mycursor%ROWTYPE;

		BEGIN

		OPEN mycursor;
		dbms_output.put_line('EID'||'  '||'Name'||'     '||'  Salary'||'    '||'Designation'||'    '||'Branch');
		DBMS_OUTPUT.NEW_LINE;
		DBMS_OUTPUT.PUT_LINE(CHR(10));

		loop
		 fetch mycursor into X1;
		 exit when mycursor%notfound;
		dbms_output.put_line(X1.EID||' '||X1.Ename||' '||X1.salary||' '||X1.designation||' '||X1.bid);
		end loop;
		 CLOSE mycursor;
		 EXCEPTION
	WHEN no_data_found THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
	end select_all_employee1;
	/	

	create or replace procedure select_all_employee2
		is

		cursor mycursor is
		select *from employee2@site_linkAnim;

		X1 mycursor%ROWTYPE;

		BEGIN

		OPEN mycursor;
		dbms_output.put_line('EID'||'  '||'Name'||'     '||'  Salary'||'    '||'Designation'||'    '||'Branch');
		DBMS_OUTPUT.NEW_LINE;
		DBMS_OUTPUT.PUT_LINE(CHR(10));

		loop
		 fetch mycursor into X1;
		 exit when mycursor%notfound;
		dbms_output.put_line(X1.EID||' '||X1.Ename||' '||X1.salary||' '||X1.designation||' '||X1.bid);
		end loop;
		 CLOSE mycursor;
		 EXCEPTION
	WHEN no_data_found THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
	end select_all_employee2;
	/	


create or replace procedure insert_employee(Eeid in number,Eename in varchar2,Esalary in number,Edesignation in varchar2,Ebid in number)
	is

	BEGIN

	insert into employee@site_linkTahmeed values(Eeid,Eename,Esalary,Edesignation,Ebid);
	EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
	end insert_employee;
/	


create or replace procedure update_employee(Eeied in number,Edesignation in varchar2)
	is

	BEGIN

	update employee@site_linkTahmeed set designation=Edesignation where eid=Eeied;
	
	end update_employee;
/ 


create or replace procedure update_employee_sal(Eeied in number,Esal in number)
	is

	BEGIN

	update employee@site_linkTahmeed set salary=Esal where eid=Eeied;
	
	end update_employee_sal;
/ 

create or replace procedure delete_employee(Eeied in number)
	is

	BEGIN

	delete from employee@site_linkTahmeed where eid=Eeied;
	
	end delete_employee;
/ 

--use a package for selecting branch
create or replace package branch_package as
	procedure select_branch;
end branch_package;
/

create or replace package body branch_package as
	
	procedure select_branch is

	cursor mycursor is select *from branch;
	X1 mycursor%rowtype;

	BEGIN
	OPEN mycursor;
	dbms_output.put_line('BID'||'	'||'location');
	DBMS_OUTPUT.NEW_LINE;
	DBMS_OUTPUT.PUT_LINE(CHR(10));
	loop
	fetch mycursor into X1;
	exit when mycursor%notfound;
	dbms_output.put_line(X1.BID||'	'||X1.location);
	end loop;
	end select_branch;
end branch_package;
/	

--should not use the next two procedure as no triggers cant be created for insert in employee1 and employee2

create or replace procedure insert_employee1(Eeid in number,Eename in varchar2,Esalary in number,Edesignation in varchar2,Ebid in number)
	is

	BEGIN

	if(Esalary>=86500) THEN
		dbms_output.put_line('salary should be less than 86500');
		return;
	
	else		

	insert into employee1 values(Eeid,Eename,Esalary,Edesignation,Ebid);

	end if;	

	--EXCEPTION
	--WHEN DUP_VAL_ON_INDEX THEN 
     -- dbms_output.put_line('No such data found!');
     --WHEN others THEN
      --dbms_output.put_line('Otherz error occured!');
	end insert_employee1;
/	


create or replace procedure insert_employee2(Eeid in number,Eename in varchar2,Esalary in number,Edesignation in varchar2,Ebid in number)
	is

	BEGIN
	if(Esalary<86500) THEN
		dbms_output.put_line('salary should be atleast 86500');
		return;
	end if;	

	insert into employee2@site_linkAnim values(Eeid,Eename,Esalary,Edesignation,Ebid);
	EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
	end insert_employee2;
/	
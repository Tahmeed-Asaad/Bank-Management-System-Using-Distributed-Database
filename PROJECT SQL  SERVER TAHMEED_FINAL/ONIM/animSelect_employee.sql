create or replace procedure emp_salary_above(EEsalary in number)
	is

	Eeid number;
	Eename varchar2(16);
	Esalary number;
	Edesignation varchar2(23);
	Ebid number;

	cursor hello1 is
	select *from employee where salary>=EEsalary;


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
	select *from employee where bid=bbid;


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
	select *from employee where designation like '%'||ddesig||'%';


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
	select *from employee where eid=eeeid;


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
	select *from employee where ename like '%'||eeename||'%';


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
	end emp_name;
	/

--TAHMEED
	create or replace procedure select_all_employee
		is

		cursor mycursor is
		select *from employee;

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
	end select_all_employee;
	/	 

create or replace procedure insert_employee(Eeid in number,Eename in varchar2,Esalary in number,Edesignation in varchar2,Ebid in number)
	is

	BEGIN

	insert into employee values(Eeid,Eename,Esalary,Edesignation,Ebid);
	end insert_employee;
/	
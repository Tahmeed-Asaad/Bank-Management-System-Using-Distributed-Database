SET serveroutput on;
create or replace trigger transaction_customer_deposit
 	after
	insert on transaction for each row
	begin

	update customer set balance=balance+:new.deposit where account_number=:new.account_number;

	/*update customer set balance=balance+1000 where account_number=10;*/

	dbms_output.put_line('AA');
end;
/

create or replace trigger transaction_customer_withdraw
 	after
	insert on transaction for each row
	begin

	update customer set balance=balance-:new.withdraw where account_number=:new.account_number;

	/*update customer set balance=balance+1000 where account_number=10;*/

	dbms_output.put_line('AA');
end;
/

create or replace trigger update_employee
	after update of EID on employee for each row 

	declare
			Eeid number;
			cursor search_employee1(a number) is 
	        select eid from employee1@site_linkAntora where eid=a;

	        cursor search_employee2(b number) is 
	        select eid from employee2@site_linkAnim where eid=b;
	begin
		Eeid:=:old.eid;
		update transaction set EID=:new.eid where eid=:old.eid;


		open search_employee1(Eeid);
		fetch search_employee1 into Eeid;
		if(search_employee1%found=true) then
		update employee1@site_linkAntora set eid=:new.eid where eid=:old.eid;
		dbms_output.put_line('YAY');
		end if;
		close search_employee1;


		open search_employee2(Eeid);
		fetch search_employee2 into Eeid;
		if(search_employee2%found=true) then
		update employee2@site_linkAnim set eid=:new.eid where eid=:old.eid;
		dbms_output.put_line('NYAY');
		end if;
		close search_employee2;


		/*dbms_output.put_line(:old.eid);
		dbms_output.put_line(Eeid);*/
	end;
	/	


create or replace trigger update_employee_salary

	after update of salary on employee for each row
	declare

		Eeid number;
		Eename varchar2(16);
		Esalary number;
		Edesignation varchar2(23);
		Ebid number;
		temp number;

			cursor search_employee1(a number) is 
	        select *from employee1@site_linkAntora where eid=a;

	        cursor search_employee2(b number) is 
	        select *from employee2@site_linkAnim where eid=b;


	begin
		temp:=:old.eid;
		open search_employee1(temp);
		fetch search_employee1 into Eeid,Eename,Esalary,Edesignation,Ebid;
		if(search_employee1%found=true) then

		if(:new.salary>=86500) then
			insert into employee2@site_linkAnim (EID,Ename,salary,designation,BID) values(Eeid,Eename,:new.salary,Edesignation,Ebid);
			delete from employee1@site_linkAntora where eid=Eeid;
		else
			update employee1@site_linkAntora set salary=:new.salary where eid=:old.eid;		
				
			end if;	
		dbms_output.put_line('YAY');
		end if;
		close search_employee1;


		open search_employee2(temp);
		fetch search_employee2 into Eeid,Eename,Esalary,Edesignation,Ebid;
		if(search_employee2%found=true) then

			if(:new.salary<86500) then
			insert into employee1@site_linkAntora (EID,Ename,salary,designation,BID) values(Eeid,Eename,:new.salary,Edesignation,Ebid);
			delete from employee2@site_linkAnim where eid=Eeid;
		else
			update employee2@site_linkAnim set salary=:new.salary where eid=:old.eid;		
				
			end if;

		dbms_output.put_line('NYAY');
		end if;
		close search_employee2;
	end;
	/



	create or replace trigger insert_in_employee_trigg 
		after
	insert on employee  for each row
		begin
			if(:new.salary<86500) then
			insert into employee1@site_linkAntora (EID,Ename,salary,designation,BID) values(:new.eid,:new.ename,:new.salary,:new.designation,:new.bid);
			else
			insert into employee2@site_linkAnim (EID,Ename,salary,designation,BID) values(:new.eid,:new.ename,:new.salary,:new.designation,:new.bid);
			end if;	

		end;
/

create or replace trigger update_employee_designation

	after update of designation on employee for each row
	declare

		Eeid number;
		Eename varchar2(16);
		Esalary number;
		Edesignation varchar2(23);
		Ebid number;
		temp number;

			cursor search_employee1(a number) is 
	        select *from employee1@site_linkAntora where eid=a;

	        cursor search_employee2(b number) is 
	        select *from employee2@site_linkAnim where eid=b;


	begin
		temp:=:old.eid;
		open search_employee1(temp);
		fetch search_employee1 into Eeid,Eename,Esalary,Edesignation,Ebid;
		if(search_employee1%found=true) then
			update employee1@site_linkAntora set designation=:new.designation where eid=:old.eid;		
			end if;	
		close search_employee1;

		open search_employee2(temp);
		fetch search_employee2 into Eeid,Eename,Esalary,Edesignation,Ebid;
		if(search_employee2%found=true) then
			update employee2@site_linkAnim set designation=:new.designation where eid=:old.eid;		
			end if;
		close search_employee2;
	end;

	/
		

create or replace trigger delete_employee

	after delete on employee for each row
	declare

		Eeid number;
		Eename varchar2(16);
		Esalary number;
		Edesignation varchar2(23);
		Ebid number;
		temp number;

			cursor search_employee1(a number) is 
	        select *from employee1@site_linkAntora where eid=a;

	        cursor search_employee2(b number) is 
	        select *from employee2@site_linkAnim where eid=b;
	begin
		temp:=:old.eid;
		open search_employee1(temp);
		fetch search_employee1 into Eeid,Eename,Esalary,Edesignation,Ebid;
		if(search_employee1%found=true) then
			delete from employee1@site_linkAntora where eid=:old.eid;		
			end if;	
		close search_employee1;

		open search_employee2(temp);
		fetch search_employee2 into Eeid,Eename,Esalary,Edesignation,Ebid;
		if(search_employee2%found=true) then
			delete from employee2@site_linkAnim where eid=:old.eid;		
			end if;
		close search_employee2;
	end;

	/
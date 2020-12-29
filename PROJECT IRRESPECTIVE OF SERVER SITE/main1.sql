set serveroutput on;
declare
	X number;
	Y number;
	Z number;
	eeesalary number;
    eeeid number;
    eeename varchar2(16);
    bbid number;
    ddesig varchar2(23);

    total_employees number;
    total_customers number;
    total_transactions number;
begin
	X:= &X;
	if(X=1) then
		--Employee Table
		--Right now work done for employee table.
		dbms_output.put_line('Employee Table Selected');
		Y:= 2;    
			case Y                    
			when 1 then
			dbms_output.put_line('Select operations for Employee Table');
				--select
				Z:= 2;
					case Z
					when 1 then
					--select  all employee
						select_all_employee;
					when 2 then
					--select employee salary
						emp_salary_above(90000);   
					when 3 then
						--select employeeID 
						 emp_id(7);
					when 4 then
						--select employee name
						emp_name('Ta');	 				
					when 5 then
						--select employee branch
						emp_bid(2);	
					when 6 then
						--select employee designation		
						emp_desig('Man');				 
					else
						--should use exception here
						dbms_output.put_line('Invalid input');	
					end case;
			  when 2 then
			  --Y=2 insert into employee
			  insert_employee(12,'John Doe',82000,'Assistant Manager',3);
			  commit;
			  select_all_employee;
			  select_all_employee1;
			  select_all_employee2;		
			  when 3 then
			  --Y=3 update employee designation
			  update_employee(10,'Manager');
			  commit;
			  select_all_employee;
			  select_all_employee1;
			  select_all_employee2;
			  when 4 then
			  --Y=4 delete from employee
			  delete_employee(10);
			  commit;
			  select_all_employee;
			  select_all_employee1;
			  select_all_employee2;
		else 
			dbms_output.put_line('Invalid operation selected');
		end case;
	end if;	

	if(X=2) then
		--Customer Table Selected
		--Right now Customer table's work is also done.
		dbms_output.put_line('Customer Table Selected');
		Y:= 4;    
			case Y                    
			when 1 then
			dbms_output.put_line('Select operations for Customer Table');
				--select
				Z:= 6;
					case Z
					when 1 then
					--select  all customer
						select_all_customer;
					when 2 then
					--select customer Address
						cus_addr('Ba');  
					when 3 then
						--select customer account number
						cus_an(12);
					when 4 then
						--select customer balance
						cus_balance(70000);				
					when 5 then
						--select customer branch
						cus_bid(2);	
					when 6 then
						--select customer name		
						cus_namee('f');				 
					else
						--should use exception here
						dbms_output.put_line('Invalid input');	
					end case;
		when 2 then
		--Y=2 means insert in customer table
		insert_customer(18,'Faisal Ahmed',901234,'Jurain',2);
		commit;
		select_all_customer;
		when 3 then
			--Y=3 means update in customer table 
			update_customer(18,'Purbachol');
			commit;
			select_all_customer;
		when 4 then
			--Y=4 means delete from Customer
			delete_customer(18);
			commit;
			select_all_customer;		
		else 
			dbms_output.put_line('Invalid operation selected');
		end case;	
	end if;
	if(X=3) then
		--Transaction Table Selected
		--Transaction Table Over
		dbms_output.put_line('Transaction Table Selected');
		Y:= 2;    
			case Y                    
			when 1 then
			dbms_output.put_line('Select operations for Transaction Table');
				--select
				Z:= 7;
					case Z
					when 1 then
					--select  all transaction
					select_all_transaction;
					when 2 then
					--select transaction  deposit
						transac_depo(3000);
					when 3 then
						--select transaction account number
						transac_account_number(11);
					when 4 then
						--select transaction employe id
						transac_eid(8);			
					when 5 then
						--select transaction_id
						transac_id(4);
					when 6 then
						--select transaction withdraw		
						transac_withdraw(6000); 
					when 7 then
						--select transaction date
						transac_date('06-JUN-2019');	
					else
						--should use exception here
						dbms_output.put_line('Invalid input');	
					end case;
		when 2 then
			--Y=2 means insert into transaction table		
			insert_transaction(11,200000,10000,sysdate,4,10);
			commit;
			select_all_transaction;
			select_all_customer;	
		else 
			dbms_output.put_line('Invalid operation selected');
		end case;	
	end if;

	if(X=4) then
	--Select *from branch
		--package is in the employee procedure sql file.
		branch_package.select_branch;
	end if;
	if(X=5) then
		--employee1
		Y:=1;
		case Y
		when 1 then
			--select *from employee1
			select_all_employee1;
		else
			dbms_output.put_line('Invalid operation selected');	
		end case;
	end if;	

	if(X=6) then
		--employee1
		Y:=1;
		case Y
		when 1 then
			--select *from employee1
			select_all_employee2;
		else
			dbms_output.put_line('Invalid operation selected');	
		end case;
	end if;	

	if(X=7) then
	--special queries
	Y:=11;
	case Y
	when 1 then
		-- select all customers detail who transacted between the given date(not inclusive) 7
		  transact_details_by_date_cust('01-JAN-2019','13-OCT-2019');
		  select_all_transaction;
	when 2 then
	-- select all employee's detail who transacted between the given date(not inclusive) 6
		  transact_details_by_date_emp('01-JAN-2019','12-OCT-2019');
		  select_all_transaction;
	when 3 then
	--Select all employees of branch Tejgaon. 2
		select_emp_branch('Tejgaon');
		branch_package.select_branch;	
	when 4 then
	--	  Select the list of employees who were involved in the transaction of customer Saiful Islam 4
			select_emp_hand_cust('Saiful Islam');
			select_all_customer;
			select_all_transaction;
	when 5 then
		--Select the list of customers handled by employee Iffatun Nesa. 5
		select_cust_of_emp('Iffatun Nesa');
		select_all_employee;
		select_all_transaction;	
	when 6 then
	--		1.Select all customers of branch Uttara.
		select_cust_branch('Uttara');
		branch_package.select_branch;
	when 7 then
			--8.Select all the transaction details that occured in a certain range of time.
			transact_details_by_date('01-JAN-2019','11-OCT-2019');
			select_all_transaction;
	when 8 then
		--	3.Select all transactions occured at branch Tejgaon.
		transact_details_at_branch('Tejgaon');
		branch_package.select_branch;
		select_all_employee;
		select_all_transaction;
	when 9 then
		--9.Select total employees of branch Tejgaon.
		total_employees:=total_emp_branch('Mohammadpur');
		dbms_output.put_line('total_employees: '||total_employees);
		branch_package.select_branch;
		select_all_employee;
	when 10 then
	--10.Select total customers of branch Uttara. 
		total_customers:=total_cust_branch('Uttara');
		dbms_output.put_line('total_customers: '||total_customers);
		branch_package.select_branch;
		select_all_customer;
	when 11 then
	--11.Select total transactions that occured in a certain branch.
		total_transactions:=total_transact_branch('Tejgaon');
		dbms_output.put_line('total_transactions: '||total_transactions);
		branch_package.select_branch;
		select_all_employee;
		select_all_transaction;
	else
		dbms_output.put_line('Invalid querie');
	end case;		
	end if;
	if (X>7 OR X<1) then
	dbms_output.put_line('Invalid table selected');
	end if;
end;
/	


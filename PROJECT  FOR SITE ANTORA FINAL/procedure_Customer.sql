create or replace procedure cus_addr(caddr in varchar2)
	is

	
	cAccount_number number;
	cCustomer_name varchar2(20);
	cbalance number;
	caddress varchar2(16);
	cBID number;



	cursor hello1 is
	select *from customer@site_linkTahmeed where address like '%'||caddr||'%';

	BEGIN
	OPEN hello1;
	dbms_output.put_line('Ac_NO'||'  '||'Name'||'     '||'  Balance'||'    '||'Address'||'    '||'Branch');
	DBMS_OUTPUT.NEW_LINE;
	DBMS_OUTPUT.PUT_LINE(CHR(10));

	loop

		fetch hello1 into cAccount_number,cCustomer_name,cbalance,caddress,cBID;
		exit when hello1%notfound;
		dbms_output.put_line(cAccount_number||' '||cCustomer_name||' '||cbalance||' '||caddress||' '||cBID);

	end loop;
	CLOSE hello1;
	EXCEPTION
	WHEN no_data_found THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
	end cus_addr;
	/

	create or replace procedure cus_an(cAccNum in number)
	is
	
	cAccount_number number;
	cCustomer_name varchar2(20);
	cbalance number;
	caddress varchar2(16);
	cBID number;

	cursor hello1 is
	select *from customer@site_linkTahmeed where Account_number=cAccNum;

	BEGIN
	OPEN hello1;
	dbms_output.put_line('Ac_NO'||'  '||'Name'||'     '||'  Balance'||'    '||'Address'||'    '||'Branch');
	DBMS_OUTPUT.NEW_LINE;
	DBMS_OUTPUT.PUT_LINE(CHR(10));

	loop

		fetch hello1 into cAccount_number,cCustomer_name,cbalance,caddress,cBID;
		exit when hello1%notfound;
		dbms_output.put_line(cAccount_number||' '||cCustomer_name||' '||cbalance||' '||caddress||' '||cBID);

	end loop;
	CLOSE hello1;
	EXCEPTION
	WHEN no_data_found THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
	end cus_an;
	/ 


	create or replace procedure cus_balance(ccbalance in number)
	is

	
	cAccount_number number;
	cCustomer_name varchar2(20);
	cbalance number;
	caddress varchar2(16);
	cBID number;


	cursor hello1 is
	select *from customer@site_linkTahmeed where balance>=ccbalance;

	BEGIN
	OPEN hello1;
	dbms_output.put_line('Ac_NO'||'  '||'Name'||'     '||'  Balance'||'    '||'Address'||'    '||'Branch');
	DBMS_OUTPUT.NEW_LINE;
	DBMS_OUTPUT.PUT_LINE(CHR(10));

	loop

		fetch hello1 into cAccount_number,cCustomer_name,cbalance,caddress,cBID;
		exit when hello1%notfound;
		dbms_output.put_line(cAccount_number||' '||cCustomer_name||' '||cbalance||' '||caddress||' '||cBID);

	end loop;
	CLOSE hello1;
	end cus_balance;
	/

	create or replace procedure cus_bid(ccbid in number)
	is

	
	cAccount_number number;
	cCustomer_name varchar2(20);
	cbalance number;
	caddress varchar2(16);
	cBID number;

	cursor hello1 is
	select *from customer@site_linkTahmeed where BID=ccbid;

	BEGIN
	OPEN hello1;

	dbms_output.put_line('Ac_NO'||'  '||'Name'||'     '||'  Balance'||'    '||'Address'||'    '||'Branch');
	DBMS_OUTPUT.NEW_LINE;
	DBMS_OUTPUT.PUT_LINE(CHR(10));

	loop

		fetch hello1 into cAccount_number,cCustomer_name,cbalance,caddress,cBID;
		exit when hello1%notfound;
		dbms_output.put_line(cAccount_number||' '||cCustomer_name||' '||cbalance||' '||caddress||' '||cBID);

	end loop;
	CLOSE hello1;
	EXCEPTION
	WHEN no_data_found THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
	end cus_bid;
	/

	create or replace procedure cus_namee(cName in varchar2)
	is

	
	cAccount_number number;
	cCustomer_name varchar2(20);
	cbalance number;
	caddress varchar2(16);
	cBID number;


	cursor hello1 is
	select *from customer@site_linkTahmeed where Customer_name like '%'||cName||'%';

	BEGIN
	OPEN hello1;
	dbms_output.put_line('Ac_NO'||'  '||'Name'||'     '||'  Balance'||'    '||'Address'||'    '||'Branch');
	DBMS_OUTPUT.NEW_LINE;
	DBMS_OUTPUT.PUT_LINE(CHR(10));

	loop

		fetch hello1 into cAccount_number,cCustomer_name,cbalance,caddress,cBID;
		exit when hello1%notfound;
		dbms_output.put_line(cAccount_number||' '||cCustomer_name||' '||cbalance||' '||caddress||' '||cBID);

	end loop;
	CLOSE hello1;
	EXCEPTION
	WHEN no_data_found THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
	end cus_namee;
	/

	--TAHMEED
	create or replace procedure select_all_customer
		is

		cursor mycursor is
		select *from customer@site_linkTahmeed;

		X1 mycursor%ROWTYPE;

		BEGIN

		OPEN mycursor;
		dbms_output.put_line('Ac_NO'||'  '||'Name'||'     '||'  Balance'||'    '||'Address'||'    '||'Branch');
		DBMS_OUTPUT.NEW_LINE;
		DBMS_OUTPUT.PUT_LINE(CHR(10));

		loop
		 fetch mycursor into X1;
		 exit when mycursor%notfound;
		dbms_output.put_line(X1.Account_number||' '||X1.Customer_name||' '||X1.balance||' '||X1.address||' '||X1.bid);
		end loop;
		 CLOSE mycursor;
		 EXCEPTION
	WHEN no_data_found THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
		end select_all_customer;
	/

create or replace procedure insert_customer(Cac in number,cName in varchar2,cbalance in number,
caddress in varchar2,cBID in number)
	is

	BEGIN

	insert into customer@site_linkTahmeed values(Cac,cName,cbalance,caddress,cBID);
		
	EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
	end insert_customer;
/ 

create or replace procedure update_customer(Cac in number,caddress in varchar2)
	is

	BEGIN

	update customer@site_linkTahmeed set address=caddress where Account_number=Cac;
	
	end update_customer;
/ 


create or replace procedure delete_customer(Cac in number)
	is

	BEGIN

	delete from customer@site_linkTahmeed where Account_number=Cac;
	
	end delete_customer;
/ 
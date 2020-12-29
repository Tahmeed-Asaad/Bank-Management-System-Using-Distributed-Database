create or replace procedure transac_account_number(ttaccNum in number)
	is

	
	tttid number;
	tdeposit number;
	twithdraw number;
	ttransaction_date date;
	tEID number;
	tAccount_number number;


	cursor hello1 is
	select *from transaction where Account_number=ttaccNum;


	BEGIN
	OPEN hello1;
	dbms_output.put_line('TID'||' '||'Deposit'||' '||' Withdraw'||' '||'Date'||' '||'EID'||' '||'Account_number');
	DBMS_OUTPUT.NEW_LINE;
	DBMS_OUTPUT.PUT_LINE(CHR(10));


	loop

		fetch hello1 into tttid,tdeposit,twithdraw,ttransaction_date,tEID,tAccount_number;
		exit when hello1%notfound;
		dbms_output.put_line(tttid||' '||tdeposit||' '||twithdraw||' '||ttransaction_date||' '||tEID||' '||tAccount_number);

	end loop;
	CLOSE hello1;
	EXCEPTION
	WHEN no_data_found THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
	end transac_account_number;
	/

	create or replace procedure transac_depo(ttdeposit in number)
	is

	
	tttid number;
	tdeposit number;
	twithdraw number;
	ttransaction_date date;
	tEID number;
	tAccount_number number;



	cursor hello1 is
	select *from transaction where deposit>=ttdeposit;

	BEGIN
	OPEN hello1;

	dbms_output.put_line('TID'||' '||'Deposit'||' '||' Withdraw'||' '||'Date'||' '||'EID'||' '||'Account_number');
	DBMS_OUTPUT.NEW_LINE;
	DBMS_OUTPUT.PUT_LINE(CHR(10));

	loop

		fetch hello1 into tttid,tdeposit,twithdraw,ttransaction_date,tEID,tAccount_number;
		exit when hello1%notfound;
		dbms_output.put_line(tttid||' '||tdeposit||' '||twithdraw||' '||ttransaction_date||' '||tEID||' '||tAccount_number);

	end loop;
	CLOSE hello1;
	EXCEPTION
	WHEN no_data_found THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
	end transac_depo;
	/

	create or replace procedure transac_eid(tteid in number)
	is

	
	tttid number;
	tdeposit number;
	twithdraw number;
	ttransaction_date date;
	tEID number;
	tAccount_number number;



	cursor hello1 is
	select *from transaction where eid=tteid;

	BEGIN
	OPEN hello1;
	dbms_output.put_line('TID'||' '||'Deposit'||' '||' Withdraw'||' '||'Date'||' '||'EID'||' '||'Account_number');
	DBMS_OUTPUT.NEW_LINE;
	DBMS_OUTPUT.PUT_LINE(CHR(10));

	loop

		fetch hello1 into tttid,tdeposit,twithdraw,ttransaction_date,tEID,tAccount_number;
		exit when hello1%notfound;
		dbms_output.put_line(tttid||' '||tdeposit||' '||twithdraw||' '||ttransaction_date||' '||tEID||' '||tAccount_number);

	end loop;
	CLOSE hello1;
	EXCEPTION
	WHEN no_data_found THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
	end transac_eid;
	/

	create or replace procedure transac_id(ttid in number)
	is

	
	tttid number;
	tdeposit number;
	twithdraw number;
	ttransaction_date date;
	tEID number;
	tAccount_number number;


	cursor hello1 is
	select *from transaction where tid=ttid;

	BEGIN
	OPEN hello1;
	dbms_output.put_line('TID'||' '||'Deposit'||' '||' Withdraw'||' '||'Date'||' '||'EID'||' '||'Account_number');
	DBMS_OUTPUT.NEW_LINE;
	DBMS_OUTPUT.PUT_LINE(CHR(10));

	loop

		fetch hello1 into tttid,tdeposit,twithdraw,ttransaction_date,tEID,tAccount_number;
		exit when hello1%notfound;
		dbms_output.put_line(tttid||' '||tdeposit||' '||twithdraw||' '||ttransaction_date||' '||tEID||' '||tAccount_number);

	end loop;
	CLOSE hello1;
	EXCEPTION
	WHEN no_data_found THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
	end transac_id;
	/

	create or replace procedure transac_withdraw(ttwith in number)
	is

	
	tttid number;
	tdeposit number;
	twithdraw number;
	ttransaction_date date;
	tEID number;
	tAccount_number number;



	cursor hello1 is
	select *from transaction where withdraw>=ttwith;

	BEGIN
	OPEN hello1;
	dbms_output.put_line('TID'||' '||'Deposit'||' '||' Withdraw'||' '||'Date'||' '||'EID'||' '||'Account_number');
	DBMS_OUTPUT.NEW_LINE;
	DBMS_OUTPUT.PUT_LINE(CHR(10));

	loop

		fetch hello1 into tttid,tdeposit,twithdraw,ttransaction_date,tEID,tAccount_number;
		exit when hello1%notfound;
		dbms_output.put_line(tttid||' '||tdeposit||' '||twithdraw||' '||ttransaction_date||' '||tEID||' '||tAccount_number);

	end loop;
	CLOSE hello1;
	EXCEPTION
	WHEN no_data_found THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
	end transac_withdraw;
	/

	--TAHMEED

	create or replace procedure transac_date(tdate in date)
	is

	
		cursor mycursor is
		select *from transaction where transaction_date like '%'||tdate||'%';

		X1 mycursor%ROWTYPE;

		BEGIN

		OPEN mycursor;
		dbms_output.put_line('TID'||' '||'Deposit'||' '||' Withdraw'||' '||'Date'||' '||'EID'||' '||'Account_number');
		DBMS_OUTPUT.NEW_LINE;
		DBMS_OUTPUT.PUT_LINE(CHR(10));

		loop
		fetch mycursor into X1;
		exit when mycursor%notfound;
		dbms_output.put_line(X1.TID||' '||X1.Deposit||' '||X1.Withdraw||' '||X1.transaction_date||' '||X1.eid||' '||X1.Account_number);
		end loop;
		CLOSE mycursor;
		EXCEPTION
	WHEN no_data_found THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
	end transac_date;
	/



	create or replace procedure select_all_transaction
		is

		cursor mycursor is
		select *from transaction;

		X1 mycursor%ROWTYPE;

		BEGIN

		OPEN mycursor;
		dbms_output.put_line('TID'||' '||'Deposit'||' '||' Withdraw'||' '||'Date'||' '||'EID'||' '||'Account_number');
		DBMS_OUTPUT.NEW_LINE;
		DBMS_OUTPUT.PUT_LINE(CHR(10));

		loop
		 fetch mycursor into X1;
		 exit when mycursor%notfound;
		dbms_output.put_line(X1.TID||' '||X1.Deposit||' '||X1.Withdraw||' '||X1.transaction_date||' '||X1.eid||' '||X1.Account_number);
		end loop;
		 CLOSE mycursor;
		 EXCEPTION
	WHEN no_data_found THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
		end select_all_transaction;
	/ 


	create or replace procedure insert_transaction(tttid in number,tdeposit in number,twithdraw in number,
		ttransaction_date in date,tEID in number,tAccount_number in number )

	 is

	BEGIN

	insert into transaction values(tttid,tdeposit,twithdraw,ttransaction_date,tEID,tAccount_number);

		EXCEPTION
	WHEN DUP_VAL_ON_INDEX THEN 
      dbms_output.put_line('No such data found!');
     WHEN others THEN
      dbms_output.put_line('Other error occured!');
	
	end insert_transaction;
	/ 
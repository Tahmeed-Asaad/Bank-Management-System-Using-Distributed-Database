set serveroutput on;

declare 
     eeesalary number;
     eeeid number;
     eeename varchar2(16);
     bbid number;
     ddesig varchar2(23);
     ttid number;
     ttdeposit number;
     ttwith number;
     tteid number;
     ttaccNum number;
     cAccNum number;
     cName varchar2(20);
     ccbalance number;
     caddr varchar2(16);
     ccbid number;

begin  
	eeesalary:=&value;
	emp_salary_above(eeesalary);
--eeeid:=&value;
	--emp_id(eeeid);

	--eeename:= '&value';
	--emp_name(eeename);

	--bbid:=&value;
	--emp_bid(bbid);

	--ddesig:= '&value' ;
	--emp_desig(ddesig);

	

	/*TRANSACTION*/

	/*ttid:=&value;
	transac_id(ttid);

	ttdeposit:=&value;
	transac_depo(ttdeposit);

	ttwith:=&value ;
	transac_withdraw(ttwith);

	tteid:=&value;
	transac_eid(tteid);

	ttaccNum:=&value;
	transac_account_number(ttaccNum);*/


	/*Customer*/

	/*cAccNum:=&value;
	cus_an(cAccNum);

	cName:= '&value';
	cus_namee(cName);

	ccbalance:=&value;
	cus_balance(ccbalance);

	caddr:= '&value';
	cus_addr(caddr);

	ccbid:=&value;
	cus_bid(ccbid);*/
end;
/
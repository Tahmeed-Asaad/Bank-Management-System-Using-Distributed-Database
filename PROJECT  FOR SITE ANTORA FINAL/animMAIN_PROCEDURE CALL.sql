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
	ttdeposit:=&value;
	transac_depo(ttdeposit);
end;
/
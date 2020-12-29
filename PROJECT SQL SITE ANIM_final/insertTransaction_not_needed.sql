insert into transaction (tid,deposit,withdraw,transaction_date,EID,Account_number) values(1,2000,0,sysdate,8,10);
insert into transaction (tid,deposit,withdraw,transaction_date,EID,Account_number) values(2,2000,0,sysdate,8,10);
insert into transaction (tid,deposit,withdraw,transaction_date,EID,Account_number) values(3,2000,0,sysdate,7,11);
insert into transaction (tid,deposit,withdraw,transaction_date,EID,Account_number) values(4,2000,1200,sysdate,7,11);
insert into transaction (tid,deposit,withdraw,transaction_date,EID,Account_number) values(6,3000,6000,sysdate,5,12);
insert into transaction (tid,deposit,withdraw,transaction_date,EID,Account_number) values(7,13000,9000,'06-Jun-2019',5,13);
insert into transaction (tid,deposit,withdraw,transaction_date,EID,Account_number) values(8,16000,19000,'04-APR-2019',3,15);

select *from transaction;
select *from customer;	
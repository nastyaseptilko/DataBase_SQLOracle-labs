/*1*/
create tablespace XXX_PDB datafile 'C:\Labs\5 lab\XXX_PDB.dbf'
size 10m autoextend on next 5m maxsize 20m extent management local;

create table XXX(x int primary key,y varchar2(50)) tablespace XXX_PDB;

insert into XXX(x,y) values (1,'Строка1');
insert into XXX(x,y) values (2,'Строка2');
insert into XXX(x,y) values (3,'Строка3');

select * from XXX;

CREATE DATABASE LINK anotherdb 
   CONNECT TO test_pdb_global
   IDENTIFIED BY "123" 
   USING 'ORCL_K'
   
SELECT * FROM YYY@anotherdb;

commit

/*2*/
INSERT INTO YYY@anotherdb (x,y) VALUES (10,'Строка10'); 
COMMIT; 

SELECT * FROM YYY@anotherdb;

UPDATE YYY@anotherdb 
SET x = 15 
WHERE y = 'Строка10'; 
COMMIT; 

DELETE FROM YYY@anotherdb 
WHERE x = 15 
COMMIT; 



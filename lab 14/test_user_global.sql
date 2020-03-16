create tablespace YYY_PDB datafile 'C:\Labs\5 lab\YYY_PDB.dbf'
size 10m autoextend on next 5m maxsize 20m extent management local;

create table YYY(x int primary key,y varchar2(50)) tablespace YYY_PDB;

insert into YYY(x,y) values (5,'Строка5');
insert into YYY(x,y) values (6,'Строка6');
insert into YYY(x,y) values (7,'Строка7');

select * from YYY
commit;

CREATE PUBLIC DATABASE LINK anotherdb_global
CONNECT TO test_pdb 
IDENTIFIED BY "123" 
USING 'ORCL_KK' 

commit


/*2*/
INSERT INTO XXX@anotherdb_global (x,y) VALUES (10,'Строка10'); 
COMMIT; 

SELECT * FROM XXX@anotherdb_global;

UPDATE XXX@anotherdb_global
SET x = 15 
WHERE y = 'Строка10'; 
COMMIT; 

DELETE FROM XXX@anotherdb_global
WHERE x = 15 
COMMIT; 

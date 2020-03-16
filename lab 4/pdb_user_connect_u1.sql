create tablespace pdb_tblsp_user datafile 'C:\Labs\4 lab\pdb_tblsp_user.dbf'
size 7m autoextend on next 5m maxsize 20m extent management local;

create table First(x number(3), s varchar2(50));

create view First_View as select * from First Where x=1;

create tablespace YSS_PDBDATA datafile 'C:\Labs\4 lab\YSS_PDBDATA.dbf'
size 7m autoextend on next 5m maxsize 20m extent management local;

create table FirstTable(x int) tablespace pdb_tblsp_user;

grant insert on FirstTable to U1_YSS_PDB

insert into FirstTable(x) values (5);
insert into FirstTable(x) values (7);
insert into FirstTable(x) values (8);

select * from FIRSTTABLE;
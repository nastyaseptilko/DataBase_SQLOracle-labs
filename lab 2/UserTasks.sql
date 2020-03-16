create table First(x number(3), s varchar2(50));

create view First_View as select * from First Where x=1;

create tablespace YSS_QDATA datafile 'C:\Labs\2 lab\YSS_QDATA.dbf'
size 7m autoextend on next 5m maxsize 20m extent management local offline;

alter tablespace YSS_QDATA online;

create table FirstTable(x int) tablespace YSS_QDATA;

grant insert on FirstTable to YSSCORE

insert into FirstTable(x) values (5);
insert into FirstTable(x) values (7);
insert into FirstTable(x) values (8);

select * from FIRSTTABLE;
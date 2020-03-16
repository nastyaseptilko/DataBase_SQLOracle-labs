create table YSS_t(x number(3), s varchar2(50));

insert into YSS_t values (1,'Яромич Сергей');
insert into YSS_t values (2,'Садовский Андрей');
insert into YSS_t values (3,'Кремко Илья');
commit;

update YSS_t set s='Яромич Сергей Сергеевич' where x=1;
update YSS_t set s='Садовский Андрей Иванович' where x=2;
commit;

select * from YSS_t where x=1;

select sum(x) from YSS_t;

select avg(x) from YSS_t;

select COUNT(*) from YSS_t;

select * from YSS_t where x=3;

delete from YSS_t where x=3;
commit;

select * from YSS_t;

drop table YSS_t;



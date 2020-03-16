create table YSS_T1(x int primary key,y varchar2(50)) tablespace YSS_QDATA;

insert into YSS_T1(x,y) values (1,'Строка1');
insert into YSS_T1(x,y) values (2,'Строка2');
insert into YSS_T1(x,y) values (3,'Строка3');

select * from YSS_T1;

/*4*/
drop table YSS_T1;
select * from USER_RECYCLEBIN;
/*5*/
flashback table YSS_T1 to before drop;

/*6*/
begin ы
  delete YSS_T1;
  for k in 1..10000
  loop
    insert into YSS_T1(x,y) values(k,'string');
  end loop;
  commit;
end;

select * from YSS_T1;

/*7*/
select segment_name, segment_type,tablespace_name,extents,buffer_pool from user_segments where tablespace_name='YSS_QDATA';
select * from user_segments;



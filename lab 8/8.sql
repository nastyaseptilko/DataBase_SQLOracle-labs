/*2*/
create sequence s1
increment by 10 
start with 1000
nomaxvalue
NOMINVALUE
nocycle
nocache
noorder;

select s1.nextval from dual;
select s1.CURRVAL from dual;

/*3*/
create sequence s2
increment by 10 
start with 10
maxvalue 100
nocycle;
/*4*/
select s2.NEXTval from dual;
select s2.currval from dual;
/*select s2.currval from dual where s2.currval =100; we can't do it*/

/*5*/
create sequence s3
increment by -10
start with 10
minvalue -100
maxvalue 200
nocycle
order;

select s3.NEXTVAL from dual;
select s3.currval from dual;
/*6*/
create sequence s4
increment by 1
minvalue 10
maxvalue 100
cycle
cache 5
noorder;

select s4.NEXTVAL from dual;
select s4.currval from dual;

/*7*/
select SEQUENCE_NAME,min_value, max_value, increment_by,CYCLE_FLAG,ORDER_FLAG,CACHE_SIZE,LAST_NUMBER from DBA_SEQUENCES where SEQUENCE_owner='SYSTEM';

/*8*/
CREATE TABLE T1(n1 number(20), n2 number(20), n3 number(20), n4 number(20));
alter table T1 storage (buffer_pool keep);
 
insert into t1(n1,n2,n3,n4) values (s1.NEXTval,s2.NEXTval,s3.NEXTval,s4.NEXTval);

select * from t1;
/*9*/
create cluster ABC(X NUMBER(10), V VARCHAR2(12)) HASHKEYS 200;
drop cluster abc INCLUDING TABLES;
/*10*/
create table A(XA number(10), VA varchar2(12),AA char(10)) cluster ABC(xa,va);
/*11*/
create table B(XB number(10), VB varchar2(12),AB char(10)) cluster ABC(xb,vb);

insert into B(xb,vb,ab) values (1,'bb','bbb');
/*12*/
create table C(XC number(10), VC varchar2(12),AC char(10)) cluster ABC(xc,vc);

insert into c(xc,vc,ac) values (1,'cc','ccc');
/*13*/
select cluster_name, owner, tablespace_name, cluster_type, cache from dba_clusters;

SELECT * FROM DICTIONARY;

select tablespace_name, segment_type, count(*), sum(blocks), sum(extents), sum(bytes) from dba_segments where 
tablespace_name='SYSTEM' group by TABLESPACE_NAME, SEGMENT_TYPE
order by TABLESPACE_NAME, SEGMENT_TYPE;
/*14*/
create synonym sn1 for C;
select * from sn1;
/*15*/
create public synonym sn2 for B;

select * from sn2;
/*16*/
create table AA(x int primary key, x_name varchar2(10));

create table BB(xe int, x_namee varchar2(10), constraint fk_x foreign key(xe) REFERENCES AA(x));

insert into AA(x,x_name) values (1,'dsadas');
insert into AA(x,x_name) values (2,'dsada');
insert into AA(x,x_name) values (3,'dsad');
INSERT INTO AA(X,X_NAME) VALUES(4, 'KIRILL BOG');

insert into BB(xe,x_namee) values (1,'dsadas');
insert into BB(xe,x_namee) values (2,'dsada');
insert into BB(xe,x_namee) values (3,'dsadadasd');
INSERT INTO BB(XE,X_NAMEE) VALUES(4, 'KIRILL BOG');
create view v1 as select AA.X,BB.X_NAMEE FROM AA inner join BB on AA.X_name = BB.X_namee;
select * from v1;
drop view v1

CREATE MATERIALIZED VIEW MAT_EXAMPLE
BUILD IMMEDIATE
REFRESH COMPLETE NEXT SYSDATE + NUMTODSINTERVAL(2,'MINUTE') AS SELECT AA.X,BB.X_NAMEE FROM AA inner join BB on AA.X_name = BB.X_namee;

SELECT * FROM MAT_EXAMPLE
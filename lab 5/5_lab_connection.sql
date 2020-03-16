/*1*/
select * from dba_tablespaces;

/*2*/
create tablespace YSS_QDATA datafile 'C:\Labs\5 lab\YSS_QDATA.dbf'
size 10m autoextend on next 5m maxsize 20m extent management local offline;

alter tablespace YSS_QDATA online;

alter session set "_ORACLE_SCRIPT"=true;
alter session set container=cdb$root

CREATE ROLE LB_YSSCORE;

grant create session, 
      create table,
      create view,
      create procedure to LB_YSSCORE;
      
  create profile PR_YSSCORE LIMIT
  PASSWORD_LIFE_TIME 180
  SESSIONS_PER_USER 3
  FAILED_LOGIN_ATTEMPTS 7
  PASSWORD_LOCK_TIME 1
  PASSWORD_REUSE_TIME 10
  PASSWORD_GRACE_TIME DEFAULT
  CONNECT_TIME 180
  IDLE_TIME 30
  CONTAINER=ALL
  
create user YSS IDENTIFIED BY 123
DEFAULT TABLESPACE YSS_QDATA QUOTA UNLIMITED ON YSS_QDATA
PROFILE PR_YSSCORE
ACCOUNT UNLOCK
PASSWORD EXPIRE

grant LB_YSSCORE to YSS

alter user YSS  identified by 1234

alter user YSS quota 2m on YSS_QDATA

/*3*/
select * from dba_segments;

/*8*/
drop tablespace YSS_QDATA INCLUDING CONTENTS;
drop tablespace YSS_QDATA;

/*9*/
select * from v$logfile;
select group#, status, members from v$log;

/*10*/
select * from v$log;
select member from v$logfile;

/*11*/
/*22.05 20.10.2017*/
alter system switch logfile;
select group#,sequence#,bytes,members,status,first_change# from v$log;

/*12*/
alter database add logfile group 4 'C:\app\KIRILL\ORADATA\ORCL\REDO04.LOG' size 50m blocksize 512;
select group#,sequence#,bytes,members,status,first_change# from v$log;

alter database add logfile member 'C:\app\KIRILL\ORADATA\ORCL\REDO041.LOG' TO GROUP 4;
alter database add logfile member 'C:\app\KIRILL\ORADATA\ORCL\REDO042.LOG' TO GROUP 4;
alter database add logfile member 'C:\app\KIRILL\ORADATA\ORCL\REDO043.LOG' TO GROUP 4;

alter system switch logfile;
select group#,sequence#,bytes,members,status,first_change# from v$log;

/*13*/
alter database drop logfile member 'C:\app\KIRILL\ORADATA\ORCL\REDO041.LOG';
alter database drop logfile member 'C:\app\KIRILL\ORADATA\ORCL\REDO042.LOG';
alter database drop logfile member 'C:\app\KIRILL\ORADATA\ORCL\REDO043.LOG';
select group#,sequence#,bytes,members,status,first_change# from v$log;

alter database drop logfile group 4;

/*14*/
select name, log_mode from v$database;
select instance_name, archiver, active_state from v$instance;

/*15*/
select * from v$log;

/*16-18*/
/*shutdown immediate
startup mount
alter databasse archivelog
alter database open*/

/*startup mount;
alter database noarchivelog*/
select name, log_mode from v$database;
select instance_name, archiver, active_state from v$instance;

select * from v$log;

/*19*/
show parameter control;
select name from v$controlfile;

/*20*/
select type, record_size, records_total from v$controlfile_record_section;

/*21*/
select * from v$parameter;

/*C:\app\kirill\admin\orcl\pfile\init.ora file instance*/

/*22*/
select name, value from v$parameter where name = 'open_cursors';
alter system set open_cursors=350 scope=spfile;
/*PRIVILEGES. CREATE FROM SERVER C:\app\kirill\product\12.1.0\dbhome_1\database\8SS_PFILE_ORA.ora*/
CREATE PFILE = '8SS_PFILE_ORA.ora' from SPFILE = 'SPFILEORCL.ORA';

/*23*/

select * from v$pwfile_users;

show parameter remote_login_passwordfile;
/*C:\app\kirill\product\12.1.0\dbhome_1\database\PWDorcl.ora*/

/*24*/

select * from v$diag_info;
/*c:\app\kirill\diag\rdbms\orcl\orcl\alert\log.xml*/
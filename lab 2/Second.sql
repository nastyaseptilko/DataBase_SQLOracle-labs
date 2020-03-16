create tablespace ts_ea datafile 'C:\Labs\2 lab\ts_EA.dbf'
size 7m autoextend on next 5m maxsize 20m extent management local;

create temporary tablespace ts_TEMP_ea tempfile 'C:\Labs\2 lab\ts_TEMP_EA.dbf'
size 5m AUTOEXTEND on next 3m maxsize 30m extent management local;

select * from DICTIONARY;

select file_name, tablespace_name, status, maxbytes, user_bytes from dba_data_files 
union 
select file_name, tablespace_name, status, maxbytes, user_bytes from dba_temp_files;

ALTER SESSION SET "_ORACLE_SCRIPT"=true;

CREATE ROLE RL_YSSCORE;

select * from dba_roles where role like 'RL%';

grant create session, 
      create table,
      create view,
      create procedure to RL_YSSCORE;
      
select * from DBA_SYS_PRIVS where grantee='RL_YSSCORE';  

create profile PF_YSSCORE LIMIT
  PASSWORD_LIFE_TIME 180
  SESSIONS_PER_USER 3
  FAILED_LOGIN_ATTEMPTS 7
  PASSWORD_LOCK_TIME 1
  PASSWORD_REUSE_TIME 10
  PASSWORD_GRACE_TIME DEFAULT
  CONNECT_TIME 180
  IDLE_TIME 30

select * from dba_profiles

select * from dba_profiles where profile='PF_YSSCORE';

select * from dba_profiles where profile='DEFAULT';

create user YSSCORE IDENTIFIED BY 123
DEFAULT TABLESPACE ts_ea QUOTA UNLIMITED ON ts_ea
TEMPORARY TABLESPACE ts_TEMP_ea
PROFILE PF_YSSCORE
ACCOUNT UNLOCK
PASSWORD EXPIRE

GRANT RL_YSSCORE TO YSSCORE;

alter user YSSCORE identified by 1234

grant create tablespace to YSSCORE

grant alter tablespace to YSSCORE

alter user YSSCORE quota 2m on YSS_QDATA

grant create table to YSSCORE


select name, open_mode, total_size from v$pdbs;

select * from v$instance;

select comp_name, version, status from dba_registry;

select * from dba_tablespaces;

SELECT object_name FROM user_objects WHERE object_type ='TABLE';

SELECT object_name, owner,  status FROM dba_objects;
select name, open_mode from v$pdbs; 

select * from DiCTIONARY

select * from PRODUCT_COMPONENT_VERSION; 
select * from dba_users;

/*zodanki 1-xz*/

/*zodanki xz-posled*/

create tablespace pdb_tblsp datafile 'C:\Labs\4 lab\pdb_tblsp.dbf'
size 7m autoextend on next 5m maxsize 20m extent management local;

create temporary tablespace pdb_TEMP_tblsp tempfile 'C:\Labs\4 lab\pdb_TEMP_tblsp.dbf'
size 5m AUTOEXTEND on next 3m maxsize 30m extent management local;

CREATE ROLE PDB_YSSCORE;

grant create session, 
      create table,
      create view,
      create procedure to PDB_YSSCORE;
      
  create profile PR_PDB_YSSCORE LIMIT
  PASSWORD_LIFE_TIME 180
  SESSIONS_PER_USER 3
  FAILED_LOGIN_ATTEMPTS 7
  PASSWORD_LOCK_TIME 1
  PASSWORD_REUSE_TIME 10
  PASSWORD_GRACE_TIME DEFAULT
  CONNECT_TIME 180
  IDLE_TIME 30
  CONTAINER=ALL
  
create user U1_YSS_PDB IDENTIFIED BY 123
DEFAULT TABLESPACE pdb_tblsp QUOTA UNLIMITED ON pdb_tblsp
TEMPORARY TABLESPACE pdb_TEMP_tblsp
PROFILE PR_PDB_YSSCORE
ACCOUNT UNLOCK
PASSWORD EXPIRE


grant PDB_YSSCORE to U1_YSS_PDB

alter user U1_YSS_PDB identified by 1234

grant create tablespace to U1_YSS_PDB
grant alter tablespace to U1_YSS_PDB

alter user U1_YSS_PDB quota 2m on pdb_tblsp_user

alter session set "_ORACLE_SCRIPT"=true
alter session set container=yss_pdb
alter session set container=cdb$root

select * from dictionary

create user C##YSS IDENTIFIED BY 123 

grant create session to C##YSS

grant create table to C##YSS

alter user C##YSS quota 2m on pdb_tblsp_user

grant alter tablespace to C##YSS

/*показать соединение */
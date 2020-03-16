GRANT CREATE DATABASE LINK TO test_pdb

grant create table to test_pdb_global

grant insert on XXX to test_pdb_global

grant create tablespace to test_pdb_global

alter user test_pdb_global quota 2m on YYY_PDB


GRANT CREATE PUBLIC DATABASE LINK to test_pdb_global
/*1*/
create table NewTable(x int primary key, y VARCHAR(100));

/*2*/
insert into NewTable(x,y) values (1,'String1');
insert into NewTable(x,y) values (2,'String2');
insert into NewTable(x,y) values (3,'String3');
insert into NewTable(x,y) values (4,'String4');
insert into NewTable(x,y) values (5,'String5');
insert into NewTable(x,y) values (6,'String6');
insert into NewTable(x,y) values (7,'String7');
insert into NewTable(x,y) values (8,'String8');
insert into NewTable(x,y) values (9,'String9');
insert into NewTable(x,y) values (10,'String10');

/*3*/
create or replace trigger before_insert
before insert on NewTable
begin
dbms_output.put_line('NewTable_before_insert');
end;

create or replace trigger before_delete
before delete on NewTable
begin
dbms_output.put_line('NewTable_before_delete');
end;

create or replace trigger before_update
before update on NewTable
begin
dbms_output.put_line('NewTable_before_update');
end;

insert into NewTable(x,y) values (19,'String1231');

update NewTable set y = 'String123' where x=19;

delete NewTable WHERE x = 19;

select * from NewTable;

/*5*/
create or replace trigger before_insert
before insert on NewTable
for each row
begin
dbms_output.put_line('NewTable_before_insert_row');
end;

create or replace trigger before_delete
before delete on NewTable
for each row
begin
dbms_output.put_line('NewTable_before_delete_row');
end;

create or replace trigger before_update
before update on NewTable
for each row
begin
dbms_output.put_line('NewTable_before_update_row');
end;

delete NewTable;

/*6*/
create or replace trigger predicat_trigger
before insert or update or delete on NewTable
begin
  if inserting then
    dbms_output.put_line('NewTable_before_insert_P');
  elsif updating then
    dbms_output.put_line('NewTable_before_update_P');
  elsif deleting then
    dbms_output.put_line('NewTable_before_delete_P');
  end if;
end;

/*7*/
create or replace trigger after_insert
after insert on NewTable
begin
dbms_output.put_line('NewTable_after_insert');
end;

create or replace trigger after_delete
after delete on NewTable
begin
dbms_output.put_line('NewTable_after_delete');
end;

create or replace trigger after_update
after update on NewTable
begin
dbms_output.put_line('NewTable_after_update');
end;

insert into NewTable(x,y) values (11,'String11');

update NewTable set y = 'String123' where x=11;

delete NewTable WHERE x = 11;

select * from NewTable;

/*8*/
create or replace trigger after_insert
after insert on NewTable
for each row
begin
dbms_output.put_line('NewTable_after_insert_row');
end;

create or replace trigger after_delete
after delete on NewTable
for each row
begin
dbms_output.put_line('NewTable_after_delete_row');
end;

create or replace trigger after_update
after update on NewTable
for each row
begin
dbms_output.put_line('NewTable_after_update_row');
end;

delete NewTable;

/*9*/
CREATE TABLE AUDITT 
( 
OperationType varchar(100), 
TriggerName varchar(100), 
DataT varchar(100) 
);



/*10-15*/ 
----— 
CREATE OR REPLACE TRIGGER NEWTABLE_BEFORE_UPDATE_ROWS 
BEFORE UPDATE ON NewTable 
FOR EACH ROW 
BEGIN 
INSERT INTO AUDITT VALUES('UPDATE','NewTable_BEFORE_UPDATE',:old.x||' '||:new.x); 
DBMS_OUTPUT.PUT_LINE('BEFORE UPDATE ROWS'); 
END; 
UPDATE NewTable SET x=x+10 WHERE y='String5'; 
SELECT * FROM AUDITT;

CREATE OR REPLACE TRIGGER NEWTABLE_BEFORE_INSERT_ROWS 
BEFORE INSERT ON NewTable 
FOR EACH ROW 
BEGIN 
INSERT INTO AUDITT VALUES('INSERT','NEWTABLE_BEFORE_INSERT',:old.x||' '||:new.x); 
DBMS_OUTPUT.PUT_LINE('BEFORE INSERT ROWS'); 
END; 
insert into NewTable(x,y) values (13,'String13'); 

CREATE OR REPLACE TRIGGER NEWTABLE_BEFORE_DELETE_ROWS 
BEFORE DELETE ON NewTable
FOR EACH ROW 
BEGIN 
INSERT INTO AUDITT VALUES('DELETE','TEACH_BEFORE_DELETE',:old.x||' '||:new.x); 
DBMS_OUTPUT.PUT_LINE('BEFORE DELETE ROWS'); 
END; 
DELETE NewTable WHERE y='String 9' OR x=2; 
---------------— 
CREATE OR REPLACE TRIGGER NEWTABLE_AFTER_UPDATE_ROWS 
AFTER UPDATE ON NewTable
FOR EACH ROW 
BEGIN 
INSERT INTO AUDITT VALUES('UPDATE','TEACH_AFTER_UPDATE',:old.x||' '||:new.x); 
DBMS_OUTPUT.PUT_LINE('AFTER UPDATE ROWS'); 
END; 
UPDATE NewTable SET x=x+10 WHERE y='String6'; 


CREATE OR REPLACE TRIGGER NEWTABLE_AFTER_INSERT_ROWS 
AFTER INSERT ON NewTable
FOR EACH ROW 
BEGIN 
INSERT INTO AUDITT VALUES('INSERT','TEACH_AFTER_INSERT',:old.x||' '||:new.x); 
DBMS_OUTPUT.PUT_LINE('AFTER INSERT ROWS'); 
END; 
insert into NewTable(x,y) values (21,'String21');

CREATE OR REPLACE TRIGGER NEWTABLE_AFTER_DELETE_ROWS 
AFTER DELETE ON NewTable 
FOR EACH ROW 
BEGIN 
INSERT INTO AUDITT VALUES('DELETE','TEACH_AFTER_DELETE',:old.x||' '||:new.x); 
DBMS_OUTPUT.PUT_LINE('AFTER DELETE ROWS'); 
END; 
DELETE NewTable WHERE y='String10' OR y='String15'; 
---------------------— 

/*11*/
CREATE OR REPLACE TRIGGER NewTable_DELL 
BEFORE DROP ON SYSTEM.SCHEMA 
BEGIN 
DBMS_OUTPUT.PUT_LINE('ERROR DROP'); 
END; 

/*12*/
drop table NewTable

/*13*/
drop table AUDITT

CREATE TABLE KKK 
( ID INT) 
DROP TABLE KKK 

INSERT INTO NewTable(x,y) VALUES(16,'Streng2'); 
DELETE FROM NewTable WHERE y='Streng2' 
SELECT * FROM AUDITT 


/*14*/
create view vnewtab
as select x, y from NewTable

select * from vnewtab


/*14?????*/
create or replace trigger trnewtab
instead of insert or update or delete on vnewtab
for each row
begin
  if inserting then dbms_output.put_line('insert:'||:new.x);
  else if updating then dbms_output.put_line('update:'||rtrim(:old.y) ||'->'||:new.y);
  else if deleting then dbms_output.put_line('delete:'||:old.x);
  end if;
end if;
end;

insert into vnewtab(x,y) values (41,'Streng41');
update vnewtab set x = 21;
delete vnewtab;

SELECT * FROM AUDITT

select * from KKK

CREATE OR REPLACE TRIGGER newtable_before_dml_row 
BEFORE INSERT OR UPDATE OR DELETE ON NewTable 
FOR EACH ROW 
DECLARE 
operationType NVARCHAR2(50) := ''; 
triggerName NVARCHAR2(50) := 'newtable_before_dml_row'; 
data NVARCHAR2(50) := ''; 
BEGIN 
IF INSERTING THEN 
operationType := 'inserting'; 
END IF; 
IF UPDATING THEN 
operationType := 'updating'; 
END IF; 
IF DELETING THEN 
operationType := 'deleting'; 
END IF; 
data := (:OLD.y || ' ' || :NEW.y); 

INSERT INTO AUDITT(OperationType, TriggerName, DataT) VALUES (operationType, triggerName, data); 
END;

Insert into newtable(x,y) values (125, 'Streng125');

select * from auditt
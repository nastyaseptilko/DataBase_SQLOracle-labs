/*1*/

/*2*/
DECLARE 
Z1 VARCHAR2(100); 
Z2 VARCHAR2(100); 
Z3 VARCHAR2(100); 
K1 INT:=0; 
K2 INT:=0; 
CURSOR CUR_TEACH 
IS SELECT TEACHER,TEACHER_NAME,PULPIT,BIRTHDAY,SALARY FROM TEACHER; 
CC_SUB TEACHER%ROWTYPE; 
BEGIN 
OPEN CUR_TEACH; 
FETCH CUR_TEACH INTO CC_SUB; 
WHILE CUR_TEACH%FOUND 
LOOP 
K1:=INSTR(CC_SUB.TEACHER_NAME, ' '); 
K2:=INSTR(CC_SUB.TEACHER_NAME, ' ',1,2); 
Z1:=SUBSTR(CC_SUB.TEACHER_NAME,1,K1); 
Z2:=SUBSTR(CC_SUB.TEACHER_NAME,K1,K2); 
Z2:=SUBSTR(Z2,1,2); 
Z3:=SUBSTR(CC_SUB.TEACHER_NAME,K2); 
Z3:=SUBSTR(Z3,1,2); 
DBMS_OUTPUT.PUT_LINE(Z1||' '||Z2||'.'||Z3||'.'); 
FETCH CUR_TEACH INTO CC_SUB; 
END LOOP; 
CLOSE CUR_TEACH; 
END;

/*3*/
DECLARE 
CURSOR CUR_TEACH 
IS SELECT TEACHER,TEACHER_NAME,PULPIT,BIRTHDAY,SALARY FROM TEACHER; 
CC_SUB TEACHER%ROWTYPE; 
BEGIN 
OPEN CUR_TEACH; 
FETCH CUR_TEACH INTO CC_SUB; 
WHILE CUR_TEACH%FOUND 
LOOP 
if (next_day(CC_SUB.BIRTHDAY,'�������'))=CC_SUB.BIRTHDAY+7 then DBMS_OUTPUT.PUT_LINE(CC_SUB.TEACHER_NAME||' '||CC_SUB.BIRTHDAY); end if; 
FETCH CUR_TEACH INTO CC_SUB; 
END LOOP; 
CLOSE CUR_TEACH; 
END; 

/*4*/
DECLARE 
L INT:=100; 
CURSOR CUR_TEACH 
IS SELECT TEACHER,TEACHER_NAME,PULPIT,BIRTHDAY,SALARY FROM TEACHER; 
CC_SUB TEACHER%ROWTYPE; 
BEGIN 
OPEN CUR_TEACH; 
FETCH CUR_TEACH INTO CC_SUB; 
WHILE CUR_TEACH%FOUND 
LOOP 
L:=MONTHS_BETWEEN(SYSDATE+30,CC_SUB.BIRTHDAY); 
WHILE L>12 
LOOP 
L:=L-12; 
END LOOP; 
IF L=12 THEN DBMS_OUTPUT.PUT_LINE(CC_SUB.TEACHER_NAME||' '||CC_SUB.BIRTHDAY); END IF;  
FETCH CUR_TEACH INTO CC_SUB; 
END LOOP; 
CLOSE CUR_TEACH; 
END; 

CREATE VIEW NEXT_MONTH_BIRTHDAY AS SELECT * FROM TEACHER WHERE EXTRACT (MONTH FROM SYSDATE)+1=EXTRACT (MONTH FROM BIRTHDAY); 
SELECT * FROM NEXT_MONTH_BIRTHDAY; 

/*5*/
create view number_teacher as SELECT SUM(CASE WHEN EXTRACT(MONTH FROM BIRTHDAY)=1 THEN 1 ELSE 0 END)"������", 
SUM(CASE WHEN EXTRACT(MONTH FROM BIRTHDAY)=2 THEN 1 ELSE 0 END)"�������", 
SUM(CASE WHEN EXTRACT(MONTH FROM BIRTHDAY)=3 THEN 1 ELSE 0 END)"����", 
SUM(CASE WHEN EXTRACT(MONTH FROM BIRTHDAY)=4 THEN 1 ELSE 0 END)"������", 
SUM(CASE WHEN EXTRACT(MONTH FROM BIRTHDAY)=5 THEN 1 ELSE 0 END)"���", 
SUM(CASE WHEN EXTRACT(MONTH FROM BIRTHDAY)=6 THEN 1 ELSE 0 END)"����", 
SUM(CASE WHEN EXTRACT(MONTH FROM BIRTHDAY)=7 THEN 1 ELSE 0 END)"����", 
SUM(CASE WHEN EXTRACT(MONTH FROM BIRTHDAY)=8 THEN 1 ELSE 0 END)"������", 
SUM(CASE WHEN EXTRACT(MONTH FROM BIRTHDAY)=9 THEN 1 ELSE 0 END)"��������", 
SUM(CASE WHEN EXTRACT(MONTH FROM BIRTHDAY)=10 THEN 1 ELSE 0 END)"�������", 
SUM(CASE WHEN EXTRACT(MONTH FROM BIRTHDAY)=11 THEN 1 ELSE 0 END)"������", 
SUM(CASE WHEN EXTRACT(MONTH FROM BIRTHDAY)=12 THEN 1 ELSE 0 END)"�������" 
FROM TEACHER; 

select * from number_teacher;

/*6*/
DECLARE 
L INT:=100; 
Z INT:=0; 
CURSOR CUR_TEACH 
IS SELECT TEACHER,TEACHER_NAME,PULPIT,BIRTHDAY,SALARY FROM TEACHER; 
CC_SUB TEACHER%ROWTYPE; 
BEGIN 
OPEN CUR_TEACH; 
FETCH CUR_TEACH INTO CC_SUB; 
WHILE CUR_TEACH%FOUND 
LOOP 
L:=MONTHS_BETWEEN(SYSDATE+60,CC_SUB.BIRTHDAY)/11.8; 
Z:=MOD(L,5); 
IF Z=0 THEN DBMS_OUTPUT.PUT_LINE(CC_SUB.TEACHER_NAME||' '||CC_SUB.BIRTHDAY||' '||L); 
END IF;  
FETCH CUR_TEACH INTO CC_SUB; 
END LOOP; 
CLOSE CUR_TEACH; 
END; 


/*7*/
DECLARE 
Z INT:=0; 
K INT:=0; 
CURSOR CUR_TEACH 
IS SELECT TEACHER,TEACHER_NAME,PULPIT,BIRTHDAY,SALARY FROM TEACHER; 
CC_SUB TEACHER%ROWTYPE; 
BEGIN 
OPEN CUR_TEACH; 
FETCH CUR_TEACH INTO CC_SUB; 
WHILE CUR_TEACH%FOUND 
LOOP 
IF CC_SUB.PULPIT='����' THEN 
Z:=Z+CC_SUB.SALARY; 
K:=K+1; 
END IF; 
FETCH CUR_TEACH INTO CC_SUB; 
END LOOP; 
Z:=Z/K; 
DBMS_OUTPUT.PUT_LINE('AVG SALARY='||Z); 
CLOSE CUR_TEACH; 
END; 


/*8*/
DECLARE 
TYPE PRIM IS RECORD 
( 
MY_NAME VARCHAR2(15):='World', 
SALARY INT:=50 
); 
PAREN PRIM ; 
PAREN2 PRIM; 
BEGIN 
DBMS_OUTPUT.PUT_LINE(PAREN.MY_NAME||' '||PAREN.SALARY); 
PAREN2.MY_NAME:='Hello World!'; 
PAREN2.SALARY:=1000; 
DBMS_OUTPUT.PUT_LINE(PAREN2.MY_NAME||' '||PAREN2.SALARY);
END; 
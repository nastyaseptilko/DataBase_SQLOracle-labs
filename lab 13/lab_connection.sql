/*1*/
CREATE OR REPLACE PROCEDURE GET_TEACHERS(in_pcode IN TEACHER.PULPIT%TYPE) AS
  CURSOR teacher IS SELECT *
                    FROM TEACHER
                    WHERE PULPIT = in_pcode;
  teacher_item TEACHER%ROWTYPE;
  BEGIN
    OPEN teacher;
    FETCH teacher INTO teacher_item;
    WHILE teacher%FOUND
    LOOP
      dbms_output.put_line(
          teacher_item.TEACHER || ' ' || teacher_item.TEACHER_NAME || ' ' || teacher_item.SALARY || ' ' ||
          teacher_item.BIRTHDAY);
      FETCH teacher INTO teacher_item;
    END LOOP;
  END;

BEGIN
  GET_TEACHERS('»—Ë“');
END;

/*2*/
create or replace function selcy
return number is
  rc number(5);
begin 
  select max(auditorium_capacity) into rc from auditorium;
  return rc;
exception 
 when others then return -1;
 end selcy;
 
 SELECT SELCY FROM DUAL;
 
 /*3*/
 CREATE OR REPLACE PROCEDURE GET_NUM_TEACHERS(PCODE TEACHER.PULPIT%TYPE)
  AS
  CURSOR teacher IS SELECT *
                    FROM TEACHER
                    WHERE PULPIT = PCODE;
  teacher_item TEACHER%ROWTYPE;
  BEGIN
    OPEN teacher;
    FETCH teacher INTO teacher_item;
    WHILE teacher%FOUND
    LOOP
      dbms_output.put_line(
          teacher_item.TEACHER || ' ' || teacher_item.TEACHER_NAME || ' ' || teacher_item.SALARY || ' ' ||
          teacher_item.BIRTHDAY);
      FETCH teacher INTO teacher_item;
    END LOOP;
    RETURN teacher%ROWCOUNT;
  END;

SELECT GET_NUM_TEACHERS('»ƒËœ') FROM dual;

/*4*/
 CREATE OR REPLACE PROCEDURE GET_TEACHERS(in_fcode FACULTY.FACULTY%TYPE) AS  
  CURSOR teacher IS SELECT *
                    FROM TEACHER
                      INNER JOIN PULPIT ON TEACHER.PULPIT = PULPIT.PULPIT
                      INNER JOIN FACULTY ON PULPIT.FACULTY = FACULTY.FACULTY
                    WHERE FACULTY.FACULTY = in_fcode;
  teacher_item TEACHER%ROWTYPE;
    BEGIN
    OPEN teacher;
    FETCH teacher INTO teacher_item;
    WHILE teacher%FOUND
    LOOP
      dbms_output.put_line(
          teacher_item.TEACHER || ' ' || teacher_item.TEACHER_NAME || ' ' || teacher_item.SALARY || ' ' ||
          teacher_item.BIRTHDAY);
      FETCH teacher INTO teacher_item;
    END LOOP;
  END;

begin
GET_TEACHERS('’“Ë“');
end;

 CREATE OR REPLACE PROCEDURE GET_SUBJECT(in_Pcode SUBJECT.PULPIT%TYPE) AS  
  CURSOR subject IS SELECT *
                    FROM SUBJECT
                      INNER JOIN PULPIT ON SUBJECT.PULPIT = PULPIT.PULPIT
                      WHERE SUBJECT.PULPIT = in_Pcode;
  subject_item SUBJECT%ROWTYPE;
    BEGIN
    OPEN subject;
    FETCH subject INTO subject_item;
    WHILE subject%FOUND
    LOOP
      dbms_output.put_line(
          subject_item.SUBJECT || ' ' || subject_item.SUBJECT_NAME || '            ' || subject_item.PULPIT_NAME);
      FETCH subject INTO subject_item;
    END LOOP;
  END;

begin
GET_SUBJECT('»—Ë“');
end;

/*5*/
CREATE OR REPLACE FUNCTION GET_NUM_TEACHERS(FCODE FACULTY.FACULTY%TYPE)
  RETURN NUMBER AS
  CURSOR teacher IS SELECT *
                    FROM TEACHER
                      INNER JOIN PULPIT ON TEACHER.PULPIT = PULPIT.PULPIT
                      INNER JOIN FACULTY ON PULPIT.FACULTY = FACULTY.FACULTY
                    WHERE PULPIT.FACULTY = FCODE;
  teacherItem TEACHER%ROWTYPE;
  BEGIN
    OPEN teacher;
    FETCH teacher INTO teacherItem;
    WHILE teacher%FOUND
    LOOP
      FETCH teacher INTO teacherItem;
    END LOOP;
    RETURN teacher%ROWCOUNT;
  END;

SELECT GET_NUM_TEACHERS('»ƒËœ') FROM dual;

CREATE OR REPLACE FUNCTION GET_NUM_SUBJECTS(PCODE SUBJECT.PULPIT%TYPE)
  RETURN NUMBER AS
  CURSOR subject IS SELECT *
                    FROM SUBJECT
                      INNER JOIN PULPIT ON SUBJECT.PULPIT = PULPIT.PULPIT
                    WHERE PULPIT.PULPIT = PCODE;
  subjectItem SUBJECT%ROWTYPE;
  BEGIN
    OPEN subject;
    FETCH subject INTO subjectItem;
    WHILE subject%FOUND
    LOOP
      FETCH subject INTO subjectItem;
    END LOOP;
    RETURN subject%ROWCOUNT;
  END;

SELECT GET_NUM_SUBJECTS('»—Ë“') FROM dual;

/*6*/
CREATE OR REPLACE PACKAGE TEACHERS AS
  PROCEDURE GET_TEACHERS(in_pcode IN TEACHER.PULPIT%TYPE);
  PROCEDURE GET_SUBJECTS(PCODE SUBJECT.PULPIT%TYPE);
  FUNCTION GET_NUM_TEACHERS(FCODE FACULTY.FACULTY%TYPE)
    RETURN NUMBER;
  FUNCTION GET_NUM_SUBJECTS(PCODE SUBJECT.PULPIT%TYPE)
    RETURN NUMBER;
END;

CREATE OR REPLACE PACKAGE BODY TEACHERS AS
  PROCEDURE GET_TEACHERS(in_pcode IN TEACHER.PULPIT%TYPE) AS
    CURSOR teacher IS SELECT *
                      FROM TEACHER
                      WHERE PULPIT = in_pcode;
    teacher_item TEACHER%ROWTYPE;
    BEGIN
      OPEN teacher;
      FETCH teacher INTO teacher_item;
      WHILE teacher%FOUND
      LOOP
        dbms_output.put_line(
            teacher_item.TEACHER || ' ' || teacher_item.TEACHER_NAME || ' ' || teacher_item.SALARY || ' ' ||
            teacher_item.BIRTHDAY);
        FETCH teacher INTO teacher_item;
      END LOOP;
    END;

  PROCEDURE GET_SUBJECTS(PCODE SUBJECT.PULPIT%TYPE) AS
    CURSOR subject IS SELECT *
                      FROM SUBJECT
                        INNER JOIN PULPIT ON SUBJECT.PULPIT = PULPIT.PULPIT
                      WHERE SUBJECT.PULPIT = PCODE;
    subjectItem SUBJECT%ROWTYPE;
    BEGIN
      OPEN subject;
      FETCH subject INTO subjectItem;
      WHILE subject%FOUND
      LOOP
        dbms_output.put_line(subjectItem.SUBJECT_NAME || ' ' || subjectItem.PULPIT_NAME);
        FETCH subject INTO subjectItem;
      END LOOP;
    END;

  FUNCTION GET_NUM_TEACHERS(FCODE FACULTY.FACULTY%TYPE)
    RETURN NUMBER AS
    CURSOR teacher IS SELECT *
                      FROM TEACHER
                        INNER JOIN PULPIT ON TEACHER.PULPIT = PULPIT.PULPIT
                        INNER JOIN FACULTY ON PULPIT.FACULTY = FACULTY.FACULTY
                      WHERE PULPIT.FACULTY = FCODE;
    teacherItem TEACHER%ROWTYPE;
    BEGIN
      OPEN teacher;
      FETCH teacher INTO teacherItem;
      WHILE teacher%FOUND
      LOOP
        FETCH teacher INTO teacherItem;
      END LOOP;
      RETURN teacher%ROWCOUNT;
    END;

  FUNCTION GET_NUM_SUBJECTS(PCODE SUBJECT.PULPIT%TYPE)
    RETURN NUMBER AS
    CURSOR subject IS SELECT *
                      FROM SUBJECT
                        INNER JOIN PULPIT ON SUBJECT.PULPIT = PULPIT.PULPIT
                      WHERE PULPIT.PULPIT = PCODE;
    subjectItem SUBJECT%ROWTYPE;
    BEGIN
      OPEN subject;
      FETCH subject INTO subjectItem;
      WHILE subject%FOUND
      LOOP
        FETCH subject INTO subjectItem;
      END LOOP;
      RETURN subject%ROWCOUNT;
    END;

END;


/*7*/
BEGIN
  dbms_output.put_line(TEACHERS.GET_NUM_SUBJECTS('»—Ë“'));
  dbms_output.put_line(TEACHERS.GET_NUM_TEACHERS('»ƒËœ'));

  TEACHERS.GET_SUBJECTS('»—Ë“');
  TEACHERS.GET_TEACHERS('»ƒËœ');
END;

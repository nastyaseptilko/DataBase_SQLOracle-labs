CREATE TABLE TEACHER_BACKUP (
  TEACHER      NUMBER,
  TEACHER_NAME NVARCHAR2(50),
  PULPIT       NUMBER,
  SALARY       NUMBER,
  BIRTHDAY     DATE
);

CREATE TABLE JOB_STATUS (
  STATUS   NVARCHAR2(50),
  DATETIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- stored procedure
CREATE OR REPLACE PROCEDURE jobProcedure AS
  CURSOR teacherCursor IS SELECT *
                          FROM TEACHER
                          WHERE TEACHER_NAME = 'backup';
  teacherItem TEACHER%ROWTYPE;
  BEGIN
    OPEN teacherCursor;
    FETCH teacherCursor INTO teacherItem;
    WHILE teacherCursor%FOUND
    LOOP
      INSERT INTO TEACHER_BACKUP (TEACHER, TEACHER_NAME, PULPIT, SALARY, BIRTHDAY)
      VALUES
        (teacherItem.TEACHER, teacherItem.TEACHER_NAME, teacherItem.PULPIT, teacherItem.SALARY, teacherItem.BIRTHDAY);
      FETCH teacherCursor INTO teacherItem;
    END LOOP;

    DELETE FROM TEACHER
    WHERE TEACHER_NAME = 'backup';

    INSERT INTO JOB_STATUS (STATUS) VALUES ('SUCCESS');

    COMMIT;

    EXCEPTION WHEN OTHERS THEN INSERT INTO JOB_STATUS (STATUS) VALUES ('FAIL');
    CLOSE teacherCursor;
  END;

CREATE OR REPLACE PROCEDURE jobProcedure2 AS
  BEGIN
    dbms_output.put_line('procedure job');
  END;

-- Task 1. DBMS_JOB. Actions
DECLARE v_job NUMBER;
BEGIN
  dbms_job.submit(
      job => v_job,
      what => 'BEGIN jobProcedure2(); END;',
      next_date => TRUNC(SYSDATE + 1) + 3 / 24,
      interval => 'trunc(sysdate+1)+3/24');
  COMMIT;
END;

BEGIN
  dbms_job.remove(
      job => 3);
  COMMIT;
END;

BEGIN
  dbms_job.run(job => 5);
END;

BEGIN
  dbms_job.broken(job => 5, broken => TRUE);
  COMMIT;
END;

BEGIN
  dbms_job.change(job => 5, what => NULL, next_date => TRUNC(SYSDATE + 1) + 3 / 24, interval => NULL, instance => NULL,
                  force => NULL);
END;


ALTER SYSTEM SET JOB_QUEUE_PROCESSES = 10;

SELECT * FROM DBA_JOBS;

SELECT * FROM DBA_JOBS_RUNNING;


-- Task 2. DBMS_SCHEDULER. Actions
BEGIN
  dbms_scheduler.CREATE_JOB(
      job_name => 'js2',
      job_type => 'STORED_PROCEDURE',
      job_action => 'jobProcedure',
      start_date => SYSTIMESTAMP + INTERVAL '1' MINUTE,
      repeat_interval => 'FREQ=MONTHLY; BYDAY=SUN, -1 SAT',
      ENABLED => TRUE
  );
END;

BEGIN
  DBMS_SCHEDULER.DROP_JOB('js', TRUE);
END;


BEGIN
  DBMS_SCHEDULER.RUN_JOB('js2');
END;

BEGIN
  DBMS_SCHEDULER.STOP_JOB('js2');
END;

BEGIN
  DBMS_SCHEDULER.SET_ATTRIBUTE('js2', attribute => 'job_action', value => 'jobProcedure');
END;


SELECT * FROM DBA_JOBS_RUNNING;

SELECT * FROM dba_scheduler_jobs;

SELECT * FROM dba_scheduler_job_log;

SELECT * FROM dba_scheduler_job_classes;

SELECT * FROM dba_scheduler_job_run_details;

SELECT * FROM dba_scheduler_window_log;

SELECT * FROM dba_scheduler_window_details;
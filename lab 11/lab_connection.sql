/*Неявные курсоры*/

/*1*/
declare 
faculty_rec faculty%rowtype;
begin 
  select * into faculty_rec from faculty where faculty = 'ФИТ';
  DBMS_OUTPUT.PUT_LINE(faculty_rec.faculty ||' '||faculty_rec.faculty_name);
  exception
  when others
  then DBMS_OUTPUT.PUT_LINE(sqlerrm);
  end;
  
  /*2*/
  declare 
faculty_rec faculty%rowtype;
begin 
  select * into faculty_rec from faculty;
  DBMS_OUTPUT.PUT_LINE(faculty_rec.faculty ||' '||faculty_rec.faculty_name);
  exception
  when others
  then dbms_output.put_line('WHEN OTHERS: '||sqlerrm);
  end;
  
  /*3*/
  declare 
faculty_rec faculty%rowtype;
begin 
  select * into faculty_rec from faculty;
  DBMS_OUTPUT.PUT_LINE(faculty_rec.faculty ||' '||faculty_rec.faculty_name);
  exception
  when too_many_rows
  then DBMS_OUTPUT.PUT_LINE('WHEN TO_MANY_ROWS: результат состоит из нескольких строк (ORA'||sqlcode||')');
  end;
  
  /*4*/
  declare 
  faculty_rec faculty%rowtype;
  begin
  select * into faculty_rec from faculty where faculty = 'XXX';
  DBMS_OUTPUT.PUT_LINE(faculty_rec.faculty||' '||faculty_rec.faculty_name);
  exception
  when no_data_found
  then
    dbms_output.put_line('данные не найдены (ORA '||sqlcode||')');
    DBMS_OUTPUT.PUT_LINE(sqlerrm);
  when too_many_rows
  then DBMS_OUTPUT.PUT_LINE('результат состоит из нескольких строк (ORA'||sqlcode||')');
  when others
  then SYS.DBMS_OUTPUT.PUT_LINE(sqlerrm);
end;

/*5*/
declare 
b1 boolean;
b2 boolean;
b3 boolean;
n pls_integer;
auditorium_cur auditorium%rowtype;
begin 
update auditorium set auditorium='314-1',
                      auditorium_name = '314-1',
                      auditorium_capacity = 90,
                      auditorium_type = 'ЛК'
                where auditorium='301-1';
rollback;
b1 := sql%found;
b2 := sql%isopen;
b3 := sql%notfound;
n := sql%rowcount;
dbms_output.put_line(auditorium_cur.auditorium_name || ' ' ||
                      auditorium_cur.auditorium_capacity|| ' '||
                      auditorium_cur.auditorium_type);
if b1 then dbms_output.put_line('b1 = true');
      else dbms_output.put_line('b1 = false');
  end if;
if b2 then dbms_output.put_line('b2 = true');
      else dbms_output.put_line('b2 = false');
  end if;
 if b3 then dbms_output.put_line('b3 = true');
      else dbms_output.put_line('b3 = false');
  end if;
 dbms_output.put_line('n = '||n);
 exception
  when others
  then dbms_output.put_line(sqlerrm);
  end;
  
  /*6*/
  DECLARE 
SUB auditorium%ROWTYPE; 
BEGIN 
UPDATE auditorium SET 
auditorium_capacity='Z' 
WHERE AUDITORIUM_NAME='301-1'; 
SELECT * INTO SUB FROM AUDITORIUM WHERE AUDITORIUM_NAME='301-1'; 
DBMS_OUTPUT.PUT_LINE(SUB.AUDITORIUM_CAPACITY); 
EXCEPTION 
WHEN OTHERS 
THEN 
DBMS_OUTPUT.PUT_LINE(SQLERRM); 
END;

  /*7*/
  declare 
b1 boolean;
b2 boolean;
b3 boolean;
n pls_integer;
auditorium_cur auditorium%rowtype;
begin 
insert into auditorium(auditorium,auditorium_name,auditorium_capacity,auditorium_type) 
values('304-1','304-1',80,'ЛК');
b1 := sql%found;
b2 := sql%isopen;
b3 := sql%notfound;
n := sql%rowcount;
dbms_output.put_line(auditorium_cur.auditorium_name || ' ' ||
                      auditorium_cur.auditorium_capacity|| ' '||
                      auditorium_cur.auditorium_type);
if b1 then dbms_output.put_line('b1 = true');
      else dbms_output.put_line('b1 = false');
  end if;
if b2 then dbms_output.put_line('b2 = true');
      else dbms_output.put_line('b2 = false');
  end if;
 if b3 then dbms_output.put_line('b3 = true');
      else dbms_output.put_line('b3 = false');
  end if;
 dbms_output.put_line('n = '||n);
rollback;
 exception
  when others
  then dbms_output.put_line(sqlerrm);
  end;
  
  /*8*/
  declare 
b1 boolean;
b2 boolean;
b3 boolean;
n pls_integer;
auditorium_cur auditorium%rowtype;
begin 
insert into auditorium(auditorium,auditorium_name,auditorium_capacity,auditorium_type) 
values('301-1','301-1',90,'ЛК');
--rollback;
b1 := sql%found;
b2 := sql%isopen;
b3 := sql%notfound;
n := sql%rowcount;
dbms_output.put_line(auditorium_cur.auditorium_name || ' ' ||
                      auditorium_cur.auditorium_capacity|| ' '||
                      auditorium_cur.auditorium_type);
if b1 then dbms_output.put_line('b1 = true');
      else dbms_output.put_line('b1 = false');
  end if;
if b2 then dbms_output.put_line('b2 = true');
      else dbms_output.put_line('b2 = false');
  end if;
 if b3 then dbms_output.put_line('b3 = true');
      else dbms_output.put_line('b3 = false');
  end if;
 dbms_output.put_line('n = '||n);
rollback;
 exception
  when others
  then dbms_output.put_line(sqlerrm);
  end;
  
  /*9*/
    declare 
b1 boolean;
b2 boolean;
b3 boolean;
n pls_integer;
begin 
delete auditorium where auditorium = '301-4';
b1 := sql%found;
b2 := sql%isopen;
b3 := sql%notfound;
n := sql%rowcount;
if b1 then dbms_output.put_line('b1 = true');
      else dbms_output.put_line('b1 = false');
  end if;
if b2 then dbms_output.put_line('b2 = true');
      else dbms_output.put_line('b2 = false');
  end if;
 if b3 then dbms_output.put_line('b3 = true');
      else dbms_output.put_line('b3 = false');
  end if;
 dbms_output.put_line('n = '||n);
rollback;
 exception
  when others
  then dbms_output.put_line(sqlerrm);
  end;
  
  /*10*/
  DECLARE 
SUB AUDITORIUM_TYPE%ROWTYPE; 
BEGIN 
DELETE FROM AUDITORIUM_TYPE WHERE AUDITORIUM_TYPE='ЛК'; 
EXCEPTION 
WHEN OTHERS 
THEN 
DBMS_OUTPUT.PUT_LINE(SQLERRM); 
END;
  
  /*Явные курсоры*/
  /*11*/
   declare 
  cursor curs_teacher is select teacher, teacher_name, pulpit
      from teacher;
  m_teacher system.teacher.teacher%type;
  m_teacher_name system.teacher.teacher_name%type;
  m_pulpit system.teacher.pulpit%type;
  begin
    open curs_teacher;
    DBMS_OUTPUT.PUT_LINE('rowcount = '||curs_teacher%rowcount);
    loop
    fetch curs_teacher into m_teacher, m_teacher_name, m_pulpit;
    exit when curs_teacher%notfound;
    DBMS_OUTPUT.PUT_LINE(' '||curs_teacher%rowcount||' '
                          ||m_teacher||' '
                          ||m_teacher_name||' '
                          ||m_pulpit);
    end loop;
     DBMS_OUTPUT.PUT_LINE('rowcount = '|| curs_teacher%rowcount);
     close curs_teacher;
    exception
    when others
    then  DBMS_OUTPUT.PUT_LINE(sqlerrm);
    end;
    
  /*12*/
  declare 
  cursor curs_subject is select subject, subject_name, pulpit
      from subject;
 rec_subject system.subject%rowtype;
  begin
    open curs_subject;
    DBMS_OUTPUT.PUT_LINE('rowcount = '||curs_subject%rowcount);
    loop
    fetch curs_subject into rec_subject;
    exit when curs_subject%notfound;
    DBMS_OUTPUT.PUT_LINE(' '||curs_subject%rowcount||' '
                          ||rec_subject.subject||' '
                          ||rec_subject.subject_name||' '
                          ||rec_subject.pulpit);
    end loop;

     DBMS_OUTPUT.PUT_LINE('rowcount = '|| curs_subject%rowcount);
      close curs_subject;
     exception
    when others
    then  DBMS_OUTPUT.PUT_LINE(sqlerrm);
    end;
/*13*/
declare 
  cursor curs_pulpit
  is select pulpit.pulpit,teacher.teacher_name
    from pulpit inner join teacher on pulpit.pulpit = teacher.pulpit;
    rec_pulpit curs_pulpit%rowtype;
    begin
    for rec_pulpit IN curs_pulpit
    loop
    dbms_output.put_line(' ' ||curs_pulpit%rowcount||' '
                        ||rec_pulpit.pulpit||' '
                        ||rec_pulpit.teacher_name);
    end loop;
  exception
  when others
  then dbms_output.put_line(sqlerrm);
  end;
  
/*14*/
declare 
  cursor curs_auditorium(capacity system.auditorium.auditorium%type,capac system.auditorium.auditorium%type)
    is select auditorium, auditorium_capacity
      from auditorium
      where auditorium_capacity >=capacity and AUDITORIUM_CAPACITY <= capac;
begin
  dbms_output.put_line('Кол-во <20 ');
  for aum in curs_auditorium(0,20)
  loop
  dbms_output.put_line(' '||aum.auditorium||' '||aum.auditorium_capacity);
  end loop;  
  dbms_output.put_line('Кол-во 20 and 30');
  for aum in curs_auditorium(21,30)
  loop
  dbms_output.put_line(' '||aum.auditorium||' '||aum.auditorium_capacity);
  end loop;  
   dbms_output.put_line('Кол-во 30 and 60 ');
  for aum in curs_auditorium(31,60)
  loop
  dbms_output.put_line(' '||aum.auditorium||' '||aum.auditorium_capacity);
  end loop;  
   dbms_output.put_line('Кол-во 60 and 80 ');
  for aum in curs_auditorium(61,80)
  loop
  dbms_output.put_line(' '||aum.auditorium||' '||aum.auditorium_capacity);
  end loop;  
   dbms_output.put_line('Кол-во >80 ');
  for aum in curs_auditorium(81,1000)
  loop
  dbms_output.put_line(' '||aum.auditorium||' '||aum.auditorium_capacity);
  end loop;  
 exception
  when others
  then dbms_output.put_line(sqlerrm);
  end;

/*15*/
variable x refcursor;
declare 
  type teacher_name is ref cursor return teacher%rowtype;
  xcurs teacher_name;
  rec_teacher teacher%rowtype;
  begin
  open xcurs for select * from system.teacher;
  :x :=xcurs;
  exception
    when others 
    then dbms_output.put_line(sqlerrm);
    
    end;
    
    print x;
    
    /*16*/
    declare 
    cursor curs_aut
    is select auditorium_type,
      cursor (
          select auditorium
          from auditorium aum
          where aut.auditorium_type = aum.auditorium_type
      )
      from auditorium_type aut;
     curs_aum sys_refcursor;
     aut auditorium_type.auditorium_type%type;
     txt varchar2(1000);
     aum auditorium.auditorium%type;
     begin
      open curs_aut;
      fetch curs_aut into aut, curs_aum;
      while(curs_aut%found)
      loop
        txt:=rtrim(aut)||':';
        loop
          fetch curs_aum into aum;
          exit when curs_aum%notfound;
          txt := txt||','||rtrim(aum);
        end loop;
        dbms_output.put_line(txt);
        fetch curs_aut into aut, curs_aum;
      end loop;
      close curs_aut;
    exception
      when others
      then dbms_output.put_line(sqlerrm);
    end;
    
   /*17*/ 
declare 
  cursor curs_auditorium(capacity system.auditorium.auditorium%type, capac system.auditorium.auditorium%type)
    is select auditorium, auditorium_capacity
      from auditorium
      where auditorium_capacity >=capacity and AUDITORIUM_CAPACITY <= capac for update;
  aum system.auditorium.auditorium%type;
  cty system.auditorium.auditorium_capacity%type;
begin
  open curs_auditorium(40,80);
  fetch curs_auditorium into aum, cty;
  while(curs_auditorium%found)
  loop
  cty := cty * 0.9;
  update auditorium
  set auditorium_capacity = cty
  where current of curs_auditorium;
  dbms_output.put_line(' '||aum||' '||cty);
  fetch curs_auditorium into aum, cty;
  end loop;
  close curs_auditorium;
  rollback;
exception
  when others
  then dbms_output.put_line(sqlerrm);
  end;
  
  /*18*/
  declare 
  cursor curs_auditorium(capacity system.auditorium.auditorium%type,capac system.auditorium.auditorium%type)
    is select auditorium, auditorium_capacity
      from auditorium
      where auditorium_capacity >=capacity and AUDITORIUM_CAPACITY <= capac for update;
  aum system.auditorium.auditorium%type;
  cty system.auditorium.auditorium_capacity%type;
begin
  open curs_auditorium(0,20);
  fetch curs_auditorium into aum, cty;
  while(curs_auditorium%found)
  loop
  delete auditorium
  where current of curs_auditorium;
  fetch curs_auditorium into aum, cty;
  end loop;
  close curs_auditorium;
  
  for pp in curs_auditorium(0,120)
  loop
  dbms_output.put_line(' '||pp.auditorium||
                       ' '||pp.auditorium_capacity);
  end loop;
  rollback;
exception
  when others
  then dbms_output.put_line(sqlerrm);
  end;
  
  /*19*/
  declare
cursor curs_auditorium(capacity system.auditorium.auditorium%type)
    is select auditorium, auditorium_capacity, rowid
      from auditorium
      where auditorium_capacity >=capacity for update;
  aum system.auditorium.auditorium%type;
  cty system.auditorium.auditorium_capacity%type;
begin
  for xxx in curs_auditorium(80)
  loop
    case
    when xxx.auditorium_capacity > 90
      then delete auditorium
      where rowid = xxx.rowid;
    when xxx.auditorium_capacity >=80
      then update auditorium
      set auditorium_capacity = auditorium_capacity+3
      where rowid = xxx.rowid;
    end case;
  end loop;
  for yyy in curs_auditorium(80)
  loop
    dbms_output.put_line(' '||yyy.auditorium||
                         ' '||yyy.auditorium_capacity);
  end loop;
  rollback;
exception
  when others
  then dbms_output.put_line(sqlerrm);
  end;
  
  /*20*/
    declare 
  cursor curs_teacher is select teacher, teacher_name, pulpit
      from teacher;
  m_teacher system.teacher.teacher%type;
  m_teacher_name system.teacher.teacher_name%type;
  m_pulpit system.teacher.pulpit%type;
  k integer :=1;
  begin
    open curs_teacher;
    loop
    fetch curs_teacher into m_teacher, m_teacher_name, m_pulpit;
    exit when curs_teacher%notfound;
    DBMS_OUTPUT.PUT_LINE(' '||curs_teacher%rowcount||' '
                          ||m_teacher||' '
                          ||m_teacher_name||' '
                          ||m_pulpit);
    if (k mod 3 = 0) then DBMS_OUTPUT.PUT_LINE('-------------------------------------------'); end if;
    k:=k+1;
    end loop;
     DBMS_OUTPUT.PUT_LINE('rowcount = '|| curs_teacher%rowcount);
     close curs_teacher;
    exception
    when others
    then  DBMS_OUTPUT.PUT_LINE(sqlerrm);
    end;
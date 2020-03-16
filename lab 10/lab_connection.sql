CREATE TABLE FACULTY
  (
   FACULTY      CHAR(10)      NOT NULL,
   FACULTY_NAME VARCHAR2(50), 
   CONSTRAINT PK_FACULTY PRIMARY KEY(FACULTY) 
  );
     
insert into FACULTY   (FACULTY,   FACULTY_NAME )
             values  ('ИДиП',   'Издателькое дело и полиграфия');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ХТиТ',   'Химическая технология и техника');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ЛХФ',     'Лесохозяйственный факультет');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ИЭФ',     'Инженерно-экономический факультет');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ТТЛП',    'Технология и техника лесной промышленности');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ТОВ',     'Технология органических веществ');
insert into FACULTY   (FACULTY,   FACULTY_NAME )
            values  ('ФИТ',     'Факультет информационных технологий');

--------------------------------------------------------------------------------------------
-- DROP TABLE PULPIT
CREATE TABLE PULPIT 
(
 PULPIT       CHAR(10)      NOT NULL,
 PULPIT_NAME  VARCHAR2(100), 
 FACULTY      CHAR(10)      NOT NULL, 
 CONSTRAINT FK_PULPIT_FACULTY FOREIGN KEY(FACULTY)   REFERENCES FACULTY(FACULTY), 
 CONSTRAINT PK_PULPIT PRIMARY KEY(PULPIT) 
 ); 
 
delete PULPIT;  
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY )
             values  ('ИСиТ',    'Иформационный систем и технологий ',                         'ИДиП'  );
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY )
             values  ('ПОиСОИ', 'Полиграфического оборудования и систем обработки информации ', 'ИДиП'  );
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
              values  ('ЛВ',      'Лесоводства',                                                 'ЛХФ') ;         
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('ОВ',      'Охотоведения',                                                 'ЛХФ') ;   
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('ЛУ',      'Лесоустройства',                                              'ЛХФ');           
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('ЛЗиДВ',   'Лесозащиты и древесиноведения',                               'ЛХФ');                
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('ЛПиСПС',  'Ландшафтного проектирования и садово-паркового строительства','ЛХФ');                  
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('ТЛ',     'Транспорта леса',                                              'ТТЛП');                        
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('ЛМиЛЗ',  'Лесных машин и технологии лесозаготовок',                      'ТТЛП');                        
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                   FACULTY)
             values  ('ОХ',     'Органической химии',                                           'ТОВ');            
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                              FACULTY)
             values  ('ТНХСиППМ','Технологии нефтехимического синтеза и переработки полимерных материалов','ТОВ');             
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                      FACULTY)
             values  ('ТНВиОХТ','Технологии неорганических веществ и общей химической технологии ','ХТиТ');                    
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                                         FACULTY)
             values  ('ХТЭПиМЭЕ','Химии, технологии электрохимических производств и материалов электронной техники', 'ХТиТ');
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                      FACULTY)
             values  ('ЭТиМ',    'экономической теории и маркетинга',                              'ИЭФ');   
insert into PULPIT   (PULPIT,    PULPIT_NAME,                                                      FACULTY)
             values  ('МиЭП',   'Менеджмента и экономики природопользования',                      'ИЭФ');    
------------------------------------------------------------------------------------------------------------------------        - DROP  TABLE TEACHER
CREATE TABLE TEACHER
 ( 
  TEACHER       CHAR(10) NOT  NULL,
  TEACHER_NAME  VARCHAR2(50), 
  PULPIT        CHAR(10) NOT NULL, 
  BIRTHDAY      DATE,
  SALARY        NUMBER(5),
  CONSTRAINT PK_TEACHER  PRIMARY KEY(TEACHER), 
  CONSTRAINT FK_TEACHER_PULPIT FOREIGN   KEY(PULPIT)   REFERENCES PULPIT(PULPIT)
 ) ;
 
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('СМЛВ',    'Смелов Владимир Владиславович',  'ИСиТ','03.07.1960',1000);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('АКНВЧ',    'Акунович Станислав Иванович',  'ИСиТ','04.07.1961',600);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('КЛСНВ',    'Колесников Леонид Валерьевич', 'ИСиТ','05.08.1955',500);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('ГРМН',    'Герман Олег Витольдович', 'ИСиТ','06.05.1961',550);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('ЛЩНК',    'Лащенко Анатолий Пвалович',  'ИСиТ','01.08.1963',620);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('БРКВЧ',    'Бракович Андрей Игорьевич',  'ИСиТ','03.03.1971',480);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('ДДК',     'Дедко Александр Аркадьевич',  'ИСиТ','11.09.1965',490);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('КБЛ',     'Кабайло Александр Серафимович',  'ИСиТ','13.02.1960',530);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('УРБ',     'Урбанович Павел Павлович',  'ИСиТ','21.04.1964',710);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('РМНК',     'Романенко Дмитрий Михайлович',  'ИСиТ','17.07.1973',670);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('ПСТВЛВ',  'Пустовалова Наталия Николаевна', 'ИСиТ' ,'13.10.1968',460);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                      values  ('ГРН',     'Гурин Николай Иванович',  'ИСиТ','23.11.1963',580);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('ЖЛК',     'Жиляк Надежда Александровна',  'ИСиТ','12.01.1980',490);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('БРТШВЧ',   'Барташевич Святослав Александрович',  'ПОиСОИ','09.04.1972',390);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('ЮДНКВ',   'Юденков Виктор Степанович',  'ПОиСОИ','17.02.1974',380);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('БРНВСК',   'Барановский Станислав Иванович',  'ЭТиМ','21.01.1982',440);
insert into  TEACHER    (TEACHER,  TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('НВРВ',   'Неверов Александр Васильевич',  'МиЭП', '26.10.1975',430);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('РВКЧ',   'Ровкач Андрей Иванович',  'ОВ','19.02.1973',395);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('ДМДК', 'Демидко Марина Николаевна',  'ЛПиСПС','26.12.1978',320);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('МШКВСК',   'Машковский Владимир Петрович',  'ЛУ','23.10.1974',750);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('ЛБХ',   'Лабоха Константин Валентинович',  'ЛВ','28.03.1968',630);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('ЗВГЦВ',   'Звягинцев Вячеслав Борисович',  'ЛЗиДВ','26.11.1974',410); 
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('БЗБРДВ',   'Безбородов Владимир Степанович',  'ОХ','05.05.1972',610); 
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('ПРКПЧК',   'Прокопчук Николай Романович',  'ТНХСиППМ','07.08.1968',630); 
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('НСКВЦ',   'Насковец Михаил Трофимович',  'ТЛ','12.08.1969',465); 
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('МХВ',   'Мохов Сергей Петрович',  'ЛМиЛЗ','18.10.1973',345); 
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('ЕЩНК',   'Ещенко Людмила Семеновна',  'ТНВиОХТ','28.07.1972',415); 
insert into  TEACHER    (TEACHER,   TEACHER_NAME, PULPIT, BIRTHDAY,SALARY)
                       values  ('ЖРСК',   'Жарский Иван Михайлович',  'ХТЭПиМЭЕ','13.04.1955',860); 
---------------------------------------------------------------------------------------------------------------------
CREATE TABLE SUBJECT
    (
     SUBJECT      CHAR(10)     NOT NULL, 
     SUBJECT_NAME VARCHAR2(50)  NOT NULL,
     PULPIT       CHAR(10)     NOT NULL,  
     CONSTRAINT PK_SUBJECT PRIMARY KEY(SUBJECT),
     CONSTRAINT FK_SUBJECT_PULPIT FOREIGN  KEY(PULPIT)  REFERENCES PULPIT(PULPIT)
    );


insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('СУБД',   'Системы управления базами данных',                   'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT)
                       values ('БД',     'Базы данных',                                        'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ИНФ',    'Информацтонные технологии',                          'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ОАиП',  'Основы алгоритмизации и программирования',            'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ПЗ',     'Представление знаний в компьютерных системах',       'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ПСП',    'Пограммирование сетевых приложений',                 'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('МСОИ',     'Моделирование систем обработки информации',        'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ПИС',     'Проектирование информационных систем',              'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('КГ',      'Компьютерная геометрия ',                           'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ПМАПЛ',   'Полиграфические машины, автоматы и поточные линии', 'ПОиСОИ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('КМС',     'Компьютерные мультимедийные системы',               'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ОПП',     'Организация полиграфического производства',         'ПОиСОИ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                            PULPIT)
               values ('ДМ',   'Дискретная матеатика',                     'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                             PULPIT )
               values ('МП',   'Математисеское программирование',          'ИСиТ');  
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                             PULPIT )
               values ('ЛЭВМ', 'Логические основы ЭВМ',                     'ИСиТ');                   
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,                             PULPIT )
               values ('ООП',  'Объектно-ориентированное программирование', 'ИСиТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ЭП',     'Экономика природопользования',                       'МиЭП');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ЭТ',     'Экономическая теория',                               'ЭТиМ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('БЛЗиПсOO','Биология лесных зверей и птиц с осн. охотов.',      'ОВ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ОСПиЛПХ','Основы садовопаркового и лесопаркового хозяйства',  'ЛПиСПС');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ИГ',     'Инженерная геодезия ',                              'ЛУ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ЛВ',    'Лесоводство',                                        'ЛЗиДВ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ОХ',    'Органическая химия',                                 'ОХ');   
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ТРИ',    'Технология резиновых изделий',                      'ТНХСиППМ'); 
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ВТЛ',    'Водный транспорт леса',                             'ТЛ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ТиОЛ',   'Технология и оборудование лесозаготовок',           'ЛМиЛЗ'); 
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ТОПИ',   'Технология обогащения полезных ископаемых ',        'ТНВиОХТ');
insert into SUBJECT   (SUBJECT,   SUBJECT_NAME,        PULPIT )
                       values ('ПЭХ',    'Прикладная электрохимия',                           'ХТЭПиМЭЕ');          
---------------------------------------------------------------------------------------------------------------------
-- DROP TABLE AUDITORIUM_TYPE 
create table AUDITORIUM_TYPE 
(
  AUDITORIUM_TYPE   char(10) constraint AUDITORIUM_TYPE_PK  primary key,  
  AUDITORIUM_TYPENAME  varchar2(30) constraint AUDITORIUM_TYPENAME_NOT_NULL not null         
);

delete AUDITORIUM_TYPE;
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('ЛК',   'Лекционная');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('ЛБ-К',   'Компьютерный класс');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('ЛК-К', 'Лекционная с уст. компьютерами');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('ЛБ-X', 'Химическая лаборатория');
insert into AUDITORIUM_TYPE   (AUDITORIUM_TYPE,   AUDITORIUM_TYPENAME )
                       values  ('ЛБ-СК', 'Спец. компьютерный класс');
---------------------------------------------------------------------------------------------------------------------

create table AUDITORIUM 
(
 AUDITORIUM           char(10) primary key,  -- код аудитории
 AUDITORIUM_NAME      varchar2(200),          -- аудитория 
 AUDITORIUM_CAPACITY  number(4),              -- вместимость
 AUDITORIUM_TYPE      char(10) not null      -- тип аудитории
                      references AUDITORIUM_TYPE(AUDITORIUM_TYPE)  
);

delete  AUDITORIUM;
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('206-1',   '206-1', 'ЛБ-К', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
                       values  ('301-1',   '301-1', 'ЛБ-К', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('236-1',   '236-1', 'ЛК',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('313-1',   '313-1', 'ЛК',   60);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('324-1',   '324-1', 'ЛК',   50);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('413-1',   '413-1', 'ЛБ-К', 15);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('423-1',   '423-1', 'ЛБ-К', 90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('408-2',   '408-2', 'ЛК',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('103-4',   '103-4', 'ЛК',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('105-4',   '105-4', 'ЛК',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('107-4',   '107-4', 'ЛК',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('110-4',   '110-4', 'ЛК',  30);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('111-4',   '111-4', 'ЛК',  30);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                      values  ('114-4',   '114-4', 'ЛК-К',  90 );
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values ('132-4',   '132-4', 'ЛК',   90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values ('02Б-4',   '02Б-4', 'ЛК',   90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values ('229-4',   '229-4', 'ЛК',   90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('304-4',   '304-4','ЛБ-К', 90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('314-4',   '314-4', 'ЛК',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('320-4',   '320-4', 'ЛК',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                       values  ('429-4',   '429-4', 'ЛК',  90);
insert into  AUDITORIUM   (AUDITORIUM,   AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY )
                        values  ('?',   '???', 'ЛК',  90);
                        
                        
/*1*/
begin
null;
end;

/*2*/
begin
DBMS_OUTPUT.PUT_LINE('Hello World!');
END;

/*3*/
declare 
x number(3) :=3;
y number(3) :=0;
z number(10,2);
begin 
DBMS_OUTPUT.PUT_LINE(
                  'x= ' ||x||
                  ', y='||y
                  );
z := x/y;
DBMS_OUTPUT.PUT_LINE('z= '||z);
exception
  when others
  then DBMS_OUTPUT.PUT_LINE('error = ' || sqlerrm);
end;

/*4*/
declare 
x number(3) :=3;
y number(3) :=0;
z number(10,2);
begin 
DBMS_OUTPUT.PUT_LINE( 'x= ' ||x||', y='||y );
begin
z := x/y;
exception
  when others
  then DBMS_OUTPUT.PUT_LINE('error = ' || sqlerrm);
end;
DBMS_OUTPUT.PUT_LINE('z = '||z);
end;

/*5*/
show parameter plsql_warnings;

/*6*/
select keyword from v$reserved_words where length = 1 and keyword !='A'

/*7*/
select keyword from v$reserved_words where length > 1 and keyword != 'A' order by keyword

/*8*/
show parameter plsql

/*10*/
declare 
x number(3) :=3;
y number(3) :=10;
begin 
DBMS_OUTPUT.PUT_LINE(
                  'x= ' ||x||
                  ', y='||y
                  );
end;

/*11*/
declare 
x number(3) :=10;
y number(3) :=3;
z number(10,2);
b number(10,2);
d number(10,2);
g number(10,2);
begin 
DBMS_OUTPUT.PUT_LINE(
                  'x= ' ||x||
                  ', y='||y
                  );
b :=x+y;
d :=x-y;
g :=x*y;
z := x/y;
DBMS_OUTPUT.PUT_LINE('b= '||b);
DBMS_OUTPUT.PUT_LINE('d= '||d);
DBMS_OUTPUT.PUT_LINE('g= '||g);
DBMS_OUTPUT.PUT_LINE('z= '||z);
end;

/*12*/
declare 
n1 number(20,11) :=123456789.12345678911;
n2 number(20,10) :=123456789.12345678911;
n3 number(20) :=123456789.12345678911;
n4 number(20,-1) :=123456789.12345678911;
n5 number(20,-2) :=123456789.12345678911;
n6 number(20,-21) :=123456789.12345678911;
n7 number(20,-25) :=123456789.12345678911;
n8 number(20,-83) :=123456789.12345678911;
n9 number(20,-7) :=0.12345678911;
n10 number(38,10) :=123456789.12345678911;
n11 number(38,10) :=123456789E-12;
begin 
DBMS_OUTPUT.PUT_LINE('n1= '||n1);
DBMS_OUTPUT.PUT_LINE('n2= '||n2);
DBMS_OUTPUT.PUT_LINE('n3= '||n3);
DBMS_OUTPUT.PUT_LINE('n4= '||n4);
DBMS_OUTPUT.PUT_LINE('n5= '||n5);
DBMS_OUTPUT.PUT_LINE('n6= '||n6);
DBMS_OUTPUT.PUT_LINE('n7= '||n7);
DBMS_OUTPUT.PUT_LINE('n8= '||n8);
DBMS_OUTPUT.PUT_LINE('n9= '||n9);
DBMS_OUTPUT.PUT_LINE('n10= '||n10);
DBMS_OUTPUT.PUT_LINE('n11= '||n11);
end;

/*13*/
declare 
n1 number(20,-1) :=123456789.12345678911;
n2 number(20,-2) :=123456789.12345678911;
n3 number(20,-21) :=123456789.12345678911;
n4 number(20,-25) :=123456789.12345678911;
n5 number(20,-83) :=123456789.12345678911;
n6 number(20,-7) :=0.12345678911;
begin 
DBMS_OUTPUT.PUT_LINE('n1= '||n1);
DBMS_OUTPUT.PUT_LINE('n2= '||n2);
DBMS_OUTPUT.PUT_LINE('n3= '||n3);
DBMS_OUTPUT.PUT_LINE('n4= '||n4);
DBMS_OUTPUT.PUT_LINE('n5= '||n5);
DBMS_OUTPUT.PUT_LINE('n6= '||n6);
end;

/*14*/
declare 
n1 binary_float := 123456789.12345678911;
n2 binary_float := 123456.12345678911;
begin
DBMS_OUTPUT.PUT_LINE('n1= '||n1);
DBMS_OUTPUT.PUT_LINE('n2= '||n2);
end;

/*15*/
declare 
n1 binary_double := 123456789.12345678911;
n2 binary_double := 123456.12345678911;
begin 
DBMS_OUTPUT.PUT_LINE('n1= '||n1);
DBMS_OUTPUT.PUT_LINE('n2= '||n2);
end;

/*16*/
declare
n1 number(20,4) :=123456789.12345678911;
n2 number(20,3) :=123456789.12345678911;
n3 number(38,10) :=123456789E-12;
n4 number(38,10) :=1234567E+10;
begin 
DBMS_OUTPUT.PUT_LINE('n1= '||n1);
DBMS_OUTPUT.PUT_LINE('n2= '||n2);
DBMS_OUTPUT.PUT_LINE('n3= '||n3);
DBMS_OUTPUT.PUT_LINE('n4= '||n4);
end;

/*17*/
declare 
b1 boolean := true;
b2 boolean := false;
b3 boolean;
begin 
if b1 then DBMS_OUTPUT.PUT_LINE('b1= '||'true'); end if;
if not b2  then DBMS_OUTPUT.PUT_LINE('b2= '||'false'); end if; 
if b3 is null then DBMS_OUTPUT.PUT_LINE('b3= '||'null'); end if;
end;

/*18*/
declare 
n1 constant number(5) :=5;
v1 constant varchar2(25 char) :='dadasda';
c1 constant char(5) := 'dasda';
begin 
DBMS_OUTPUT.PUT_LINE('n1= '||n1);
/*v1:= 'fdsfsd'; n1:=10; c1:='dasd'; cun;t*/
DBMS_OUTPUT.PUT_LINE('v1= '||v1);
DBMS_OUTPUT.PUT_LINE('c1= '||c1);
END;

/*19-20*/
declare 
subject system.subject.subject%type;
pulpit system.pulpit.pulpit%type;
faculty_rec system.faculty%rowtype;
begin
subject :='ПИС';
pulpit :='ИСИТ';
faculty_rec.faculty :='ИДиП';
faculty_rec.faculty_name := 'Факультет издательского дела и полиграфии';
DBMS_OUTPUT.PUT_LINE(subject);
DBMS_OUTPUT.PUT_LINE(pulpit);
DBMS_OUTPUT.PUT_LINE(rtrim(faculty_rec.faculty)||':'||faculty_rec.faculty_name);
exception
  when others
  then DBMS_OUTPUT.PUT_LINE('error= '|| sqlerrm);
end;

/*21*/
declare x pls_integer :=17;
begin
if 8>x then DBMS_OUTPUT.PUT_LINE('8> '||x);
end if;
----------------
if 8>x
then DBMS_OUTPUT.PUT_LINE('8> '||x);
else
DBMS_OUTPUT.PUT_LINE('8 <= '||x);
end if;
---------------
if 8>x
then DBMS_OUTPUT.PUT_LINE('8> '||x);
else if 8=x
then DBMS_OUTPUT.PUT_LINE('8 = '||x);
else if 12 > x
then DBMS_OUTPUT.PUT_LINE('12> '||x);
else if 12 = x
then DBMS_OUTPUT.PUT_LINE('12= '||x);
else 
DBMS_OUTPUT.PUT_LINE('12< '||x);
end if; 
end;

/*22*/
declare 
x pls_integer :=17;
begin

case x
  when 1 then DBMS_OUTPUT.PUT_LINE('1');
  when 2 then DBMS_OUTPUT.PUT_LINE('2');
  when 3 then DBMS_OUTPUT.PUT_LINE('3');
  else DBMS_OUTPUT.PUT_LINE('else');
  end case;
  --------------------------------------
case 
    when 8 > x then DBMS_OUTPUT.PUT_LINE('8> '||x);
    when 8 = x then DBMS_OUTPUT.PUT_LINE('8 = '||x);
    when 12 = x then DBMS_OUTPUT.PUT_LINE('12 = '||x);
    when x between 13 and 20 then DBMS_OUTPUT.PUT_LINE('12 <= '||x||' <=20');
    else DBMS_OUTPUT.PUT_LINE('else');
end case;
-----------------------------------------
end;

/*23-25*/
declare
  x pls_integer :=0;
begin
-------------
  loop 
  x := x+1;
  DBMS_OUTPUT.PUT_LINE(x);
  exit when x>5;
  end loop;
  -----------
  for k in 1..5
  loop 
  DBMS_OUTPUT.PUT_LINE(k);
  end loop;
  ---------------
  while (x>0)
  loop
  x:=x-1;
  DBMS_OUTPUT.PUT_LINE(x);
  end loop;
  -----------------
  end;
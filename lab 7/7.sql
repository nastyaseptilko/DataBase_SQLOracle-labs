/*1*/
select count(*) from v$bgprocess;
select * from v$bgprocess;

/*2*/

select name, description from v$bgprocess where paddr !=hextoraw('00') ORDER BY name;

/*3*/

select name, description from v$bgprocess where name='DBWn';

/*4*/

select * from v$instance;

/*5*/

select username, sid, serial#, server, paddr, status from v$session where username is not null;
/*DEDICATED*/

/*6*/

select name, network_name, pdb from v$services;

/*7*/
show parameter dispatcher;

/*9*/
select username, service_name, server, osuser, machine, program from v$session where username is not null;
/*10*/

/*c:\app\kirill\product\12.1.0\dbhome_1\newtwork\admin\listener.ora*/

/*11*/

/*c:\app\kirill\product\12.1.0\dbhome_1\bin\lsncrtl.exe*/

/*Param start stop status services version reload save_config trace quit exit set* show* */

/*12*/

/*services in lsnrctl*/
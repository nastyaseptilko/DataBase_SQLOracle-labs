/*1*/
 select * from V$SGAINFO;
 /*2*/
 select component, current_size,min_size,max_size from V$SGA_DYNAMIC_COMPONENTS;
 
 /*3*/
 
 select component, current_size,granule_size from V$SGA_DYNAMIC_COMPONENTS;
 
 /*4*/
select * from v$sga_dynamic_free_memory;
 
 /*5*/
 select component, current_size,min_size,max_size from V$SGA_DYNAMIC_COMPONENTS;
 
 /*6*/
 create table YSS_T2(x int);
 
 alter table YSS_T2 storage (buffer_pool keep);
 
 select * from dba_segments where segment_name = 'YSS_T2';
 
 /*7*/
 create table YSS_T3(x int);
 
 alter table YSS_T3 storage (buffer_pool default);
 
 select * from dba_segments where segment_name = 'YSS_T3';
 
 /*8*/
 show parameter log_buffer;
 
 /*9*/
 select component, current_size,min_size,max_size from V$SGA_DYNAMIC_COMPONENTS;
 select * from v$sgastat where pool = 'shared pool' order by bytes;
 select * from V$SGA_DYNAMIC_COMPONENTS;
 
 /*10 */
 select * from V$SGA_DYNAMIC_COMPONENTS where component='large pool';
 show parameter large_pool
 /*11*/
 
 select username, service_name, server, osuser,machine, program from v$session where username is not null;

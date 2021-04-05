/*================================================================*/
/*            IDENTFICAR SESSÕES EM LOCK                          */
/*================================================================*/

SELECT b.session_id AS sid,
     NVL(b.oracle_username, '(oracle)') AS username,
     a.owner AS object_owner,
     a.object_name,
     Decode(b.locked_mode, 0, 'None',
               1, 'Null (NULL)',
               2, 'Row-S (SS)',
               3, 'Row-X (SX)',
               4, 'Share (S)',
               5, 'S/Row-X (SSX)',
               6, 'Exclusive (X)',
               b.locked_mode) locked_mode,
     b.os_user_name
FROM   dba_objects a,
     v$locked_object b
WHERE  a.object_id = b.object_id
ORDER BY 1, 2, 3, 4;

/*================================================================*/


/*================================================================*/
/*            IDENTFICAR SESSÃO QUE ESTÁ CAUSANDO LOCK            */
/*================================================================*/

select sid,
       serial#,
       username,
       blocking_session,
       osuser,
       program, 
       comando_sql,
       --tabela tabela_em_lock,
       decode(blocking_session, null, 'ESTOU CAUSANDO O LOCK', 'ESTOU EM LOCK')
 
from
(

select s.sid,
       s.serial#,
       s.username,
       s.blocking_session,
       s.osuser,
       (select sql_text
         from v$sqlarea
        where HASH_VALUE = s.SQL_HASH_VALUE) comando_sql,       
        s.program,
        s.SQL_ID 
 from v$session s
 where blocking_session is not null
 union all
 select a.sid, 
        a.serial#,
        a.username, a.blocking_session,
         a.osuser, 
        (select sql_text
         from v$sqlarea
        where HASH_VALUE = a.SQL_HASH_VALUE
        and ADDRESS = a.SQL_ADDRESS) comando_sql,       
        a.program,
        a.SQL_ID
 from v$session a, v$session b
 where a.sid = b.BLOCKING_SESSION
)
group by sid,
       username,
       blocking_session,
       osuser,
       comando_sql,
       program,
       SQL_ID,
       --tabela,
       serial#;
	   
/*================================================================*/	   


/*================================================================*/
/*            IDENTFICAR LOCK DE TRANSAÇÃO DISTRIBUÍDA            */
/*================================================================*/

select *from dba_2pc_pending;

/*================================================================*/

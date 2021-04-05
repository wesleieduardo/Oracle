/*================================================================*/
/*            FINALIZAR SESSÃO ATRAVÉS DO SID                     */
/*================================================================*/

DECLARE
  KILL_SESSION VARCHAR2(100);
  CURSOR C1 IS SELECT SID, SERIAL#, USERNAME, A.LOGON_TIME
  FROM V$SESSION a
  WHERE a.sid in (11);
BEGIN
  FOR C1_ROW IN C1 LOOP
    execute immediate 'Alter System Kill Session '''|| c1_row.Sid || ',' || c1_row.Serial# || ''' IMMEDIATE';
  END LOOP;
END;

/*================================================================*/

/*================================================================*/
/* CASO A SESSÃO SEJA FINALIZADA, PORÉM AINDA CONSTE COMO KILLED, */
/* É NECESSÁRIO FINALIZAR O PROCESSO NO S.O.                      */
/* PARA ISTO, DEVE-SE IDENTIFICAR O PID, ATRAVÉS DO COMANDO:      */
/*================================================================*/

select substr(a.spid,1,9)pid,
substr(b.sid,1,5)sid,
substr(b.serial#,1,5)ser#,
substr(b.machine,1,6)box,
substr(b.username,1,10)username,
b.status,
substr(b.osuser,1,8)os_user,
substr(b.program,1,30)program
from
v$session b, v$process a where b.paddr = a.addr and type='USER' and sid = &SID
order  by spid 

/*================================================================*/

/*================================================================*/
/* ACESSAR O PROMPT DE COMANDOS E UTILIZAR O COMANDO ABAIXO.      */
/* OBS: SUBSTITUIR NR_PID PELO PID OBTIDO NO COMANDO ANTERIOR     */
/*================================================================*/

ORAKILL XE NR_PID;

/*================================================================*/
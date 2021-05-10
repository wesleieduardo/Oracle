/*=============================================================================*/
/* Export completo do banco de dados                                           */
/*=============================================================================*/
EXP user/senha@SID FULL=y FILE=C:\dumpname.dmp LOG=C:\dumplog.log GRANTS=y ROWS=y
/*=============================================================================*/

/*=============================================================================*/
/* Import completo do banco de dados                                           */
/*=============================================================================*/
IMP user/senha@SID FROMUSER=userA TOUSER=userB FILE=c:\dumpname.dmp FULL=Y
/*=============================================================================*/

/*=============================================================================*/
/* Import remapeando tablespace e esquema (usuário)                            */
/* Tablespace vs_user remapeada para tablespace users                          */
/* Tablespace system remapeada para tablespace users                           */
/* Schema usera remapeado para schema userb                                    */
/*=============================================================================*/
IMPDP user/senha@SID DIRECTORY=dump DUMPFILE=dump.dmp LOGFILE=dumplog.log 
 REMAP_TABLESPACE=vs_user:users REMAP_TABLESPACE=system:users 
 REMAP_SCHEMA=USERA:USERB
/*=============================================================================*/

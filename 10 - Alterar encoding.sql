/*=============================================================================*/
/* Consultar encoding atual do banco                                           */
/*=============================================================================*/
SELECT * FROM v$nls_parameters
 WHERE parameter = 'NLS_CHARACTERSET';
/*=============================================================================*/

/*=============================================================================*/
/* Alterar encoding do banco                                                   */
/* Ao executar os comandos abaixo, registros que contenham caracteres          */
/* especiais podem apresentar problemas para conversão. Desta forma, é         */
/* recomendável realizar backup antes de iniciar                               */
/*=============================================================================*/
1 - Acessar prompt de comandos
2 - Informar os comandos abaixo:

sqlplus /nolog
connect sys as sysdba

3 - Informar a senha de acesso ao banco
4 - Digitar a sequencia de comandos abaixo:

SHUTDOWN IMMEDIATE;
STARTUP MOUNT;
ALTER SYSTEM ENABLE RESTRICTED SESSION;
ALTER DATABASE OPEN;
alter database character set INTERNAL_USE WE8ISO8859P1;
SHUTDOWN IMMEDIATE;
STARTUP;

OBS: WE8ISO8859P1 corresponde ao conjunto de caracteres que será utilizado
/*=============================================================================*/

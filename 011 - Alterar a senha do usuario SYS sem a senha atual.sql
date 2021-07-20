/*=============================================================================*/
/* No prompt de comandos, digitar as seguintes instruções                      */
/*=============================================================================*/
SQLPLUS /NOLOG;
CONNECT / AS SYSDBA;
ALTER USER system IDENTIFIED BY nova_senha;
/*=============================================================================*/

/*=============================================================================*/
/* Caso tenha apresentado erro e não seja possível concluir a alteração:       */
/* - Fazer backup do arquivo PWDXE.ora que se encontra no seguinte diretório:  */
/* C:\oraclexe\app\oracle\product\11.2.0\server\database                       */
/* - Apagar o arquivo PWDXE.ora                                                */
/* - Recriar o arquivo com a nova senha. Para isto, no prompt de comandos:     */
/*=============================================================================*/
ORAPWD file=PWDXE.ORA password=NOVA_SENHA
/*=============================================================================*/

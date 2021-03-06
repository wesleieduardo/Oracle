/*======================================================================================================================*/
/* O erro ORA-01033 acontece quando o Oracle não consegue encerrar a sessão, uma situação muito comum é em quedas       */
/* de energia constantes. Para corrigir esse problema é necessário o acesso a máquina onde o oracle está instalado.     */
/*======================================================================================================================*/
1 - sqlplus / nolog;
2 - conn / as sysdba 

/*======================================================================================================================*/
/* Cancela todas as tarefas que o oracle está realizando no momento                                                     */
/*======================================================================================================================*/
3 - shutdown abort;

/*======================================================================================================================*/
/* Inicia o oracle sem montar o banco de dados, isso é importante para verificar os códigos dos erros                   */
/*======================================================================================================================*/
4 - startup nomount;

/*======================================================================================================================*/
/* Monta o diretório dos dados                                                                                          */
/*======================================================================================================================*/
5 - alter database mount;

/*======================================================================================================================*/
/* Abre o banco de dados. Neste momento, podem ocorrer alguns erros.                                                    */
/* Isto indica que os arquivos do banco foram corrompidos                                                               */
/*======================================================================================================================*/
6 - alter database open;

/*======================================================================================================================*/
/* Caso ocorra os erros ORA-01113 e ORA-01110, executar o comando abaixo para recuperar a última instância válida       */
/*======================================================================================================================*/
7 - recover database;

/*======================================================================================================================*/
/* Caso ocorra o erro ORA-00322 (problema com o arquivo de log)                                                         */
/*======================================================================================================================*/
8 - set autorecovery on;
9 - alter database recover until cancel;
10 - alter database open resetlogs;
11 alter database open;
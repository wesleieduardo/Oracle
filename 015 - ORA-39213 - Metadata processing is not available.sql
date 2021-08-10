/*======================================================================================================================*/
/* O erro mencionado (ORA-39213) pode ocorrer ao compilar objetos, export de dados, etc...                             */
/* Inicialmente, executar o comando abaixo com o usuário SYS.                                                           */
/*======================================================================================================================*/
BEGIN
  EXECUTE sys.dbms_metadata_util.load_stylesheets;
END;

/*======================================================================================================================*/
/* Neste cenário, pode ser que retorne outra mensagem de erro: ORA-31609: error loading file "kucolumn.xsl" from file   */
/* system directory. Para resolver:                                                                                     */
/* - Copiar a pasta XSL para o seguinte diretório do Oracle: C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\xml     */
/* - Executar novamente o comando descrito acima.                                                                       */
/*======================================================================================================================*/

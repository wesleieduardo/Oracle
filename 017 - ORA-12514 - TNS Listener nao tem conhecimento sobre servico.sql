Caso ocorra o erro ORA-12514 após a instalação do banco

1 - Acessar o SQLPLUS com: sys/senha@servicename ocorre o erro
ORA-12514: TNS:listener não tem conhecimento sobre o serviço

2 - Conectar ao SQLPLUS com: 
sqlplus / as sysdba

3 - Executar o comando abaixo:
SHOW PARAMETER LOCAL LISTENER

4 - Caso a consulta retornar anterior não retornar valor, deve-se ajustar com o comando abaixo
alter system set LOCAL_LISTENER='(ADDRESS = (PROTOCOL = TCP)(HOST = SERVERNAME)(PORT = 1521))'scope=both;
Substituir SERVERNAME pelo nome do servidor.

Obs: Os procedimentos descritos foram testados na versão 11 do Oracle.
Caso ocorra o erro ORA-12638: Falha na recuperação de credencial durante o assistente de configuração do banco de dados:

1 - Na mensagem apresentada, cliquei no botão "Abortar". Instalador irá retornar a tela anterior.
2 - No equipamento onde está sendo instalado o banco de dados, localizar o arquivo SQLNET.ora e alterar a tag abaixo:
SQLNET.AUTHENTICATION_SERVICES = (NONE)
3 - Retornei ao instalador e cliquei no botão "Repetir"

Obs: Os procedimentos descritos foram testados na versão 11 do Oracle.
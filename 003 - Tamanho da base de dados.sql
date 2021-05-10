/*================================================================*/
/* CONSULTAR TAMANHO DA BASE DE DADOS - ORACLE EXPRESS EDITION    */
/* TAMANHO LÓGICO DO BANCO DE DADOS - INDICA A QUANTIDADE DE      */
/* DADOS ARMAZENADOS                                              */
/*================================================================*/

select tablespace_name,
   sum(bytes)/1024/1024 total_mb,
   (select sum(bytes)/1024/1024 from dba_segments)
    from dba_segments group by tablespace_name;

/*================================================================*/

/*================================================================*/
/* CONSULTAR TAMANHO DA BASE DE DADOS - ORACLE EXPRESS EDITION    */
/* TAMANHO FÍSICO DOS ARQUIVOS DO BANCO DE DADOS - INDICA O       */
/* TAMANHO DOS ARQUIVOS DE TABLESPACE                             */
/*================================================================*/

select tablespace_name,
   sum(bytes)/1024/1024 total_mb,
   (select sum(bytes)/1024/1024 from dba_data_files)
    from dba_data_files  group by tablespace_name;

/*================================================================*/

/*================================================================*/
/* IDENTIFICAR QUAL OBJETO DO BANCO (TABELA OU INDÍCE) ESTÁ       */
/* CONSUMINDO MAIOR ESPAÇO DE ARMAZENAMENTO                       */
/*================================================================*/

SELECT SEGMENT_NAME, SUM(BYTES) / 1024 / 1024 MBYTES
  FROM DBA_SEGMENTS
 WHERE OWNER = 'LENKE'
 GROUP BY SEGMENT_NAME
 ORDER BY MBYTES DESC;

/*================================================================*/

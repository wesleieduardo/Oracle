/*================================================================*/
/* Identificar processos com grande quantidade de acesso a disco  */
/* O comando abaixo identifica o SQLID. Com esta informação,      */
/* acessar no PL/SQL: menu Tools > Sessions >  e identificar qual */
/* processo está gerando lentidão.                                */
/*================================================================*/

SELECT *
FROM ( SELECT ROUND ( ( (cpu_time / 1000000) / 60), 2) AS "Tempo total de CPU",
executions AS "Quant. exec.",
rows_processed AS "Quant. linhas proc.",
disk_reads AS "Leituras no disco",
first_load_time AS "Primeira utilização",
last_load_time AS "Última utilização",
parsing_schema_name AS "Usuário analisado",
sql_id,
sql_text AS "SQL exec."
FROM v$sqlarea
WHERE parsing_schema_name NOT IN ('SYS', 'SYSTEM', 'SYSMAN', 'DBSNMP')
ORDER BY 1 DESC)
WHERE ROWNUM <= 10;

/*================================================================*/

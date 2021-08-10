Comando abaixo ilustra como efetuar o cálculo de diferença entre duas datas, mostrando a diferença em horas, minutos e segundos.
Obs: Comando abaixo foi testado no banco Oracle. Algumas expressões reservadas podem não funcionar em outros bancos de dados.

select TO_DATE('1','J') as PT01,--primeiro dia calendário juliano antes de cristo
       SYSDATE -  "APONTAMENTO"."DT_APONTAMENTO" AS PT02,  --diferença em dias entre duas datas
       TO_DATE('1','J') + (SYSDATE -  "APONTAMENTO"."DT_APONTAMENTO") AS PT03, --converte os dias fracionados em horas
       TO_CHAR(TO_DATE('1','J') + (SYSDATE -  "APONTAMENTO"."DT_APONTAMENTO"), 'J') as PT04, --arredonda quantidade de dias
       TO_NUMBER(TO_CHAR(TO_DATE('1','J') + (SYSDATE -  "APONTAMENTO"."DT_APONTAMENTO"), 'J') - 1) as PT05, --converte para number e diminui 1 dia,
       NVL (TO_NUMBER(TO_CHAR(TO_DATE('1','J') + (SYSDATE -  "APONTAMENTO"."DT_APONTAMENTO"), 'J') - 1),0) DIA,

       TO_DATE('00:00:00','HH24:MI:SS') AS PT06, --Retorna o dia atual
       SYSDATE -  "APONTAMENTO"."DT_APONTAMENTO" as PT07, --diferença em dias entre duas datas
       TO_DATE('00:00:00','HH24:MI:SS') + (SYSDATE -  "APONTAMENTO"."DT_APONTAMENTO") as PT08, --soma ao dia atual a diferença das duas datas. O retorno é o dia e a quantidade de horas
       TO_CHAR(TO_DATE('00:00:00','HH24:MI:SS') + (SYSDATE -  "APONTAMENTO"."DT_APONTAMENTO"), 'HH24:MI:SS') HORA
 from apontamento
 where nr_apontamento in (7683810, 7765705)
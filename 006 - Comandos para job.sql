/*================================================================*/
/* FORÇAR O INICIO DA EXECUÇÃO DE UM JOB                          */
/* OBS: SUBSTITUIR A EXPRESSÃO numero_job PELO NÚMERO DO JOB      */
/*================================================================*/

BEGIN
  dbms_job.run(numero_job);
END;

/*================================================================*/

/*================================================================*/
/* REMOVER UM JOB DO BANCO DE DADOS                               */
/* OBS: SUBSTITUIR A EXPRESSÃO numero_job PELO NÚMERO DO JOB      */
/*================================================================*/

BEGIN
  dbms_job.remove(numero_job);
END;

/*================================================================*/

/*================================================================*/
/* COLOCAR UM JOB NO ESTADO DE BROKEN                             */
/* (INTERROMPE A PRÓXIMA EXECUÇÃO)                                */
/* OBS: SUBSTITUIR A EXPRESSÃO numero_job PELO NÚMERO DO JOB      */
/*================================================================*/

BEGIN
  dbms_job.broken(numero_job,true);
END;

/*================================================================*/

/*================================================================*/
/* REMOVER UM JOB DO ESTADO DE BROKEN                             */
/* OBS: SUBSTITUIR A EXPRESSÃO numero_job PELO NÚMERO DO JOB      */
/*================================================================*/

BEGIN
  dbms_job.broken(numero_job,false);
END;

/*================================================================*/

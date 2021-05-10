/*================================================================*/
/* CURSOR PARA REMOVER MARCA D'AGUA DO ÍNDICE, APÓS DELETAR       */
/* REGISTROS DO BANCO E LIBERAR O ESPAÇO EM USO (LIMITE LÓGICO).  */
/* APLICA-SE NO ORACLE EXPRESS EDTION                             */
/*================================================================*/

declare

vcmd varchar(500);

begin

  for c1_row in (
  
                  SELECT owner,
                         tablespace_name,
                         segment_name,
                         segment_type,
                         round(sum(bytes / 1024 / 1024), 2) as Tamanho_MB
                   FROM dba_segments
                  WHERE owner = 'LENKE'
                    AND segment_type = 'INDEX'
                  GROUP BY owner, tablespace_name, segment_name, segment_type
                  order by tamanho_mb desc
                
                 
                 ) LOOP
    BEGIN
    execute immediate 'ALTER INDEX ' || C1_ROW.SEGMENT_NAME || ' shrink space compact';  
    execute immediate 'ALTER INDEX ' || C1_ROW.SEGMENT_NAME || ' shrink space';   
                       
    EXCEPTION
    WHEN OTHERS then
         DBMS_OUTPUT.put_line(sqlerrm);
    END;                      
  
  END LOOP;

END;

/*================================================================*/

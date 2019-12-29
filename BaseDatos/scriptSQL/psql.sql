--eliminar la funcion
drop function crud_dominio(pid bigint, pdominio character varying, pcodigo character varying, pdominiopadre character varying, pnombre character varying, pdescripcion character varying, porden int, pfechainicio timestamp without time zone, pfechafin timestamp without time zone, estado character varying, poperacion bigint);

--crear la funcion
create function crud_dominio(pid bigint, pdominio character varying, pcodigo character varying,
                            pdominiopadre character varying, pnombre character varying,
                            pdescripcion character varying, porden int,
                            pfechainicio timestamp without time zone, pfechafin timestamp without time zone,
                            pestado character varying,
                            poperacion bigint)
  returns SETOF dominio
  language plpgsql
as $$
/*
*********************************Funcion de crud para etapa***********************************************
Creado: Eddy Hernan Valero Kari Fecha:12/12/2019
Realizar registro, modificaicon, eliminacion en tabla dominio
*/
DECLARE
seq_dominio bigint;
vreg_dominio dominio%ROWTYPE;
BEGIN

   -- Create
    IF poperacion=1 THEN
    INSERT INTO dominio(
       dominio,
       codigo,
       dominiopadre,
       nombre,
       descripcion,
       orden,
       fechainicio,
       fechafin,
       estado
    )
    VALUES(
        pdominio,
        pcodigo,
        pdominiopadre,
        pnombre,
        pdescripcion,
        porden,
        pfechainicio,
        pfechafin,
        pestado
    );

      seq_dominio = (SELECT currval('sec_dominio')) ;

      FOR vreg_dominio IN (SELECT *
         FROM dominio
         WHERE id = seq_dominio
         )
        LOOP
           return next vreg_dominio;
        END LOOP;
    END IF;----fin


    --
    IF poperacion=2 THEN -- update
    UPDATE dominio SET
          dominio=pdominio,
          codigo=pcodigo,
          dominiopadre=pdominiopadre,
          descripcion=pdescripcion,
          orden=porden,
          fechainicio=pfechainicio,
          fechafin=pfechafin,
          estado=pestado
          WHERE
              id= pid;

    --seq_modmodificacion = (select currval('sec_modmodificacion')) ;
    /*for vetapa in (select *
     from etapa
     where idetapa = pidetapa
     ) loop
    return next vetapa;
    end loop;

    */
    END IF;----fin update

    --delete
    IF poperacion = 3 THEN
      DELETE FROM dominio where id = pid;
    END IF;

END;
$$
;

select now();

select * from dominio;

select crud_dominio(1, 'categoriamensaje', 'CMENM', NULL,'FORTALEZA', 'MENSAJES DE FORTALEZ', 1, now()::date, null, 'AC', 3);

create function crud_dominio(pid bigint, pdominio character varying, pcodigo character varying,
                            pdominiopadre character varying, pnombre character varying,
                            pdescripcion character varying, porden int,
                            pfechainicio timestamp without time zone, pfechafin timestamp without time zone,
                            estado character varying)



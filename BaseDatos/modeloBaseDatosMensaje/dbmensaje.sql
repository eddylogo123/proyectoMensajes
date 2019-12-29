--
-- ER/Studio Data Architect SQL Code Generation
-- Company :      Senapi
-- Project :      dbmensaje.DM1
-- Author :       Jonas
--
-- Date Created : Sunday, December 22, 2019 08:31:31
-- Target DBMS : PostgreSQL 9.x
--

CREATE SEQUENCE sec_autoria
  start with 1
  increment by 1
  maxvalue 999999999
  minvalue 1;
-- 
-- TABLE: autoria 
--

CREATE TABLE autoria(
    id                int8            NOT NULL,
    nombrecompleto    varchar(100),
    categoriaautor    varchar(5),
    CONSTRAINT "PK7" PRIMARY KEY (id)
)
;
ALTER TABLE autoria ALTER COLUMN id SET DEFAULT nextval('sec_autoria');

CREATE SEQUENCE sec_dominio
  start with 1
  increment by 1
  maxvalue 999999999
  minvalue 1;
-- 
-- TABLE: dominio 
--

CREATE TABLE dominio(
    id              int8            NOT NULL,
    dominio         varchar(100),
    codigo          varchar(5),
    dominiopadre    varchar(100),
    nombre          varchar(200),
    descripcion     varchar(255),
    orden           int4,
    fechainicio     timestamp,
    fechafin        timestamp,
    estado          varchar(2),
    CONSTRAINT "PK5" PRIMARY KEY (id)
)
;
ALTER TABLE dominio ALTER COLUMN id SET DEFAULT nextval('sec_dominio');

CREATE SEQUENCE sec_fuente
  start with 1
  increment by 1
  maxvalue 999999999
  minvalue 1;
-- 
-- TABLE: fuente 
--

CREATE TABLE fuente(
    id              int8    NOT NULL,
    idautoria       int8,
    nombrefuente    text,
    CONSTRAINT "PK6" PRIMARY KEY (id)
)
;
ALTER TABLE fuente ALTER COLUMN id SET DEFAULT nextval('sec_fuente');

CREATE SEQUENCE sec_mensaje
  start with 1
  increment by 1
  maxvalue 999999999
  minvalue 1;
-- 
-- TABLE: mensaje 
--

CREATE TABLE mensaje(
    id                  int8          NOT NULL,
    idfuente            int8          NOT NULL,
    mensaje             text,
    categoriamensaje    varchar(5),
    CONSTRAINT "PK4" PRIMARY KEY (id)
)
;
ALTER TABLE mensaje ALTER COLUMN id SET DEFAULT nextval('sec_mensaje');

-- 
-- TABLE: fuente 
--

ALTER TABLE fuente ADD CONSTRAINT "Refautoria2" 
    FOREIGN KEY (idautoria)
    REFERENCES autoria(id)
;


-- 
-- TABLE: mensaje 
--

ALTER TABLE mensaje ADD CONSTRAINT "Reffuente1" 
    FOREIGN KEY (idfuente)
    REFERENCES fuente(id)
;



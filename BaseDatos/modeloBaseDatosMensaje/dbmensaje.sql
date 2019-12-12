--
-- ER/Studio Data Architect SQL Code Generation
-- Company :      Senapi
-- Project :      dbmensaje.DM1
-- Author :       Jonas
--
-- Date Created : Thursday, December 12, 2019 10:06:55
-- Target DBMS : PostgreSQL 9.x
--

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



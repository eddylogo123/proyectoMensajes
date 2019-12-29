--
-- ER/Studio Data Architect SQL Code Generation
-- Company :      TRILOGIA
-- Project :      model-administrador.DM1
-- Author :       Eddy
--
-- Date Created : Sunday, December 22, 2019 08:32:07
-- Target DBMS : PostgreSQL 9.x
--

CREATE SEQUENCE sec_persona
  start with 1
  increment by 1
  maxvalue 999999999
  minvalue 1;
-- 
-- TABLE: persona 
--

CREATE TABLE persona(
    id                 int8            NOT NULL,
    idusuario          int8            NOT NULL,
    nombres            varchar(50),
    apellidopaterno    varchar(100),
    apellidomaterno    varchar(50),
    CONSTRAINT "PK2" PRIMARY KEY (id)
)
;
ALTER TABLE persona ALTER COLUMN id SET DEFAULT nextval('sec_persona');

CREATE SEQUENCE sec_usuario
  start with 1
  increment by 1
  maxvalue 999999999
  minvalue 1;
-- 
-- TABLE: usuario 
--

CREATE TABLE usuario(
    id         int8           NOT NULL,
    usuario    varchar(50),
    pass       varchar(50),
    CONSTRAINT "PK1" PRIMARY KEY (id)
)
;
ALTER TABLE usuario ALTER COLUMN id SET DEFAULT nextval('sec_usuario');

-- 
-- TABLE: persona 
--

ALTER TABLE persona ADD CONSTRAINT "Refusuario1" 
    FOREIGN KEY (idusuario)
    REFERENCES usuario(id)
;



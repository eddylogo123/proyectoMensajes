--
-- ER/Studio Data Architect SQL Code Generation
-- Company :      Senapi
-- Project :      Model1.DM1
-- Author :       Jonas
--
-- Date Created : Wednesday, December 11, 2019 21:11:05
-- Target DBMS : PostgreSQL 9.x
--

CREATE SEQUENCE sec_clasea
INCREMENT 1
MINVALUE 1
START 1
CACHE 1;
-- 
-- TABLE: clasea 
--

CREATE TABLE clasea(
    id              int8           NOT NULL,
    atributounoa    varchar(10),
    fecha           timestamp,
    CONSTRAINT "PK1" PRIMARY KEY (id)
)
;
ALTER TABLE clasea
ALTER COLUMN id
SET DEFAULT NEXTVAL ('sec_clasea');

-- 
-- TABLE: claseb 
--

CREATE TABLE claseb(
    id               int8           NOT NULL,
    idclaseorigen    int8           NOT NULL,
    atributounob     varchar(10),
    fecha            timestamp,
    CONSTRAINT "PK2" PRIMARY KEY (id)
)
;



-- 
-- TABLE: clasec 
--

CREATE TABLE clasec(
    id              int8           NOT NULL,
    atributounoc    varchar(10),
    fecha           timestamp,
    CONSTRAINT "PK1_1" PRIMARY KEY (id)
)
;



-- 
-- TABLE: clased 
--

CREATE TABLE clased(
    id              int8           NOT NULL,
    idclasec        int8           NOT NULL,
    atributounod    varchar(10),
    fecha           timestamp,
    CONSTRAINT "PK2_1" PRIMARY KEY (id, idclasec)
)
;



-- 
-- TABLE: clasee 
--

CREATE TABLE clasee(
    id              int8           NOT NULL,
    atributounoe    varchar(10),
    fecha           timestamp,
    CONSTRAINT "PK1_1_1" PRIMARY KEY (id)
)
;



-- 
-- TABLE: clasef 
--

CREATE TABLE clasef(
    id              int8           NOT NULL,
    atributounof    varchar(10),
    fecha           timestamp,
    idclasec        int8           NOT NULL,
    CONSTRAINT "PK2_1_1" PRIMARY KEY (id)
)
;



-- 
-- TABLE: claseg 
--

CREATE TABLE claseg(
    id              int8           NOT NULL,
    atributounog    varchar(10),
    fecha           timestamp,
    CONSTRAINT "PK1_1_1_1" PRIMARY KEY (id)
)
;



-- 
-- TABLE: clasegi 
--

CREATE TABLE clasegi(
    id              int8           NOT NULL,
    atributounoi    varchar(10),
    fecha           timestamp,
    CONSTRAINT "PK1_1_1_1_1" PRIMARY KEY (id)
)
;



-- 
-- TABLE: claseh 
--

CREATE TABLE claseh(
    id              int8           NOT NULL,
    atributounoh    varchar(10),
    fecha           timestamp,
    idclaseg        int8,
    CONSTRAINT "PK2_1_1_1" PRIMARY KEY (id)
)
;



-- 
-- TABLE: clasej 
--

CREATE TABLE clasej(
    id              int8           NOT NULL,
    atributounoj    varchar(10),
    fecha           timestamp,
    idclasegi       int8,
    CONSTRAINT "PK2_1_1_1_1" PRIMARY KEY (id)
)
;



-- 
-- TABLE: clasek 
--

CREATE TABLE clasek(
    id              int8           NOT NULL,
    atributounok    varchar(10),
    fecha           timestamp,
    CONSTRAINT "PK1_1_1_1_1_1" PRIMARY KEY (id)
)
;



-- 
-- TABLE: clasek_clasel 
--

CREATE TABLE clasek_clasel(
    id     int8    NOT NULL,
    idl    int8    NOT NULL,
    idk    int8    NOT NULL,
    CONSTRAINT "PK17" PRIMARY KEY (id)
)
;



-- 
-- TABLE: clasel 
--

CREATE TABLE clasel(
    id              int8           NOT NULL,
    atributounol    varchar(10),
    fecha           timestamp,
    CONSTRAINT "PK2_1_1_1_1_1" PRIMARY KEY (id)
)
;



-- 
-- TABLE: claseln 
--

CREATE TABLE claseln(
    id              int8           NOT NULL,
    atributounon    varchar(10),
    fecha           timestamp,
    CONSTRAINT "PK2_1_1_1_1_1_1" PRIMARY KEY (id)
)
;



-- 
-- TABLE: clasem 
--

CREATE TABLE clasem(
    id              int8           NOT NULL,
    atributounom    varchar(10),
    fecha           timestamp,
    CONSTRAINT "PK1_1_1_1_1_1_1" PRIMARY KEY (id)
)
;



-- 
-- TABLE: claseb 
--

ALTER TABLE claseb ADD CONSTRAINT "Refclasea1" 
    FOREIGN KEY (idclaseorigen)
    REFERENCES clasea(id)
;


-- 
-- TABLE: clased 
--

ALTER TABLE clased ADD CONSTRAINT "Refclasec10" 
    FOREIGN KEY (idclasec)
    REFERENCES clasec(id)
;


-- 
-- TABLE: clasef 
--

ALTER TABLE clasef ADD CONSTRAINT "Refclasee4" 
    FOREIGN KEY (idclasec)
    REFERENCES clasee(id)
;


-- 
-- TABLE: claseh 
--

ALTER TABLE claseh ADD CONSTRAINT "Refclaseg6" 
    FOREIGN KEY (idclaseg)
    REFERENCES claseg(id)
;


-- 
-- TABLE: clasej 
--

ALTER TABLE clasej ADD CONSTRAINT "Refclasegi8" 
    FOREIGN KEY (idclasegi)
    REFERENCES clasegi(id)
;


-- 
-- TABLE: clasek_clasel 
--

ALTER TABLE clasek_clasel ADD CONSTRAINT "Refclasel34" 
    FOREIGN KEY (idl)
    REFERENCES clasel(id)
;

ALTER TABLE clasek_clasel ADD CONSTRAINT "Refclasek35" 
    FOREIGN KEY (idk)
    REFERENCES clasek(id)
;



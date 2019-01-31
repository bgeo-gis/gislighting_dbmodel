/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

SET search_path = SCHEMA_NAME, public, pg_catalog;

CREATE SEQUENCE doc_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;


CREATE TABLE doc_type (
id serial NOT NULL,
idval varchar(30)   NOT NULL,
comment varchar(512)  ,
CONSTRAINT doc_type_pkey PRIMARY KEY (id)
);
  
  
CREATE TABLE doc (
id integer DEFAULT nextval ('SCHEMA_NAME.doc_seq'::regclass) NOT NULL,
code varchar(30),
doc_type integer,
path varchar(512),
observ varchar(512),
date timestamp(6) DEFAULT now(),
user_name varchar(50) DEFAULT user,
tstamp timestamp DEFAULT now(),
CONSTRAINT doc_pkey PRIMARY KEY (id)
);


CREATE TABLE doc_x_node (
id serial NOT NULL PRIMARY KEY,
doc_id integer,
node_id integer
);


CREATE TABLE doc_x_arc (
id serial NOT NULL PRIMARY KEY,
doc_id integer,
arc_id integer
);


CREATE TABLE doc_x_visit(
id serial NOT NULL PRIMARY KEY,
doc_id integer,
visit_id integer 
);




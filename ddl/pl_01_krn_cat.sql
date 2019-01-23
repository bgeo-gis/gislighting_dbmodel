
SET search_path = SCHEMA_NAME, public, pg_catalog;


CREATE TABLE cat_feature (
id character varying(30) NOT NULL,
system_id character varying(30),
type character varying(30),
shortcut_key character varying(100),
parent_layer character varying(100),
child_layer character varying(100),
orderby integer,
active boolean,
code_autofill boolean
);

CREATE TABLE sys_combo_cat(
id serial NOT NULL,
idval text,
CONSTRAINT sys_combo_cat_pkey PRIMARY KEY (id)
);
--how does it work?
CREATE TABLE sys_combo_values(
sys_combo_cat_id integer NOT NULL,
id integer NOT NULL,
idval text,
descript text, -- no en sys_combo_cat?
CONSTRAINT sys_combo_pkey PRIMARY KEY (sys_combo_cat_id, id)
);

CREATE TABLE value_state (
id int2 NOT NULL PRIMARY KEY, 
name varchar(30),
observ text
);

CREATE TABLE value_state_type (
id int2 NOT NULL PRIMARY KEY, 
state_id int2,
name varchar(30),
is_operative boolean,
is_doable boolean
);

CREATE TABLE value_verified (
id varchar(30) NOT NULL PRIMARY KEY, 
observ text
);


CREATE TABLE dattrib(
dattrib_type integer,
feature_id character varying(30),
feature_type varchar(30),
idval text,
CONSTRAINT dattrib_pkey PRIMARY KEY (dattrib_type, feature_id)
);

  
CREATE TABLE dattrib_type(
id INTEGER PRIMARY KEY,
idval varchar(30),
observ text,
project_type varchar (30)
);



CREATE INDEX dattrib_feature_id_index ON dattrib USING btree (feature_id COLLATE pg_catalog.default);

CREATE INDEX dattrib_dattrib_type_index ON dattrib USING btree (dattrib_type);

-- ----------------------------------
-- Table: Zones
-- ----------------------------------
CREATE TABLE exploitation(
expl_id integer  NOT NULL PRIMARY KEY,
name character varying(50),
macroexpl_id integer,
descript text,
undelete boolean,
the_geom geometry(MULTIPOLYGON,SRID_VALUE),
tstamp timestamp DEFAULT now()
);

CREATE INDEX exploitation_index ON exploitation USING GIST (the_geom);

CREATE TABLE exploitation_x_user(
id SERIAL PRIMARY KEY,
expl_id integer,
username character varying(50)
);

CREATE TABLE dma (
dma_id serial NOT NULL PRIMARY KEY,
name character varying(30),
expl_id integer,
--macrodma_id integer,
descript text,
undelete boolean,
the_geom public.geometry (MULTIPOLYGON, SRID_VALUE)
);

-- ----------------------------------
-- Table: Fields in arc/node
-- ----------------------------------

CREATE TABLE cat_soil (
id varchar(30)   NOT NULL,
descript varchar(512),
link varchar(512),
y_param numeric(5,2),
b numeric(5,2),
trenchlining numeric(3,2),
m3exc_cost varchar (16),
m3fill_cost varchar (16),
m3excess_cost varchar (16),
m2trenchl_cost varchar (16),
CONSTRAINT cat_soil_pkey PRIMARY KEY (id)
);


CREATE TABLE cat_builder (
id varchar(30)   NOT NULL,
descript varchar(512)  ,
link varchar(512)  ,
CONSTRAINT cat_builder_pkey PRIMARY KEY (id)
);


CREATE TABLE cat_work (
id varchar(30) NOT NULL,
descript varchar(512),
link varchar(512),
workid_key1 character varying(30),
workid_key2 character varying(30),
builtdate date,
CONSTRAINT cat_work_pkey PRIMARY KEY (id)
);


CREATE TABLE cat_owner (
id varchar(30)   NOT NULL,
descript varchar(512)  ,
link varchar(512)  ,
CONSTRAINT cat_owner_pkey PRIMARY KEY (id)
);


CREATE TABLE man_type_category (
id serial NOT NULL,
category_type varchar(50),
feature_type varchar(30),
featurecat_id varchar(300),
observ varchar(150),
CONSTRAINT man_type_category_pkey PRIMARY KEY (id)
);


CREATE TABLE man_type_location (
id serial NOT NULL,
location_type varchar(50),
feature_type varchar(30),
featurecat_id varchar(300),
observ varchar(150),
CONSTRAINT man_type_location_pkey PRIMARY KEY (id)
);


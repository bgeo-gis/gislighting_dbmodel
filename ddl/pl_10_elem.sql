
SET search_path = SCHEMA_NAME, public, pg_catalog;


CREATE TABLE element_type (
id serial NOT NULL,
idval varchar(30) NOT NULL,
active boolean,
code_autofill boolean,
descript text,
link_path varchar(254),
CONSTRAINT element_type_pkey PRIMARY KEY (id)
);


CREATE TABLE cat_mat_element (
id serial NOT NULL,
idval varchar(30),
descript varchar(512),
link varchar(512),
CONSTRAINT cat_mat_element_pkey PRIMARY KEY (id)
);


CREATE TABLE cat_element (
id serial NOT NULL,
idval varchar(30)  NOT NULL,
elementtype_id integer,
matcat_id integer,
geometry varchar(30),
descript varchar(512),
link varchar(512),
brand varchar(30),
type varchar(30),
model varchar(30),
svg varchar(50),
active boolean,
CONSTRAINT cat_element_pkey PRIMARY KEY (id)
);



CREATE TABLE element (
element_id integer PRIMARY KEY DEFAULT nextval('SCHEMA_NAME.urn_id_seq'::regclass),
code varchar(30),
elementcat_id integer,
serial_number varchar(30),
num_elements integer,
state_id int2,
state_type_id int2,
observ character varying(254),
comment character varying(254),
category_type_id integer,
location_type_id integer,
workcat_id integer, 
workcat_id_end integer,
buildercat_id integer,
builtdate date,
enddate date,
ownercat_id integer,
rotation numeric (6,3),
link character varying(512),
verified_id varchar(20),
the_geom public.geometry (POINT, SRID_VALUE),
label_x character varying(30),
label_y character varying(30),
label_rotation numeric(6,3),
undelete boolean,
publish boolean,
inventory boolean,
expl_id integer,
feature_type varchar (16) DEFAULT 'ELEMENT',
tstamp timestamp DEFAULT now()
);


CREATE TABLE element_x_arc (
id serial NOT NULL PRIMARY KEY,
element_id integer,
arc_id integer
);


CREATE TABLE element_x_node (
id serial NOT NULL PRIMARY KEY,
element_id integer,
node_id integer
);

CREATE INDEX element_index ON element USING GIST (the_geom);
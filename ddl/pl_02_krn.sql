

SET search_path = SCHEMA_NAME, public, pg_catalog;


CREATE SEQUENCE urn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
   

CREATE TABLE cat_mat (
id serial NOT NULL PRIMARY KEY,
idval varchar(30) NOT NULL ,
descript varchar(512)  ,
feature_type varchar(30) ,
link varchar(512) 
);




CREATE TABLE cat_arc (
id serial NOT NULL,
idval varchar (30) NOT NULL,
cat_feature_id integer,
matcat_id integer  ,
area float ,
nlines integer, 
descript varchar(512)  ,
link varchar(512)  ,
svg varchar(50)  ,
z1 numeric (12,2),
z2 numeric (12,2),
width numeric (12,2),
estimated_depth numeric (12,2),
cost_unit varchar (3) DEFAULT 'm',
cost varchar (16),
m2bottom_cost varchar (16),
m3protec_cost varchar (16),
active boolean,
CONSTRAINT cat_arc_pkey PRIMARY KEY (id)
);


CREATE TABLE cat_node (
id serial NOT NULL,
idval varchar (30) NOT NULL,
cat_feature_id integer,
matcat_id integer,
descript varchar(512)  ,
link varchar(512)  ,
svg varchar(50)  ,
estimated_depth numeric (12,2),
cost_unit varchar (3) DEFAULT 'u',
cost varchar (16),
active boolean,
CONSTRAINT cat_node_pkey PRIMARY KEY (id)
);

CREATE TABLE arc (
  arc_id integer PRIMARY KEY NOT NULL DEFAULT nextval('SCHEMA_NAME.urn_id_seq'::regclass),
  code character varying(30),
  node_1 integer,
  node_2 integer,
  arccat_id integer NOT NULL,
  state_id smallint NOT NULL,
  state_type_id smallint,
  annotation text,
  observ text,
  sys_length numeric(12,2),
  custom_length numeric(12,2),
  dma_id integer NOT NULL,
  soilcat_id integer,
  workcat_id integer,
  workcat_id_end integer,
  buildercat_id integer,
  builtdate date,
  enddate date,
  ownercat_id integer,
  muni_id integer,
  postcode character varying(16),
  streetaxis_id integer,
  postnumber integer,
  postcomplement character varying(100),
  streetaxis2_id integer,
  postnumber2 integer,
  postcomplement2 character varying(100),
  descript character varying(254),
  link character varying(512),
  the_geom geometry(LineString,25831),
  undelete boolean,
  label_x character varying(30),
  label_y character varying(30),
  label_rotation numeric(6,3),
  displace_style numeric(12,3),
  publish boolean,
  inventory boolean,
  expl_id integer NOT NULL,
  feature_type character varying(16) DEFAULT 'ARC'::character varying,
  tstamp timestamp without time zone DEFAULT now()
);



CREATE TABLE node (
  node_id integer PRIMARY KEY NOT NULL DEFAULT nextval('SCHEMA_NAME.urn_id_seq'::regclass),
  code character varying(30),
  nodecat_id integer NOT NULL,
  arc_id integer,
  parent_id integer,
  state_id smallint NOT NULL,
  state_type_id smallint,
  annotation text,
  observ text,
  dma_id integer NOT NULL,
  soilcat_id integer,
  workcat_id integer,
  workcat_id_end integer,
  buildercat_id integer,
  builtdate date,
  enddate date,
  ownercat_id integer,
  muni_id integer,
  postcode character varying(16),
  streetaxis_id integer,
  postnumber integer,
  postcomplement character varying(100),
  streetaxis2_id integer,
  postnumber2 integer,
  postcomplement2 character varying(100),
  descript character varying(254),
  link character varying(512),
  rotation numeric(6,3),
  the_geom geometry(Point,25831),
  undelete boolean,
  label_x character varying(30),
  label_y character varying(30),
  label_rotation numeric(6,3),
  publish boolean,
  inventory boolean,
  hemisphere double precision,
  expl_id integer NOT NULL,
  feature_type character varying(16) DEFAULT 'NODE'::character varying,
  tstamp timestamp without time zone DEFAULT now()
);

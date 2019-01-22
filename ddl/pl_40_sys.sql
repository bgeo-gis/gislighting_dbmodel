
SET search_path = SCHEMA_NAME, public, pg_catalog;

-- ----------------------------------
-- Table: Version
-- ----------------------------------

CREATE TABLE version (
id serial NOT NULL PRIMARY KEY,
giswater varchar(16)  ,
wsoftware varchar(16)  ,
postgres varchar(512)  ,
postgis varchar(512)  ,
date timestamp(6) DEFAULT now(),
language varchar (50),
epsg int4
);


-- ----------------------------------
-- Tables: man_addfields
-- ----------------------------------
CREATE TABLE man_addfields_parameter (
id serial PRIMARY KEY,
param_name varchar(50) NOT NULL,
cat_feature_id varchar (30),
datatype text NOT NULL,
field_length integer,
num_decimals integer,
is_mandatory boolean NOT NULL,
default_value text,
descript text
);
--unique:   param_name,featurecat_id
--fk:     cat_feature_id, data_type


CREATE TABLE man_addfields_value (
id bigserial PRIMARY KEY,
feature_id varchar(16),
parameter_id integer,
value_param text
);
--unique:   feature_id,parameter_id
--fk:     parameter_id


CREATE INDEX man_addfields_value_feature_id_index ON man_addfields_value USING btree (feature_id);
CREATE INDEX man_addfields_value_parameter_id_index ON man_addfields_value USING btree (parameter_id);


-- ----------------------------------
-- Tables: config
-- ----------------------------------

CREATE TABLE config_param_system (
  id serial NOT NULL PRIMARY KEY,
  parameter character varying(50),
  value text,
  data_type character varying(20),
  context character varying(50),
  descript text,
  dt integer,
  wt integer,
  label text,
  dv_querytext text,
  dv_filterbyfield text,
  isenabled boolean,
  orderby integer,
  layout_id integer,
  layout_order integer,
  project_type character varying,
  dv_isparent boolean,
  isautoupdate boolean,
  datatype character varying,
  widgettype character varying,
  tooltip text
);


CREATE TABLE config_param_user (
id serial PRIMARY KEY,
parameter character varying (50),
value text,
cur_user character varying (30)
);

-- ----------------------------------
-- Tables: selectors
-- ----------------------------------

CREATE TABLE selector_state (
state_id integer,
cur_user text,
CONSTRAINT selector_state_pkey PRIMARY KEY (state_id,cur_user)
);

CREATE TABLE selector_date(
id serial PRIMARY KEY,
from_date date,
to_date date,
context varchar(30),
cur_user text
);

-- ----------------------------------
-- Table: Audit table
-- ----------------------------------

CREATE TABLE audit_cat_error(
  id integer PRIMARY KEY NOT NULL,
  error_message text,
  hint_message text,
  log_level smallint DEFAULT 1,
  show_user boolean DEFAULT true,
  project_type text DEFAULT 'utils'::text
  );


CREATE TABLE audit_cat_function (
  id integer PRIMARY KEY NOT NULL,
  function_name text NOT NULL,
  project_type text,
  function_type text,
  input_params text,
  return_type text,
  context text,
  descript text,
  sys_role_id text,
  isdeprecated boolean DEFAULT false
);


CREATE TABLE audit_cat_param_user(
  id text PRIMARY KEY NOT NULL,
  context text,
  description text,
  sys_role_id character varying(30),
  qgis_message text,
  dv_table text,
  dv_column text,
  dv_clause text,
  data_type text,
  label text,
  dv_querytext text,
  dv_parent_id text,
  isenabled boolean,
  layout_id integer,
  layout_order integer,
  project_type character varying,
  isparent boolean,
  dv_querytext_filterc text,
  feature_field_id text,
  feature_dv_parent_value text,
  isautoupdate boolean,
  datatype character varying(30),
  widgettype character varying(30),
  vdefault text,
  formname text,
  ismandatory boolean,
  widgetcontrols json
);


CREATE TABLE audit_cat_table(
  id text PRIMARY KEY NOT NULL,
  context text,
  description text,
  sys_role_id character varying(30),
  sys_criticity smallint,
  sys_rows text,
  qgis_role_id character varying(30),
  qgis_criticity smallint,
  qgis_message text,
  sys_sequence text,
  sys_sequence_field text,
  isdeprecated boolean DEFAULT false
);
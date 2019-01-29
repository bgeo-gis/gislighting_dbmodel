/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/


SET search_path = SCHEMA_NAME, public, pg_catalog;

-- ----------------------------
-- Base map
-- ----------------------------


-- Municipality
CREATE TABLE ext_municipality (
id integer PRIMARY KEY,
idval text,
observ text,
the_geom geometry(MULTIPOLYGON, SRID_VALUE)
);



-- Streeter
CREATE TABLE ext_type_street (
id integer PRIMARY KEY NOT NULL,
idval varchar(20) NOT NULL,
observ varchar(50)
);



CREATE TABLE ext_streetaxis (
id serial PRIMARY KEY NOT NULL,
idval varchar (100) NOT NULL,
code varchar (16),
type_id integer,
text text,
the_geom public.geometry (MULTILINESTRING, SRID_VALUE),
expl_id integer,
muni_id integer
);



-- Postnumber
CREATE TABLE ext_address(
id serial NOT NULL PRIMARY KEY,
idval character varying(16) NOT NULL,
muni_id integer,
postcode character varying(16),
streetaxis_id integer,
--postnumber character varying(16),
the_geom geometry(Point,SRID_VALUE),
expl_id integer
  );

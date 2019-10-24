

SET search_path = "SCHEMA_NAME", public, pg_catalog;


DROP VIEW IF EXISTS v_ext_streetaxis CASCADE;
CREATE VIEW v_ext_streetaxis AS SELECT
ext_streetaxis.id,
code,
type_id,
idval as streetname,
text,
the_geom,
ext_streetaxis.expl_id,
muni_id
FROM ext_streetaxis;



DROP VIEW IF EXISTS v_ext_address CASCADE;
CREATE VIEW v_ext_address AS SELECT
ext_address.id,
muni_id,
postcode,
streetaxis_id,
idval as postnumber,
the_geom,
ext_address.expl_id
FROM ext_address;




DROP VIEW IF EXISTS v_ext_district CASCADE;
CREATE OR REPLACE VIEW v_ext_district AS 
 SELECT district.district_id,
    district.name,
    district.muni_id,
    district.observ,
    district.the_geom
   FROM district;
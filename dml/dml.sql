
SET search_path = "SCHEMA_NAME", public, pg_catalog;

INSERT INTO om_visit_parameter_type (id) VALUES ('INSPECCIO');
INSERT INTO om_visit_parameter_type (id) VALUES ('ACTUACIO');


--doc

INSERT INTO doc_type (idval) VALUES ('AS_BUILT');
INSERT INTO doc_type (idval) VALUES ('INCIDENT');
INSERT INTO doc_type (idval) VALUES ('RELACIO DE TREBALL');
INSERT INTO doc_type (idval) VALUES ('ALTRES');
INSERT INTO doc_type (idval) VALUES ('FOTO');


INSERT INTO man_addfields_cat_datatype VALUES ('integer', NULL);
INSERT INTO man_addfields_cat_datatype VALUES ('text', NULL);
INSERT INTO man_addfields_cat_datatype VALUES ('date', NULL);
INSERT INTO man_addfields_cat_datatype VALUES ('boolean', NULL);
INSERT INTO man_addfields_cat_datatype VALUES ('numeric', NULL);
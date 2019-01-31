
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


INSERT INTO man_addfields_parameter VALUES (14, 'lamppost', '4', 'text', 16, NULL, false, NULL, 'columna');
INSERT INTO man_addfields_parameter VALUES (13, 'line', '4', 'text', 16, NULL, false, NULL, 'línia');
INSERT INTO man_addfields_parameter VALUES (37, 'panelboard', '5', 'text', 16, NULL, false, NULL, 'quadre');
INSERT INTO man_addfields_parameter VALUES (38, 'line', '5', 'text', 16, NULL, false, NULL, 'línia');
INSERT INTO man_addfields_parameter VALUES (35, 'panelboard', '2', 'text', 16, NULL, false, NULL, 'quadre');
INSERT INTO man_addfields_parameter VALUES (36, 'line', '2', 'text', 16, NULL, false, NULL, 'línia');
INSERT INTO man_addfields_parameter VALUES (1, 'panelboard', '3', 'text', 16, NULL, false, NULL, 'quadre');
INSERT INTO man_addfields_parameter VALUES (11, 'width_pavement', '3', 'numeric', 12, 3, false, NULL, 'ampleV');
INSERT INTO man_addfields_parameter VALUES (10, 'distance_pavement', '3', 'numeric', 12, 3, false, NULL, 'distVor');
INSERT INTO man_addfields_parameter VALUES (9, 'distance_facade', '3', 'numeric', 12, 3, false, NULL, 'distF');
INSERT INTO man_addfields_parameter VALUES (8, 'height', '3', 'numeric', 12, 3, false, NULL, 'alçada');
INSERT INTO man_addfields_parameter VALUES (6, 'color', '3', 'text', 30, NULL, false, NULL, 'color');
INSERT INTO man_addfields_parameter VALUES (5, 'model', '3', 'text', 30, NULL, false, NULL, 'model');
INSERT INTO man_addfields_parameter VALUES (4, 'light_number', '3', 'integer', 3, NULL, false, NULL, 'numpunts');
INSERT INTO man_addfields_parameter VALUES (2, 'line', '3', 'text', 16, NULL, false, NULL, 'línia');
INSERT INTO man_addfields_parameter VALUES (7, 'anti_corrosion', '3', 'text', 30, NULL, false, NULL, 'anticorr');
INSERT INTO man_addfields_parameter VALUES (3, 'lamppost', '3', 'text', 16, NULL, false, NULL, 'columna');
INSERT INTO man_addfields_parameter VALUES (22, 'line_number', '1', 'integer', 3, NULL, false, NULL, 'numlinies');
INSERT INTO man_addfields_parameter VALUES (34, 'remote_management', '1', 'text', 30, NULL, false, NULL, 'telegestio');
INSERT INTO man_addfields_parameter VALUES (33, 'hour_change_date', '1', 'date', NULL, NULL, false, NULL, 'canvihora');
INSERT INTO man_addfields_parameter VALUES (32, 'auto_hour_change', '1', 'boolean', NULL, NULL, false, NULL, 'canviauto');
INSERT INTO man_addfields_parameter VALUES (31, 'astro_clock_model', '1', 'text', 30, NULL, false, NULL, 'moderell');
INSERT INTO man_addfields_parameter VALUES (30, 'astro_clock_brand', '1', 'text', 30, NULL, false, NULL, 'marcarell');
INSERT INTO man_addfields_parameter VALUES (29, 'active_flow_regulator', '1', 'boolean', NULL, NULL, false, NULL, 'regactiu');
INSERT INTO man_addfields_parameter VALUES (28, 'flow_regulator', '1', 'boolean', NULL, NULL, false, NULL, 'regfluxe');
INSERT INTO man_addfields_parameter VALUES (27, 'next_inspection', '1', 'date', NULL, NULL, false, NULL, 'propinspec');
INSERT INTO man_addfields_parameter VALUES (26, 'last_inspection', '1', 'date', NULL, NULL, false, NULL, 'ultinspec');
INSERT INTO man_addfields_parameter VALUES (25, 'data_legal', '1', 'date', NULL, NULL, false, NULL, 'datalegal');
INSERT INTO man_addfields_parameter VALUES (24, 'light_number', '1', 'integer', 10, NULL, false, NULL, 'numpunts');
INSERT INTO man_addfields_parameter VALUES (23, 'power', '1', 'integer', 10, NULL, false, NULL, 'potencia');
INSERT INTO man_addfields_parameter VALUES (12, 'panelboard', '4', 'text', 16, NULL, false, NULL, 'quadre');
INSERT INTO man_addfields_parameter VALUES (21, 'ballast_code', '4', 'text', 30, NULL, false, NULL, 'codbalast');
INSERT INTO man_addfields_parameter VALUES (20, 'color_temperature', '4', 'text', 30, NULL, false, NULL, 'tempcolor');
INSERT INTO man_addfields_parameter VALUES (19, 'light_form', '4', 'text', 30, NULL, false, NULL, 'formalamp');
INSERT INTO man_addfields_parameter VALUES (18, 'light_type', '4', 'text', 30, NULL, false, NULL, 'tipuslamp');
INSERT INTO man_addfields_parameter VALUES (17, 'light_code', '4', 'text', 30, NULL, false, NULL, 'codilamp');
INSERT INTO man_addfields_parameter VALUES (16, 'power', '4', 'integer', 10, NULL, false, NULL, 'potencia');
INSERT INTO man_addfields_parameter VALUES (15, 'light_number', '4', 'integer', 3, NULL, false, NULL, 'numpunt');


INSERT INTO cat_feature (id, idval, system_id, feature_type, shortcut_key, parent_layer, child_layer, orderby, active, code_autofill) VALUES (2, 'ARQUETA', 'REGISTER', 'NODE', 'R', 've_node', 've_node_arqueta', NULL, true, NULL);
INSERT INTO cat_feature (id, idval, system_id, feature_type, shortcut_key, parent_layer, child_layer, orderby, active, code_autofill) VALUES (3, 'COLUMNA', 'LAMPPOST', 'NODE', 'C', 've_node', 've_node_columna', NULL, true, NULL);
INSERT INTO cat_feature (id,idval, system_id, feature_type, shortcut_key, parent_layer, child_layer, orderby, active, code_autofill) VALUES (5, 'LINIA', 'LINE', 'ARC', 'L', 've_node', 've_arc_linia', NULL, true, NULL);
INSERT INTO cat_feature (id,idval, system_id, feature_type, shortcut_key, parent_layer, child_layer, orderby, active, code_autofill) VALUES (4,'PUNT', 'LIGHTPOINT', 'NODE', 'P', 've_node', 've_node_punto_luz', NULL, true, NULL);
INSERT INTO cat_feature (id,idval, system_id, feature_type, shortcut_key, parent_layer, child_layer, orderby, active, code_autofill) VALUES (1,'QUADRE', 'PANELBOARD', 'NODE', 'Q', 've_node', 've_node_quadre', NULL, true, NULL);



INSERT INTO cat_node VALUES (4, 'PUNT', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL);
INSERT INTO cat_node VALUES (1, 'QUADRE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL);
INSERT INTO cat_node VALUES (2, 'ARQUETA', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL);
INSERT INTO cat_node VALUES (3, 'COLUMNA', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL);


INSERT INTO cat_arc VALUES (1, 'LINIA', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'm', NULL, NULL, NULL, NULL);

INSERT INTO config_param_system VALUES (1, 'arc_searchnodes', '0.5', 'float', 'edit', NULL, NULL, NULL, 'Arc searchnodes buffer:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO config_param_system VALUES (2, 'arc_searchnodes_control', 'true', 'boolean', 'edit', NULL, NULL, NULL, 'Arc searchnodes control:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO config_param_system VALUES (3, 'samenode_init_end_control', 'false', 'boolean', 'edit', NULL, NULL, NULL, 'Arc same node init end control:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO config_param_system VALUES (5, 'state_topocontrol', 'true', 'boolean', 'edit', NULL, NULL, NULL, 'State topocontrol:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO config_param_system VALUES (4, 'edit_topocontrol_dsbl_error', 'true', 'boolean', 'edit', NULL, NULL, NULL, 'Topocontrol error:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

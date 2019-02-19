
SET search_path = "SCHEMA_NAME", public, pg_catalog;


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
INSERT INTO man_addfields_parameter VALUES (39, 'location', '5', 'text', 50, NULL, false, NULL, 'tipus');
INSERT INTO man_addfields_parameter VALUES (40, 'light_height', '4', 'numeric', 12, 3, false, NULL, 'alçadasup');
INSERT INTO man_addfields_parameter VALUES (41, 'initial_flow', '4', 'numeric', 12, 3, false, NULL, 'fluxinlamp');



INSERT INTO cat_feature (id, idval, system_id, feature_type, shortcut_key, parent_layer, child_layer, orderby, active, code_autofill,topology_type) VALUES (2, 'ARQUETA', 'REGISTER', 'NODE', 'R', 've_node', 've_node_arqueta', NULL, true, NULL, NULL);
INSERT INTO cat_feature (id, idval, system_id, feature_type, shortcut_key, parent_layer, child_layer, orderby, active, code_autofill,topology_type) VALUES (3, 'COLUMNA', 'LAMPPOST', 'NODE', 'C', 've_node', 've_node_columna', NULL, true, NULL, 1);
INSERT INTO cat_feature (id,idval, system_id, feature_type, shortcut_key, parent_layer, child_layer, orderby, active, code_autofill,topology_type) VALUES (5, 'LINIA', 'LINE', 'ARC', 'L', 've_arc', 've_arc_linia', NULL, true,NULL, 1);
INSERT INTO cat_feature (id,idval, system_id, feature_type, shortcut_key, parent_layer, child_layer, orderby, active, code_autofill,topology_type) VALUES (4,'PUNT', 'LIGHTPOINT', 'NODE', 'P', 've_node', 've_node_punto_luz', NULL, true, NULL, NULL);
INSERT INTO cat_feature (id,idval, system_id, feature_type, shortcut_key, parent_layer, child_layer, orderby, active, code_autofill, topology_type) VALUES (1,'QUADRE', 'PANELBOARD', 'NODE', 'Q', 've_node', 've_node_quadre', NULL, true,NULL, 1);



INSERT INTO cat_node VALUES (4, 'PUNT', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL);
INSERT INTO cat_node VALUES (1, 'QUADRE', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL);
INSERT INTO cat_node VALUES (2, 'ARQUETA', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL);
INSERT INTO cat_node VALUES (3, 'COLUMNA', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL);


INSERT INTO cat_arc VALUES (1, 'LINIA', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'm', NULL, NULL, NULL, NULL);

INSERT INTO exploitation VALUES (1, 'expl1', NULL, true, '0106000020E76400000100000001030000000100000005000000947C5CBD6FF319416C5659F22F89514178A0E03EFC201A41168A209F9B8A514182FF6B367D3A1A41FCFA088532885141251F5717A5081A4168ECB769C5865141947C5CBD6FF319416C5659F22F895141');

INSERT INTO dma VALUES (1, 'dma1', 1, NULL, NULL, '0106000020E76400000100000001030000000100000005000000947C5CBD6FF319416C5659F22F89514178A0E03EFC201A41168A209F9B8A514182FF6B367D3A1A41FCFA088532885141251F5717A5081A4168ECB769C5865141947C5CBD6FF319416C5659F22F895141');

INSERT INTO ext_municipality VALUES (1, 'muni1', NULL, '0106000020E76400000100000001030000000100000005000000947C5CBD6FF319416C5659F22F89514178A0E03EFC201A41168A209F9B8A514182FF6B367D3A1A41FCFA088532885141251F5717A5081A4168ECB769C5865141947C5CBD6FF319416C5659F22F895141');

INSERT INTO selector_state VALUES (1,'postgres');


INSERT INTO om_visit_parameter_form_type (id) VALUES ('event_standard');

INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('intermittent_bulb_lp', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Làmpada intermitent', 'event_standard', NULL, NULL, 'PUNT');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('broken_bulb_lp', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Làmpada trencada', 'event_standard', NULL, NULL, 'PUNT');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('burned_bulb_lp', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Làmpada esgotada', 'event_standard', NULL, NULL, 'PUNT');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('lock_pb', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Pany', 'event_standard', NULL, NULL, 'QUADRE - EXT');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('defected_bulb_lp', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Defecte en la làmpada', 'event_standard', NULL, NULL, 'PUNT');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('hinge_pb', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Frontissa', 'event_standard', NULL, NULL, 'QUADRE - EXT');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('burned_line', NULL, 'INSPECCIO', 'ARC', 'TEXT', NULL, 'Cremada', 'event_standard', NULL, NULL, 'LINIA');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('rodent_line', NULL, 'INSPECCIO', 'ARC', 'TEXT', NULL, 'Rosegador', 'event_standard', NULL, NULL, 'LINIA');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('cut_line', NULL, 'INSPECCIO', 'ARC', 'TEXT', NULL, 'Tall o pessic', 'event_standard', NULL, NULL, 'LINIA');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('deterioration_col', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Deteriorament', 'event_standard', NULL, NULL, 'COLUMNA');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('hit_pb', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Colpejat', 'event_standard', NULL, NULL, 'QUADRE - EXT');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('corrosion_col', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Corrosió en la base', 'event_standard', NULL, NULL, 'COLUMNA');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('hit_accident_col', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Colpejat accident', 'event_standard', NULL, NULL, 'COLUMNA');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('lack_cover_reg', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Falta tapa', 'event_standard', NULL, NULL, 'ARQUETA');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('loose_frame_reg', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Marc solt', 'event_standard', NULL, NULL, 'ARQUETA');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('broken_cover_reg', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Tapa trencada', 'event_standard', NULL, NULL, 'ARQUETA');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('magnetothermic_pb', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Pia', 'event_standard', NULL, NULL, 'QUADRE - INT');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('diferential_switch_pb', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Diferencial', 'event_standard', NULL, NULL, 'QUADRE - INT');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('clock_pb', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Rellotge', 'event_standard', NULL, NULL, 'QUADRE - INT');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('contactor_pb', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Contactor', 'event_standard', NULL, NULL, 'QUADRE - INT');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('deterioration_pb', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Deteriorament', 'event_standard', NULL, NULL, 'QUADRE - EXT');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('broken_door_pb', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Tapa/porta trencada', 'event_standard', NULL, NULL, 'QUADRE - EXT');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('deterioration_line', NULL, 'INSPECCIO', 'ARC', 'TEXT', NULL, 'Deteriorament', 'event_standard', NULL, NULL, 'LINIA');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('deterioration_lp', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Deteriorament', 'event_standard', NULL, NULL, 'PUNT');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('broken_lp', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Trencament', 'event_standard', NULL, NULL, 'PUNT');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('out-of-order_lp', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'No funciona', 'event_standard', NULL, NULL, 'PUNT');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('light_install_lp', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Instalació llum', 'event_standard', NULL, NULL, 'PUNT');
INSERT INTO om_visit_parameter (id, code, parameter_type, feature_type, data_type, criticity, descript, form_type, vdefault, ismultifeature, short_descript) VALUES ('ballast_install_lp', NULL, 'INSPECCIO', 'NODE', 'TEXT', NULL, 'Instalació balastro', 'event_standard', NULL, NULL, 'PUNT');

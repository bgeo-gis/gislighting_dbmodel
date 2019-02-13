
INSERT INTO config_param_system VALUES (1, 'arc_searchnodes', '0.5', 'float', 'edit', NULL, NULL, NULL, 'Arc searchnodes buffer:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO config_param_system VALUES (2, 'arc_searchnodes_control', 'true', 'boolean', 'edit', NULL, NULL, NULL, 'Arc searchnodes control:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO config_param_system VALUES (3, 'samenode_init_end_control', 'false', 'boolean', 'edit', NULL, NULL, NULL, 'Arc same node init end control:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO config_param_system VALUES (5, 'state_topocontrol', 'true', 'boolean', 'edit', NULL, NULL, NULL, 'State topocontrol:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO config_param_system VALUES (4, 'edit_topocontrol_dsbl_error', 'true', 'boolean', 'edit', NULL, NULL, NULL, 'Topocontrol error:', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);



INSERT INTO man_addfields_cat_datatype VALUES ('integer', NULL);
INSERT INTO man_addfields_cat_datatype VALUES ('text', NULL);
INSERT INTO man_addfields_cat_datatype VALUES ('date', NULL);
INSERT INTO man_addfields_cat_datatype VALUES ('boolean', NULL);
INSERT INTO man_addfields_cat_datatype VALUES ('numeric', NULL);


INSERT INTO sys_typevalue (id, typevalue, idval, descript) VALUES (1, 'feature_type', 'ARC', NULL);
INSERT INTO sys_typevalue (id, typevalue, idval, descript) VALUES (2, 'feature_type', 'NODE', NULL);
INSERT INTO sys_typevalue (id, typevalue, idval, descript) VALUES (3, 'system_id', 'PANELBOARD', NULL);
INSERT INTO sys_typevalue (id, typevalue, idval, descript) VALUES (4, 'system_id', 'REGISTER', NULL);
INSERT INTO sys_typevalue (id, typevalue, idval, descript) VALUES (5, 'system_id', 'LAMPPOST', NULL);
INSERT INTO sys_typevalue (id, typevalue, idval, descript) VALUES (6, 'system_id', 'LIGHTPOINT', NULL);
INSERT INTO sys_typevalue (id, typevalue, idval, descript) VALUES (7, 'system_id', 'LINE', NULL);

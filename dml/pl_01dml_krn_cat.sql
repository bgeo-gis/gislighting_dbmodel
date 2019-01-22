
SET search_path = "SCHEMA_NAME", public, pg_catalog;

-- Records of value_state
-- ----------------------------
INSERT INTO "value_state" VALUES (0,'OBSOLET');
INSERT INTO "value_state" VALUES (1,'EN_SERVEI');
INSERT INTO "value_state" VALUES (2,'PLANIFICAT');

-- Records of value_state_type
-- ----------------------------
INSERT INTO value_state_type VALUES (1, 0, 'OBSOLET', false, false);
INSERT INTO value_state_type VALUES (2, 1, 'EN_SERVEI', true, true);
INSERT INTO value_state_type VALUES (3, 2, 'PLANIFICAT', true, true);
INSERT INTO value_state_type VALUES (4, 2, 'RECONSTRUIR', true, false);
INSERT INTO value_state_type VALUES (5, 1, 'PROVISIONAL', false, true);

-- Records of value_verified
-- ----------------------------
INSERT INTO "value_verified" VALUES ('PER REVISAR');
INSERT INTO "value_verified" VALUES ('VERIFICAT');
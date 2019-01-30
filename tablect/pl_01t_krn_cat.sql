
SET search_path = "SCHEMA_NAME", public, pg_catalog;

--DROP
aLTER TABLE dattrib DROP CONSTRAINT IF EXISTS dattrib_dattrib_type_fkey;

ALTER TABLE exploitation_x_user DROP CONSTRAINT IF EXISTS exploitation_x_user_expl_id_fkey;
ALTER TABLE exploitation_x_user DROP CONSTRAINT IF EXISTS exploitation_x_user_username_fkey;
ALTER TABLE exploitation_x_user DROP CONSTRAINT IF EXISTS exploitation_x_user_expl_username_unique;

ALTER TABLE dma DROP CONSTRAINT IF EXISTS dma_expl_id_fkey;

ALTER TABLE value_state_type DROP CONSTRAINT IF EXISTS value_state_type_state_id_fkey;

ALTER TABLE man_type_category DROP CONSTRAINT IF EXISTS man_type_category_feature_type_fkey;
ALTER TABLE man_type_category DROP CONSTRAINT IF EXISTS man_type_category_unique CASCADE;

ALTER TABLE man_type_location DROP CONSTRAINT IF EXISTS man_type_location_feature_type_fkey;
ALTER TABLE man_type_location DROP CONSTRAINT IF EXISTS man_type_location_unique CASCADE;
--ADD

ALTER TABLE dattrib ADD CONSTRAINT dattrib_dattrib_type_fkey FOREIGN KEY (dattrib_type)
REFERENCES dattrib_type (id) MATCH SIMPLE ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE exploitation_x_user ADD CONSTRAINT exploitation_x_user_expl_id_fkey FOREIGN KEY (expl_id) REFERENCES exploitation (expl_id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE exploitation_x_user ADD CONSTRAINT exploitation_x_user_username_fkey FOREIGN KEY (username) REFERENCES cat_users (id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE exploitation_x_user ADD CONSTRAINT exploitation_x_user_expl_username_unique UNIQUE (expl_id, username);


ALTER TABLE dma ADD CONSTRAINT dma_expl_id_fkey FOREIGN KEY (expl_id) REFERENCES exploitation (expl_id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE value_state_type ADD CONSTRAINT value_state_type_state_id_fkey FOREIGN KEY (state_id) REFERENCES value_state (id) ON DELETE RESTRICT ON UPDATE CASCADE;


--MAN_TYPE
ALTER TABLE man_type_category ADD CONSTRAINT man_type_category_feature_type_fkey FOREIGN KEY (feature_type) REFERENCES sys_feature_type (id) ON DELETE RESTRICT ON UPDATE CASCADE; 
ALTER TABLE man_type_category ADD CONSTRAINT man_type_category_unique UNIQUE (category_type, feature_type);

ALTER TABLE man_type_location ADD CONSTRAINT man_type_location_feature_type_fkey FOREIGN KEY (feature_type) REFERENCES sys_feature_type (id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE man_type_location ADD CONSTRAINT man_type_location_unique UNIQUE (location_type, feature_type);
--------------
--new
ALTER TABLE cat_feature ADD CONSTRAINT cat_feature_type_check CHECK (type IN ('ARC', 'NODE'));
ALTER TABLE cat_feature ADD CONSTRAINT cat_feature_system_id_check CHECK (type IN ('REGISTER', 'COLUMN', 'LINE', 'LIGHTPOINT', 'PANELBOARD'));
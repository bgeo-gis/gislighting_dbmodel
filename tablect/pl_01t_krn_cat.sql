
SET search_path = "SCHEMA_NAME", public, pg_catalog;

--DROP
aLTER TABLE dattrib DROP CONSTRAINT IF EXISTS dattrib_dattrib_type_fkey;

ALTER TABLE exploitation_x_user DROP CONSTRAINT IF EXISTS exploitation_x_user_expl_id_fkey;
ALTER TABLE exploitation_x_user DROP CONSTRAINT IF EXISTS exploitation_x_user_username_fkey;
ALTER TABLE exploitation_x_user DROP CONSTRAINT IF EXISTS exploitation_x_user_expl_username_unique;

ALTER TABLE dma DROP CONSTRAINT IF EXISTS dma_expl_id_fkey;

ALTER TABLE value_state_type DROP CONSTRAINT IF EXISTS value_state_type_state_id_fkey;

ALTER TABLE cat_type_category DROP CONSTRAINT IF EXISTS cat_type_category_feature_type_check;
--ALTER TABLE cat_type_category DROP CONSTRAINT IF EXISTS cat_type_category_feature_type_fkey;
ALTER TABLE cat_type_category DROP CONSTRAINT IF EXISTS cat_type_category_id_unique CASCADE;
ALTER TABLE cat_type_category DROP CONSTRAINT IF EXISTS cat_type_category_idval_unique CASCADE;

ALTER TABLE cat_type_location DROP CONSTRAINT IF EXISTS cat_type_location_feature_type_check;
--ALTER TABLE cat_type_location DROP CONSTRAINT IF EXISTS cat_type_location_feature_type_fkey;
ALTER TABLE cat_type_location DROP CONSTRAINT IF EXISTS cat_type_location_id_unique CASCADE;
ALTER TABLE cat_type_location DROP CONSTRAINT IF EXISTS cat_type_location_idval_unique CASCADE;

ALTER TABLE cat_feature DROP CONSTRAINT IF EXISTS cat_feature_type_check;
ALTER TABLE cat_feature DROP CONSTRAINT IF EXISTS cat_feature_system_id_check;


--ADD

ALTER TABLE dattrib ADD CONSTRAINT dattrib_dattrib_type_fkey FOREIGN KEY (dattrib_type)
REFERENCES dattrib_type (id) MATCH SIMPLE ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE exploitation_x_user ADD CONSTRAINT exploitation_x_user_expl_id_fkey FOREIGN KEY (expl_id) REFERENCES exploitation (id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE exploitation_x_user ADD CONSTRAINT exploitation_x_user_username_fkey FOREIGN KEY (username) REFERENCES cat_user (id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE exploitation_x_user ADD CONSTRAINT exploitation_x_user_expl_username_unique UNIQUE (expl_id, username);


ALTER TABLE dma ADD CONSTRAINT dma_expl_id_fkey FOREIGN KEY (expl_id) REFERENCES exploitation (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE value_state_type ADD CONSTRAINT value_state_type_state_id_fkey FOREIGN KEY (state_id) REFERENCES value_state (id) ON DELETE RESTRICT ON UPDATE CASCADE;


--MAN_TYPE
ALTER TABLE cat_type_category ADD CONSTRAINT cat_type_category_feature_type_check CHECK (feature_type IN ('ARC', 'NODE'));
--ALTER TABLE cat_type_category ADD CONSTRAINT cat_type_category_feature_type_fkey FOREIGN KEY (feature_type) REFERENCES sys_feature_type (id) ON DELETE RESTRICT ON UPDATE CASCADE; 
ALTER TABLE cat_type_category ADD CONSTRAINT cat_type_category_idval_unique UNIQUE (idval, feature_type);
ALTER TABLE cat_type_category ADD CONSTRAINT cat_type_category_id_unique UNIQUE (id, feature_type);

--ALTER TABLE cat_type_location ADD CONSTRAINT cat_type_location_feature_type_fkey FOREIGN KEY (feature_type) REFERENCES sys_feature_type (id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE cat_type_location ADD CONSTRAINT cat_type_location_feature_type_check CHECK (feature_type IN ('ARC', 'NODE','ELEMENT'));
ALTER TABLE cat_type_location ADD CONSTRAINT cat_type_location_idval_unique UNIQUE (idval, feature_type);
ALTER TABLE cat_type_location ADD CONSTRAINT cat_type_location_id_unique UNIQUE (id, feature_type);

--------------
--new
ALTER TABLE cat_feature ADD CONSTRAINT cat_feature_type_check CHECK (feature_type IN ('ARC', 'NODE','ELEMENT'));
ALTER TABLE cat_feature ADD CONSTRAINT cat_feature_system_id_check CHECK (system_id IN ('REGISTER', 'LAMPPOST', 'LINE', 'LIGHTPOINT', 'PANELBOARD'));

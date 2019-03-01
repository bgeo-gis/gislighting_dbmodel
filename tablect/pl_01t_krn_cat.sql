
SET search_path = "SCHEMA_NAME", public, pg_catalog;

--DROP
ALTER TABLE exploitation_x_user DROP CONSTRAINT IF EXISTS exploitation_x_user_expl_id_fkey;
ALTER TABLE exploitation_x_user DROP CONSTRAINT IF EXISTS exploitation_x_user_username_fkey;
ALTER TABLE exploitation_x_user DROP CONSTRAINT IF EXISTS exploitation_x_user_expl_username_unique;

ALTER TABLE dma DROP CONSTRAINT IF EXISTS dma_expl_id_fkey;

ALTER TABLE value_state_type DROP CONSTRAINT IF EXISTS value_state_type_state_id_fkey;

ALTER TABLE cat_feature DROP CONSTRAINT IF EXISTS cat_feature_type_check;
ALTER TABLE cat_feature DROP CONSTRAINT IF EXISTS cat_feature_system_id_check;

ALTER TABLE cat_addfields_typevalue DROP CONSTRAINT IF EXISTS cat_addfields_typevalue_typevalue_fkey;

ALTER TABLE cat_feature DROP CONSTRAINT IF EXISTS cat_feature_type_check;

--ADD

ALTER TABLE exploitation_x_user ADD CONSTRAINT exploitation_x_user_expl_id_fkey FOREIGN KEY (expl_id) REFERENCES exploitation (id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE exploitation_x_user ADD CONSTRAINT exploitation_x_user_username_fkey FOREIGN KEY (username) REFERENCES cat_user (id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE exploitation_x_user ADD CONSTRAINT exploitation_x_user_expl_username_unique UNIQUE (expl_id, username);


ALTER TABLE dma ADD CONSTRAINT dma_expl_id_fkey FOREIGN KEY (expl_id) REFERENCES exploitation (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE value_state_type ADD CONSTRAINT value_state_type_state_id_fkey FOREIGN KEY (state_id) REFERENCES value_state (id) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE cat_addfields_typevalue ADD CONSTRAINT cat_addfields_typevalue_typevalue_fkey FOREIGN KEY (typevalue) REFERENCES man_addfields_parameter (id) ON DELETE RESTRICT ON UPDATE CASCADE;



--------------
--new
ALTER TABLE cat_feature ADD CONSTRAINT cat_feature_type_check CHECK (feature_type IN ('ARC', 'NODE','ELEMENT'));
ALTER TABLE cat_feature ADD CONSTRAINT cat_feature_system_id_check CHECK (system_id IN ('REGISTER', 'LAMPPOST', 'LINE', 'LIGHTPOINT', 'PANELBOARD','ELEMENT'));

ALTER TABLE cat_mat
  ADD CONSTRAINT cat_mat_type_check CHECK (feature_type::text = ANY (ARRAY['ARC'::character varying, 'NODE'::character varying, 'ELEMENT'::character varying]::text[]));


SET search_path = SCHEMA_NAME, public, pg_catalog;


--DROP CONSTRAINT
ALTER TABLE man_addfields_value DROP CONSTRAINT IF EXISTS man_addfields_value_parameter_id_fkey;
ALTER TABLE man_addfields_parameter DROP CONSTRAINT IF EXISTS  man_addfields_parameter_cat_feature_id_fkey;
ALTER TABLE man_addfields_value DROP CONSTRAINT man_addfields_value_unique;
/*
ALTER TABLE selector_expl DROP CONSTRAINT IF EXISTS selector_expl_id_fkey;

ALTER TABLE audit_cat_table DROP CONSTRAINT IF EXISTS audit_cat_table_sys_role_id_fkey ;
ALTER TABLE audit_cat_table DROP CONSTRAINT IF EXISTS audit_cat_table_qgis_role_id_fkey;

ALTER TABLE audit_cat_function DROP CONSTRAINT IF EXISTS audit_cat_function_sys_role_id_fkey ;
*/
--ADD CONSTRAINT
ALTER TABLE man_addfields_parameter ADD CONSTRAINT man_addfields_parameter_cat_feature_id_fkey FOREIGN KEY (cat_feature_id) REFERENCES cat_feature (id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE man_addfields_value ADD CONSTRAINT man_addfields_value_parameter_id_fkey FOREIGN KEY (parameter_id) REFERENCES man_addfields_parameter (id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE man_addfields_value ADD CONSTRAINT man_addfields_value_unique UNIQUE(feature_id, parameter_id);
/*
ALTER TABLE selector_expl ADD CONSTRAINT selector_expl_id_fkey FOREIGN KEY (expl_id) REFERENCES exploitation (id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE audit_cat_table ADD CONSTRAINT audit_cat_table_sys_role_id_fkey FOREIGN KEY (sys_role_id)  REFERENCES sys_role (id) ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE audit_cat_table ADD CONSTRAINT audit_cat_table_qgis_role_id_fkey FOREIGN KEY (qgis_role_id)  REFERENCES sys_role (id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE sys_csv2pg_cat ADD CONSTRAINT sys_csv2pg_cat_sys_role_fkey FOREIGN KEY (sys_role) REFERENCES sys_role (id) ON DELETE RESTRICT ON UPDATE CASCADE;
*/

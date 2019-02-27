

SET search_path = SCHEMA_NAME, public, pg_catalog;

--DROP CONSTRAINT

ALTER TABLE cat_element DROP CONSTRAINT IF EXISTS cat_element_matcat_id_fkey;

--ELEMENT
ALTER TABLE element DROP CONSTRAINT IF EXISTS element_elementcat_id_fkey;
ALTER TABLE element DROP CONSTRAINT IF EXISTS element_state_id_fkey;
ALTER TABLE element DROP CONSTRAINT IF EXISTS element_workcat_id_fkey;
ALTER TABLE element DROP CONSTRAINT IF EXISTS element_workcat_id_end_fkey;
ALTER TABLE element DROP CONSTRAINT IF EXISTS element_buildercat_id_fkey;
ALTER TABLE element DROP CONSTRAINT IF EXISTS element_ownercat_id_fkey;
ALTER TABLE element DROP CONSTRAINT IF EXISTS element_feature_type_fkey;
ALTER TABLE element DROP CONSTRAINT IF EXISTS element_state_type_id_fkey;
ALTER TABLE element DROP CONSTRAINT IF EXISTS element_feature_type_check;

ALTER TABLE element_x_arc DROP CONSTRAINT IF EXISTS element_x_arc_element_id_fkey;
ALTER TABLE element_x_arc DROP CONSTRAINT IF EXISTS element_x_arc_arc_id_fkey;

ALTER TABLE element_x_node DROP CONSTRAINT IF EXISTS element_x_node_element_id_fkey;
ALTER TABLE element_x_node DROP CONSTRAINT IF EXISTS element_x_node_node_id_fkey;

ALTER TABLE cat_element DROP CONSTRAINT IF EXISTS cat_element_cat_feature_id_fkey;
ALTER TABLE cat_element DROP CONSTRAINT IF EXISTS  cat_element_cat_mat_id_fkey;


--ADD CONSTRAINT
ALTER TABLE cat_element ADD CONSTRAINT cat_element_matcat_id_fkey FOREIGN KEY (matcat_id) REFERENCES cat_mat (id) ON DELETE CASCADE ON UPDATE CASCADE;

--ELEMENT
ALTER TABLE element ADD CONSTRAINT element_elementcat_id_fkey FOREIGN KEY (elementcat_id) REFERENCES cat_element (id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE element ADD CONSTRAINT element_state_id_fkey FOREIGN KEY (state_id) REFERENCES value_state (id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE element ADD CONSTRAINT element_state_type_id_fkey FOREIGN KEY (state_type_id) REFERENCES value_state_type (id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE element ADD CONSTRAINT element_workcat_id_fkey FOREIGN KEY (workcat_id) REFERENCES cat_work (id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE element ADD CONSTRAINT element_workcat_id_end_fkey FOREIGN KEY (workcat_id_end) REFERENCES cat_work (id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE element ADD CONSTRAINT element_buildercat_id_fkey FOREIGN KEY (buildercat_id) REFERENCES cat_builder (id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE element ADD CONSTRAINT element_ownercat_id_fkey FOREIGN KEY (ownercat_id) REFERENCES cat_owner (id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE element ADD CONSTRAINT element_feature_type_check CHECK (feature_type::text = ANY (ARRAY['ELEMENT'::character varying]::text[]));

ALTER TABLE element_x_arc ADD CONSTRAINT element_x_arc_element_id_fkey FOREIGN KEY (element_id) REFERENCES element (element_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE element_x_arc ADD CONSTRAINT element_x_arc_arc_id_fkey FOREIGN KEY (arc_id) REFERENCES arc (arc_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE element_x_node ADD CONSTRAINT element_x_node_element_id_fkey FOREIGN KEY (element_id) REFERENCES element (element_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE element_x_node ADD CONSTRAINT element_x_node_node_id_fkey FOREIGN KEY (node_id) REFERENCES node (node_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE cat_element ADD CONSTRAINT cat_element_cat_feature_id_fkey FOREIGN KEY (cat_feature_id) REFERENCES cat_feature(id) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE cat_element ADD CONSTRAINT cat_element_cat_mat_id_fkey FOREIGN KEY (matcat_id) REFERENCES cat_mat(id) ON DELETE RESTRICT ON UPDATE CASCADE;

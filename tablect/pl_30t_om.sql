

SET search_path = "SCHEMA_NAME", public, pg_catalog;

--DROP CONSTRAINT
ALTER TABLE ONLY om_visit_class_x_parameter DROP CONSTRAINT om_visit_class_x_parameter_class_fkey;
ALTER TABLE ONLY om_visit_class_x_parameter DROP CONSTRAINT om_visit_class_x_parameter_parameter_fkey;

ALTER TABLE ONLY om_visit_event_photo DROP CONSTRAINT om_visit_event_foto_event_id_fkey ;
ALTER TABLE ONLY om_visit_event_photo DROP CONSTRAINT om_visit_event_foto_visit_id_fkey ;

ALTER TABLE ONLY om_visit_event DROP CONSTRAINT om_visit_event_parameter_id_fkey;
ALTER TABLE ONLY om_visit_event DROP CONSTRAINT om_visit_event_position_id_fkey;
ALTER TABLE ONLY om_visit_event DROP CONSTRAINT om_visit_event_visit_id_fkey;

ALTER TABLE ONLY om_visit DROP CONSTRAINT om_visit_expl_id_fkey;
ALTER TABLE ONLY om_visit DROP CONSTRAINT om_visit_om_visit_cat_id_fkey;

ALTER TABLE ONLY om_visit_parameter_x_parameter DROP CONSTRAINT om_visit_parameter_action_type_fkey;

ALTER TABLE ONLY om_visit_parameter DROP CONSTRAINT om_visit_parameter_criticity_fkey;
ALTER TABLE ONLY om_visit_parameter DROP CONSTRAINT om_visit_parameter_feature_type_fkey;
ALTER TABLE ONLY om_visit_parameter DROP CONSTRAINT om_visit_parameter_form_type_fkey;
ALTER TABLE ONLY om_visit_parameter DROP CONSTRAINT om_visit_parameter_parameter_type_fkey;

ALTER TABLE ONLY om_visit_x_arc DROP CONSTRAINT om_visit_x_arc_arc_id_fkey;
ALTER TABLE ONLY om_visit_x_arc DROP CONSTRAINT om_visit_x_arc_visit_id_fkey;

ALTER TABLE ONLY om_visit_x_node DROP CONSTRAINT om_visit_x_node_node_id_fkey;
ALTER TABLE ONLY om_visit_x_node DROP CONSTRAINT om_visit_x_node_visit_id_fkey;

ALTER TABLE ONLY om_visit_file DROP CONSTRAINT om_visit_file_visit_id_fkey;
ALTER TABLE ONLY om_visit_file DROP CONSTRAINT selector_workcat_filetype_fextension_fkey;

--ADD CONSTRAINT
ALTER TABLE ONLY om_visit_class_x_parameter 
ADD CONSTRAINT om_visit_class_x_parameter_class_fkey FOREIGN KEY (class_id) REFERENCES om_visit_class(id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ONLY om_visit_class_x_parameter
ADD CONSTRAINT om_visit_class_x_parameter_parameter_fkey FOREIGN KEY (parameter_id) REFERENCES om_visit_parameter(id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ONLY om_visit_event_photo
ADD CONSTRAINT om_visit_event_foto_event_id_fkey FOREIGN KEY (event_id) REFERENCES om_visit_event(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY om_visit_event_photo
ADD CONSTRAINT om_visit_event_foto_visit_id_fkey FOREIGN KEY (visit_id) REFERENCES om_visit(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY om_visit_event
ADD CONSTRAINT om_visit_event_parameter_id_fkey FOREIGN KEY (parameter_id) REFERENCES om_visit_parameter(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY om_visit_event
ADD CONSTRAINT om_visit_event_position_id_fkey FOREIGN KEY (position_id) REFERENCES node(node_id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ONLY om_visit_event
ADD CONSTRAINT om_visit_event_visit_id_fkey FOREIGN KEY (visit_id) REFERENCES om_visit(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY om_visit
ADD CONSTRAINT om_visit_expl_id_fkey FOREIGN KEY (expl_id) REFERENCES exploitation(expl_id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ONLY om_visit_file
ADD CONSTRAINT om_visit_file_visit_id_fkey FOREIGN KEY (visit_id) REFERENCES om_visit(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY om_visit
ADD CONSTRAINT om_visit_om_visit_cat_id_fkey FOREIGN KEY (visitcat_id) REFERENCES om_visit_cat(id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ONLY om_visit_parameter_x_parameter
ADD CONSTRAINT om_visit_parameter_action_type_fkey FOREIGN KEY (action_type) REFERENCES om_visit_parameter_cat_action(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY om_visit_parameter
ADD CONSTRAINT om_visit_parameter_criticity_fkey FOREIGN KEY (criticity) REFERENCES om_visit_value_criticity(id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ONLY om_visit_parameter
ADD CONSTRAINT om_visit_parameter_feature_type_fkey FOREIGN KEY (feature_type) REFERENCES sys_feature_type(id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ONLY om_visit_parameter
ADD CONSTRAINT om_visit_parameter_form_type_fkey FOREIGN KEY (form_type) REFERENCES om_visit_parameter_form_type(id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ONLY om_visit_parameter
ADD CONSTRAINT om_visit_parameter_parameter_type_fkey FOREIGN KEY (parameter_type) REFERENCES om_visit_parameter_type(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY om_visit_x_arc
ADD CONSTRAINT om_visit_x_arc_arc_id_fkey FOREIGN KEY (arc_id) REFERENCES arc(arc_id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ONLY om_visit_x_arc
ADD CONSTRAINT om_visit_x_arc_visit_id_fkey FOREIGN KEY (visit_id) REFERENCES om_visit(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY om_visit_x_node
ADD CONSTRAINT om_visit_x_node_node_id_fkey FOREIGN KEY (node_id) REFERENCES node(node_id) ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE ONLY om_visit_x_node
ADD CONSTRAINT om_visit_x_node_visit_id_fkey FOREIGN KEY (visit_id) REFERENCES om_visit(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY om_visit_file
ADD CONSTRAINT selector_workcat_filetype_fextension_fkey FOREIGN KEY (filetype, fextension) 
REFERENCES om_visit_filetype_x_extension(filetype, fextension) ON UPDATE CASCADE ON DELETE RESTRICT;

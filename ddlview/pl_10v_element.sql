	SET search_path = "SCHEMA_NAME", public, pg_catalog;

	CREATE OR REPLACE VIEW v_state_element AS 
	 SELECT element.element_id
	   FROM selector_state,
	    element
	  WHERE element.state_id = selector_state.state_id AND selector_state.cur_user = "current_user"()::text;


	DROP VIEW IF EXISTS ve_element CASCADE;
	CREATE VIEW ve_element AS SELECT
		element.element_id,
		code,
		elementcat_id,
		serial_number,
		state_id,
		state_type_id,
		num_elements,
		element.observ,
		comment,
		workcat_id,
		workcat_id_end,
		buildercat_id,
		element.builtdate,
		element.enddate,
		ownercat_id,
		rotation,
		--concat(element_type.link_path, element.link) AS link,
		element.link,
		element.the_geom,
		label_x,
		label_y,
		label_rotation,
		publish,
		inventory,
		element.undelete,
		element.expl_id
	FROM element
	JOIN v_state_element ON element.element_id=v_state_element.element_id
	JOIN cat_element ON element.elementcat_id = cat_element.id;


	drop view if exists v_ui_element_x_arc cascade; 
	CREATE OR REPLACE VIEW v_ui_element_x_arc AS
	SELECT
	element_x_arc.id,
	element_x_arc.arc_id,
	element_x_arc.element_id,
	cat_element.idval AS elementcat,
	cat_mat.idval as matcat,
	element.num_elements,
	element.state_id,
	element.state_type_id,
	element.observ,
	element.comment,
	element.builtdate,
	element.enddate,
	element.link,
	element.publish,
	element.inventory
	FROM element_x_arc
	JOIN element ON element.element_id=element_x_arc.element_id
	LEFT JOIN cat_element ON cat_element.id=element.elementcat_id
	LEFT JOIN cat_mat ON cat_mat.id = cat_element.matcat_id
	JOIN selector_state ON element.state_id=selector_state.state_id
	AND selector_state.cur_user = "current_user"()::text;


	drop view if exists v_ui_element_x_node cascade; 
	CREATE OR REPLACE VIEW v_ui_element_x_node AS
	SELECT
	element_x_node.id,
	element_x_node.node_id,
	element_x_node.element_id,
	cat_element.idval AS elementcat,
	cat_mat.idval as matcat,
	cat_element.descript,
	element.num_elements,
	element.state_id,
	element.state_type_id,
	element.observ,
	element.comment,
	element.builtdate,
	element.enddate,
	element.link,
	element.publish,
	element.inventory
	FROM element_x_node
	JOIN element ON element.element_id = element_x_node.element_id
	LEFT JOIN cat_element ON cat_element.id=element.elementcat_id
	LEFT JOIN cat_mat ON cat_mat.id = cat_element.matcat_id
	JOIN selector_state ON element.state_id=selector_state.state_id
	AND selector_state.cur_user = "current_user"()::text;


	drop view if exists v_ui_element cascade; 
	CREATE VIEW "v_ui_element" AS 
	SELECT 
	element.element_id as id,
	code,
	cat_element.idval AS elementcat,
	cat_mat.idval as matcat,
	serial_number,
	num_elements ,
    value_state.idval as state,
    value_state_type.idval as state_type,
	element.observ ,
	comment ,
	cat_work.idval as workcat,
    cat_work_end.idval as workcat_end,
	cat_builder.idval as buildercat,
	element.builtdate,
	element.enddate ,
	cat_owner.idval as ownercat,
	rotation ,
	element.link ,
	element.the_geom ,
	label_x ,
	label_y ,
	label_rotation ,
	element.undelete ,
	publish ,
	inventory ,
	exploitation.idval as expl,
	element.feature_type ,
	element.tstamp
	FROM element
	JOIN v_state_element ON element.element_id=v_state_element.element_id
     LEFT JOIN cat_element ON cat_element.id=element.elementcat_id
     LEFT JOIN cat_mat ON cat_mat.id = cat_element.matcat_id
     LEFT JOIN value_state ON value_state.id=element.state_id
     LEFT JOIN value_state_type ON value_state_type.id=element.state_type_id
     LEFT JOIN cat_builder ON cat_builder.id=element.buildercat_id
     LEFT JOIN cat_owner ON cat_owner.id=element.ownercat_id
     LEFT JOIN cat_work ON cat_work.id = workcat_id
     LEFT JOIN cat_work as cat_work_end ON cat_work_end.id = workcat_id_end
     LEFT JOIN exploitation ON exploitation.id=element.expl_id;




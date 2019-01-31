	SET search_path = "SCHEMA_NAME", public, pg_catalog;

	CREATE OR REPLACE VIEW v_state_element AS 
	 SELECT element.element_id
	   FROM selector_state,
	    element
	  WHERE element.state_id = selector_state.state_id AND selector_state.cur_user = "current_user"()::text;

	DROP VIEW IF EXISTS ve_element CASCADE;
	SET search_path = "pl_test", public, pg_catalog;


	DROP VIEW IF EXISTS ve_element CASCADE;
	CREATE VIEW ve_element AS SELECT
		element.element_id,
		code,
		elementcat_id,
		cat_element.elementtype_id,
		serial_number,
		state_id,
		state_type_id,
		num_elements,
		observ,
		comment,
		category_type_id,
		location_type_id,
		workcat_id,
		workcat_id_end,
		buildercat_id,
		builtdate,
		enddate,
		ownercat_id,
		rotation,
		concat(element_type.link_path, element.link) AS link,
		verified_id,
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
	JOIN cat_element ON element.element_id = cat_element.id
	LEFT JOIN element_type ON cat_element.elementtype_id=element_type.id;


	drop view if exists v_ui_element_x_arc cascade; 
	CREATE OR REPLACE VIEW v_ui_element_x_arc AS
	SELECT
	element_x_arc.id,
	element_x_arc.arc_id,
	element_x_arc.element_id,
	element.elementcat_id,
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
	FROM element_x_arc
	JOIN element ON element.element_id=element_x_arc.element_id
	LEFT JOIN cat_element ON cat_element.id=element.elementcat_id
	JOIN selector_state ON element.state_id=selector_state.state_id
	AND selector_state.cur_user = "current_user"()::text;


	drop view if exists v_ui_element_x_node cascade; 
	CREATE OR REPLACE VIEW v_ui_element_x_node AS
	SELECT
	element_x_node.id,
	element_x_node.node_id,
	element_x_node.element_id,
	element.elementcat_id,
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
	JOIN selector_state ON element.state_id=selector_state.state_id
	AND selector_state.cur_user = "current_user"()::text;


	drop view if exists v_ui_element cascade; 
	CREATE VIEW "v_ui_element" AS 
	SELECT 
	element_id as id,
	code,
	elementcat_id,
	serial_number,
	num_elements ,
	state,
	state_type,
	observ ,
	comment ,
	category_type_id ,
	location_type_id ,
	workcat_id ,
	workcat_id_end ,
	buildercat_id ,
	builtdate,
	enddate ,
	ownercat_id ,
	rotation ,
	link ,
	verified_id,
	the_geom ,
	label_x ,
	label_y ,
	label_rotation ,
	undelete ,
	publish ,
	inventory ,
	expl_id ,
	feature_type ,
	tstamp
	FROM element;


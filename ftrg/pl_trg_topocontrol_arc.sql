-- Function: SCHEMA_NAME.pl_trg_topocontrol_arc()

-- DROP FUNCTION SCHEMA_NAME.pl_trg_topocontrol_arc();

CREATE OR REPLACE FUNCTION SCHEMA_NAME.pl_trg_topocontrol_arc()
  RETURNS trigger AS
$BODY$
DECLARE 
    nodeRecord1 record; 
    nodeRecord2 record; 
    rec record;  
    vnoderec record;
    newPoint public.geometry;    
    connecPoint public.geometry;
    state_topocontrol_bool boolean;
    connec_id_aux varchar;
    array_agg varchar [];
	v_dsbl_error boolean;
	arc_searchnodes_aux numeric;
	samenode_init_end_control_aux boolean;
	arc_searchnodes_control_aux boolean;
	
BEGIN 

    EXECUTE 'SET search_path TO '||quote_literal(TG_TABLE_SCHEMA)||', public';
    
 -- Get data from config table

    SELECT value::numeric INTO arc_searchnodes_aux FROM config_param_system WHERE parameter='arc_searchnodes';
    SELECT value::boolean INTO arc_searchnodes_control_aux FROM config_param_system WHERE parameter='arc_searchnodes_control';
    SELECT value::boolean INTO samenode_init_end_control_aux FROM config_param_system WHERE parameter='samenode_init_end_control';
    SELECT value::boolean INTO state_topocontrol_bool FROM config_param_system WHERE parameter='state_topocontrol';
   	SELECT value::boolean INTO v_dsbl_error FROM config_param_system WHERE parameter='edit_topocontrol_dsbl_error' ;


    IF state_topocontrol_bool IS FALSE OR state_topocontrol_bool IS NULL THEN

		SELECT * INTO nodeRecord1 FROM node JOIN cat_node ON cat_node.id=nodecat_id
		JOIN cat_feature ON cat_feature.id = cat_node.cat_feature_id 
		WHERE ST_DWithin(ST_startpoint(NEW.the_geom), node.the_geom, arc_searchnodes_aux) AND topology_type=1
		ORDER BY ST_Distance(node.the_geom, ST_startpoint(NEW.the_geom)) LIMIT 1;

		SELECT * INTO nodeRecord2 FROM node JOIN cat_node ON cat_node.id=nodecat_id
		JOIN cat_feature ON cat_feature.id = cat_node.cat_feature_id 
		WHERE ST_DWithin(ST_endpoint(NEW.the_geom), node.the_geom, arc_searchnodes_aux) AND topology_type=1
		ORDER BY ST_Distance(node.the_geom, ST_endpoint(NEW.the_geom)) LIMIT 1;
   raise notice 'arc,1,2,%,%,%', NEW.arc_id, nodeRecord1,nodeRecord2;
    
    ELSIF state_topocontrol_bool IS TRUE THEN

	-- Looking for state control
	--PERFORM gw_fct_state_control('ARC', NEW.arc_id, NEW.state, TG_OP);

	-- Lookig for state=0
	IF NEW.state_id=0 THEN
		RETURN NEW;
        END IF;
	
	-- Starting process
	IF TG_OP='INSERT' THEN  

		SELECT * INTO nodeRecord1 FROM node JOIN cat_node ON cat_node.id=nodecat_id
			JOIN cat_feature ON cat_feature.id = cat_node.cat_feature_id 
			WHERE ST_DWithin(ST_startpoint(NEW.the_geom), node.the_geom, arc_searchnodes_aux) AND topology_type=1
			AND (NEW.state_id=1 AND node.state_id=1)
		ORDER BY ST_Distance(node.the_geom, ST_startpoint(NEW.the_geom)) LIMIT 1;

	
		SELECT * INTO nodeRecord2 FROM node JOIN cat_node ON cat_node.id=nodecat_id
			JOIN cat_feature ON cat_feature.id = cat_node.cat_feature_id 
			WHERE ST_DWithin(ST_endpoint(NEW.the_geom), node.the_geom, arc_searchnodes_aux) AND topology_type=1
			AND (NEW.state_id=1 AND node.state_id=1)
		ORDER BY ST_Distance(node.the_geom, ST_endpoint(NEW.the_geom)) LIMIT 1;

	ELSIF TG_OP='UPDATE' THEN


		SELECT * INTO nodeRecord1 FROM node JOIN cat_node ON cat_node.id=nodecat_id
			JOIN cat_feature ON cat_feature.id = cat_node.cat_feature_id 
			WHERE ST_DWithin(ST_startpoint(NEW.the_geom), node.the_geom, arc_searchnodes_aux) AND topology_type=1
			AND (NEW.state_id=1 AND node.state_id=1)
		ORDER BY ST_Distance(node.the_geom, ST_startpoint(NEW.the_geom)) LIMIT 1;

	
		SELECT * INTO nodeRecord2 FROM node JOIN cat_node ON cat_node.id=nodecat_id
			JOIN cat_feature ON cat_feature.id = cat_node.cat_feature_id 
			WHERE ST_DWithin(ST_endpoint(NEW.the_geom), node.the_geom, arc_searchnodes_aux) AND topology_type=1
			AND (NEW.state_id=1 AND node.state_id=1)
		ORDER BY ST_Distance(node.the_geom, ST_endpoint(NEW.the_geom)) LIMIT 1;

	END IF;

   END IF;

    -- Control of length line
		IF (nodeRecord1.node_id IS NOT NULL) AND (nodeRecord2.node_id IS NOT NULL) THEN
    
        -- Control of same node initial and final
			IF (nodeRecord1.node_id = nodeRecord2.node_id) AND (samenode_init_end_control_aux IS TRUE) THEN
				/*IF v_dsbl_error IS NOT TRUE THEN
					PERFORM audit_function (1040,1344, nodeRecord1.node_id);	
				ELSE
					INSERT INTO audit_log_data (fprocesscat_id, feature_id, log_message) VALUES (3, NEW.arc_id, 'Node_1 and Node_2 are the same');
				END IF;*/
				INSERT INTO audit_log_data (fprocesscat_id, feature_id, log_message) VALUES (3, NEW.arc_id, 'Node_1 and Node_2 are the same');
				
			ELSE
				-- Update coordinates
				NEW.the_geom:= ST_SetPoint(NEW.the_geom, 0, nodeRecord1.the_geom);
				NEW.the_geom:= ST_SetPoint(NEW.the_geom, ST_NumPoints(NEW.the_geom) - 1, nodeRecord2.the_geom);
				NEW.node_1:= nodeRecord1.node_id; 
				NEW.node_2:= nodeRecord2.node_id;

				
				RETURN NEW;
			END IF;

		
	--	Error, no existing nodes
		ELSIF ((nodeRecord1.node_id IS NULL) OR (nodeRecord2.node_id IS NULL)) AND (arc_searchnodes_control_aux IS TRUE) THEN
			/*IF v_dsbl_error IS NOT TRUE THEN
				PERFORM audit_function (1042,1344, nodeRecord1.node_id);	
			ELSE
				
			END IF;*/
			INSERT INTO audit_log_data (fprocesscat_id, feature_id, log_message) 
			VALUES (4, NEW.arc_id, 'Node_1 or Node_2 does not exists or does not has compatible state with arc');
		
	--	Not existing nodes but accepted insertion
		ELSIF ((nodeRecord1.node_id IS NULL) OR (nodeRecord2.node_id IS NULL)) AND (arc_searchnodes_control_aux IS FALSE) THEN
			RETURN NEW;
			
		ELSE	
			/*IF v_dsbl_error IS NOT TRUE THEN
				--PERFORM audit_function (1042,1344, nodeRecord1.node_id);	
			ELSE
				INSERT INTO audit_log_data (fprocesscat_id, feature_id, log_message) 
				VALUES (4, NEW.arc_id, 'Node_1 or Node_2 does not exists or does not has compatible state with arc');
			END IF;^*/
			INSERT INTO audit_log_data (fprocesscat_id, feature_id, log_message) 
			VALUES (4, NEW.arc_id, 'Node_1 or Node_2 does not exists or does not has compatible state with arc');
		END IF;
		
RETURN NEW;
		
END; 
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

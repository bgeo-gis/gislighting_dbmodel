-- Function: SCHEMA_NAME.pl_trg_edit_node()

-- DROP FUNCTION SCHEMA_NAME.pl_trg_edit_node();

CREATE OR REPLACE FUNCTION SCHEMA_NAME.pl_trg_edit_node()
  RETURNS trigger AS
$BODY$
DECLARE 
    inp_table varchar;
    v_sql varchar;
    v_sql2 varchar;
    node_id_seq int8;
	rec Record;
	code_autofill_bool boolean;
	rec_aux text;
	node_id_aux text;
	delete_aux text;
	tablename_aux varchar;
	count_aux integer;
	promixity_buffer_aux double precision;
	v_addfields record;
	v_customfeature integer;
	v_parameter_name text;
	v_new_value_param text;
	v_old_value_param text;
	v_feature_search_streetaxis double precision;


BEGIN

    EXECUTE 'SET search_path TO '||quote_literal(TG_TABLE_SCHEMA)||', public';
	v_customfeature = TG_ARGV[0];
		
	--Get data from config table
	promixity_buffer_aux = (SELECT "value" FROM config_param_system WHERE "parameter"='proximity_buffer');
	v_feature_search_streetaxis = (SELECT "value" FROM config_param_system WHERE "parameter"='feature_search_streetaxis');

-- INSERT

    -- Control insertions ID
	IF TG_OP = 'INSERT' THEN
	
		-- Node ID	
		IF (NEW.node_id IS NULL) THEN
			--PERFORM setval('urn_id_seq', gw_fct_urn(),true);
			NEW.node_id:= (SELECT nextval('urn_id_seq'));
		END IF;
	
		-- Node Catalog ID
		IF (NEW.nodecat_id IS NULL) THEN
			IF ((SELECT COUNT(*) FROM cat_node) = 0) THEN
				--RETURN audit_function(1006,1318);  
			ELSE IF ((SELECT COUNT(*) FROM cat_node WHERE cat_feature_id=v_customfeature) = 1 ) THEN
				NEW.nodecat_id = (SELECT id FROM cat_node WHERE cat_feature_id=v_customfeature);
			END IF;
			END IF;


				IF (NEW.nodecat_id IS NULL) THEN
				--	PERFORM audit_function(1090,1318);
				END IF;

		END IF;
        
	-- Dma ID
        IF (NEW.dma_id IS NULL) THEN
			IF ((SELECT COUNT(*) FROM dma) = 0) THEN
                --RETURN audit_function(1012,1318);  
                raise notice 'No dma';
            END IF;
				SELECT count(*)into count_aux FROM dma WHERE ST_DWithin(NEW.the_geom, dma.the_geom,0.001);
			IF count_aux = 1 THEN
				NEW.dma_id := (SELECT id FROM dma WHERE ST_DWithin(NEW.the_geom, dma.the_geom,0.001) LIMIT 1);
			ELSIF count_aux > 1 THEN
				NEW.dma_id =(SELECT dma_id FROM ve_node WHERE ST_DWithin(NEW.the_geom, ve_node.the_geom, promixity_buffer_aux) 
				order by ST_Distance (NEW.the_geom, ve_node.the_geom) LIMIT 1);
			END IF;
            IF (NEW.dma_id IS NULL) THEN
                --RETURN audit_function(1014,1318,NEW.node_id);  
                raise notice 'Choose dma';
            END IF;            
        END IF;
		
		-- Exploitation
			IF (NEW.expl_id IS NULL) THEN
				NEW.expl_id := (SELECT id FROM exploitation WHERE ST_DWithin(NEW.the_geom, exploitation.the_geom,0.001) LIMIT 1);
				IF (NEW.expl_id IS NULL) THEN
					--PERFORM audit_function(2012,1318,NEW.node_id);
					raise notice 'no exploitation';
				END IF;		
			END IF;

		--Municipality
			IF (NEW.muni_id IS NULL) THEN
				NEW.muni_id := (SELECT id FROM ext_municipality WHERE ST_DWithin(NEW.the_geom, ext_municipality.the_geom,0.001) LIMIT 1);
				IF (NEW.muni_id IS NULL) THEN
					--PERFORM audit_function(2024,1318,NEW.node_id);
					raise notice 'no municipality';
				END IF;	
			END IF;
		
		--Streetaxis
		IF (NEW.streetaxis_id IS NULL) THEN
			NEW.streetaxis_id :=(SELECT id FROM ext_streetaxis 
			WHERE ST_DWithin(NEW.the_geom, ext_streetaxis.the_geom,v_feature_search_streetaxis) LIMIT 1);
		END IF; 

			
		-- FEATURE INSERT      
		INSERT INTO node (node_id, code, nodecat_id, arc_id, parent_id, state_id, state_type_id, annotation, observ, dma_id, soilcat_id, 
			workcat_id, workcat_id_end,buildercat_id, builtdate, enddate, ownercat_id, muni_id, streetaxis_id, streetaxis2_id, postcode, 
			postnumber, postnumber2, postcomplement, postcomplement2, descript, rotation,undelete,label_x,
			label_y,label_rotation, expl_id, publish, the_geom) 
		VALUES (NEW.node_id, NEW.code,  NEW.nodecat_id, NEW.arc_id, NEW.parent_id, NEW.state_id, NEW.state_type_id, NEW.annotation, NEW.observ, 
		NEW.dma_id,NEW.soilcat_id, NEW.workcat_id, NEW.workcat_id_end, NEW.buildercat_id, NEW.builtdate, NEW.enddate, NEW.ownercat_id, 
		NEW.muni_id, NEW.streetaxis_id, NEW.streetaxis2_id, NEW.postcode,NEW.postnumber,NEW.postnumber2, NEW.postcomplement, NEW.postcomplement2, 
		NEW.descript,NEW.rotation, NEW.undelete,NEW.label_x,NEW.label_y,NEW.label_rotation, NEW.expl_id, NEW.publish, 
		NEW.the_geom);
		

		-- man addfields insert
		FOR v_addfields IN SELECT * FROM man_addfields_parameter WHERE cat_feature_id = v_customfeature
		LOOP
			EXECUTE 'SELECT $1.' || v_addfields.idval
				USING NEW
				INTO v_new_value_param;

			IF v_new_value_param IS NOT NULL THEN
				EXECUTE 'INSERT INTO man_addfields_value (feature_id, parameter_id, value_param) VALUES ($1, $2, $3)'
					USING NEW.node_id, v_addfields.id, v_new_value_param;
			END IF;	
		END LOOP;
		
	

        RETURN NEW;

	-- UPDATE
    ELSIF TG_OP = 'UPDATE' THEN

		-- State
		IF (NEW.state_id != OLD.state_id) THEN
			UPDATE node SET state_id=NEW.state_id WHERE node_id = OLD.node_id;
		END IF;
		
		-- State_type
		IF NEW.state_id=0 AND OLD.state_id=1 THEN
			IF (SELECT state FROM value_state_type WHERE id=NEW.state_type_id) != NEW.state_id THEN
				IF NEW.state_type IS NULL THEN
				NEW.state_type_id=(SELECT id from value_state_type WHERE state=0 LIMIT 1);
					IF NEW.state_type_id IS NULL THEN
						--RETURN audit_function(2110,1318);
						raise notice 'no new state_type';
					END IF;
				END IF;
			END IF;
		END IF;
        
		-- The geom
		IF (NEW.the_geom IS DISTINCT FROM OLD.the_geom) THEN
		
			--the_geom
			UPDATE node SET the_geom=NEW.the_geom WHERE node_id = OLD.node_id;
							
		END IF;
	
		--Label rotation
		IF (NEW.rotation != OLD.rotation) THEN
			   UPDATE node SET rotation=NEW.rotation WHERE node_id = OLD.node_id;
		END IF;	

		--Streetaxis
		IF (NEW.streetaxis_id IS NULL) THEN
			NEW.streetaxis_id :=(SELECT id FROM ext_streetaxis 
			WHERE ST_DWithin(NEW.the_geom, ext_streetaxis.the_geom,v_feature_search_streetaxis) LIMIT 1);
		END IF; 

		UPDATE node 
		SET code=NEW.code, nodecat_id=NEW.nodecat_id, arc_id=NEW.arc_id, parent_id=NEW.parent_id,
		state_type_id=NEW.state_type_id, annotation=NEW.annotation, "observ"=NEW."observ", dma_id=NEW.dma_id, soilcat_id=NEW.soilcat_id, 
		workcat_id=NEW.workcat_id, workcat_id_end=NEW.workcat_id_end, buildercat_id=NEW.buildercat_id,builtdate=NEW.builtdate, 
		enddate=NEW.enddate, ownercat_id=NEW.ownercat_id, muni_id=NEW.muni_id, streetaxis_id=NEW.streetaxis_id, 
		postcomplement=NEW.postcomplement, postcomplement2=NEW.postcomplement2, streetaxis2_id=NEW.streetaxis2_id, 
		postcode=NEW.postcode,postnumber=NEW.postnumber,postnumber2=NEW.postnumber2, descript=NEW.descript,
		undelete=NEW.undelete, label_x=NEW.label_x, label_y=NEW.label_y, 
		label_rotation=NEW.label_rotation, publish=NEW.publish, expl_id=NEW.expl_id
		WHERE node_id = OLD.node_id;
		

		-- man addfields update
		FOR v_addfields IN SELECT * FROM man_addfields_parameter WHERE cat_feature_id = v_customfeature
		LOOP
			EXECUTE 'SELECT $1.' || v_addfields.idval
				USING NEW
				INTO v_new_value_param;
 
			EXECUTE 'SELECT $1.' || v_addfields.idval
				USING OLD
				INTO v_old_value_param;
				
			
			IF v_new_value_param IS NOT NULL THEN 

				EXECUTE 'INSERT INTO man_addfields_value(feature_id, parameter_id, value_param) VALUES ($1, $2, $3) 
					ON CONFLICT (feature_id, parameter_id)
					DO UPDATE SET value_param=$3 WHERE man_addfields_value.feature_id=$1 AND man_addfields_value.parameter_id=$2'
					USING NEW.node_id, v_addfields.id, v_new_value_param;

			ELSIF v_new_value_param IS NULL AND v_old_value_param IS NOT NULL THEN

				EXECUTE 'DELETE FROM man_addfields_value WHERE feature_id=$1 AND parameter_id=$2'
					USING NEW.node_id, v_addfields.id;
			END IF;
		
		END LOOP;
            
		RETURN NEW;
    

	-- DELETE
    ELSIF TG_OP = 'DELETE' THEN

		--PERFORM gw_fct_check_delete(OLD.node_id, 'NODE');
	
			DELETE FROM node WHERE node_id = OLD.node_id;

		
        RETURN NULL;
   
    END IF;
    
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

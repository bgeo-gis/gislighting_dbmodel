-- Function: SCHEMA_NAME.pl_trg_edit_arc()

-- DROP FUNCTION SCHEMA_NAME.pl_trg_edit_arc();

CREATE OR REPLACE FUNCTION SCHEMA_NAME.pl_trg_edit_arc()
  RETURNS trigger AS
$BODY$
DECLARE 
    inp_table varchar;
    v_sql varchar;
    v_sql2 varchar;
    arc_id_seq int8;
	rec Record;
	code_autofill_bool boolean;
	rec_aux text;
	arc_id_aux text;
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
	
		-- arc ID	
		IF (NEW.arc_id IS NULL) THEN
			--PERFORM setval('urn_id_seq', gw_fct_urn(),true);
			NEW.arc_id:= (SELECT nextval('urn_id_seq'));
		END IF;
	
		-- arc Catalog ID
		IF (NEW.arccat_id IS NULL) THEN
			IF ((SELECT COUNT(*) FROM cat_arc) = 0) THEN
				--RETURN audit_function(1006,1318);  
			ELSE IF ((SELECT COUNT(*) FROM cat_arc WHERE cat_feature_id=v_customfeature) = 1 ) THEN
				NEW.arccat_id = (SELECT id FROM cat_arc WHERE cat_feature_id=v_customfeature);
			END IF;
			END IF;


				IF (NEW.arccat_id IS NULL) THEN
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
				NEW.dma_id =(SELECT dma_id FROM ve_arc WHERE ST_DWithin(NEW.the_geom, ve_arc.the_geom, promixity_buffer_aux) 
				order by ST_Distance (NEW.the_geom, ve_arc.the_geom) LIMIT 1);
			END IF;
            IF (NEW.dma_id IS NULL) THEN
                --RETURN audit_function(1014,1318,NEW.arc_id);  
                raise notice 'Choose dma';
            END IF;            
        END IF;
		
		-- Exploitation
			IF (NEW.expl_id IS NULL) THEN
				NEW.expl_id := (SELECT id FROM exploitation WHERE ST_DWithin(NEW.the_geom, exploitation.the_geom,0.001) LIMIT 1);
				IF (NEW.expl_id IS NULL) THEN
					--PERFORM audit_function(2012,1318,NEW.arc_id);
					raise notice 'no exploitation';
				END IF;		
			END IF;


			IF (NEW.muni_id IS NULL) THEN
				NEW.muni_id := (SELECT id FROM ext_municipality WHERE ST_DWithin(NEW.the_geom, ext_municipality.the_geom,0.001) LIMIT 1);
				IF (NEW.muni_id IS NULL) THEN
					--PERFORM audit_function(2024,1318,NEW.arc_id);
					raise notice 'no municipality';
				END IF;	
			END IF;
		
		--Streetaxis
		IF (NEW.streetaxis_id IS NULL) THEN
			NEW.streetaxis_id :=(SELECT id FROM ext_streetaxis 
			WHERE ST_DWithin(NEW.the_geom, ext_streetaxis.the_geom,v_feature_search_streetaxis) LIMIT 1);
		END IF; 

		-- FEATURE INSERT      
		INSERT INTO arc (arc_id, code, node_1,node_2, arccat_id, state_id, state_type_id, annotation, observ,custom_length,dma_id, soilcat_id,
			workcat_id, workcat_id_end, buildercat_id, builtdate,enddate, ownercat_id, muni_id, postcode, streetaxis_id, postnumber, postcomplement,
			streetaxis2_id,postnumber2, postcomplement2,descript,link,the_geom,undelete,label_x,label_y,label_rotation,  publish,
			expl_id,displace_style)
			VALUES (NEW.arc_id, NEW.code, null, null, NEW.arccat_id, NEW.state_id, NEW.state_type_id, NEW.annotation, NEW.observ, 
			NEW.custom_length,NEW.dma_id, NEW.soilcat_id,NEW.workcat_id, NEW.workcat_id_end, NEW.buildercat_id, NEW.builtdate,
			NEW.enddate, NEW.ownercat_id,NEW.muni_id, NEW.postcode, NEW.streetaxis_id,NEW.postnumber, NEW.postcomplement, 
			NEW.streetaxis2_id, NEW.postnumber2, NEW.postcomplement2, NEW.descript,NEW.link, NEW.the_geom,
			NEW.undelete,NEW.label_x,NEW.label_y,NEW.label_rotation, NEW.publish, NEW.expl_id,
			NEW.displace_style);
					


		-- man addfields insert
		FOR v_addfields IN SELECT * FROM man_addfields_parameter WHERE cat_feature_id = v_customfeature
		LOOP
			EXECUTE 'SELECT $1.' || v_addfields.idval
				USING NEW
				INTO v_new_value_param;

			IF v_new_value_param IS NOT NULL THEN
				EXECUTE 'INSERT INTO man_addfields_value (feature_id, parameter_id, value_param) VALUES ($1, $2, $3)'
					USING NEW.arc_id, v_addfields.id, v_new_value_param;
			END IF;	
		END LOOP;
		
	

        RETURN NEW;

	-- UPDATE
    ELSIF TG_OP = 'UPDATE' THEN

		-- State
		IF (NEW.state_id != OLD.state_id) THEN
			UPDATE arc SET state_id=NEW.state_id WHERE arc_id = OLD.arc_id;
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
			UPDATE arc SET the_geom=NEW.the_geom WHERE arc_id = OLD.arc_id;
							
		END IF;

		--Streetaxis
		IF (NEW.streetaxis_id IS NULL) THEN
			NEW.streetaxis_id :=(SELECT id FROM ext_streetaxis 
			WHERE ST_DWithin(NEW.the_geom, ext_streetaxis.the_geom,v_feature_search_streetaxis) LIMIT 1);
		END IF; 
		
		UPDATE arc
		SET code=NEW.code, arccat_id=NEW.arccat_id, state_type_id=NEW.state_type_id, annotation= NEW.annotation, "observ"=NEW.observ, 
		custom_length=NEW.custom_length, dma_id=NEW.dma_id, soilcat_id=NEW.soilcat_id, workcat_id=NEW.workcat_id, 
		workcat_id_end=NEW.workcat_id_end, buildercat_id=NEW.buildercat_id, builtdate=NEW.builtdate, enddate=NEW.enddate,
		ownercat_id=NEW.ownercat_id, muni_id=NEW.muni_id, streetaxis_id=NEW.streetaxis_id,streetaxis2_id=NEW.streetaxis2_id,postcode=NEW.postcode,
		postnumber=NEW.postnumber, postnumber2=NEW.postnumber2,descript=NEW.descript, undelete=NEW.undelete, 
		label_x=NEW.label_x, the_geom=NEW.the_geom, postcomplement=NEW.postcomplement, postcomplement2=NEW.postcomplement2,label_y=NEW.label_y,
		label_rotation=NEW.label_rotation, publish=NEW.publish, expl_id=NEW.expl_id,link=NEW.link,
		displace_style=NEW.displace_style
		WHERE arc_id=OLD.arc_id;

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
					USING NEW.arc_id, v_addfields.id, v_new_value_param;

			ELSIF v_new_value_param IS NULL AND v_old_value_param IS NOT NULL THEN

				EXECUTE 'DELETE FROM man_addfields_value WHERE feature_id=$1 AND parameter_id=$2'
					USING NEW.arc_id, v_addfields.id;
			END IF;
		
		END LOOP;
            
		RETURN NEW;
    

	-- DELETE
    ELSIF TG_OP = 'DELETE' THEN

		--PERFORM gw_fct_check_delete(OLD.arc_id, 'ARC');
	
			DELETE FROM arc WHERE arc_id = OLD.arc_id;

		
        RETURN NULL;
   
    END IF;
    
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

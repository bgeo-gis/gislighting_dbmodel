
  --Function allows to separate the lightpoints from the posts. One is moved into direction of the streetaxis, the second one is it's  mirror reflexion.
  --Values to fill in in config_param_user: node_search_streetaxis, light_separate_distance 
  
CREATE OR REPLACE FUNCTION SCHEMA_NAME.pl_fct_separate_lightpoints()
  RETURNS integer AS
$BODY$
DECLARE
	v_last_post_id integer;
	rec record;
	v_line geometry;
	v_point geometry;
	v_point_reflect geometry;
	v_street record;
	v_light_separate_distance numeric;
	v_count_light integer;
	v_node_search_streetaxis numeric;
	v_separate_fraction numeric;

BEGIN

	-- Search path
	SET search_path = "SCHEMA_NAME", public;

	delete from temp_table where fprocesscat_id=1 and cur_user=current_user;
	
	v_node_search_streetaxis = (SELECT value::numeric FROM config_param_user WHERE parameter='node_search_streetaxis' AND cur_user=current_user);
	v_light_separate_distance = (SELECT value::numeric FROM config_param_user WHERE parameter='light_separate_distance' AND cur_user=current_user);

	--update value of streetaxis_id of node
	update node set streetaxis_id=id from ext_streetaxis where streetaxis_id is null and st_dwithin(node.the_geom,ext_streetaxis.the_geom, v_node_search_streetaxis);
	
	--loop over duplicated nodes
	for rec IN SELECT DISTINCT t1.node_id as post_id,t2.node_id as light_id, t1.expl_id,t1.the_geom, t1.streetaxis_id
				FROM node AS t1 JOIN node AS t2 ON ST_Dwithin(t1.the_geom, t2.the_geom,(0.01)) 
				JOIN cat_node  t1_cat_node ON t1_cat_node.id = t1.nodecat_id
				JOIN cat_node t2_cat_node ON t2_cat_node.id = t2.nodecat_id
				JOIN cat_feature t1_cat_feature ON t1_cat_feature.id=t1_cat_node.cat_feature_id
				JOIN cat_feature t2_cat_feature ON t2_cat_feature.id=t2_cat_node.cat_feature_id
				WHERE t1.node_id != t2.node_id  AND t1_cat_feature.system_id='LAMPPOST' and t2_cat_feature.system_id='LIGHTPOINT' 
				AND t1.state_id = 1 and t2.state_id =1
				ORDER BY t1.node_id LOOP
				
		select * into v_street from ext_streetaxis where id=rec.streetaxis_id;

	--if node has assigned the streetaxis continue with the process of separating lights
	if rec.streetaxis_id is not null then
	--	if post has only one lightpoint (check if the last post has the same id and reset the count_light if not)
		if v_last_post_id != rec.post_id THEN

			v_count_light = 1;

			--find the shortest line between column and street, interpolate the location of a point over the line
				v_line = ST_ShortestLine(rec.the_geom,v_street.the_geom);
				v_separate_fraction = v_light_separate_distance / ST_Length(v_line);
				
				if v_separate_fraction > 0 and v_separate_fraction < 1 then
					v_point = ST_LineInterpolatePoint (v_line, v_separate_fraction);
					UPDATE node SET the_geom=v_point WHERE node_id=rec.light_id;
				else 
					INSERT INTO temp_table (feature_id, text_column, geom_point, fprocesscat_id) 
					VALUES (rec.post_id, 'Distance to streetaxis shorter than offset distance',rec.the_geom, 1);
				end if;
		ELSE
			--	if post has more than one lightpoint, the second is a mirror reflexion of the first light, the other ones are not managed by the function
			if v_count_light = 2 then
				v_point_reflect=ST_SetSrid(ST_MakePoint((2*St_x(rec.the_geom) - St_x(v_point)), (2*ST_y(rec.the_geom) - ST_y(v_point))),25831);
				UPDATE node SET the_geom=v_point_reflect WHERE node_id=rec.light_id;
			else 
				INSERT INTO temp_table (feature_id, text_column, geom_point, fprocesscat_id) 
				VALUES (rec.post_id, 'More than two lights located on the lightpost',rec.the_geom, 1);
			end if;
			--update count of existing lights
			v_count_light=v_count_light+1;
		END IF;
		--update the value of the last post in loop
		v_last_post_id = rec.post_id;
	else 
		INSERT INTO temp_table (feature_id, text_column, geom_point, fprocesscat_id) 
				VALUES (rec.post_id, 'Streetaxis_id is missing',rec.the_geom, 1);
	end if;
	end loop;

	return null;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION SCHEMA_NAME.pl_fct_separate_lightpoints()
  OWNER TO postgres;

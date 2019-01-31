
SET search_path = "SCHEMA_NAME", public, pg_catalog;

DROP VIEW IF EXISTS ve_dma CASCADE;
CREATE VIEW ve_dma AS SELECT
    id,
    idval,
    descript,
    the_geom,
    undelete,
    dma.expl_id
    FROM dma;

CREATE OR REPLACE VIEW v_state_arc AS 
 SELECT arc.arc_id
   FROM selector_state,
    arc
  WHERE arc.state_id = selector_state.state_id AND selector_state.cur_user = "current_user"()::text;

CREATE OR REPLACE VIEW v_state_node AS 
 SELECT node.node_id
   FROM selector_state,
    node
  WHERE node.state_id = selector_state.state_id AND selector_state.cur_user = "current_user"()::text;




DROP VIEW IF EXISTS ve_node cascade;
CREATE OR REPLACE VIEW ve_node AS 
SELECT 
node.node_id, 
code, 
nodecat_id, 
arc_id, 
parent_id, 
state_id, 
state_type_id, 
annotation, 
observ, 
dma_id, 
soilcat_id, 
category_type_id, 
location_type_id, 
workcat_id, 
workcat_id_end, 
buildercat_id, 
builtdate, 
enddate, 
ownercat_id, 
muni_id, 
postcode, 
streetaxis_id, 
postnumber, 
postcomplement, 
streetaxis2_id, 
postnumber2, 
postcomplement2, 
descript, 
link, 
verified_id, 
rotation, 
the_geom, 
undelete, 
label_x, 
label_y, 
label_rotation, 
publish, 
inventory, 
hemisphere, 
expl_id, 
feature_type, 
tstamp
  FROM node
  JOIN v_state_node ON v_state_node.node_id::text = node.node_id::text;

DROP VIEW IF EXISTS ve_arc cascade;
CREATE OR REPLACE VIEW ve_arc AS 
SELECT 
arc.arc_id, 
code, 
node_1, 
node_2, 
arccat_id, 
state_id, 
state_type_id, 
annotation, 
observ, 
sys_length, 
custom_length, 
dma_id, 
soilcat_id,
category_type_id, 
location_type_id, 
workcat_id, 
workcat_id_end, 
buildercat_id, 
builtdate, 
enddate, 
ownercat_id, 
muni_id, 
postcode,
streetaxis_id, 
postnumber, 
postcomplement, 
streetaxis2_id, 
postnumber2, 
postcomplement2, 
descript, 
link, 
verified_id, 
the_geom, 
undelete, 
label_x, 
label_y, 
label_rotation, 
displace_style,
publish, 
inventory, 
expl_id, 
feature_type, 
tstamp
  FROM arc
  JOIN v_state_arc ON v_state_arc.arc_id::text = arc.arc_id::text;

CREATE OR REPLACE VIEW SCHEMA_NAME.ve_node_quadre AS 
 SELECT ve_node.node_id,
    ve_node.code,
    ve_node.nodecat_id,
    ve_node.arc_id,
    ve_node.parent_id,
    ve_node.state_id,
    ve_node.state_type_id,
    ve_node.annotation,
    ve_node.observ,
    ve_node.dma_id,
    ve_node.soilcat_id,
    ve_node.category_type_id,
    ve_node.location_type_id,
    ve_node.workcat_id,
    ve_node.workcat_id_end,
    ve_node.buildercat_id,
    ve_node.builtdate,
    ve_node.enddate,
    ve_node.ownercat_id,
    ve_node.muni_id,
    ve_node.postcode,
    ve_node.streetaxis_id,
    ve_node.postnumber,
    ve_node.postcomplement,
    ve_node.streetaxis2_id,
    ve_node.postnumber2,
    ve_node.postcomplement2,
    ve_node.descript,
    ve_node.link,
    ve_node.verified_id,
    ve_node.rotation,
    ve_node.the_geom,
    ve_node.undelete,
    ve_node.label_x,
    ve_node.label_y,
    ve_node.label_rotation,
    ve_node.publish,
    ve_node.inventory,
    ve_node.hemisphere,
    ve_node.expl_id,
    a.line_number,
    a.power,
    a.light_number,
    a.data_legal,
    a.last_inspection,
    a.next_inspection,
    a.flow_regulator,
    a.active_flow_regulator,
    a.astro_clock_brand,
    a.astro_clock_model,
    a.auto_hour_change,
    a.hour_change_date,
    a.remote_management
   FROM SCHEMA_NAME.ve_node
     LEFT JOIN ( SELECT ct.feature_id,
            ct.line_number,
            ct.power,
            ct.light_number,
            ct.data_legal,
            ct.last_inspection,
            ct.next_inspection,
            ct.flow_regulator,
            ct.active_flow_regulator,
            ct.astro_clock_brand,
            ct.astro_clock_model,
            ct.auto_hour_change,
            ct.hour_change_date,
            ct.remote_management
           FROM public.crosstab('SELECT feature_id, parameter_id, value_param
                    FROM SCHEMA_NAME.man_addfields_value JOIN SCHEMA_NAME.man_addfields_parameter on man_addfields_parameter.id=parameter_id where cat_feature_id=1
                    ORDER  BY 1,2'::text, ' VALUES (''22''),(''23''),(''24''),(''25''),(''26''),(''27''),(''28''),(''29''),(''30''),(''31''),(''32'')
                    ,(''33''),(''34'')'::text) ct(feature_id character varying, line_number integer, power integer, 
                    light_number integer, data_legal date, last_inspection date, next_inspection date, flow_regulator boolean, 
                    active_flow_regulator boolean, astro_clock_brand text, astro_clock_model text, auto_hour_change boolean, hour_change_date date,remote_management text)) a ON a.feature_id::text = ve_node.node_id::text
     LEFT JOIN SCHEMA_NAME.cat_node ON ve_node.nodecat_id = cat_node.id WHERE cat_node.cat_feature_id::text = 1::text;


DROP VIEW IF EXISTS ve_node_arqueta;
CREATE OR REPLACE VIEW ve_node_arqueta AS 
  SELECT ve_node.node_id,
    ve_node.code,
    ve_node.nodecat_id,
    ve_node.arc_id,
    ve_node.parent_id,
    ve_node.state_id,
    ve_node.state_type_id,
    ve_node.annotation,
    ve_node.observ,
    ve_node.dma_id,
    ve_node.soilcat_id,
    ve_node.category_type_id,
    ve_node.location_type_id,
    ve_node.workcat_id,
    ve_node.workcat_id_end,
    ve_node.buildercat_id,
    ve_node.builtdate,
    ve_node.enddate,
    ve_node.ownercat_id,
    ve_node.muni_id,
    ve_node.postcode,
    ve_node.streetaxis_id,
    ve_node.postnumber,
    ve_node.postcomplement,
    ve_node.streetaxis2_id,
    ve_node.postnumber2,
    ve_node.postcomplement2,
    ve_node.descript,
    ve_node.link,
    ve_node.verified_id,
    ve_node.rotation,
    ve_node.the_geom,
    ve_node.undelete,
    ve_node.label_x,
    ve_node.label_y,
    ve_node.label_rotation,
    ve_node.publish,
    ve_node.inventory,
    ve_node.hemisphere,
    ve_node.expl_id,
    a.panelboard,
    a.line
    FROM SCHEMA_NAME.ve_node
    LEFT JOIN ( SELECT ct.feature_id,
            ct.panelboard,
            ct.line
           FROM public.crosstab('SELECT feature_id, parameter_id, value_param
                    FROM SCHEMA_NAME.man_addfields_value JOIN SCHEMA_NAME.man_addfields_parameter on man_addfields_parameter.id=parameter_id where cat_feature_id=2
                    ORDER  BY 1,2'::text, ' VALUES (''35''),(''36'')'::text) ct(feature_id character varying, panelboard text, line text)) a ON a.feature_id::text = ve_node.node_id::text
    LEFT JOIN SCHEMA_NAME.cat_node ON ve_node.nodecat_id = cat_node.id WHERE cat_node.cat_feature_id::text = 2::text;

DROP VIEW IF EXISTS ve_node_columna;
CREATE OR REPLACE VIEW ve_node_columna AS 
  SELECT ve_node.node_id,
    ve_node.code,
    ve_node.nodecat_id,
    ve_node.arc_id,
    ve_node.parent_id,
    ve_node.state_id,
    ve_node.state_type_id,
    ve_node.annotation,
    ve_node.observ,
    ve_node.dma_id,
    ve_node.soilcat_id,
    ve_node.category_type_id,
    ve_node.location_type_id,
    ve_node.workcat_id,
    ve_node.workcat_id_end,
    ve_node.buildercat_id,
    ve_node.builtdate,
    ve_node.enddate,
    ve_node.ownercat_id,
    ve_node.muni_id,
    ve_node.postcode,
    ve_node.streetaxis_id,
    ve_node.postnumber,
    ve_node.postcomplement,
    ve_node.streetaxis2_id,
    ve_node.postnumber2,
    ve_node.postcomplement2,
    ve_node.descript,
    ve_node.link,
    ve_node.verified_id,
    ve_node.rotation,
    ve_node.the_geom,
    ve_node.undelete,
    ve_node.label_x,
    ve_node.label_y,
    ve_node.label_rotation,
    ve_node.publish,
    ve_node.inventory,
    ve_node.hemisphere,
    ve_node.expl_id,
    a.panelboard,
    a.line,
    a.lamppost,
    a.light_number,
    a.model,
    a.color,
    a.anti_corrosion,
    a.height,
    a.distance_facade,
    a.distance_pavement,
    a.width_pavement
    FROM SCHEMA_NAME.ve_node
    LEFT JOIN ( SELECT ct.feature_id,
            ct.panelboard,
            ct.line,
            ct.lamppost,
            ct.light_number,
            ct.model,
            ct.color,
            ct.anti_corrosion,
            ct.height,
            ct.distance_facade,
            ct.distance_pavement,
            ct.width_pavement
           FROM public.crosstab('SELECT feature_id, parameter_id, value_param
                    FROM SCHEMA_NAME.man_addfields_value JOIN SCHEMA_NAME.man_addfields_parameter on man_addfields_parameter.id=parameter_id where cat_feature_id=3
                    ORDER  BY 1,2'::text, ' VALUES (''1''),(''2''),(''3''),(''4''),(''5''),(''6''),(''7''),(''8''),(''9''),(''10''),(''11'')'::text) 
                    ct(feature_id character varying, panelboard text, line text, lamppost text, light_number integer,model text, color text,
                    anti_corrosion text, height numeric, distance_facade numeric, distance_pavement numeric, width_pavement numeric)) a 
                    ON a.feature_id::text = ve_node.node_id::text
    LEFT JOIN SCHEMA_NAME.cat_node ON ve_node.nodecat_id = cat_node.id WHERE cat_node.cat_feature_id::text = 3::text;




DROP VIEW IF EXISTS ve_node_punto_luz;
CREATE OR REPLACE VIEW ve_node_punto_luz AS 
  SELECT ve_node.node_id,
    ve_node.code,
    ve_node.nodecat_id,
    ve_node.arc_id,
    ve_node.parent_id,
    ve_node.state_id,
    ve_node.state_type_id,
    ve_node.annotation,
    ve_node.observ,
    ve_node.dma_id,
    ve_node.soilcat_id,
    ve_node.category_type_id,
    ve_node.location_type_id,
    ve_node.workcat_id,
    ve_node.workcat_id_end,
    ve_node.buildercat_id,
    ve_node.builtdate,
    ve_node.enddate,
    ve_node.ownercat_id,
    ve_node.muni_id,
    ve_node.postcode,
    ve_node.streetaxis_id,
    ve_node.postnumber,
    ve_node.postcomplement,
    ve_node.streetaxis2_id,
    ve_node.postnumber2,
    ve_node.postcomplement2,
    ve_node.descript,
    ve_node.link,
    ve_node.verified_id,
    ve_node.rotation,
    ve_node.the_geom,
    ve_node.undelete,
    ve_node.label_x,
    ve_node.label_y,
    ve_node.label_rotation,
    ve_node.publish,
    ve_node.inventory,
    ve_node.hemisphere,
    ve_node.expl_id,
    a.panelboard,
    a.line,
    a.lamppost,
    a.light_number,
    a.power,
    a.light_code,
    a.light_type,
    a.light_form,
    a.color_temperature,
    a.ballast_code
    FROM SCHEMA_NAME.ve_node
    LEFT JOIN ( SELECT ct.feature_id,
            ct.panelboard,
            ct.line,
            ct.lamppost,
            ct.light_number,
            ct.power,
            ct.light_code,
            ct.light_type,
            ct.light_form,
            ct.color_temperature,
            ct.ballast_code
           FROM public.crosstab('SELECT feature_id, parameter_id, value_param
                    FROM SCHEMA_NAME.man_addfields_value JOIN SCHEMA_NAME.man_addfields_parameter on man_addfields_parameter.id=parameter_id where cat_feature_id=4
                    ORDER  BY 1,2'::text, ' VALUES (''12''),(''13''),(''14''),(''15''),(''16''),(''17''),(''18''),(''19''),(''20''),(''21'')'::text) 
                    ct(feature_id character varying, panelboard text, line text, lamppost text, light_number integer, power integer, light_code text,
                    light_type text, light_form text, color_temperature text, ballast_code text)) a 
                    ON a.feature_id::text = ve_node.node_id::text
    LEFT JOIN SCHEMA_NAME.cat_node ON ve_node.nodecat_id = cat_node.id WHERE cat_node.cat_feature_id::text = 4::text;

DROP VIEW IF EXISTS ve_arc_linia;
CREATE OR REPLACE VIEW ve_arc_linia AS 
SELECT 
ve_arc.arc_id, 
ve_arc.code, 
node_1, 
node_2, 
arccat_id, 
state_id, 
state_type_id, 
annotation, 
observ, 
sys_length,
custom_length, 
dma_id, 
soilcat_id, 
category_type_id, 
location_type_id, 
workcat_id, 
workcat_id_end, 
buildercat_id, 
builtdate, 
enddate, 
ownercat_id,
muni_id, 
postcode, 
streetaxis_id, 
postnumber, 
postcomplement, 
streetaxis2_id, 
postnumber2, 
postcomplement2, 
ve_arc.descript, 
ve_arc.link, 
verified_id, 
the_geom, 
undelete, 
label_x, 
label_y, 
label_rotation, 
displace_style, 
publish, 
inventory, 
expl_id,
a.panelboard,
a.line
    FROM SCHEMA_NAME.ve_arc
    LEFT JOIN ( SELECT ct.feature_id,
            ct.panelboard,
            ct.line
           FROM public.crosstab('SELECT feature_id, parameter_id, value_param
                    FROM SCHEMA_NAME.man_addfields_value JOIN SCHEMA_NAME.man_addfields_parameter on man_addfields_parameter.id=parameter_id where cat_feature_id=5
                    ORDER  BY 1,2'::text, ' VALUES (''37''),(''38'')'::text) ct(feature_id character varying, panelboard text, line text)) a 
                    ON a.feature_id::text = ve_arc.arc_id::text
    LEFT JOIN SCHEMA_NAME.cat_arc ON ve_arc.arccat_id = cat_arc.id WHERE cat_arc.cat_feature_id::text = 5::text;
SET search_path = "SCHEMA_NAME", public, pg_catalog;

CREATE OR REPLACE VIEW v_ui_node AS 
 SELECT node.node_id,
    node.code,
    cat_node.idval as nodecat,
    node.arc_id,
    node.parent_id,
    value_state.idval as state,
    value_state_type.idval as state_type,
    node.annotation,
    node.observ,
    dma.idval as dma,
    cat_soil.idval as soil,
    cat_location_type.idval as location_type,
    cat_category_type.idval as category_type,
    cat_work.idval as workcat,
    cat_work_end.idval as workcat_end,
    cat_builder.idval as buildercat,
    node.builtdate,
    node.enddate,
    cat_owner.idval as ownercat,
    ext_municipality.idval as muni,
    node.postcode,
    ext_streetaxis.idval as ext_streetaxis,
    ext_address.idval as postnumber,
    node.postcomplement,
    ext_streetaxis2.idval as ext_streetaxis2,
    ext_address2.idval as postnumber2,
    node.postcomplement2,
    node.descript,
    node.link,
    value_verified.idval as verified,
    node.rotation,
    node.the_geom,
    node.undelete,
    node.label_x,
    node.label_y,
    node.label_rotation,
    node.publish,
    node.inventory,
    node.hemisphere,
    exploitation.idval as expl,
    node.feature_type,
    node.tstamp
   FROM node
     JOIN v_state_node ON v_state_node.node_id::text = node.node_id::text
     LEFT JOIN cat_node ON cat_node.id=node.nodecat_id
     LEFT JOIN value_state ON value_state.id=node.state_id
     LEFT JOIN value_state_type ON value_state_type.id=node.state_type_id
     LEFT JOIN dma ON dma.id=node.dma_id
     LEFT JOIN cat_soil ON  cat_soil.id=node.soilcat_id
     LEFT JOIN cat_location_type ON  cat_location_type.id = node.location_type_id
     LEFT JOIN cat_category_type ON  cat_category_type.id=node.category_type_id
     LEFT JOIN cat_work ON cat_work.id = workcat_id
     LEFT JOIN cat_work as cat_work_end ON cat_work_end.id = workcat_id_end
     LEFT JOIN cat_builder ON cat_builder.id=node.buildercat_id
     LEFT JOIN cat_owner ON cat_owner.id=node.ownercat_id
     LEFT JOIN ext_municipality ON ext_municipality.id=node.muni_id
     LEFT JOIN ext_streetaxis ON ext_streetaxis.id=node.streetaxis_id
     LEFT JOIN ext_streetaxis AS ext_streetaxis2 ON ext_streetaxis2.id=node.streetaxis_id
     LEFT JOIN ext_address ON ext_address.id=node.postnumber
     LEFT JOIN ext_address as ext_address2 ON ext_address2.id=node.postnumber2
     LEFT JOIN value_verified ON value_verified.id=node.verified_id
     LEFT JOIN exploitation ON exploitation.id=node.expl_id;



CREATE OR REPLACE VIEW v_ui_arc AS 
 SELECT arc.arc_id,
    arc.code,
    node_1,
    node_2,
    cat_arc.idval as arccat,
    value_state.idval as state,
    value_state_type.idval as state_type,
    arc.annotation,
    arc.observ,
    sys_length,
    custom_length,
    dma.idval as dma,
    cat_soil.idval as soil,
    cat_location_type.idval as location_type,
    cat_category_type.idval as category_type,
    cat_work.idval as workcat,
    cat_work_end.idval as workcat_end,
    cat_builder.idval as buildercat,
    arc.builtdate,
    arc.enddate,
    cat_owner.idval as ownercat,
    ext_municipality.idval as muni,
    arc.postcode,
    ext_streetaxis.idval as ext_streetaxis,
    ext_address.idval as postnumber,
    arc.postcomplement,
    ext_streetaxis2.idval as ext_streetaxis2,
    ext_address2.idval as postnumber2,
    arc.postcomplement2,
    arc.descript,
    arc.link,
    value_verified.idval as verified,
    arc.the_geom,
    arc.undelete,
    arc.label_x,
    arc.label_y,
    arc.label_rotation,
    displace_style,
    arc.publish,
    arc.inventory,
    exploitation.idval as expl,
    arc.feature_type,
    arc.tstamp
   FROM arc
     JOIN v_state_arc ON v_state_arc.arc_id::text = arc.arc_id::text
     LEFT JOIN cat_arc ON cat_arc.id=arc.arccat_id
     LEFT JOIN value_state ON value_state.id=arc.state_id
     LEFT JOIN value_state_type ON value_state_type.id=arc.state_type_id
     LEFT JOIN dma ON dma.id=arc.dma_id
     LEFT JOIN cat_soil ON  cat_soil.id=arc.soilcat_id
     LEFT JOIN cat_location_type ON  cat_location_type.id = arc.location_type_id
     LEFT JOIN cat_category_type ON  cat_category_type.id=arc.category_type_id
     LEFT JOIN cat_work ON cat_work.id = workcat_id
     LEFT JOIN cat_work as cat_work_end ON cat_work_end.id = workcat_id_end
     LEFT JOIN cat_builder ON cat_builder.id=arc.buildercat_id
     LEFT JOIN cat_owner ON cat_owner.id=arc.ownercat_id
     LEFT JOIN ext_municipality ON ext_municipality.id=arc.muni_id
     LEFT JOIN ext_streetaxis ON ext_streetaxis.id=arc.streetaxis_id
     LEFT JOIN ext_streetaxis AS ext_streetaxis2 ON ext_streetaxis2.id=arc.streetaxis_id
     LEFT JOIN ext_address ON ext_address.id=arc.postnumber
     LEFT JOIN ext_address as ext_address2 ON ext_address2.id=arc.postnumber2
     LEFT JOIN value_verified ON value_verified.id=arc.verified_id
     LEFT JOIN exploitation ON exploitation.id=arc.expl_id;
     
     

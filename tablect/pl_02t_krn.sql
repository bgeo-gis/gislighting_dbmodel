

SET search_path = "SCHEMA_NAME", public, pg_catalog;

--DROP CONSTRAINT
--NODE/ARC/CONNEC
ALTER TABLE "node" DROP CONSTRAINT IF EXISTS "node_nodecat_id_fkey";
ALTER TABLE "node" DROP CONSTRAINT IF EXISTS "node_arc_id_fkey";
ALTER TABLE "node" DROP CONSTRAINT IF EXISTS "node_parent_id_fkey";
ALTER TABLE "node" DROP CONSTRAINT IF EXISTS "node_state_fkey";
ALTER TABLE "node" DROP CONSTRAINT IF EXISTS "node_state_type_fkey";
ALTER TABLE "node" DROP CONSTRAINT IF EXISTS "node_dma_id_fkey";
ALTER TABLE "node" DROP CONSTRAINT IF EXISTS "node_soilcat_id_fkey";
ALTER TABLE "node" DROP CONSTRAINT IF EXISTS "node_workcat_id_fkey";
ALTER TABLE "node" DROP CONSTRAINT IF EXISTS "node_workcat_id_end_fkey";
ALTER TABLE "node" DROP CONSTRAINT IF EXISTS "node_buildercat_id_fkey";
ALTER TABLE "node" DROP CONSTRAINT IF EXISTS "node_ownercat_id_fkey";
ALTER TABLE "node" DROP CONSTRAINT IF EXISTS "node_verified_fkey";
ALTER TABLE "node" DROP CONSTRAINT IF EXISTS "node_expl_fkey" ;
ALTER TABLE "node" DROP CONSTRAINT IF EXISTS "node_feature_type_fkey";
ALTER TABLE node DROP CONSTRAINT IF EXISTS  node_category_type_feature_type_fkey;
ALTER TABLE node DROP CONSTRAINT IF EXISTS  node_location_type_feature_type_fkey;




ALTER TABLE "arc" DROP CONSTRAINT IF EXISTS "arc_arccat_id_fkey";
ALTER TABLE "arc" DROP CONSTRAINT IF EXISTS "arc_node_1_fkey";
ALTER TABLE "arc" DROP CONSTRAINT IF EXISTS "arc_node_2_fkey";
ALTER TABLE "arc" DROP CONSTRAINT IF EXISTS "arc_state_fkey";
ALTER TABLE "arc" DROP CONSTRAINT IF EXISTS "arc_state_type_fkey";
ALTER TABLE "arc" DROP CONSTRAINT IF EXISTS "arc_dma_id_fkey";
ALTER TABLE "arc" DROP CONSTRAINT IF EXISTS "arc_soilcat_id_fkey";
ALTER TABLE "arc" DROP CONSTRAINT IF EXISTS "arc_workcat_id_fkey";
ALTER TABLE "arc" DROP CONSTRAINT IF EXISTS "arc_workcat_id_end_fkey";
ALTER TABLE "arc" DROP CONSTRAINT IF EXISTS "arc_buildercat_id_fkey";
ALTER TABLE "arc" DROP CONSTRAINT IF EXISTS "arc_ownercat_id_fkey";
ALTER TABLE "arc" DROP CONSTRAINT IF EXISTS "arc_verified_fkey";
ALTER TABLE "arc" DROP CONSTRAINT IF EXISTS "arc_expl_fkey" ;
ALTER TABLE "arc" DROP CONSTRAINT IF EXISTS "arc_feature_type_fkey";
ALTER TABLE arc DROP CONSTRAINT IF EXISTS  arc_category_type_feature_type_fkey;
ALTER TABLE arc DROP CONSTRAINT IF EXISTS  arc_location_type_feature_type_fkey;


--ADD CONSTRAINT
ALTER TABLE "node" ADD CONSTRAINT "node_nodecat_id_fkey" FOREIGN KEY ("nodecat_id") REFERENCES "cat_node" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "node" ADD CONSTRAINT "node_arc_id_fkey" FOREIGN KEY ("arc_id") REFERENCES "arc" ("arc_id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "node" ADD CONSTRAINT "node_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "node" ("node_id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "node" ADD CONSTRAINT "node_state_fkey" FOREIGN KEY ("state") REFERENCES "value_state" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "node" ADD CONSTRAINT "node_state_type_fkey" FOREIGN KEY ("state_type") REFERENCES "value_state_type" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "node" ADD CONSTRAINT "node_dma_id_fkey" FOREIGN KEY ("dma_id") REFERENCES "dma" ("dma_id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "node" ADD CONSTRAINT "node_soilcat_id_fkey" FOREIGN KEY ("soilcat_id") REFERENCES "cat_soil" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "node" ADD CONSTRAINT "node_workcat_id_fkey" FOREIGN KEY ("workcat_id") REFERENCES "cat_work" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "node" ADD CONSTRAINT "node_workcat_id_end_fkey" FOREIGN KEY ("workcat_id_end") REFERENCES "cat_work" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "node" ADD CONSTRAINT "node_buildercat_id_fkey" FOREIGN KEY ("buildercat_id") REFERENCES "cat_builder" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "node" ADD CONSTRAINT "node_ownercat_id_fkey" FOREIGN KEY ("ownercat_id") REFERENCES "cat_owner" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "node" ADD CONSTRAINT "node_verified_fkey" FOREIGN KEY ("verified") REFERENCES "value_verified" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "node" ADD CONSTRAINT "node_expl_fkey" FOREIGN KEY ("expl_id") REFERENCES "exploitation" ("expl_id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "node" ADD CONSTRAINT "node_feature_type_fkey" FOREIGN KEY ("feature_type") REFERENCES "sys_feature_type" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "node" ADD CONSTRAINT "node_category_type_feature_type_fkey" FOREIGN KEY ("category_type","feature_type") REFERENCES "man_type_category" ("category_type", "feature_type") ON DELETE RESTRICT ON UPDATE CASCADE; 
ALTER TABLE "node" ADD CONSTRAINT "node_location_type_feature_type_fkey" FOREIGN KEY ("location_type","feature_type") REFERENCES "man_type_location" ("location_type", "feature_type") ON DELETE RESTRICT ON UPDATE CASCADE; 


ALTER TABLE "arc" ADD CONSTRAINT "arc_node_1_fkey" FOREIGN KEY ("node_1") REFERENCES "node" ("node_id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "arc" ADD CONSTRAINT "arc_node_2_fkey" FOREIGN KEY ("node_2") REFERENCES "node" ("node_id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "arc" ADD CONSTRAINT "arc_arccat_id_fkey" FOREIGN KEY ("arccat_id") REFERENCES "cat_arc" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "arc" ADD CONSTRAINT "arc_state_fkey" FOREIGN KEY ("state") REFERENCES "value_state" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "arc" ADD CONSTRAINT "arc_state_type_fkey" FOREIGN KEY ("state_type") REFERENCES "value_state_type" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "arc" ADD CONSTRAINT "arc_dma_id_fkey" FOREIGN KEY ("dma_id") REFERENCES "dma" ("dma_id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "arc" ADD CONSTRAINT "arc_soilcat_id_fkey" FOREIGN KEY ("soilcat_id") REFERENCES "cat_soil" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "arc" ADD CONSTRAINT "arc_workcat_id_fkey" FOREIGN KEY ("workcat_id") REFERENCES "cat_work" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "arc" ADD CONSTRAINT "arc_workcat_id_end_fkey" FOREIGN KEY ("workcat_id_end") REFERENCES "cat_work" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "arc" ADD CONSTRAINT "arc_buildercat_id_fkey" FOREIGN KEY ("buildercat_id") REFERENCES "cat_builder" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "arc" ADD CONSTRAINT "arc_ownercat_id_fkey" FOREIGN KEY ("ownercat_id") REFERENCES "cat_owner" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "arc" ADD CONSTRAINT "arc_verified_fkey" FOREIGN KEY ("verified") REFERENCES "value_verified" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "arc" ADD CONSTRAINT "arc_expl_fkey" FOREIGN KEY ("expl_id") REFERENCES "exploitation" ("expl_id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "arc" ADD CONSTRAINT "arc_feature_type_fkey" FOREIGN KEY ("feature_type") REFERENCES "sys_feature_type" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "arc" ADD CONSTRAINT "arc_category_type_feature_type_fkey" FOREIGN KEY ("category_type","feature_type") REFERENCES "man_type_category" ("category_type", "feature_type") ON DELETE RESTRICT ON UPDATE CASCADE; 
ALTER TABLE "arc" ADD CONSTRAINT "arc_location_type_feature_type_fkey" FOREIGN KEY ("location_type","feature_type") REFERENCES "man_type_location" ("location_type", "feature_type") ON DELETE RESTRICT ON UPDATE CASCADE; 


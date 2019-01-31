/*
This file is part of Giswater 3
The program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This version of Giswater is provided by Giswater Association
*/

DROP TRIGGER IF EXISTS pl_trg_edit_dma ON "SCHEMA_NAME".ve_dma;
CREATE TRIGGER pl_trg_edit_dma INSTEAD OF INSERT OR DELETE OR UPDATE ON "SCHEMA_NAME".ve_dma 
FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME".pl_trg_edit_dma('dma');

DROP TRIGGER IF EXISTS pl_trg_edit_element ON "SCHEMA_NAME".ve_element;
CREATE TRIGGER pl_trg_edit_element INSTEAD OF INSERT OR DELETE OR UPDATE ON "SCHEMA_NAME".ve_element 
FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME".pl_trg_edit_element('element');

DROP TRIGGER IF EXISTS pl_trg_ui_element_x_node ON "SCHEMA_NAME".v_ui_element_x_node;
CREATE TRIGGER pl_trg_ui_element_x_node INSTEAD OF INSERT OR DELETE OR UPDATE ON "SCHEMA_NAME".v_ui_element_x_node
FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME".pl_trg_ui_element(element_x_node);

DROP TRIGGER IF EXISTS pl_trg_ui_element_x_arc ON "SCHEMA_NAME".v_ui_element_x_arc;
CREATE TRIGGER pl_trg_ui_element_x_arc INSTEAD OF INSERT OR DELETE OR UPDATE ON "SCHEMA_NAME".v_ui_element_x_arc
FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME".pl_trg_ui_element(element_x_arc);

DROP TRIGGER IF EXISTS pl_trg_ui_doc_x_node ON "SCHEMA_NAME".v_ui_doc_x_node;
CREATE TRIGGER pl_trg_ui_doc_x_node INSTEAD OF INSERT OR DELETE OR UPDATE ON "SCHEMA_NAME".v_ui_doc_x_node
FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME".pl_trg_ui_doc(doc_x_node);

DROP TRIGGER IF EXISTS pl_trg_ui_doc_x_arc ON "SCHEMA_NAME".v_ui_doc_x_arc;
CREATE TRIGGER pl_trg_ui_doc_x_arc INSTEAD OF INSERT OR DELETE OR UPDATE ON "SCHEMA_NAME".v_ui_doc_x_arc
FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME".pl_trg_ui_doc(doc_x_arc);

DROP TRIGGER IF EXISTS pl_trg_ui_doc_x_visit ON "SCHEMA_NAME".v_ui_doc_x_visit;
CREATE TRIGGER pl_trg_ui_doc_x_visit INSTEAD OF INSERT OR DELETE OR UPDATE ON "SCHEMA_NAME".v_ui_doc_x_visit
FOR EACH ROW EXECUTE PROCEDURE "SCHEMA_NAME".pl_trg_ui_doc(doc_x_visit);

DROP TRIGGER IF EXISTS pl_trg_topocontrol_arc ON "SCHEMA_NAME"."arc";
CREATE TRIGGER pl_trg_topocontrol_arc BEFORE INSERT OR UPDATE OF the_geom ON SCHEMA_NAME.arc
FOR EACH ROW  EXECUTE PROCEDURE SCHEMA_NAME.pl_trg_topocontrol_arc();

  
    

  create  table "instagrid"."public"."dim_production_plan__dbt_tmp"
  
  
    as
  
  (
    select week,pn,plan as productionplan
from 
 "instagrid"."public"."sg_production_plan" as prodplan
  );
  

  
    

  create  table "instagrid"."public"."sg_production_plan__dbt_tmp"
  
  
    as
  
  (
    with source as
(

    select * from  "instagrid"."public"."production_plan"
)

select 
week,
cast(lower(replace(pn,' ',''))  as varchar(50)) as pn,
cast(plan as integer) as productionplan

from source
  );
  
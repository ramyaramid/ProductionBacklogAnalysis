
  
    

  create  table "instagrid"."public"."obt__dbt_tmp"
  
  
    as
  
  (
    with final as
(
select date,p.plan as plan,m.plan as dailymanufactured,week,pn 
from "instagrid"."public"."sg_production_plan" as p
right join  "instagrid"."public"."dim_manufactured_units"  as m
on 
concat('W',EXTRACT(week from date) )= week 
and 
m.product_type=p.pn

)


select distinct date,plan as weeklyplanned,week,pn,plan/7 as dailyplanned,coalesce(dailymanufactured,0) as dailymanufactured
from final
  );
  
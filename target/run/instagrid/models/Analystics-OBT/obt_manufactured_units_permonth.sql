
  create view "instagrid"."public"."obt_manufactured_units_permonth__dbt_tmp"
    
    
  as (
    with manufactured_units as
(
select date,month_name,product_type,sum(cast(plan as integer)) over(partition by month_name,product_type) as monthly_manufactured_units
from "instagrid"."public"."dim_manufactured_units" as manufactured_units
),

cte as

(
select  distinct production_plan.month_name as month_name,date,product_type,coalesce(monthly_manufactured_units,0) as monthly_manufactured_units,
monthy_production_planned
from manufactured_units
right join
 "instagrid"."public"."dim_production_plan" as production_plan
 on
 production_plan.pn=manufactured_units.product_type
 and manufactured_units.month_name=production_plan.month_name
)

select distinct month_name,product_type,monthly_manufactured_units,monthy_production_planned
from cte
  );
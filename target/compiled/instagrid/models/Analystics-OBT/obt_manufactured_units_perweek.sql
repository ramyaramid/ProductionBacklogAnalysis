with manufactured_units as
(
select year_week,product_type,sum(cast(plan as integer)) as manufactured_units
from "instagrid"."public"."dim_manufactured_units" as manufactured_units
group by year_week,product_type

)

select production_plan.week,product_type,coalesce(manufactured_units,0) as manufactured_units ,plan as production_plan
,sum(manufactured_units) over(partition by product_type order by cast(replace(week,'W','') as integer)) as weekly_manufactured_runningtotal
from manufactured_units
right join
 "instagrid"."public"."dim_production_plan" as production_plan
 on production_plan.week=manufactured_units.year_week and 
 production_plan.pn=manufactured_units.product_type
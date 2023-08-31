with final as
(

select week,pn,plan,date,year_week,month_name,concat('product1-',product1) as product_type
from
"instagrid"."public"."dim_production_plan" as prodplan
 join
"instagrid"."public"."dim_manufactured_units" as manufactured_units
on manufactured_units.year_week=prodplan.week
union all
select week,pn,plan,date,year_week,month_name,concat('product2-',product2) as product_type
from
"instagrid"."public"."dim_production_plan" as prodplan
 join
"instagrid"."public"."dim_manufactured_units" as manufactured_units
on manufactured_units.year_week=prodplan.week
)

select week,pn,plan,date,year_week,month_name,

SPLIT_PART(product_type,'-',2) as plan

from final
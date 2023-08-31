select 
cast(date as date) as date,
year_week,
month_name,
cast(product_type as varchar(50)) as product_type,
cast(plan as integer) as plan 
from

"instagrid"."public"."dim_manufactured_units"
with final as
(

select
date,
concat('W',extract(week from date)) as year_week,
TO_CHAR(date, 'MON')  as month_name,
concat('product1-',product1) as product_type
 from
"instagrid"."public"."sg_manufactured_units" 

union all 
select
date,
concat('W',extract(week from date)) as year_week,
TO_CHAR(date, 'MON')  as month_name,
concat('product2-',product2) as product_type
 from
"instagrid"."public"."sg_manufactured_units" 
),

base as
(
select date,year_week,month_name,
SPLIT_PART(product_type,'-',1) as product_type,
cast(SPLIT_PART(product_type,'-',2) as integer) as plan

from final
)

select distinct date as date, year_week,product_type,plan
from base
with final as
(
select date,concat('product1-',sum(product1)) as product
from
"instagrid"."public"."dim_manufactured_units"
group by date
union all 
select date,concat('product2-',sum(product2)) as product
from
"instagrid"."public"."dim_manufactured_units"
group by date
)

select date,
SPLIT_PART(product,'-',1) as product_type,
SPLIT_PART(product,'-',2) as plan
from final

  
    

  create  table "instagrid"."public"."manufactured_final__dbt_tmp"
  
  
    as
  
  (
    with base as
(
select dimdate,product_type,plan from 
"instagrid"."public"."dim_date" as d
left join "instagrid"."public"."dim_manufactured_units"  as m 
on d.dimdate=m.date
),

first1 as
(

select dimdate, concat('W',extract('week' from dimdate)) as year_week,product_type,coalesce(plan,0) as manufacturedplan
 from base
 where product_type is not null
),

nullvalues as
(
    select dimdate, concat('W',extract('week' from dimdate)) as year_week,product_type,coalesce(plan,0) as manufacturedplan
 from base
 where product_type is null
),

products as
(
select distinct product_type from first1
where product_type is not null
),

decembervalues as
(
select dimdate,year_week,products.product_type as product_type , manufacturedplan from products 
cross join nullvalues 
),

final as
(
select * from first1
union all
select * from  decembervalues
)

select * from final
  );
  
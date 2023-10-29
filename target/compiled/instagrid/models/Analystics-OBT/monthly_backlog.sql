with monthlymanufactured as
(
select extract(month from dimdate) as month,product_type,sum(manufacturedplan) as monthlymanufactured from 
"instagrid"."public"."manufactured_final"
group by extract(month from dimdate),product_type
),

monthlyproduction as
(
select distinct week, extract(month from dimdate) as month, pn,productionplan from  "instagrid"."public"."sg_production_plan" as p
left join "instagrid"."public"."dim_date" as d on concat('W',extract(week from d.dimdate))=p.week

),

productionfinal as
(
select month,pn, sum(productionplan) as monthlyproductionplan
from monthlyproduction
group by month,pn
)

select productionfinal.month as month,product_type,monthlyproductionplan, monthlymanufactured from productionfinal
join monthlymanufactured on 
productionfinal.month=monthlymanufactured.month and productionfinal.pn=monthlymanufactured.product_type


{# select * from  {{ref('sg_production_plan')}} #}
with final as
(
select distinct week,date_trunc('week',dimdate) as dim_date, extract(month from dimdate) as month, pn,productionplan from  {{ref('sg_production_plan')}} as p
left join {{ref('dim_date')}} as d on concat('W',extract(week from d.dimdate))=p.week
),

trys as
(
select  distinct extract(week from dim_date),(extract(month from dim_date)) as month,pn,productionplan from final
)

select sum(productionplan) from trys
group by month 


  create view "instagrid"."public"."testprod__dbt_tmp"
    
    
  as (
    select full_date,plan,pn,monthy_production_planned
from
"instagrid"."public"."dim_production_plan" as prodplan
join "instagrid"."public"."dim_date" as dimdate
on prodplan.month_name=dimdate.month_name
  );
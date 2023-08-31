with source as
(

    select * from  "instagrid"."public"."production_plan"
)

select 

replace(week,'W','') as year_week,
cast(lower(replace(pn,' ',''))  as varchar(50)) as pn,
cast(plan as integer) as plan
from source
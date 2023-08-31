with source as
(

    select * from  {{source('instagrid','production_plan')}}
)

select 
week,
cast(lower(replace(pn,' ',''))  as varchar(50)) as pn,
cast(plan as integer) as productionplan

from source 



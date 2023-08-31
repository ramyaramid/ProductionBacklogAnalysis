with source as
(

    select * from  {{source('instagrid','manufactured_units')}}
)

select 
cast(date as Date) as date,

product1,
product2
from source
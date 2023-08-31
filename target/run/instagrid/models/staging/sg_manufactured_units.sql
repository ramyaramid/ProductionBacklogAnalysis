
  
    

  create  table "instagrid"."public"."sg_manufactured_units__dbt_tmp"
  
  
    as
  
  (
    with source as
(

    select * from  "instagrid"."public"."manufactured_units"
)

select 
cast(date as Date) as date,

product1,
product2
from source
  );
  
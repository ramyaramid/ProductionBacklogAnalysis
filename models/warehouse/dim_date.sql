with base as
(
  select
    *
  from
generate_series('2021-12-31', '2022-12-31', INTERVAL '1 day') as d

)


select cast(d as date) as dimdate from base


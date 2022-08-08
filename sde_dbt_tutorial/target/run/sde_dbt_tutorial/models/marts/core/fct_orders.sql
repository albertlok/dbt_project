

  create  table "dbt"."warehouse"."fct_orders__dbt_tmp"
  as (
    with orders as (
    select *
    from "dbt"."warehouse"."stg_eltool__orders"
)
select * from orders
  );
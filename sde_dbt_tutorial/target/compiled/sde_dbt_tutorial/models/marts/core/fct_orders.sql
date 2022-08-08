with orders as (
    select *
    from "dbt"."warehouse"."stg_eltool__orders"
)
select * from orders
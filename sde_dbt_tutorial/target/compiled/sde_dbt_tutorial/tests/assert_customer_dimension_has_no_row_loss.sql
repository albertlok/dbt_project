-- dim_customers must have the same number of rows as its staging counterpart
-- Therefore return records where this isn't true to make the test fail
select *
from (
        select dim_cust.customer_id
        from "dbt"."warehouse"."dim_customers" dim_cust
            left join "dbt"."warehouse"."stg_eltool__customers" stg_cust on dim_cust.customer_id = stg_cust.customer_id
        where stg_cust.customer_id is null
        UNION ALL
        select stg_cust.customer_id
        from "dbt"."warehouse"."stg_eltool__customers" stg_cust
            left join "dbt"."warehouse"."dim_customers" dim_cust on stg_cust.customer_id = dim_cust.customer_id
        where dim_cust.customer_id is null
    ) tmp
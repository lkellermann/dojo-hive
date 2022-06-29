drop table smallshop.cube_client_case;
create table smallshop.cube_client_case as
select a.client_id,
    sum(c.total_food) as total_food,
    sum(c.total_office) as total_office,
    sum(c.total_hygiene) as total_hygiene,
    b.order_year_month
from smallshop.client_orders a
    inner join (
        select client_id,
            max(cast(date_format(order_date, 'yyyyMM') as int)) as order_year_month
        from smallshop.client_orders
        group by client_id
    ) b on a.client_id = b.client_id
    left join smallshop.tmp_client_purchase_case c on a.order_id = c.order_id
group by a.client_id,
    b.order_year_month;
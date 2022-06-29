drop table smallshop.tmp_client_purchase_map;
create table smallshop.tmp_client_purchase_map as
select a.client_id,
    map(d.type, sum((c.quantity * d.unit_price))) as group_type_total_value,
    b.order_year_month
from smallshop.client_orders a
    inner join (
        select client_id,
            max(cast(date_format(order_date, 'yyyyMM') as int)) as order_year_month
        from smallshop.client_orders
        group by client_id
    ) b on a.client_id = b.client_id
    and cast(date_format(a.order_date, 'yyyyMM') as int) = b.order_year_month
    left join smallshop.order_items c on a.order_id = c.order_id
    left join smallshop.items d on c.item_id = d.item_id
group by a.client_id,
    d.type,
    b.order_year_month;
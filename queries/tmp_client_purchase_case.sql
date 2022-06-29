drop table smallshop.tmp_client_purchase_case;
create table smallshop.tmp_client_purchase_case as
select order_id,
    sum(
        case
            when type = 'Food' then total_price
            else 0
        end
    ) as total_food,
    sum(
        case
            when type = 'Office' then total_price
            else 0
        end
    ) as total_office,
    sum(
        case
            when type = 'Hygiene' then total_price
            else 0
        end
    ) as total_hygiene
from (
        select distinct a1.order_id,
            b1.type,
            (a1.quantity * b1.unit_price) as total_price
        from smallshop.order_items a1
            left join smallshop.items b1 on a1.item_id = b1.item_id
    ) a
group by a.order_id;
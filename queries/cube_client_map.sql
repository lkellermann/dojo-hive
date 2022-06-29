drop table smallshop.cube_client_map;
create table smallshop.cube_client_map as
select client_id,
    coalesce(
        collect_list(group_type_total_value ['Food']) [0],
        0
    ) as total_value_food,
    coalesce(
        collect_list(group_type_total_value ['Office']) [0],
        0
    ) as total_value_office,
    coalesce(
        collect_list(group_type_total_value ['Hygiene']) [0],
        0
    ) as total_value_hygiene,
    order_year_month
from smallshop.tmp_client_purchase_map
group by client_id,
    order_year_month;
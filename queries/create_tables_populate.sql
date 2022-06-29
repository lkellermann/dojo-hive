create database smallshop comment 'Database containing sales data of a smallshop.' with dbproperties ('department' = 'sales');
describe database extended smallshop;
-- Create tables:
create table if not exists smallshop.order_items(
    order_id bigint comment 'Order identifier.',
    item_id bigint comment 'Item identifier.',
    quantity smallint comment 'Quantity of specific item in the order.'
);
create table if not exists smallshop.items(
    item_id bigint comment 'Item identifier.',
    description string comment 'Item description.',
    type string comment 'Item type.',
    unit_price decimal(4, 2) comment 'Sales value per unit item.'
);
create table if not exists smallshop.client_orders(
    order_id bigint comment 'Order identifier.',
    client_id bigint comment 'Client identifier.',
    order_date date comment 'Order date.'
);
create table if not exists smallshop.cube_client(
    client_id bigint comment 'Client identifier.',
    total_value_food decimal(8, 2) comment 'Total order value of food items in a given month.',
    total_value_office decimal(8, 2) comment 'Total order value of office items in a given month.',
    total_value_hygiene decimal(8, 2) comment 'Total order value of hygiene items in a given month.'
) partitioned by (
    order_year_month int comment 'Year-month (yyyyMM) of order.'
);
-- Populate tables:
truncate table smallshop.order_items;
insert into table smallshop.order_items
values(0, 1, 12),
    (1, 1, 2),
    (1, 2, 1),
    (1, 3, 1),
    (1, 4, 4),
    (2, 5, 2),
    (2, 6, 100),
    (2, 1, 5),
    (3, 1, 5),
    (3, 5, 3),
    (3, 6, 200),
    (4, 1, 3),
    (4, 5, 2),
    (5, 3, 2),
    (5, 6, 150),
    (5, 5, 10),
    (6, 5, 2);
truncate table smallshop.items;
insert into table smallshop.items
values (1, 'Soap', 'Hygiene', 1),
    (2, 'Bread', 'Food', 2),
    (3, 'Lettuce', 'Food', 0.5),
    (4, 'Toothpaste', 'Hygiene', 3),
    (5, 'Pen', 'Office', 1.25),
    (6, 'Paper', 'Office', 0.1);
truncate table smallshop.client_orders;
insert into smallshop.client_orders
values (0, 4, '2022-01-11'),
    (1, 4, '2022-02-01'),
    (2, 5, '2022-02-02'),
    (3, 1, '2022-02-05'),
    (4, 2, '2022-02-03'),
    (5, 2, '2022-02-04'),
    (6, 1, '2022-02-04');
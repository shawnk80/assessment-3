drop table if exists customers cascade;
drop table if exists products cascade;
drop table if exists categories cascade;
drop table if exists orders cascade;
drop table if exists addresses cascade;

-- Every row in customer table is assigned a primary key in serial order, addresses are 
-- stored in the address table and referenced by address_id
create table customers (
    id serial primary key,
    first_name varchar(64) NOT NULL,
    last_name varchar(64) NOT NULL,
    email varchar(64) NOT NULL,
    phone varchar(10) NOT NULL,
    address_id int
);

-- Every row in products table is assigned a primary key in serial order
-- Products have categories that are referenced by category id
create table products (
    id serial primary key,
    name varchar(64) NOT NULL,
    cost decimal NOT NULL,
    category_id int, 
    quantity int NOT NULL default 0
);

-- Every row in categories table is assigned a primary key in serial order
create table categories(
    id serial primary key,
    category_name varchar(64) NOT NULL
);


-- Every row in orders table is assigned a primary key in serial order
-- orders is a join table with many to many relationships with both the
-- products table and customers table.
create table orders (
    id serial primary key,
    product_id int,
    product_quantity int NOT NULL,
    customer_id int
);

-- Every row in addresses table is assigned a primary key in serial order
create table addresses (
    id serial primary key,
    line1 varchar(64) NOT NULL,
    line2 varchar(64),
    city varchar(32) NOT NULL,
    state varchar(2) NOT NULL,
    zip varchar(9) NOT NULL
);

-- Establish foreign key relationships between 
-- customers/addresses
-- products/categories 
-- orders/products 
-- orders/customers

alter table customers
add constraint fk_customers_addresses_id
foreign key (address_id) references addresses(id);

alter table products
add constraint fk_products_categories_id
foreign key (category_id) references categories(id);

alter table orders
add constraint fk_orders_products_id
foreign key (product_id) references products(id);

alter table orders
add constraint fk_orders_customers_id
foreign key (customer_id) references customers(id);

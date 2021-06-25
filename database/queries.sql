-- - SQL containing queries to extract the following data from your database tables:
--   1. Retrieve the first name, last name, and email address of all customers that have a Gmail email address.
\o query_results.txt

select first_name, last_name, email 
from customers
where email ilike '%gmail.com';


--   2. Retrieve the address of the customers and the order IDs for all orders that were placed in 2020

select line1, line2, city, state, zipcode, orders.id
from orders
join customers 
on orders.customer_id = customers.id
join addresses
on customers.address_id = addresses.id
where order_date > '2019-12-31'::date and order_date < '2021-01-01'::date;

--   3. Retrieve all product details for products that are under the "Kitchen" category

select products.id, name, cost, quantity, category_id
from products
join categories
on products.category_id = categories.id
where category_name='Kitchen';

--   4. Retrieve the product names and prices of all products ordered by the customer with first name "Bugs" and last name "Bunny"

select products.name, products.cost
from products
join orders
on products.id = orders.product_id
join customers
on orders.customer_id = customers.id
where first_name = 'Bugs' and last_name='Bunny';

\o
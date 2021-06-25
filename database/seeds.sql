
INSERT INTO addresses (line1, city, state, zipcode) VALUES ('6232 Guiseppe Courts', 'Jamartown', 'MD', '49028');
INSERT INTO addresses (line1, city, state, zipcode) VALUES ('704 Cecil Mountain', 'West Jon', 'SD', '91578');
INSERT INTO addresses (line1, city, state, zipcode) VALUES ('41613 Huel Ranch', 'Loycefort', 'FL', '12109');
INSERT INTO addresses (line1, city, state, zipcode) VALUES ('1397 Braden Shoals', 'New Karine', 'NY', '03913');
INSERT INTO addresses (line1, city, state, zipcode) VALUES ('603 Signer', 'Honolulu', 'HI', '96818');
INSERT INTO addresses (line1, city, state, zipcode) VALUES ('205 Proteus', 'Groton', 'CT', '06340');
INSERT INTO addresses (line1, city, state, zipcode) VALUES ('105 The Strand', 'St Marys', 'GA', '31558');
INSERT INTO addresses (line1, city, state, zipcode) VALUES ('3189 Tallmon', 'Marina', 'CA', '93933');

INSERT INTO categories (category_name) VALUES ('Home');
INSERT INTO categories (category_name) VALUES ('Outdoors');
INSERT INTO categories (category_name) VALUES ('Kitchen');
INSERT INTO categories (category_name) VALUES ('Bedroom');
INSERT INTO categories (category_name) VALUES ('Clothes');
INSERT INTO categories (category_name) VALUES ('Books');
INSERT INTO categories (category_name) VALUES ('Electronics');

INSERT INTO products (name, cost, category_id, quantity) VALUES 
('Chair', 45,(SELECT id from categories WHERE category_name='Home'), 17),
('Sofa', 6,(SELECT id from categories WHERE category_name='Home'), 4),
('Leaf Blower', 100,(SELECT id from categories WHERE category_name='Outdoors'), 10),
('Lawn Mower', 375,(SELECT id from categories WHERE category_name='Outdoors'), 7),
('Chef Knife', 30,(SELECT id from categories WHERE category_name='Kitchen'), 55),
('Dish Soap', 3,(SELECT id from categories WHERE category_name='Kitchen'), 197),
('Sheet Set', 87,(SELECT id from categories WHERE category_name='Bedroom'), 32),
('Pillow', 22,(SELECT id from categories WHERE category_name='Bedroom'), 23),
('T-Shirt', 42,(SELECT id from categories WHERE category_name='Clothes'), 117),
('Pants', 78,(SELECT id from categories WHERE category_name='Clothes'), 99),
('The Great Gatsby', 15,(SELECT id from categories WHERE category_name='Books'), 37),
('To Kill A Mockingbird', 12,(SELECT id from categories WHERE category_name='Books'), 44),
('TV', 275,(SELECT id from categories WHERE category_name='Electronics'), 17),
('Playstation', 350,(SELECT id from categories WHERE category_name='Electronics'), 42);

INSERT into customers (first_name, last_name, email, phone, address_id) VALUES
('Tianna', 'Lowe', 'tianna_lowe@yahoo.com', '8002738255', (SELECT id from addresses where city='Marina')),
('Elda', 'Snipes', 'snipe02@hotmail.com', '2018675309', (SELECT id from addresses where city='Loycefort')),
('Blue', 'Dolphin', 'subguy07@gmail.com', '8604876289', (SELECT id from addresses where city='Groton')),
('Justin', 'Verlander', 'cyyoungwinner@outlook.com', '2818675309', (SELECT id from addresses where city='New Karine')),
('Kate', 'Upton', 'supermodel@gmail.com', '2818675309', (SELECT id from addresses where city='New Karine')),
('Carlos', 'Correa', 'shortstopROY@astros.com', '2815550987', (SELECT id from addresses where city='Jamartown')),
('Duke', 'Kahanamoku', 'og_surfer@yahoo.com', '8088675309', (SELECT id from addresses where city='Honolulu'));

INSERT into orders (product_id, product_quantity, customer_id) VALUES
((SELECT id from products where name='Playstation'), 1, (SELECT id from customers where last_name='Dolphin')),
((SELECT id from products where name='TV'), 2, (SELECT id from customers where last_name='Dolphin')),
((SELECT id from products where name='Sofa'), 2, (SELECT id from customers where last_name='Dolphin')),
((SELECT id from products where name='Leaf Blower'), 1, (SELECT id from customers where last_name='Kahanamoku')),
((SELECT id from products where name='Lawn Mower'), 1, (SELECT id from customers where last_name='Kahanamoku')),
((SELECT id from products where name='The Great Gatsby'), 5, (SELECT id from customers where last_name='Lowe'));




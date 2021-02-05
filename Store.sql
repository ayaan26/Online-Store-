/* Ayaan Abdirizak */


/*SELECT * FROM "CUST_ADDRESSES";
SELECT * FROM "LINE_ITEMS";
SELECT * FROM "PRODUCTS";
SELECT * FROM "PROMOTIONS";
SELECT * FROM "CUSTOMERS";
SELECT * FROM "ORDERS";
SELECT * FROM "EMPLOYEES";
SELECT * FROM "DEPARTMENTS";*/

/*DROP TABLE "EMPLOYEES" CASCADE CONSTRAINTS;
DROP TABLE "CUSTOMERS" CASCADE CONSTRAINTS;
DROP TABLE "CUST_ADDRESSES" CASCADE CONSTRAINTS;
DROP TABLE "ORDERS" CASCADE CONSTRAINTS;
DROP TABLE "DEPARTMENTS" CASCADE CONSTRAINTS;
DROP TABLE "PROMOTIONS" CASCADE CONSTRAINTS;
DROP TABLE "PRODUCTS" CASCADE CONSTRAINTS;
DROP TABLE "LINE_ITEMS" CASCADE CONSTRAINTS;*/

/* Departments */
CREATE TABLE departments(
    department_id INTEGER PRIMARY KEY,
    department_name VARCHAR(25) NOT NULL,
    department_location CHAR(30),
    job_desc VARCHAR(100) NOT NULL
);

INSERT INTO departments(department_id, department_name, department_location, job_desc)
    VALUES(1, 'Head Office', 'Toronto, ON', 'managing the overall operations and resources of the company');
INSERT INTO departments(department_id, department_name, department_location, job_desc)
    VALUES(2, 'Sales', 'Toronto, ON', 'Activities related to selling or the number of goods sold in a given targeted time period');
INSERT INTO departments(department_id, department_name, department_location, job_desc)
    VALUES(3, 'Marketing', 'Toronto, ON', 'Promoting products and widening company reach');
INSERT INTO departments(department_id, department_name, department_location, job_desc)
    VALUES(4, 'Manufacturing', 'Kingston, ON',' production of products for use or sale');
INSERT INTO departments(department_id, department_name, department_location, job_desc)
    VALUES(5, 'Finance', 'Toronto, ON','Matters regarding the management, creation, and study of money and investments');
INSERT INTO departments(department_id, department_name, department_location, job_desc)
    VALUES(6, 'Software Development', 'Mississauga, ON', 'Planning and exectuing technical projects');
INSERT INTO departments(department_id, department_name, department_location, job_desc)
    VALUES(7, 'Customer Service', 'Toronto, ON', 'Ensuring customers tickets are resolved and customers are satisfied');
INSERT INTO departments(department_id, department_name, department_location, job_desc)
    VALUES(8, 'Fulfillment', 'Brampton, ON', 'Ensuring orders are completed in streamlined manner');

SELECT * FROM departments
WHERE department_id=8;

/* The following query displays the departments located in Toronto, ON.
They are ordered alphabetically by department name. */
SELECT department_name
FROM departments
WHERE department_location = 'Toronto, ON'
ORDER BY department_name;


/* Employees */
CREATE TABLE employees(
    department_id INTEGER,
    employee_id INTEGER PRIMARY KEY,
    employee_name VARCHAR(30) NOT NULL,
    employee_phone VARCHAR(12),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

drop table departments;
drop table employees;
drop table orders;
drop table products;
drop table promotions;
drop table line_items;
drop table customers;
drop table cust_addresses;

INSERT INTO employees (employee_id,employee_name,employee_phone,department_id)
    VALUES (101, 'khirad asaria', 6476532134,8);
INSERT INTO employees (employee_id,employee_name,employee_phone, department_id)
    VALUES (102, 'lucas smith', 6476719841,8);
INSERT INTO employees (employee_id,employee_name,employee_phone, department_id)
    VALUES (103, 'leslie murphy', 6471237683,4);
INSERT INTO employees (employee_id,employee_name,employee_phone, department_id)
    VALUES (104, 'steven kim', 6478943468, 7);
INSERT INTO employees (employee_id,employee_name,employee_phone, department_id)
    VALUES (105, 'alexandra watson', 6476832956, 7);
INSERT INTO employees (employee_id,employee_name,employee_phone, department_id)
    VALUES (106, 'megan lowe', 9054432121, 1);
INSERT INTO employees (employee_id,employee_name,employee_phone, department_id)
    VALUES (107, 'sacha stewarts', 4167673211, 1);
INSERT INTO employees (employee_id,employee_name,employee_phone, department_id)
    VALUES (108, 'rob lu', 9053218821, 1);
INSERT INTO employees (employee_id,employee_name,employee_phone, department_id)
    VALUES (109, 'kristoff rue', 4167673222, 1);
INSERT INTO employees (employee_id,employee_name,employee_phone, department_id)
    VALUES (110, 'kurtis mcfee', 9056678989, 1);
    
SELECT * FROM employees;

/* Selecting all employees who are in Head Office. These individuals are integral
to decision making within our company. */



create view v_headoffice
as
SELECT employee_id,employee_name,employee_phone,job_desc,department_name
FROM employees e,departments d
WHERE e.department_id=d.department_id AND d.department_id=1 /*all headoffice employees have id=1*/
ORDER BY e.job_desc; 


   CREATE VIEW customerAddresses AS
    SELECT customers.customer_name,cust_addresses.street,cust_addresses.city, cust_addresses.postal_code
        FROM customers, cust_addresses
        WHERE customers.customer_id=cust_addresses.customer_id
        ORDER BY customers.customer_name;

/* View to see all product names, ids, quantity in order 4. */
CREATE VIEW order4_cart AS(
	SELECT products.product_id, products.product_name, line_items.quantity
	FROM products, line_items
	WHERE products.product_id=line_items.product_id
    	AND order_id = 4
);

/* Get all products in order 4 using order4_cart view. */
SELECT * FROM order4_cart;



DROP TABLE employees;
DROP TABLE departments;

/* select all employees */
SELECT *
FROM employees;
/* The following query selects employees who work in customer service and returns their name. */
SELECT employee_name
FROM employees
WHERE job_desc = 'customer service'
ORDER BY employee_name ASC;


/* Customers */
CREATE TABLE customers(
    customer_id INTEGER PRIMARY KEY,
    customer_name VARCHAR(30) NOT NULL,
    customer_email VARCHAR(320) NOT NULL,
    customer_phone VARCHAR(12) NOT NULL
);

INSERT INTO customers (customer_id,customer_name,customer_email,customer_phone)
    VALUES (900, 'miranda jackson', 'miranda.jackson@ryerson.ca',9055239393);
INSERT INTO customers (customer_id,customer_name,customer_email,customer_phone)
    VALUES (901, 'stacey kerr', 'stacey.kerr@gmail.ca',9054343311);
INSERT INTO customers (customer_id,customer_name,customer_email,customer_phone)
    VALUES (902, 'jeff stewart', 'jeff.steward@ryerson.ca',6475239393);
INSERT INTO customers (customer_id,customer_name,customer_email,customer_phone)
    VALUES (903, 'aryan lue', 'alue@hotmail.ca',4165239393);
INSERT INTO customers (customer_id,customer_name,customer_email,customer_phone)
    VALUES (904, 'nick phillips', 'nick.phillips@ryerson.ca',6471233214);
INSERT INTO customers (customer_id,customer_name,customer_email,customer_phone)
    VALUES (905, 'teheem abdul', 'tabdul@hotmail.ca',9056611726);
INSERT INTO customers (customer_id,customer_name,customer_email,customer_phone)
    VALUES (906, 'nixon le', 'nixon.le@gmail.ca',4162330010);
INSERT INTO customers (customer_id,customer_name,customer_email,customer_phone)
    VALUES (907, 'teresa ricardo', 'tricardo@ryerson.ca',4165542716);
INSERT INTO customers (customer_id,customer_name,customer_email,customer_phone)
    VALUES (908, 'ally gater', 'allyg123@yahoo.com',4167519203);
    
/* The following query organizes the customers names in alphabetical order. */
SELECT * FROM customers
ORDER BY customer_name ASC;


/* Customer Addresses */
CREATE TABLE cust_addresses(
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    street VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    province VARCHAR(10) NOT NULL,
    postal_code VARCHAR(10) NOT NULL
);

INSERT INTO cust_addresses (customer_id,street, city, province, postal_code)
    VALUES (900, '54 Fake Street', 'Vaughan', 'ON', 'MGR 345');
INSERT INTO cust_addresses (customer_id,street, city, province, postal_code)
    VALUES (901, '22 Valley Road', 'Brampton', 'ON', 'L6B 3C5');
INSERT INTO cust_addresses (customer_id,street, city, province, postal_code)
    VALUES (903, '54 Sunrise Circle', 'Ajax', 'ON', 'N3Z 3D5');
INSERT INTO cust_addresses (customer_id,street, city, province, postal_code)
    VALUES (904, '54 Dusk Circle', 'Brampton', 'ON', 'N3Z 3D5');
INSERT INTO cust_addresses (customer_id,street, city, province, postal_code)
    VALUES (905, '54 Twilight Road', 'Brampton', 'ON', 'N3Z 3D7');
INSERT INTO cust_addresses (customer_id,street, city, province, postal_code)
    VALUES (906, '54 Treasure Street', 'North York', 'ON', 'T3G 1A5');
INSERT INTO cust_addresses (customer_id,street, city, province, postal_code)
    VALUES (907, '54 Mable Court', 'Brampton', 'ON', 'V3N 8D5');
INSERT INTO cust_addresses (customer_id,street, city, province, postal_code)
    VALUES (908, '54 Festival Drive', 'Vaughan', 'ON', 'M8V 2P7');

/* The following query returns the names of the customers referenced from the
customer table living in the city of brampton referenced from the
cust_addresses table. */
SELECT customer_name
FROM customers
WHERE customer_id in (SELECT customer_id
    FROM cust_addresses
    WHERE city='Brampton');
    
/* The following SQL statement lists the number of customers in each city, sorted from high to low:*/ 
SELECT COUNT(customer_id), City
FROM cust_addresses
GROUP BY city
ORDER BY COUNT(customer_id) DESC;

/* The following query returns the names of the customers referenced from the customer table living in the city of brampton referenced from the cust_addresses table. */

SELECT customer_name
FROM customers
WHERE customer_id in (SELECT customer_id
    FROM cust_addresses
    WHERE city='Brampton');

/* The following SQL statement lists customer names, email, city and addresses of each customer*/ 
SELECT customers.customer_name, customers.customer_email, cust_addresses.city, cust_addresses.street   
FROM customers, cust_addresses
WHERE customers.customer_id=cust_addresses.customer_id ;





/* Order */
CREATE TABLE orders(
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    employee_id INTEGER,
    sub_total DECIMAL(10,2),
    order_tax  DECIMAL(3,2) DEFAULT 1.13,
    order_shipping DECIMAL(5,2) NOT NULL,
    order_total DECIMAL(10,2),
    order_date VARCHAR(15) NOT NULL,
    order_status VARCHAR(25) NOT NULL,
    tracking_code VARCHAR(15) UNIQUE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

SELECT * FROM orders; 

INSERT INTO orders (order_id,customer_id,employee_id,order_shipping,order_date,order_status,tracking_code)
    VALUES (1,900,101,5.99,'09/10/2020','shipped','9n999');
INSERT INTO orders (order_id,customer_id,employee_id,order_shipping,order_date,order_status,tracking_code)
    VALUES (2,901,103,4.99,'09/26/2020','processing','4a9732');
INSERT INTO orders (order_id,customer_id,employee_id,order_shipping,order_date,order_status,tracking_code)
    VALUES (3,907,102,4.99,'09/26/2020','processing','2k5432');
INSERT INTO orders (order_id,customer_id,employee_id,order_shipping,order_date,order_status,tracking_code)
    VALUES (4,903,102,4.99,'09/27/2020','shipped','8z7200');
INSERT INTO orders (order_id,customer_id,employee_id,order_shipping,order_date,order_status,tracking_code)
    VALUES (5,904,101,4.99,'09/29/2020','shipped','2u2354');
INSERT INTO orders (order_id,customer_id,employee_id,order_shipping,order_date,order_status,tracking_code)
    VALUES (6,906,103,4.99,'09/29/2020','processing','3j8472');
INSERT INTO orders (order_id,customer_id,employee_id,order_shipping,order_date,order_status,tracking_code)
    VALUES (7,905,101,4.99,'09/30/2020','processing','7f6452');
INSERT INTO orders (order_id,customer_id,employee_id,order_shipping,order_date,order_status,tracking_code)
    VALUES (8,908,102,3.99,'10/14/2020','processing','6b799');

/* The following query returns the orders that are processing in reverse order
by order id. */
SELECT *
FROM orders
WHERE (order_status = 'processing')
ORDER BY order_id DESC;


/* Promotion */
CREATE TABLE promotions(
    order_id INTEGER,
    promo_name VARCHAR(30) UNIQUE NOT NULL,
    promo_code VARCHAR(15) UNIQUE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

SELECT * FROM promotions; 

INSERT INTO promotions (order_id, promo_name, promo_code)
    VALUES (1, 'free shipping', 'Q6Opw');
INSERT INTO promotions (order_id,promo_name, promo_code)
    VALUES (3, '2 free samples', 'A2Fel');
INSERT INTO promotions (order_id,promo_name, promo_code)
    VALUES (7, '50% off', 'F4Wxu');
INSERT INTO promotions (order_id,promo_name, promo_code)
    VALUES (5, '10% off', 'M9Ani');

/* Update order total in orders when promotion is triggered. */
UPDATE orders SET order_total=(SELECT order_total
FROM promotions
WHERE orders.order_id=promotions.order_id);

/* Query to find "percent off" promotions in descending alphabet order of
promo codes. */
SELECT *
FROM promotions
WHERE promo_name LIKE '% off'
ORDER BY promo_code DESC;


/* Product */
CREATE TABLE products(
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL UNIQUE,
    product_size INTEGER NOT NULL,
    stock INTEGER NOT NULL,
    product_desc VARCHAR(200),
    sale_price DECIMAL(10,2) NOT NULL,
    original_price DECIMAL(10,2) NOT NULL,
    date_added VARCHAR(10) NOT NULL
);
SELECT * FROM products;
INSERT INTO products (product_id,product_name,product_size,stock, product_desc, sale_price, original_price, date_added)
    VALUES (001, 'fenty beauty foundation',20,12,'smooth flawless foundation designed by rihanna', 34.60, 53.4, '06/01/2020');
INSERT INTO products (product_id,product_name,product_size,stock, product_desc, sale_price, original_price, date_added)
    VALUES (002, 'huda beauty lipstick',10,50,'liquid lipstick', 22.20, 31.00, '06/01/2020');
INSERT INTO products (product_id,product_name,product_size,stock, product_desc, sale_price, original_price, date_added)
    VALUES (003, 'rare beauty foundation',20,40,'foundation designed by selena g', 44.00, 51.4, '06/01/2020');
INSERT INTO products (product_id,product_name,product_size,stock, product_desc, sale_price, original_price, date_added)
    VALUES (004, 'kat von d eyeliner',5,200,'winged felt tip eyeliner', 15.50, 22.00, '06/01/2020');
INSERT INTO products (product_id,product_name,product_size,stock, product_desc, sale_price, original_price, date_added)
    VALUES (005, 'kat von d contour kit',45,12,'powered contour kit for light-medium-dark skin tone', 44.5, 60.00, '06/01/2020');
INSERT INTO products (product_id,product_name,product_size,stock, product_desc, sale_price, original_price, date_added)
    VALUES (006, 'huda beauty eyelashes',4,35,'natural whispy eyelashes for everyday look', 18.90, 53.4, '06/01/2020');
INSERT INTO products (product_id,product_name,product_size,stock, product_desc, sale_price, original_price, date_added)
    VALUES (007, 'fenty beauty lipgloss',20,50,'glossy shiny lipgloss', 26.7, 37.50, '06/01/2020');
INSERT INTO products (product_id,product_name,product_size,stock, product_desc, sale_price, original_price, date_added)
    VALUES (008, 'nars blush',14,43,'mauve tone blush', 24.75, 42.15, '06/01/2020');
INSERT INTO products (product_id,product_name,product_size,stock, product_desc, sale_price, original_price, date_added)
    VALUES (009, 'fenty beauty lipstick',10,120,'matte lipstick designed by rihanna', 23.5, 35.5, '06/01/2020');
INSERT INTO products (product_id,product_name,product_size,stock, product_desc, sale_price, original_price, date_added)
    VALUES (010, 'too faced bronzer',15,16,'medium tone bronzer', 14.5, 43.5, '06/01/2020');
INSERT INTO products (product_id,product_name,product_size,stock, product_desc, sale_price, original_price, date_added)
    VALUES (011, 'laura mercier highlighter',14,47,'champagne colored liquid highlighter', 34.60, 53.4, '06/01/2020');

/* A query to select all the fenty beauty products */
SELECT * 
FROM products 
WHERE product_name LIKE 'fenty beauty%';


/* Line Item */
CREATE TABLE line_items(
    line_item_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER DEFAULT 1,
    extended_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO line_items(line_item_id, order_id, product_id, quantity)
    VALUES (1, 7, 1, 1);
INSERT INTO line_items(line_item_id, order_id, product_id, quantity)
    VALUES (2, 7, 11, 1);
INSERT INTO line_items(line_item_id, order_id, product_id, quantity)
    VALUES (3, 2, 10, 2);
INSERT INTO line_items(line_item_id, order_id, product_id, quantity)
    VALUES (4, 5, 4, 2);
INSERT INTO line_items(line_item_id, order_id, product_id, quantity)
    VALUES (5, 1, 3, 3);
INSERT INTO line_items(line_item_id, order_id, product_id, quantity)
    VALUES (6, 3, 10, 1);
INSERT INTO line_items(line_item_id, order_id, product_id, quantity)
    VALUES (7, 4, 8, 2);
INSERT INTO line_items(line_item_id, order_id, product_id, quantity)
    VALUES (8, 6, 2, 1);
INSERT INTO line_items(line_item_id, order_id, product_id, quantity)
    VALUES (9, 8, 9, 1);


SELECT * FROM line_items;
/* Set quoted price and extended price using product id. */
/*UPDATE line_items SET quoted_price = (SELECT sale_price
FROM products
where line_items.product_id = products.product_id);*/

UPDATE line_items SET extended_price = (SELECT sale_price 
FROM products 
where line_items.product_id = products.product_id);

/* Update extended price when customer makes quantity > 1. */
UPDATE line_items
SET extended_price = (extended_price * quantity)
WHERE (quantity > 1);

SELECT * FROM line_items;

/* Query to see all the product names in order_id 7 in line_items. */
SELECT product_name
FROM products
WHERE product_id IN (SELECT product_id
    FROM line_items
    WHERE order_id = 7);
    
/* Query using join to see all the products that are also line items. */
SELECT product_name, product_desc, product_size
FROM products, line_items
WHERE products.product_id=line_items.product_id;
    
/* Query to see total number of products in each order. */
SELECT order_ID, SUM(quantity)
FROM line_items
GROUP BY order_id
ORDER BY order_id ASC;

/* Query to see each customer associated with each order id and the name(s) of the product(s) they ordered. */
SELECT orders.order_id, customers.customer_name, products.product_name
FROM orders, customers, line_items, products
WHERE orders.customer_id=customers.customer_id
    AND line_items.order_id=orders.order_id
    AND products.product_id=line_items.product_id
ORDER BY (order_id) ASC;

/* Calculate and set sub_total from line items. */
UPDATE orders SET sub_total = (SELECT
    SUM(extended_price) FROM line_items WHERE (line_items.order_id = orders.order_id));

/* Set the order_total when inserting data as it calculates it for us by using
sub_total, order_tax and order_shipping. */
UPDATE orders SET order_total = ((sub_total *(1+order_tax)) + order_shipping);
DROP TABLE orders;
DROP TABLE invoices;
DROP TABLE products;
DROP TABLE suppliers;
DROP TABLE customers;
DROP TABLE shops;

CREATE TABLE shops (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  turnover INT
);

CREATE TABLE customers (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  address_1 VARCHAR(255),
  address_2 VARCHAR(255),
  postcode VARCHAR(255),
  town_city VARCHAR(255),
  create_account BOOLEAN
);

CREATE TABLE suppliers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  contact_name VARCHAR(255),
  address_1 VARCHAR(255),
  address_2 VARCHAR(255),
  postcode VARCHAR(255),
  town_city VARCHAR(255)
);

CREATE TABLE products (
  id SERIAL8 PRIMARY KEY,
  supplier_id INT8 REFERENCES suppliers(id),
  name VARCHAR(255),
  description TEXT,
  stock INT,
  cost_price INT,
  selling_price INT,
  low_stock_threshold INT,
  delivery_time INT
);

CREATE TABLE invoices (
  id SERIAL8 PRIMARY KEY,
  shop_id INT8 REFERENCES shops(id),
  status BOOLEAN
);

CREATE TABLE orders (
  id SERIAL8 PRIMARY KEY,
  product_id INT8 REFERENCES products(id),
  quantity INT,
  status BOOLEAN,
  customer_id INT8 REFERENCES customers(id),
  invoice_id INT8 REFERENCES invoices(id),
  date_ordered DATE
);

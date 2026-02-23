

DROP TABLE IF EXISTS EMPLOYEE_LOG;
DROP TABLE IF EXISTS ORDERS;
DROP TABLE IF EXISTS PRODUCTS;
DROP TABLE IF EXISTS CUSTOMERS;

CREATE TABLE CUSTOMERS (
    CUST_ID       INT PRIMARY KEY,
    FULL_NAME     VARCHAR(255) NOT NULL,
    EMAIL_ADDRESS VARCHAR(255),
    PHONE_NUMBER  VARCHAR(50),
    FULL_ADDRESS  VARCHAR(1000)
);

INSERT INTO CUSTOMERS VALUES
(1,  'Alice Johnson',   'alice.johnson@email.com',  '555-0101', '123 Main St, Springfield, IL 62701'),
(2,  'Bob Williams',    'bob.w@techmail.com',        '555-0102', '456 Oak Ave, Portland, OR 97201'),
(3,  'Carol Davis',     'carol.davis@gmail.com',     '555-0103', '789 Pine Rd, Austin, TX 78701'),
(4,  'David Martinez',  'd.martinez@work.net',       '555-0104', '321 Elm St, Denver, CO 80201'),
(5,  'Emma Wilson',     'emma.wilson@email.com',     '555-0105', '654 Maple Dr, Seattle, WA 98101'),
(6,  'Frank Brown',     'frank.b@personal.com',      '555-0106', '987 Cedar Ln, Miami, FL 33101'),
(7,  'Grace Lee',       'grace.lee@gmail.com',       '555-0107', '147 Birch Blvd, Chicago, IL 60601'),
(8,  'Henry Taylor',    'h.taylor@work.org',         '555-0108', '258 Walnut St, Boston, MA 02101'),
(9,  'Isabel Anderson', 'isabel.a@email.com',        '555-0109', '369 Spruce Ave, Nashville, TN 37201'),
(10, 'James Thomas',    'james.t@techmail.com',      '555-0110', '741 Ash Ct, Phoenix, AZ 85001'),
(11, 'Karen White',     'karen.white@gmail.com',     '555-0111', '852 Willow Way, San Francisco, CA 94101'),
(12, 'Alice Johnson',   'alice.johnson@email.com',   '555-0101', '500 New Blvd, Springfield, IL 62702');

CREATE TABLE PRODUCTS (
    PROD_ID        INT,
    PROD_NAME      VARCHAR(255),
    CATEGORY       VARCHAR(100),
    UNIT_PRICE     DOUBLE,
    STOCK_QTY      INT,
    SUPPLIER_NAME  VARCHAR(255),
    SUPPLIER_EMAIL VARCHAR(255)
);

INSERT INTO PRODUCTS VALUES
(1,  'Wireless Headphones',   'Electronics',  89.99,  45,  'TechSupply Co',   'orders@techsupply.com'),
(2,  'Laptop Stand',          'Electronics',  34.99,  80,  'TechSupply Co',   'orders@techsupply.com'),
(3,  'USB-C Hub 7-Port',      'Electronics',  49.99,  60,  'TechSupply Co',   'orders@techsupply.com'),
(4,  'Running Shoes',         'Footwear',    120.00,  30,  'SportGear Inc',   'sales@sportgear.com'),
(5,  'Yoga Mat',              'Sports',       35.00,  55,  'SportGear Inc',   'sales@sportgear.com'),
(6,  'Cotton T-Shirt',        'Clothing',     19.99, 200,  'Fashion Forward', 'contact@fashionforward.com'),
(7,  'Denim Jeans',           'Clothing',     59.99,  75,  'Fashion Forward', 'contact@fashionforward.com'),
(8,  'Coffee Maker',          'Kitchen',      79.99,  25,  'HomeGoods Plus',  'orders@homegoodsplus.com'),
(9,  'Countertop Blender',    'Kitchen',      45.00,  40,  'HomeGoods Plus',  'orders@homegoodsplus.com'),
(10, 'LED Desk Lamp',         'Office',       28.99,  90,  'HomeGoods Plus',  'orders@homegoodsplus.com'),
(11, 'Python Programming',    'Books',        49.99,  35,  'BookWorld Ltd',   'orders@bookworld.com'),
(12, 'SQL Fundamentals',      'Books',        39.99,  50,  'BookWorld Ltd',   'orders@bookworld.com'),
(13, 'Wireless Mouse',        'Electronics',  29.99, 110,  'Tech Supply Co',  'orders@techsupply.com'),
(14, 'Stainless Water Bottle','Sports',       22.00, 150,  'SportGear Inc',   'sales@sportgear.com'),
(15, 'Canvas Backpack',       'Accessories',  75.00,  65,  'Fashion Forward', 'contact@fashionforward.com');

CREATE TABLE ORDERS (
    ORDER_ID         INT,
    CUSTOMER_NAME    VARCHAR(255),
    CUSTOMER_EMAIL   VARCHAR(255),
    CUSTOMER_PHONE   VARCHAR(50),
    SHIPPING_ADDRESS VARCHAR(1000),
    ORDER_DATE       VARCHAR(20),
    PRODUCT_LIST     VARCHAR(4000),
    TOTAL_PRICE      DOUBLE,
    ORDER_STATUS     VARCHAR(50)
);

INSERT INTO ORDERS VALUES

(1,  'Alice Johnson',   'alice.johnson@email.com', '555-0101', '123 Main St, Springfield, IL 62701',       '2024-01-15', '1,11',      139.98, 'Delivered'),
(2,  'Alice Johnson',   'alice.johnson@email.com', '555-0101', '123 Main St, Springfield, IL 62701',       '2024-02-03', '12',         39.99, 'DELIVERED'),
(3,  'Alice Johnson',   'alice.johnson@email.com', '555-0101', '500 New Blvd, Springfield, IL 62702',      '2024-06-10', '2,3',        84.98, 'Pending'),

(4,  'Bob Williams',    'bob.w@techmail.com',       '555-0102', '456 Oak Ave, Portland, OR 97201',          '2024-01-17', '4,5,14',    177.00, 'DELIVERED'),
(5,  'Bob W.',          'bob.w@techmail.com',       '555-0102', '456 Oak Ave, Portland, OR 97201',          '2024-03-05', '1,15',      164.99, 'Shipped'),

(6,  'Carol Davis',     'carol.davis@gmail.com',   '555-0103', '789 Pine Rd, Austin, TX 78701',            '2024-01-20', '6,7',        79.98, 'shipped'),
(7,  'Carol Davis',     'carol.davis@gmail.com',   '555-0103', '789 Pine Rd, Austin, TX 78701',            '2024-04-14', '8',          79.99, 'Pending'),
(25, 'Carol Davis',     'carol.davis@gmail.com',   '',         '789 Pine Rd, Austin, TX 78701',            '2024-08-01', '7,15',      134.99, 'PENDING'),

(8,  'David Martinez',  'd.martinez@work.net',     '555-0104', '321 Elm St, Denver, CO 80201',             '2024-01-22', '8',          79.99, 'PENDING'),
(9,  'David Martinez',  'd.martinez@work.net',     '555-0104', '321 Elm St, Denver, CO 80201',             '2024-05-19', '10,9',       73.99, 'Delivered'),
(26, 'David Martinez',  'd.martinez@work.net',     '555-0104', '321 Elm St, Denver, CO 80201',             '2024-07-25', '1,2,3',     174.97, 'Shipped'),

(10, 'Emma Wilson',     'emma.wilson@email.com',   '555-0105', '654 Maple Dr, Seattle, WA 98101',          '2024-02-01', '2,3,13',    114.97, 'Shipped'),
(11, 'Emma Wilson',     'emma.wilson@email.com',   '555-0105', '654 Maple Dr, Seattle, WA 98101',          '2024-05-27', '11,12',      89.98, 'complete'),
(27, 'Emma Wilson',     'emma.wilson@email.com',   '555-0105', '654 Maple Dr, Seattle, WA 98101',          '2024-08-10', '4',         120.00, 'pending'),

(12, 'Frank Brown',     'frank.b@personal.com',    '555-0106', '987 Cedar Ln, Miami, FL 33101',            '2024-02-05', '1,2,11,12', 214.96, 'complete'),
(13, 'Frank Brown',     'frank.b@personal.com',    '555-0106', '987 Cedar Ln, Miami, FL 33101',            '2024-06-22', '4,5',       155.00, 'Pending'),
(28, 'Frank Brown',     'frank.b@personal.com',    '555-0106', '987 Cedar Ln, Miami, FL 33101',            '2024-08-15', '14,15',      97.00, 'Cancelled'),

(14, 'Grace Lee',       'grace.lee@gmail.com',     '555-0107', '147 Birch Blvd, Chicago, IL 60601',        '2024-02-08', '9,10',       73.99, 'Completed'),
(15, 'Grace Lee',       'grace.lee@gmail.com',     '555-0107', '147 Birch Blvd, Chicago, IL 60601',        '2024-07-03', '6,7,15',    154.98, 'Shipped'),
(29, 'Grace Lee',       'grace.lee@gmail.com',     '555-0107', '147 Birch Blvd, Chicago, IL 60601',        '2024-08-20', '11',         49.99, 'Pending'),

(16, 'Henry Taylor',    'h.taylor@work.org',       '555-0108', '258 Walnut St, Boston, MA 02101',          '2024-02-12', '15',         75.00, 'pending'),
(17, 'Henry Taylor',    'h.taylor@work.org',       '555-0108', '258 Walnut St, Boston, MA 02101',          '2024-04-30', '1,13',      119.98, 'Delivered'),

(18, 'Isabel Anderson', 'isabel.a@email.com',      '555-0109', '369 Spruce Ave, Nashville, TN 37201',      '2024-02-14', '6,14',       41.99, 'CANCELLED'),
(19, 'Isabel Anderson', 'isabel.a@email.com',      '555-0109', '369 Spruce Ave, Nashville, TN 37201',      '2024-05-08', '3,10,14',   100.98, 'Shipped'),

(20, 'James Thomas',    'james.t@techmail.com',    '555-0110', '741 Ash Ct, Phoenix, AZ 85001',            '2024-02-18', '4',         120.00, 'Delivered'),
(21, 'James Thomas',    'james.t@techmail.com',    '555-0110', '741 Ash Ct, Phoenix, AZ 85001',            '2024-06-15', '8,9',       124.99, 'Pending'),
(24, 'J. Thomas',       'james.t@techmail.com',    '555-0110', '741 Ash Ct, Phoenix, AZ 85001',            '2024-03-22', '5,14',       57.00, 'Delivered'),

(22, 'Karen White',     'karen.white@gmail.com',   '555-0111', '852 Willow Way, San Francisco, CA 94101',  '2024-02-20', '3,13',       79.98, 'delivered'),
(23, 'Karen White',     'karen.white@gmail.com',   '555-0111', '852 Willow Way, San Francisco, CA 94101',  '2024-07-18', '11,12,15',  164.98, 'Shipped'),
(30, 'Bob Williams',    'bob.w@techmail.com',       '555-0102', '456 Oak Ave, Portland, OR 97201',          '2024-08-25', '13,14,15',  126.99, 'pending');

CREATE TABLE EMPLOYEE_LOG (
    LOG_ID        INT,
    EMPLOYEE_NAME VARCHAR(255),
    ACTION_TYPE   VARCHAR(50),
    LOG_DATE      VARCHAR(20),
    ORDER_ID      INT,
    NOTES         VARCHAR(4000)
);

INSERT INTO EMPLOYEE_LOG VALUES
(1,  'Sarah Mitchell', 'ORDER_CONFIRM',   '2024-01-15', 1,    'Order confirmed and forwarded to warehouse'),
(2,  'Sarah Mitchell', 'ORDER_CONFIRM',   '2024-01-17', 4,    'Order confirmed and forwarded to warehouse'),
(3,  'Tom Richards',   'STATUS_UPDATE',   '2024-01-20', 1,    'Marked as delivered — carrier tracking confirmed'),
(4,  'Sarah Mitchell', 'ORDER_CONFIRM',   '2024-01-20', 6,    'Order confirmed'),
(5,  'Tom Richards',   'STATUS_UPDATE',   '2024-01-25', 4,    'Marked as delivered'),
(6,  'Amy Foster',     'CUSTOMER_CALL',   '2024-02-03', 5,    'Customer called to check status; informed shipment is in transit'),
(7,  'Tom Richards',   'REFUND_PROCESS',  '2024-02-14', 18,   'Customer requested cancellation; refund of $41.99 issued'),
(8,  'Sarah Mitchell', 'ORDER_CONFIRM',   '2024-02-20', 22,   'Order confirmed'),
(9,  'Amy Foster',     'ADDRESS_CHANGE',  '2024-03-01', 3,    'Customer called to update shipping address to 500 New Blvd, Springfield IL 62702'),
(10, 'Tom Richards',   'STATUS_UPDATE',   '2024-03-10', 5,    'Marked as delivered'),
(11, 'Sarah Mitchell', 'NOTE',            '2024-04-05', 8,    'Customer emailed regarding delivery date; replied with tracking number'),
(12, 'Amy Foster',     'INVENTORY_CHECK', '2024-05-01', NULL, 'Stock check for product ID 4 (Running Shoes) — only 12 units remain; reorder requested'),
(13, 'Tom Richards',   'STATUS_UPDATE',   '2024-06-10', 10,   'Marked as delivered'),
(14, 'Sarah Mitchell', 'FRAUD_FLAG',      '2024-07-18', 999,  'Order 999 flagged for review — billing address mismatch detected'),
(15, 'Amy Foster',     'ORDER_CONFIRM',   '2024-08-01', 25,   'Order confirmed');

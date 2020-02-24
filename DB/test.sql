INSERT INTO Customers
VALUES(10006, 'Pep E', '100 Main Street',
'Los Angeles', 'CA', '90046', 'USA', NULL, NULL);

INSERT INTO Customers(cust_name, cust_address,
cust_city, cust_state, cust_zip, cust_country)
VALUES('Pep E', '100 Main Street',
'Los Angeles', 'CA', '90046', 'USA');

#插入多行数据
INSERT INTO Customers(cust_name, cust_address,
cust_city, cust_state, cust_zip, cust_country)
VALUES('Pep E', '100 Main Street',
'Los Angeles', 'CA', '90046', 'USA'),
('M Martian', '100 Main Street',
'Los Angeles', 'CA', '90046', 'USA');

INSERT INTO custnew(cust_id, cust_name, cust_address,
cust_city, cust_state, cust_zip, cust_country)
SELECT cust_id, cust_name, cust_address,
cust_city, cust_state, cust_zip, cust_country
FROM customers;

UPDATE customers
SET cust_name = 'The Fudds',
	cust_email = 'elmer@fudd.com'
WHERE cust_id = 10005;

DELETE FROM customers
WHERE cust_id = 10013;

21章
更改表
ALTER TABLE vendors 
ADD vend_phone CHAR(20);

ALTER TABLE vendors 
DROP vend_phone;


CREATE TABLE orderitems_copy
(
  order_num  int          NOT NULL ,
  order_item int          NOT NULL ,
  prod_id    char(10)     NOT NULL ,
  quantity   int          NOT NULL ,
  item_price decimal(8,2) NOT NULL ,
  PRIMARY KEY (order_num, order_item)
) ENGINE=InnoDB;

ALTER TABLE orderitems_copy
ADD CONSTRAINT fk_orderitems_orders
FOREIGN KEY (order_num) REFERENCES orders (order_num);

ALTER TABLE orderitems
ADD CONSTRAINT fk_orderitems_orders;

22章视图
CREATE VIEW productcustomers AS
SELECT cust_name, cust_contact, prod_id, 
		customers.cust_id, orderitems.order_num
FROM customers, orders, orderitems
WHERE customers.cust_id = orders.cust_id
	AND orderitems.order_num = orders.order_num;

SELECT cust_name, cust_contact
FROM productcustomers
WHERE prod_id = 'TNT2';
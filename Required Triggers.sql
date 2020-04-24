#Triggers
#Referential Integrity Trigger Consumer Protection (ENSURES PAYMENTS HAVE VALID ORDER ID OTHERWISE THEY ARE FLAGGED)
drop trigger if exists ref_integ;
DELIMITER $$
CREATE TRIGGER ref_integ BEFORE INSERT ON payments
	FOR EACH ROW BEGIN
		IF NEW.Order_ID is null then
		set NEW.Order_ID = -1;
	END IF;
	END$$
DELIMITER ;
#Domain Restriction Trigger Consumer Protection (ENSURES ADDED ORDER CONTENTS DO NOT EXCEED PURCHASE LIMIT OTHERWISE THEY ARE FLAGGED AS INVALID)
drop trigger if exists dom_rest;
DELIMITER $$
CREATE TRIGGER dom_rest BEFORE INSERT ON order_contents
	FOR EACH ROW BEGIN
		IF NEW.Amount > 10000 then
        set NEW.Amount = -1;
	END IF;
    END$$
        
DELIMITER ;

#Statistics Trigger
drop trigger if exists avg_payment;
CREATE TRIGGER avg_payment AFTER UPDATE ON payments
	FOR EACH ROW
		INSERT INTO payment_avg_log (stamp, avg_amount)
		SELECT NOW(), avg(payments.amount) from payments group by payments.Order_ID;

#Triggers to keep database log-------------------------------
#Product Logs
drop trigger if exists pri_data;
drop trigger if exists pru_data;
drop trigger if exists prd_data; 
CREATE TRIGGER pri_data AFTER INSERT ON product
	FOR EACH ROW
	  INSERT INTO prod_log (action, id, stamp, tab)
	  VALUES('insert', NEW.id, NOW(), 'Product');

	CREATE TRIGGER pru_data AFTER UPDATE ON product
	FOR EACH ROW
	  INSERT INTO prod_log (action, id, stamp, tab) 
	  VALUES('update', NEW.id, NOW(), 'Product');

	CREATE TRIGGER prd_data AFTER DELETE ON product
	FOR EACH ROW
	  INSERT INTO prod_log (action, id, stamp, tab)
	  VALUES('delete', OLD.id, NOW(), 'Product');

#Payment Logs
drop trigger if exists payi_data;
drop trigger if exists payu_data;
drop trigger if exists payd_data;
CREATE TRIGGER payi_data AFTER INSERT ON Payments
	FOR EACH ROW
	  INSERT INTO data_log (action, id, stamp, tab)
	  VALUES('insert', NEW.Payment_ID, NOW(), 'Payments');

	CREATE TRIGGER payu_data AFTER UPDATE ON payments
	FOR EACH ROW
	  INSERT INTO data_log (action, id, stamp, tab) 
	  VALUES('update', NEW.Payment_ID, NOW(), 'Payments');

	CREATE TRIGGER payd_data AFTER DELETE ON payments
	FOR EACH ROW
	  INSERT INTO data_log (action, id, stamp, tab)
	  VALUES('delete', OLD.Payment_ID, NOW(), 'Payments');

#Customer Logs
drop trigger if exists ci_data;
drop trigger if exists cu_data;
drop trigger if exists cd_data;
CREATE TRIGGER ci_data AFTER INSERT ON Customers
	FOR EACH ROW
	  INSERT INTO data_log (action, id, stamp, tab)
	  VALUES('insert', NEW.Customer_ID, NOW(), 'Customers');

	CREATE TRIGGER cu_data AFTER UPDATE ON Customers
	FOR EACH ROW
	  INSERT INTO data_log (action, id, stamp, tab) 
	  VALUES('update', NEW.Customer_ID, NOW(), 'Customers');

	CREATE TRIGGER cd_data AFTER DELETE ON customers
	FOR EACH ROW
	  INSERT INTO data_log (action, id, stamp, tab)
	  VALUES('delete', OLD.Customer_ID, NOW(), 'Customers');
      
#Orders Logs
drop trigger if exists oi_data;
drop trigger if exists ou_data;
drop trigger if exists od_data;
CREATE TRIGGER oi_data AFTER INSERT ON Orders
	FOR EACH ROW
	  INSERT INTO data_log (action, id, stamp, tab)
	  VALUES('insert', NEW.Order_ID, NOW(), 'Orders');

	CREATE TRIGGER ou_data AFTER UPDATE ON Orders
	FOR EACH ROW
	  INSERT INTO data_log (action, id, stamp, tab) 
	  VALUES('update', NEW.Order_ID, NOW(), 'Orders');

	CREATE TRIGGER od_data AFTER DELETE ON Orders
	FOR EACH ROW
	  INSERT INTO data_log (action, id, stamp, tab)
	  VALUES('delete', OLD.Order_ID, NOW(), 'Orders');
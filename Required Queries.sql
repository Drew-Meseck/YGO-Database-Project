#Update Querys--------------------------------------------------------------- 
#Multiple Tables
UPDATE Payments p
INNER JOIN (
  SELECT order_contents.Order_ID, SUM(order_contents.Amount) as total
  FROM order_contents
  GROUP BY order_contents.Order_ID
) x ON p.Order_ID = x.Order_ID
SET p.Amount = x.total;
#----------------------------------------------------------------------------
#Select Queries--------------------------------------------------------------
# 1 Finds Products in orders that are over $50 (Uses where Condition)
select order_contents.Product_ID, order_contents.amount from order_contents where order_contents.amount > 50;

# 2 Finds average Order amounts using payment data (Uses Aggregate Function AVG)
select avg(Payments.Amount) from Payments;

# 3 Finds all users ordered by their usernames (Uses ORDER BY)
select Username from Customers order by Username;

# 4 Finds all customer ID's who have payed more than $70 (Uses GROUP BY and HAVING)
select Payments.Customer_ID, sum(Payments.Amount) from Payments
	group by
		Payments.Customer_ID
	having
		sum(Payments.Amount) > 70;

# 5 Gets Placement Data for Customers in registered tournaments 
select Customers.Username, tournament_participants.Placement, tournament_participants.Tid from Customers 
inner join tournament_participants on Customers.Customer_ID = tournament_participants.Customer_ID;

# 6 Nested Select: Gets all Usernames from those who participated at Tournament 'YCS Denver'
select customers.Username from customers
where
	customers.Customer_ID in (select tournament_participants.Customer_ID from tournament_participants
		where tournament_participants.Tid = 0001);
        
# 7 Union Select Unions all Usernames from those who participated at both YCS Denver and YCS Las Vegas
select customers.Username from customers
where
	customers.Customer_ID in (select tournament_participants.Customer_ID from tournament_participants
		where tournament_participants.Tid = 0001)
union
select customers.Username from customers
where
	customers.Customer_ID in (select tournament_participants.Customer_ID from tournament_participants
		where tournament_participants.Tid = 0002);

#----------------------------------------------------------------------------

#Delete Query----------------------------------------------------------------
#Removes 1 product that is discontinued
delete from product where product.ID = 'CRMS-EN055';

#Removes Cards from products where the price is 0 so that it cannot be accidentally sold for free
delete product, card
	from product
	inner join card on product.ID = card.ID
    where card.price = 0;
#----------------------------------------------------------------------------

#View Creation and Queries---------------------------------------------------
#Creates view of a specific classification of a tournament 
create view YCS_Tournament as select * from tournament where tournament._Type = 'YCS';

#Insert new tournament into view 
insert into YCS_Tournament values (0006, 'YCS London', 'Gran-Manju-OTK', '2020-04-23', 'London', 'YCS');

#Select the Top Deck from each YCS tournament
select YCS_Tournament.Title, YCS_Tournament.Top_Deck from YCS_Tournament;


drop view YCS_Tournament;
#----------------------------------------------------------------------------

#Product Inserts
insert ignore into box (select card.box, "Box", 69.99 
	from card);

#Sort all in box by ID
(SELECT 
    *
FROM
    box);

insert into Product(select box.Product_ID, 'Box', box.Price 
	from
		box);
insert into Product(select card.ID, 'Card', card.Price
	from
		card);

        
select * from Product;
select * from Product where Ptype = "Box";





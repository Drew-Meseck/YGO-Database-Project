#Product Inserts
insert ignore into box (select card.box, "Box", 69 
	from card);

insert into Product(select box.Product_ID, 'Box', box.Price 
	from
		box);
insert into Product(select card.ID, 'Card', card.Price
	from
		card);





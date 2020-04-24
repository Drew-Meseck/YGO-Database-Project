#Customer Inserts
insert into Customers values(001, '420 Cool Street', 1234567890, 'Yugi_Muto');
insert into Customers values(002, '720 Cool Street', 0987654321, 'Seto_Kaiba');
insert into Customers values(003, '219 Domino Street', 1562489547, 'Joey_Wheeler');
insert into Customers values(004, '326 Duel Academy Ln', 1232314567, 'Jayden_Yuki');
insert into Customers values(005, '421 Duel Academy Ln', 1984657842, 'Alexis_Rhodes');

#Login Inserts
insert into Login values('Yugi_Muto', 'Pa55word');
insert into Login values('Seto_Kaiba', 'BlueEyes2049');
insert into Login values('Joey_Wheeler', 'RedEyesBrooklyn');
insert into Login values('Jayden_Yuki', 'NEOS_HERO_2020');
insert into Login values('Alexis_Rhodes', 'CyberAngel50');

#Tournament Inserts
insert into Tournament values (0001, 'YCS Denver', 'Invoked Shaddoll', '2019-11-28', 'Denver', 'YCS');
insert into Tournament values (0002, 'YCS Las Vegas', 'Adamancipator', '2020-04-22', 'Las Vegas', 'YCS');
insert into Tournament values (0003, 'AAG Locals', 'Invoked Shaddoll', '2020-01-02', 'Longmont', 'Locals');
insert into Tournament values (0004, 'AAG Locals', 'Elditch', '2020-01-09', 'Longmont', 'Locals');
insert into Tournament values (0005, 'WCQ North America', 'Invoked Shaddoll', '2020-04-30', 'Washington DC', 'WCQ');

#Tournament Participant Inserts
insert into Tournament_Participants values (1, 001, 0001, '5-0', 1);
insert into Tournament_Participants values (2, 002, 0001, '2-3', 6);
insert into Tournament_Participants values (3, 003, 0001, '1-4', 23);
insert into Tournament_Participants values (4, 001, 0002, '3-2', 4);
insert into Tournament_Participants values (5, 002, 0002, '5-0', 1);
insert into Tournament_Participants values (6, 003, 0002, '1-4', 23);
insert into Tournament_Participants values (7, 004, 0002, '4-1', 2);
insert into Tournament_Participants values (8, 004, 0003, '3-2', 3);
insert into Tournament_Participants values (9, 005, 0003, '5-0', 1);
insert into Tournament_Participants values (10, 005, 0004, '5-0', 1);
insert into Tournament_Participants values (11, 001, 0004, '3-2', 5);
insert into Tournament_Participants values (12, 002, 0005, '8-3', 13);

#Order Inserts
insert into Orders values (0001, 0001, 001);
insert into Orders values (0002, 0002, 002);
insert into Orders values (0003, 0003, 004);
insert into Orders values (0004, 0004, 003);
insert into Orders values (0005, 0005, 001);
insert into Orders values (0006, 0006, 005);
insert into Orders values (0007, 0007, 002);

#Order Contents Inserts
insert into Order_Contents (select 001, 0001, 'LOB-045', (select cast(product.price as unsigned)) from product where product.ID = 'LOB-045' );
insert into Order_Contents (select 002, 0001, 'LOB-059', (select cast(product.price as unsigned)) from product where product.ID = 'LOB-059' );
insert into Order_Contents (select 003, 0001, 'LOB-059', (select cast(product.price as unsigned)) from product where product.ID = 'LOB-059' );
insert into Order_Contents (select 004, 0001, 'LOB-059', (select cast(product.price as unsigned)) from product where product.ID = 'LOB-059' );
insert into Order_Contents (select 005, 0001, 'LOB-119', (select cast(product.price as unsigned)) from product where product.ID = 'LOB-119' );

insert into Order_Contents (select 006, 0002, 'MRL-022', (select cast(product.price as unsigned)) from product where product.ID = 'MRL-022' );
insert into Order_Contents (select 007, 0002, 'MRD-127', (select cast(product.price as unsigned)) from product where product.ID = 'MRD-127' );
insert into Order_Contents (select 008, 0002, 'MRD-127', (select cast(product.price as unsigned)) from product where product.ID = 'MRD-127' );
insert into Order_Contents (select 009, 0002, 'PSV', (select cast(product.price as unsigned)) from product where product.ID = 'PSV' );
insert into Order_Contents (select 010, 0002, 'LOB', (select cast(product.price as unsigned)) from product where product.ID = 'LOB' );

insert into Order_Contents (select 011, 0003, 'LOB', (select cast(product.price as unsigned)) from product where product.ID = 'LOB' );

insert into Order_Contents (select 012, 0004, 'LOD', (select cast(product.price as unsigned)) from product where product.ID = 'LOD' );

insert into Order_Contents (select 013, 0005, 'LOD', (select cast(product.price as unsigned)) from product where product.ID = 'LOD' );
insert into Order_Contents (select 014, 0005, 'MRL-022', (select cast(product.price as unsigned)) from product where product.ID = 'MRL-022' );

insert into Order_Contents (select 015, 0006, 'MRL', (select cast(product.price as unsigned)) from product where product.ID = 'MRL' );
insert into Order_Contents (select 016, 0006, 'TDGS', (select cast(product.price as unsigned)) from product where product.ID = 'TDGS' );
insert into Order_Contents (select 017, 0006, 'MRL-022', (select cast(product.price as unsigned)) from product where product.ID = 'MRL-022' );

insert into Order_Contents (select 018, 0007, 'CRMS', (select cast(product.price as unsigned)) from product where product.ID = 'CRMS' );

#Payments Inserts (INVOLVES TWO TABLES)
insert into Payments (select Orders.Payment_ID, Orders.Order_ID, Orders.Customer_ID, 0 from Orders);
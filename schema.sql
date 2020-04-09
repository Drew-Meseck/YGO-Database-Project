create database if not exists TCG;

use TCG;

create table if not exists card (
	ID char(10) not null primary key,
	Title varchar(255),
	box varchar(4),
	classification varchar(20),
	Rarity varchar(10),
	Attribute varchar(10),
	_Type varchar(15),
	Lvl integer(10),
	Descr varchar(255),
	ATK integer(10),
	DEF integer(10),
	Summon varchar(10),
	Price double
);

create table if not exists Box (
	Product_ID varchar(10) not null primary key,
	Title varchar(255),
	_Type varchar(20),
	Price double
);

create table if not exists Product (
	ID varchar(4) not null primary key,
	Ptype varchar(20)
);

create table if not exists Orders (
	Order_ID integer(10) not null primary key,
	Payment_ID integer(10)not null primary key,
	Shipping_Address varchar(255),
	Customer_ID integer(10) not null primary key
);

create table if not exists Order_Contents (
	Order_ID integer(10) not null primary key,
	Product_ID varchar(10)not null primary key,
	Amount double
);

create table if not exists Payments (
	Payment_ID integer(10) not null primary key,
	Order_ID integer(10) not null primary key,
	Customer_ID integer(10) not null primary key,
	Order_Amount double,
	CCN integer(10)
);

create table if not exists Customers (
	Customer_ID integer(10) not null primary key,
	Shipping_Address varchar(255),
	CCN integer(10),
	Username varchar(20)
);

create table if not exists Login (
	Username varchar(20) not null primary key,
	Password varchar(25)
);

create table if not exists Tournament (
	Tid integer(10) not null primary key,
	Title varchar(20),
	Top_Deck varchar(20),
	Tdate date,
	location varchar(20),
	_Type varchar(10)
);

create table if not exists Tournament_Participants (
	Customer_ID integer(10) not null primary key,
	Tid integer(10) not null primary key,
	Record varchar(5),
	Placement integer(10)
);
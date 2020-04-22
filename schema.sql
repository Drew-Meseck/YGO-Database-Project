create database if not exists TCG;

use TCG;

#drop table if exists card; #DONT USE UNLESS YOU WANT TO SIT AROUND WAITING TO POPULATE THE CARD TABLE
create table if not exists card (
	ID char(50) not null primary key,
	Title varchar(50),
	box varchar(10),
	classification varchar(50),
	Rarity longtext,
	Attribute varchar(10),
	_Type varchar(255),
	Lvl char(10),
	ATK char(10),
	DEF char(10),
	Price char(10)
);
drop table if exists Box;
create table if not exists Box (
	Product_ID varchar(10) not null primary key,
	_Type varchar(20),
	Price char(10)
);
drop table if exists Product;
create table if not exists Product (
	ID varchar(50) not null primary key,
	Ptype varchar(10),
    Price varchar(10)
);
drop table if exists Orders;
create table if not exists Orders (
	Order_ID integer not null primary key,
	Payment_ID integer,
	Shipping_Address varchar(255),
	Customer_ID integer
);
drop table if exists Order_Contents;
create table if not exists Order_Contents (
	Order_ID integer not null primary key,
	Product_ID varchar(10),
	Amount varchar(20)
);
drop table if exists Payments;
create table if not exists Payments (
	Payment_ID integer not null primary key,
	Order_ID integer,
	Customer_ID integer,
	Order_Amount varchar(20),
	CCN integer
);
drop table if exists Customers;
create table if not exists Customers (
	Customer_ID integer not null primary key,
	Shipping_Address varchar(255),
	CCN integer,
	Username varchar(20)
);
drop table if exists Login;
create table if not exists Login (
	Username varchar(20) not null primary key,
	Password varchar(25)
);
drop table if exists Tournament;
create table if not exists Tournament (
	Tid integer not null primary key,
	Title varchar(20),
	Top_Deck varchar(20),
	Tdate date,
	location varchar(20),
	_Type varchar(10)
);
drop table if exists Tournament_Participants;
create table if not exists Tournament_Participants (
	Customer_ID integer not null primary key,
	Tid integer,
	Record varchar(5),
	Placement integer
);
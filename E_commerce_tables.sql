create database E_commerce_D;
use  e_commerce_d;
create table User (userId int not null primary key, name varchar(20), phoneNumber varchar(20));
create table Buyer (userId int,foreign key(userId) references user(userId));
create table Seller (userId int,foreign key(userId) references user(userId));
create table Address (addr_id int not null primary key , userId int,foreign key(userId) references user(userId), name varchar(50),
	city varchar(50), postalCode varchar(30), streetAddr varchar(100), province varchar(100), contactPhoneNumber varchar(20));
create table Bank_Card (cardNumber varchar(25) primary key, userId int,foreign key(userId) references user(userId),
	bank varchar(20), expiryDate date);
create table Credit_Card (cardNumber varchar(25),foreign key(cardNumber) references bank_card(cardNumber),
	userId int,foreign key(userId) references user(userId),organization varchar(20));
create table Debit_Card (cardNumber varchar(25),foreign key(cardNumber) references bank_card(cardNumber),
	userId int,foreign key(userId) references user(userId));
create table Store (s_id int not null primary key, name varchar(20), province varchar(20), city varchar(20),
	streetAddr varchar(100),customerGrade int, startTime date);
create table Product (p_id int not null primary key, s_id int,foreign key (s_id) references store(s_id),
	brand varchar(50), name varchar(100),type varchar(50),modelNumber varchar(20),colour varchar(50), amount int , price int );
create table Order_Item (item_Id int not null primary key, p_id int,foreign key (p_id) references product(p_id),
	price int, creationTime date);
create table Orders (orderNumber int not null primary key, paymentStatus varchar(20), creationTime Date, totalAmount int);


create table  Manage (userId int, foreign key(userId) references user(userId), s_Id int,foreign key (s_Id) references store(s_Id),
	SetupTime Date);
create table Save_to_Shopping_Cart (userId int, foreign key (userId) references user(userId), 
	p_id int, foreign key (p_Id) references product(p_Id) , addtime Date, quantity int);
create table Contain (orderNumber int,foreign key(orderNumber) references orders(orderNumber) , item_Id int, 
	foreign key(item_Id) references order_item(item_Id), quantity int);
create table Deliver_To (addr_id int,foreign key(addr_id) references address(addr_id), 
	orderNumber int ,foreign key(orderNumber) references orders(orderNumber), TimeDelivered Date);
create table Payment (orderNumber int ,foreign key(orderNumber) references orders(orderNumber),
cardNumber varchar(25),foreign key(cardNumber) references bank_card(cardNumber), payTime Date);
create table brand( brandName varchar(20) primary key);
create table After_Sales_Service_At(brandName varchar(50), foreign key(brandName) references brand(brandName),
	sp_Id int,foreign key(sp_Id) references servicepoint(sp_Id));
create table comments(creationTime Date,userId int,foreign key (userId) references user(userId),
	p_Id int,foreign key(p_Id) references product(p_Id),Grade Float,content varchar(500));
create table servicepoint(sp_Id int not null primary key,streetAddr varchar(50),city varchar(20),
	province varchar(20),startTime varchar(20),endTime varchar(20));



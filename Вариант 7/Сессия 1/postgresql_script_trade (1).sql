--create database trade;
--use trade;
create table "Role"
(
  RoleID serial primary key,
  RoleName varchar(100) not null
);
create table "User"
(
  UserID serial primary key,
  UserSurname varchar(100) not null,
  UserName varchar(100) not null,
  UserPatronymic varchar(100) not null,
  UserLogin text not null,
  UserPassword text not null,
  UserRole int not null references "Role"(RoleID)
);
create table "Product"
(
  ProductArticleNumber varchar(100) primary key,
  ProductName text not null,
  ProductDescription text not null,
  ProductCategory text not null,
  ProductPhoto bytea not null,
  ProductManufacturer text not null,
  ProductCost decimal(19,4) not null,
  ProductDiscountAmount smallint null,
  ProductQuantityInStock int not null,
  ProductStatus text not null
);
create table "Order"
(
  OrderID serial primary key,
  OrderStatus text not null,
  OrderDeliveryDate timestamp not null,
  OrderPickupPoint text not null
);
create table "OrderProduct"
(
  OrderID int not null references "Order"(OrderID),
  ProductArticleNumber varchar(100)  not null references "Product"(ProductArticleNumber),
  Primary key (OrderID,ProductArticleNumber)
);

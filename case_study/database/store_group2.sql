ALTER USER 'root'@'localhost' IDENTIFIED BY '123456';
FLUSH PRIVILEGES;

create database store_group2;
use store_group2;
create table category
(
    id   int primary key auto_increment not null,
    name varchar(60)                    not null
);
insert into category(name)
values ('dell');

create table products
(
    id          int primary key auto_increment not null,
    name        varchar(255)                   not null,
    price   float                          not null,
    quantity    int default 0,
    idCategory  int                            not null,
    FOREIGN KEY (idCategory) REFERENCES category (id)
);
insert into products(name, price, quantity, idCategory)
values ('dell', 1000, 20, 1);
select *
from products;

create table users
(
    id       int primary key auto_increment not null,
    username varchar(18)                    not null,
    password varchar(18)                    not null,
    role     varchar(18)                    not null,
    name     varchar(60)                    not null,
    age      int                            not null,
    address  varchar(255)                   not null
);
insert into users(username, password, role, name, age, address)
values ('team2', '1', 'admin', 'nguyen ba son', 24, 'hai duong');
insert into users(username, password, role, name, age, address)
values ('linh', '1', 'user', 'linh lee', 24, 'ha nam');
create table oder
(
    id     int primary key auto_increment not null,
    time   DATETIME                       not null,
    userId int                            not null,
    FOREIGN KEY (userId) REFERENCES users (id)
);
insert into oder(time, userId)
values ('2023-07-21 ' , 2);

create table oderDetail (
                            id  int primary key auto_increment not null,
                            priceProduct float not null ,
                            quantity int not null default 1,
                            idProduct int not null ,
                            idOder int not null ,
                            FOREIGN KEY (idProduct) REFERENCES products (id),
                            FOREIGN KEY (idOder) REFERENCES oder (id)
);
insert into oderdetail( priceProduct, quantity, idProduct, idOder)
values (1000 , 3 , 1 , 1);


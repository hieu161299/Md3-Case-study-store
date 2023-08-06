drop database store_group2;
ALTER USER 'root'@'localhost' IDENTIFIED BY '123456';
FLUSH PRIVILEGES;
drop database store_group2;
create database store_group2;
use store_group2;
create table category
(
    id   int primary key auto_increment not null,
    name varchar(60)                    not null
);
insert into category(name)
values ('dell');
insert into category(name)
values ('mac');
insert into category(name)
values ('asus');
insert into category(name)
values ('acer');
insert into category(name)
values ('msi');
insert into category(name)
values ('gigabyte');
insert into category(name)
values ('lenovo');
select *
from category;
create table products
(
    id         int primary key auto_increment not null,
    name       varchar(255)                   not null,
    price      float                          not null,
    quantity   int default 0,
    idCategory int                            ,
    image      text,
    FOREIGN KEY (idCategory) REFERENCES category (id)
);
insert into products(name, price, quantity, idCategory, image)
values ('dell', 1000, 10, 1,
        'https://cdn.tgdd.vn/Products/Images/44/284337/dell-inspiron-16-5620-i7-n6i7000w1-070722-013841-600x600.jpg');
insert into products(name, price, quantity, idCategory, image)
values ('msi 1', 500, 10, 5,
        'https://cdn.tgdd.vn/Products/Images/44/284337/dell-inspiron-16-5620-i7-n6i7000w1-070722-013841-600x600.jpg');
insert into products(name, price, quantity, idCategory, image)
values ('lenovo 1', 60, 10, 7,
        'https://cdn.tgdd.vn/Products/Images/44/284337/dell-inspiron-16-5620-i7-n6i7000w1-070722-013841-600x600.jpg');
insert into products(name, price, quantity, idCategory, image)
values ('mac m1', 70, 10, 2,
        'https://cdn.tgdd.vn/Products/Images/44/284337/dell-inspiron-16-5620-i7-n6i7000w1-070722-013841-600x600.jpg');
insert into products(name, price, quantity, idCategory, image)
values ('mac m2', 20, 10, 2,
        'https://cdn.tgdd.vn/Products/Images/44/284337/dell-inspiron-16-5620-i7-n6i7000w1-070722-013841-600x600.jpg');
insert into products(name, price, quantity, idCategory, image)
values ('lenovo 2', 120, 10, 7,
        'https://cdn.tgdd.vn/Products/Images/44/284337/dell-inspiron-16-5620-i7-n6i7000w1-070722-013841-600x600.jpg');
insert into products(name, price, quantity, idCategory, image)
values ('acer 1', 40, 10, 4,
        'https://cdn.tgdd.vn/Products/Images/44/284337/dell-inspiron-16-5620-i7-n6i7000w1-070722-013841-600x600.jpg');
insert into products(name, price, quantity, idCategory, image)
values ('acer 2', 20, 10, 4,
        'https://cdn.tgdd.vn/Products/Images/44/284337/dell-inspiron-16-5620-i7-n6i7000w1-070722-013841-600x600.jpg');
insert into products(name, price, quantity, idCategory, image)
values ('asus 1', 150, 10, 3,
        'https://cdn.tgdd.vn/Products/Images/44/284337/dell-inspiron-16-5620-i7-n6i7000w1-070722-013841-600x600.jpg');
insert into products(name, price, quantity, idCategory, image)
values ('gigabyte 1', 150, 10, 6,
        'https://cdn.tgdd.vn/Products/Images/44/284337/dell-inspiron-16-5620-i7-n6i7000w1-070722-013841-600x600.jpg');
insert into products(name, price, quantity, idCategory, image)
values ('acer nitro', 420, 15, 4,
        'https://cdn.tgdd.vn/Products/Images/44/284337/dell-inspiron-16-5620-i7-n6i7000w1-070722-013841-600x600.jpg');
insert into products(name, price, quantity, idCategory, image)
values ('msi 3', 300, 10, 5,
        'https://cdn.tgdd.vn/Products/Images/44/284337/dell-inspiron-16-5620-i7-n6i7000w1-070722-013841-600x600.jpg');
insert into products(name, price, quantity, idCategory, image)
values ('lenovo 5', 200, 14, 7,
        'https://cdn.tgdd.vn/Products/Images/44/284337/dell-inspiron-16-5620-i7-n6i7000w1-070722-013841-600x600.jpg');

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
    address  varchar(255)                   not null,
    image    text
);
insert into users(username, password, role, name, age, address, image)
values ('son', '1', 'admin', 'nguyen ba son', 24, 'hai duong', 'ảnh');
insert into users(username, password, role, name, age, address, image)
values ('linh', '1', 'member', 'linh lee', 24, 'ha nam', 'ảnh');
select *
from users;

create table oder
(
    id     int primary key auto_increment not null,
    time   DATETIME                       not null,
    userId int                            ,
    status boolean not null ,
    FOREIGN KEY (userId) REFERENCES users (id)
);

/*thêm trường status để xác định hóa đơn đã thanh toán chưa*/
insert into oder(time, userId , status)
values ('2023-07-21 ', 2 , 1);

select *
from oder;

create table oderDetail (
                            id  int primary key auto_increment not null,
                            priceProduct float not null ,
                            quantity int not null default 1,
                            idProduct int  ,
                            idOder int  ,
                            FOREIGN KEY (idProduct) REFERENCES products (id),
                            FOREIGN KEY (idOder) REFERENCES oder (id)
);

select * from oderdetail;

insert into oderdetail( priceProduct, quantity, idProduct, idOder)
values (1000 , 3 , 1 , 1);

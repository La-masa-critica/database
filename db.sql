-- Switch to the database (not needed in PostgreSQL, assuming you are already connected to the correct database)

create table Role (
    id SERIAL primary key,
    name varchar(255)
);

create table Permission (
    id SERIAL primary key,
    description varchar(255)
);

create table Role_Permission (
    role_id int,
    permission_id int,
    primary key (role_id, permission_id),
    foreign key (role_id) references Role(id),
    foreign key (permission_id) references Permission(id)
);

create table "User" (
    id SERIAL primary key,
    name varchar(255),
    phone varchar(255)
);

create table Credential (
    id SERIAL primary key,
    user_id int,
    role_id int,
    username varchar(255),
    password varchar(255),
    foreign key (user_id) references "User"(id),
    foreign key (role_id) references Role(id)
);

create table Product (
    id SERIAL primary key,
    name varchar(255),
    price decimal(10, 2),
    stock int
);

create table Category (
    id SERIAL primary key,
    name varchar(255)
);

create table Product_Category (
    category_id int,
    product_id int,
    primary key (category_id, product_id),
    foreign key (category_id) references Category(id),
    foreign key (product_id) references Product(id)
);

create table Sell (
    id SERIAL primary key,
    user_id int,
    date timestamp,
    total decimal(10, 2),
    status varchar(255),
    comments varchar(255),
    foreign key (user_id) references "User"(id)
);

create table Sell_details (
    sell_id int,
    product_id int,
    amount int,
    unit_price decimal(10, 2),
    primary key (sell_id, product_id),
    foreign key (sell_id) references Sell(id),
    foreign key (product_id) references Product(id)
);

create table Shopping_car (
    id SERIAL primary key,
    user_id int,
    status varchar(255),
    foreign key (user_id) references "User"(id)
);


create table Shopping_car_details (
    shopping_car_id int,
    product_id int,
    amount int,
    primary key (shopping_car_id, product_id),
    foreign key (shopping_car_id) references Shopping_car(id),
    foreign key (product_id) references Product(id)
);


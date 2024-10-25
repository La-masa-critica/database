-- Switch to the database (not needed in PostgreSQL, assuming you are already connected to the correct database)

create table Role (
    id SERIAL primary key,
    name varchar(255)
);

create table Permission (
    id SERIAL primary key,
    name varchar(255)
);

create table Role_Permission (
    role_id int,
    permission_id int,
    primary key (role_id, permission_id),
    foreign key (role_id) references Role(id),
    foreign key (permission_id) references Permission(id)
);

create table Profile (
    id SERIAL primary key,
    name varchar(255),
    phone varchar(255)
);

create table AuthData (
    id SERIAL primary key,
    profile_id int,
    profilename varchar(255),
    password varchar(255),
    enabled boolean default true,
    foreign key (profile_id) references Profile(id)
);

create table AuthData_Role (
    authdata_id int,
    role_id int,
    primary key (authdata_id, role_id),
    foreign key (authdata_id) references AuthData(id),
    foreign key (role_id) references Role(id)
);


create table Item (
    id SERIAL primary key,
    name varchar(255),
    price decimal(10, 2) default 0,
    stock int default 0,
    enabled boolean default true
);

create table Category (
    id SERIAL primary key,
    name varchar(255)
);

create table Item_Category (
    category_id int,
    item_id int,
    primary key (category_id, item_id),
    foreign key (category_id) references Category(id),
    foreign key (item_id) references Item(id)
);

create table Sale (
    id SERIAL primary key,
    profile_id int,
    date timestamp,
    total decimal(10, 2),
    status varchar(255),
    comments varchar(255),
    foreign key (profile_id) references Profile(id)
);

create table Sale_details (
    sale_id int,
    item_id int,
    quantity int,
    price decimal(10, 2),
    primary key (sale_id, item_id),
    foreign key (sale_id) references Sale(id),
    foreign key (item_id) references Item(id)
);

create table Cart (
    id SERIAL primary key,
    profile_id int,
    enabled boolean default true,
    foreign key (profile_id) references Profile(id)
);


create table Cart_Item (
    cart_id int,
    item_id int,
    quantity int,
    primary key (cart_id, item_id),
    foreign key (cart_id) references Cart(id),
    foreign key (item_id) references Item(id)
);


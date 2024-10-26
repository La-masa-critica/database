-- Switch to the database (not needed in PostgreSQL, assuming you are already connected to the correct database)

create table Role (
    id SERIAL primary key,
    name VARCHAR(255)
);

create table Permission (
    id SERIAL primary key,
    name VARCHAR(255)
);

create table Role_Permission (
    role_id INTEGER,
    permission_id INTEGER,
    primary key (role_id, permission_id),
    foreign key (role_id) references Role(id),
    foreign key (permission_id) references Permission(id)
);

create table Profile (
    id SERIAL primary key,
    name VARCHAR(255),
    phone VARCHAR(255)
);

create table AuthData (
    id INTEGER primary key references Profile(id),
    username VARCHAR(255),
    password VARCHAR(255),
    enabled boolean default true
);

create table Cart (
    id INTEGER primary key references Profile(id),
    enabled boolean default true
);

create table AuthData_Role (
    authdata_id INTEGER,
    role_id INTEGER,
    primary key (authdata_id, role_id),
    foreign key (authdata_id) references AuthData(id),
    foreign key (role_id) references Role(id)
);


create table Item (
    id SERIAL primary key,
    name VARCHAR(255),
    price DECIMAL(10, 2) default 0,
    stock INTEGER default 0,
    enabled boolean default true
);

create table Category (
    id SERIAL primary key,
    name VARCHAR(255)
);

create table Item_Category (
    category_id INTEGER,
    item_id INTEGER,
    primary key (category_id, item_id),
    foreign key (category_id) references Category(id),
    foreign key (item_id) references Item(id)
);

create table Sale (
    id SERIAL primary key,
    profile_id INTEGER,
    date timestamp,
    total DECIMAL(10, 2),
    status VARCHAR(255),
    comments VARCHAR(255),
    foreign key (profile_id) references Profile(id)
);

create table Sale_details (
    sale_id INTEGER,
    item_id INTEGER,
    quantity INTEGER,
    price DECIMAL(10, 2),
    primary key (sale_id, item_id),
    foreign key (sale_id) references Sale(id),
    foreign key (item_id) references Item(id)
);



create table Cart_Item (
    cart_id INTEGER,
    item_id INTEGER,
    quantity INTEGER,
    primary key (cart_id, item_id),
    foreign key (cart_id) references Cart(id),
    foreign key (item_id) references Item(id)
);


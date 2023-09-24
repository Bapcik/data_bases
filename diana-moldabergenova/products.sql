create table `diana-moldabergenova`.products
(
    id          int auto_increment
        primary key,
    product     varchar(45) not null,
    category_id int         null,
    constraint products_ibfk_1
        foreign key (category_id) references `diana-moldabergenova`.categories (id)
);

create index category_id
    on `diana-moldabergenova`.products (category_id);


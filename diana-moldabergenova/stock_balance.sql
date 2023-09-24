create table `diana-moldabergenova`.stock_balance
(
    id                int auto_increment
        primary key,
    product_id        int     null,
    from_stock        int     null,
    to_stock          int     null,
    from_counteragent int     null,
    to_counteragent   int     null,
    quantity          decimal null,
    date              date    null,
    constraint stock_balance_ibfk_1
        foreign key (product_id) references `diana-moldabergenova`.products (id),
    constraint stock_balance_ibfk_2
        foreign key (from_stock) references `diana-moldabergenova`.stores (id),
    constraint stock_balance_ibfk_3
        foreign key (to_stock) references `diana-moldabergenova`.stores (id),
    constraint stock_balance_ibfk_4
        foreign key (from_counteragent) references `diana-moldabergenova`.counteragents (id),
    constraint stock_balance_ibfk_5
        foreign key (to_counteragent) references `diana-moldabergenova`.counteragents (id)
);

create index from_counteragent
    on `diana-moldabergenova`.stock_balance (from_counteragent);

create index from_stock
    on `diana-moldabergenova`.stock_balance (from_stock);

create index product_id
    on `diana-moldabergenova`.stock_balance (product_id);

create index to_counteragent
    on `diana-moldabergenova`.stock_balance (to_counteragent);

create index to_stock
    on `diana-moldabergenova`.stock_balance (to_stock);


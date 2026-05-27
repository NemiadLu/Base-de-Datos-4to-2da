create database if not exists ecommerce_tec;
use ecommerce_tec;

create table categorias (
    id_cat int not null,
    nombre_cat varchar(100) not null,
    primary key (id_cat)
);

create table productos (
    id_prod int not null,
    nombre varchar(100) not null,
    precio decimal(10,2) not null,
    id_cat int not null,
    primary key (id_prod),
    foreign key (id_cat) references categorias(id_cat)
);

create table detalle_venta (
    id_detalle int not null,
    id_prod int not null,
    cantidad int not null,
    precio_unit decimal(10,2) not null,
    primary key (id_detalle),
    foreign key (id_prod) references productos(id_prod)
);

insert into categorias (id_cat, nombre_cat) values
(1, 'Smartphones'),
(2, 'Laptops'),
(3, 'Accesorios'),
(4, 'Monitores'),
(5, 'Audio');

insert into productos (id_prod, nombre, precio, id_cat) values
(1, 'iPhone 15', 1200.00, 1),
(2, 'Funda Silicona', 25.00, 3),
(3, 'Cargador Rápido', 45.00, 3),
(4, 'MacBook Air', 1600.00, 2),
(5, 'Auriculares BT', 90.00, 5);

insert into detalle_venta (id_detalle, id_prod, cantidad, precio_unit) values
(1, 2, 300, 25.00),
(2, 3, 250, 45.00),
(3, 1, 2, 1200.00),
(4, 4, 1, 1600.00),
(5, 5, 5, 90.00);

select c.nombre_cat, p.nombre, sum(dv.cantidad) as total_vendido
from categorias c
join productos p on c.id_cat = p.id_cat
join detalle_venta dv on p.id_prod = dv.id_prod
where c.id_cat in (
    select p2.id_cat
    from productos p2
    join detalle_venta dv2 on p2.id_prod = dv2.id_prod
    group by p2.id_cat
    having sum(dv2.cantidad) > 500
)
group by c.id_cat, c.nombre_cat, p.id_prod, p.nombre
order by total_vendido desc;

select c.nombre_cat, avg(p.precio) as promedio_precio
from categorias c
join productos p on c.id_cat = p.id_cat
join detalle_venta dv on p.id_prod = dv.id_prod
group by c.id_cat, c.nombre_cat
having avg(p.precio) > 1500.00 and sum(dv.cantidad) >= 10;

select c.nombre_cat, sum(dv.cantidad * dv.precio_unit) as recaudacion_total
from categorias c
join productos p on c.id_cat = p.id_cat
join detalle_venta dv on p.id_prod = dv.id_prod
where p.precio < 100.00
group by c.id_cat, c.nombre_cat
having sum(dv.cantidad * dv.precio_unit) < 5000.00;
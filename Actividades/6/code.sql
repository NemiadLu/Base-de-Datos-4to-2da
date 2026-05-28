create database DeliveryComida;
use DeliveryComida;

create table restaurantes (
    id_rest int primary key,
    nombre varchar(100),
    zona varchar(50)
);

create table platos (
    id_plato int primary key,
    nombre_p varchar(100),
    precio decimal(10,2),
    id_rest int,
    foreign key (id_rest) references restaurantes(id_rest)
);

create table pedidos (
    id_ped int primary key,
    id_plato int,
    cantidad int,
    foreign key (id_plato) references platos(id_plato)
);

insert into restaurantes (id_rest, nombre, zona) values
(1, 'pizzeria don luca', 'norte'),
(2, 'sushi master', 'centro'),
(3, 'la parrilla de juan', 'sur'),
(4, 'pizza y mas', 'norte'),
(5, 'burger factory', 'oeste');

insert into platos (id_plato, nombre_p, precio, id_rest) values
(1, 'pizza muzarela', 1600.00, 1),
(2, 'combo sushi', 2500.00, 2),
(3, 'asado completo', 3000.00, 3),
(4, 'pizza especial', 1800.00, 4),
(5, 'hamburguesa doble', 1400.00, 5);

insert into pedidos (id_ped, id_plato, cantidad) values
(1, 1, 10),
(2, 2, 5),
(3, 3, 2),
(4, 4, 15),
(5, 5, 8);

select r.nombre, sum(pe.cantidad) as total_pedidos
from restaurantes r
join platos pl on r.id_rest = pl.id_rest
join pedidos pe on pl.id_plato = pe.id_plato
group by r.id_rest, r.nombre
having count(distinct pl.id_plato) > 5 and sum(pe.cantidad) > 200;

select r.nombre, avg(pl.precio * pe.cantidad) as promedio_ingresos
from restaurantes r
join platos pl on r.id_rest = pl.id_rest
join pedidos pe on pl.id_plato = pe.id_plato
where pl.precio > 1500
group by r.id_rest, r.nombre;

select pl.nombre_p, sum(pe.cantidad) as total_vendido
from platos pl
join restaurantes r on pl.id_rest = r.id_rest
join pedidos pe on pl.id_plato = pe.id_plato
where r.nombre like '%pizza%'
group by pl.id_plato, pl.nombre_p
order by total_vendido desc
limit 10;

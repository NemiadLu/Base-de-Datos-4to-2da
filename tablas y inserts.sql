drop database if exists carniceria;
create database carniceria;
use carniceria;

drop table if exists detalle_pedido;
drop table if exists pedido;
drop table if exists producto;
drop table if exists cliente;
drop table if exists carnicero;

create table carnicero (
    idcarnicero int auto_increment primary key,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    dni varchar(15) unique not null
);

create table cliente (
    idcliente int auto_increment primary key,
    nombre varchar(50) not null,
    telefono varchar(20),
    medio_pago varchar(30)
);

create table producto (
    idproducto int auto_increment primary key,
    corte varchar(50) not null,
    precio decimal(10, 2) not null
);

create table pedido (
    idpedido int auto_increment primary key,
    idcliente int not null,
    idcarnicero int not null,
    foreign key (idcliente) references cliente(idcliente),
    foreign key (idcarnicero) references carnicero(idcarnicero)
);

create table detalle_pedido (
    iddetalle int auto_increment primary key,
    idpedido int not null,
    idproducto int not null,
    cantidad int not null default 1,
    foreign key (idpedido) references pedido(idpedido),
    foreign key (idproducto) references producto(idproducto)
);

insert into carnicero (nombre, apellido, dni) values
('Juan', 'el caballo', '30111222'),
('Federico', 'bouzone', '32333444'),
('German', 'Garmendia', '35555666');

insert into cliente (nombre, telefono, medio_pago) values
('Marcelo Agacha', '1144556677', 'efectivo'),
('Juanpis Lopez', '1122334455', 'tarjeta de débito'),
('Mario Mario		', '1166778899', 'mercado pago');

insert into producto (corte, precio) values
('asado', 8500.00),
('vacio', 9200.00),
('milanesa', 6500.00);

insert into pedido (idcliente, idcarnicero) values
(1, 1),
(1, 1),
(2, 2);

insert into detalle_pedido (idpedido, idproducto, cantidad) values
(1, 1, 2),
(2, 2, 1),
(3, 3, 3);
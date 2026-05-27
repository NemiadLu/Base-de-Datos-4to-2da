create database if not exists consorcios;
use consorcios;

drop table if exists expensas;
drop table if exists unidades;
drop table if exists edificios;

create table edificios (
    id_edif int not null,
    nombre varchar(100) not null,
    direccion varchar(150) not null,
    primary key (id_edif)
);

create table unidades (
    id_unidad int not null,
    nro_piso int not null,
    id_edif int not null,
    primary key (id_unidad),
    foreign key (id_edif) references edificios(id_edif)
);

create table expensas (
    id_exp int not null,
    id_unidad int not null,
    monto decimal(10,2) not null,
    estado varchar(10) not null,
    primary key (id_exp),
    foreign key (id_unidad) references unidades(id_unidad),
    constraint chk_estado check (estado in ('Pago', 'Impago'))
);

insert into edificios (id_edif, nombre, direccion) values
(1, 'Torre Alvear', 'Av. Alvear 1200'),
(2, 'Edificio Plaza', 'Mitre 450'),
(3, 'Complejo Sol', 'Rivadavia 3100'),
(4, 'Torres del Parque', 'Caseros 800'),
(5, 'Mirador Norte', 'Libertador 5000');

insert into unidades (id_unidad, nro_piso, id_edif) values
(1, 1, 1),
(2, 2, 1),
(3, 1, 2),
(4, 5, 3),
(5, 12, 4);

insert into expensas (id_exp, id_unidad, monto, estado) values
(1, 1, 120000.00, 'Pago'),
(2, 2, 150000.00, 'Impago'),
(3, 3, 95000.00, 'Pago'),
(4, 4, 80000.00, 'Impago'),
(5, 5, 210000.00, 'Pago');

select ed.nombre, sum(ex.monto) as total_impago
from edificios ed
join unidades u on ed.id_edif = u.id_edif
join expensas ex on u.id_unidad = ex.id_unidad
where ex.estado = 'Impago'
group by ed.id_edif, ed.nombre
having sum(ex.monto) > 1000000.00 and count(distinct u.id_unidad) > 5;

select ed.nombre, avg(ex.monto) as promedio_pagado
from edificios ed
join unidades u on ed.id_edif = u.id_edif
join expensas ex on u.id_unidad = ex.id_unidad
where ex.estado = 'Pago'
group by ed.id_edif, ed.nombre
having avg(ex.monto) >= 20000.00;

select ed.nombre, sum(ex.monto) as recaudacion_efectiva
from edificios ed
join unidades u on ed.id_edif = u.id_edif
join expensas ex on u.id_unidad = ex.id_unidad
where ex.estado = 'Pago'
group by ed.id_edif, ed.nombre
order by recaudacion_efectiva desc
limit 3;
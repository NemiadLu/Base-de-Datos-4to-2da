create database if not exists gestion_gimnasio;
use gestion_gimnasio;

create table socios (
    id_socio int not null,
    nombre varchar(100) not null,
    fecha_alta date not null,
    primary key (id_socio)
);

create table planes (
    id_plan int not null,
    tipo varchar(50) not null,
    costo decimal(10,2) not null,
    primary key (id_plan)
);

create table pagos (
    id_pago int not null,
    id_socio int not null,
    id_plan int not null,
    monto decimal(10,2) not null,
    fecha date not null,
    primary key (id_pago),
    foreign key (id_socio) references socios(id_socio),
    foreign key (id_plan) references planes(id_plan)
);

insert into socios (id_socio, nombre, fecha_alta) values
(1, 'Juan Perez', '2025-01-10'),
(2, 'Maria Gomez', '2025-02-15'),
(3, 'Carlos Lopez', '2025-03-01'),
(4, 'Ana Rodriguez', '2025-03-20'),
(5, 'Luis Martinez', '2025-04-05');

insert into planes (id_plan, tipo, costo) values
(1, 'Principiante', 15000.00),
(2, 'Standard', 25000.00),
(3, 'Premium', 40000.00),
(4, 'Pase Libre', 50000.00),
(5, 'Corporativo', 30000.00);

insert into pagos (id_pago, id_socio, id_plan, monto, fecha) values
(1, 1, 3, 45000.00, '2026-01-05'),
(2, 1, 3, 45000.00, '2026-02-05'),
(3, 1, 3, 45000.00, '2026-03-05'),
(4, 2, 2, 25000.00, '2026-01-10'),
(5, 3, 3, 42000.00, '2026-01-12');

select s.nombre, count(p.id_pago) as cantidad_pagos
from socios s
join pagos p on s.id_socio = p.id_socio
group by s.id_socio, s.nombre
having sum(p.monto) > (select costo from planes where tipo = 'Premium' limit 1);

select pl.tipo, sum(p.monto) as ingreso_total
from planes pl
join pagos p on pl.id_plan = p.id_plan
group by pl.id_plan, pl.tipo
having count(distinct p.id_socio) > 50 and sum(p.monto) > 100000.00;

select s.nombre, pl.tipo, count(p.id_pago) as cantidad_pagos
from socios s
join pagos p on s.id_socio = p.id_socio
join planes pl on p.id_plan = pl.id_plan
group by s.id_socio, s.nombre, pl.id_plan, pl.tipo
having count(p.id_pago) > 3;
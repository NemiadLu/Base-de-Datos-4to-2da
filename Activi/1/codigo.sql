create database if not exists control_vuelos;
use control_vuelos;

create table aviones (
    id_avion int not null,
    modelo varchar(50) not null,
    capacidad int not null,
    primary key (id_avion)
);

create table vuelos (
    nro_vuelo int not null,
    origen varchar(100) not null,
    destino varchar(100) not null,
    id_avion int not null,
    fecha_vuelo date not null,
    primary key (nro_vuelo),
    foreign key (id_avion) references aviones(id_avion)
);

create table pasajeros_vuelo (
    id_ticket int not null,
    nro_vuelo int not null,
    precio_ticket decimal(12,2) not null,
    dni_pasajero varchar(20) not null,
    primary key (id_ticket),
    foreign key (nro_vuelo) references vuelos(nro_vuelo)
);

insert into aviones (id_avion, modelo, capacidad) values
(1, 'Boeing 737', 180),
(2, 'Airbus A320', 150),
(3, 'Boeing 777', 350),
(4, 'Embraer 190', 100),
(5, 'Bombardier CRJ', 75);

insert into vuelos (nro_vuelo, origen, destino, id_avion, fecha_vuelo) values
(101, 'EZEIZA', 'Miami', 3, now() - interval 10 day),
(102, 'EZEIZA', 'Madrid', 3, now() - interval 5 day),
(103, 'AEP', 'Mendoza', 1, now() - interval 20 day),
(104, 'EZEIZA', 'Santiago', 2, now() - interval 45 day),
(105, 'COR', 'Buenos Aires', 4, now() - interval 2 day);

insert into pasajeros_vuelo (id_ticket, nro_vuelo, precio_ticket, dni_pasajero) values
(1, 101, 1200000.00, '35111222'),
(2, 101, 1100000.00, '36333444'),
(3, 102, 950000.00, '37555666'),
(4, 102, 1150000.00, '38777888'),
(5, 103, 15000.00, '39999000');

select a.modelo, sum(pv.precio_ticket) as total_recaudado
from aviones a
join vuelos v on a.id_avion = v.id_avion
join pasajeros_vuelo pv on v.nro_vuelo = pv.nro_vuelo
group by a.id_avion, a.modelo
having sum(pv.precio_ticket) > 2000000.00 and count(pv.id_ticket) > 100;

select v.nro_vuelo, avg(pv.precio_ticket) as promedio_ticket
from vuelos v
join pasajeros_vuelo pv on v.nro_vuelo = pv.nro_vuelo
where v.origen = 'EZEIZA'
group by v.nro_vuelo
having avg(pv.precio_ticket) > 500.00;

select a.modelo, count(v.nro_vuelo) as total_vuelos
from aviones a
join vuelos v on a.id_avion = v.id_avion
where v.fecha_vuelo >= now() - interval 1 month
group by a.id_avion, a.modelo
having count(v.nro_vuelo) > 50;
create database StreamingMusica;
use StreamingMusica;

create table artistas (
    id_art int primary key,
    nombre varchar(100)
);

create table albumes (
    id_alb int primary key,
    titulo varchar(100),
    id_art int,
    foreign key (id_art) references artistas(id_art)
);

create table reproducciones (
    id_rep int primary key,
    id_alb int,
    cant_repro int,
    foreign key (id_alb) references albumes(id_alb)
);

insert into artistas (id_art, nombre) values
(1, 'los piojos'),
(2, 'soda stereo'),
(3, 'charly garcia'),
(4, 'fito paez'),
(5, 'spinetta');

insert into albumes (id_alb, titulo, id_art) values
(1, 'chactuchac', 1),
(2, 'signos', 2),
(3, 'clics modernos', 3),
(4, 'el amor despues del amor', 4),
(5, 'aratormenta', 5);

insert into reproducciones (id_rep, id_alb, cant_repro) values
(1, 1, 500000),
(2, 2, 1200000),
(3, 3, 900000),
(4, 4, 1500000),
(5, 5, 30000);

select a.nombre, sum(r.cant_repro) as total_reproducciones
from artistas a
join albumes al on a.id_art = al.id_art
join reproducciones r on al.id_alb = r.id_alb
group by a.id_art, a.nombre
having count(distinct al.id_alb) > 3 and sum(r.cant_repro) > 1000000;

select al.titulo, a.nombre, avg(r.cant_repro) as promedio_reproducciones
from albumes al
join artistas a on al.id_art = a.id_art
join reproducciones r on al.id_alb = r.id_alb
group by al.id_alb, al.titulo, a.nombre
having avg(r.cant_repro) > 50000;

select a.nombre, sum(r.cant_repro) as total_reproducciones
from artistas a
join albumes al on a.id_art = al.id_art
join reproducciones r on al.id_alb = r.id_alb
group by a.id_art, a.nombre
order by total_reproducciones asc
limit 1;
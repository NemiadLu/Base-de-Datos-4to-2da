DROP DATABASE IF EXISTS CN;
create database CN;
use CN;

DROP TABLE IF EXISTS SERIES;
DROP TABLE IF EXISTS PERSONAJES;
DROP TABLE IF EXISTS HABILIDADES_ESPECIALES;
DROP TABLE IF EXISTS EPISODIOS;
DROP TABLE IF EXISTS ENEMIGOS_HISTORICOS;

create table SERIES(
   id_serie int primary key,
   nombre_serie varchar(100),
   anio_estreno int
);

create table PERSONAJES(
   id_personaje int primary key,
   nombre_personaje varchar(100),
   rol varchar(100),
   nivel_energia int,
   su_serie varchar(100),
   id_serie int,
   foreign key (id_serie) references SERIES(id_serie)
);

create table HABILIDADES_ESPECIALES(
   id_habilidad int primary key,
   nombre_habilidad varchar(100),
   tipo_habilidad varchar(50),
   id_personaje int,
   foreign key (id_personaje) references PERSONAJES(id_personaje)
);

create table EPISODIOS(
   id_episodio int primary key,
   titulo_episodio varchar(100),
   duracion_minutos int,
   rating_audiencia int,
   capítulos_emitidos int,
   id_serie int,
   foreign key (id_serie) references SERIES(id_serie)
);

create table ENEMIGOS_HISTORICOS(
   id_rivalidad  int primary key,
   id_heroe int,
   id_villano int,
   foreign key (id_heroe) references PERSONAJES(id_personaje),
   foreign key (id_villano) references PERSONAJES(id_personaje),
   encuentros_totales int
);

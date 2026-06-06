drop database if exists farmacia_stock;
create database farmacia_stock;
use farmacia_stock;

drop table if exists lotes;
drop table if exists medicamentos;
drop table if exists laboratorios;
create table laboratorios (
    id_lab int not null,
    nombre_lab varchar(100) not null,
    pais_origen varchar(50),
    telefono varchar(20),
    constraint pk_laboratorios primary key (id_lab)
);

create table medicamentos (
    id_med int not null,
    nombre_comercial varchar(100) not null,
    monodroga varchar(100) not null,
    precio_venta decimal(10, 2) not null,
    id_lab int not null,
    constraint pk_medicamentos primary key (id_med),
    constraint fk_medicamentos_laboratorios foreign key (id_lab) 
        references laboratorios(id_lab)
);

create table lotes (
    id_lote int not null,
    id_med int not null,
    stock_actual int not null,
    precio_costo decimal(10, 2) not null,
    fecha_vencimiento date not null,
    ubicacion_gondola varchar(20) not null,
    constraint pk_lotes primary key (id_lote),
    constraint fk_lotes_medicamentos foreign key (id_med) 
        references medicamentos(id_med)
);
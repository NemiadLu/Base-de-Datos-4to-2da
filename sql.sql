drop database if exists examen;
create database examen;
use examen;

drop table if exists tenicoq;
drop table if exists resultados;
drop table if exists quimicos_detectados;
drop table if exists clientes;
drop table if exists instituciones;
drop table if exists analisis_de_muestras;
drop table if exists empresas;
drop table if exists muestras;

CREATE TABLE tecnicoq (
  idtecnicoq int primary key auto_increment,
  nombre varchar(100),
  experiencia int,
  dni int
);

CREATE TABLE resultados (
  idresultados int primary key auto_increment,
  idanalisis int,
  informacionRF varchar(400),
  KEY pk (idresultados),
  KEY fk (idanalisis)
);

CREATE TABLE quimicos_detectados  (
  idquimicod int primary key auto_increment,
  idresultados int,
  informacionQD varchar(400),
  FOREIGN KEY (idresultado)
      REFERENCES resultados(idresultado),
);

CREATE TABLE clientes (
  idcliente  int primary key auto_increment,
  nombre varchar(100),
  dni int,
  idinstitucion int,
  KEY fk (idinstitucion)
);

CREATE TABLE instituciones(
  idinstitucion int primary key auto_increment,
  idanalisis int,
  nombre varchar(100),
  direccion varchar(200),
  FOREIGN KEY (idinstitucion)
      REFERENCES clientes(idinstitucion),
  FOREIGN KEY (idanalisis)
      REFERENCES analisis_de_muestras(idmuestra),
);

CREATE TABLE analisis_de_muestras (
  idanalisis int primary key auto_increment,
  idmuestra int,
  idtecnicoq int,
  fechaAna varchar(100),
  FOREIGN KEY (idtecnicoq)
      REFERENCES tecnicoq(idtecnicoq),
  FOREIGN KEY (idanalisis)
      REFERENCES instituciones(idanalisis),
  FOREIGN KEY (idmuestra)
      REFERENCES empresas(idmuestra)
);

CREATE TABLE empresas (
  idempresa  int primary key auto_increment,
  nombre varchar(100),
  direccion varchar(200),
  idmuestra int,
  FOREIGN KEY (idmuestra)
      REFERENCES empresas(idmuestra)
);

CREATE TABLE muestras (
  idmuestra int primary key auto_increment,
  compuestoQ varchar(5),
  nombre varchar(100),
  informacionI varchar(900),
  FOREIGN KEY (idmuestra)
      REFERENCES empresas(idmuestra),
);


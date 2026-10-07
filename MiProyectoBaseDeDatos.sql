-- Crear la base de datos
drop database if exists curso_sql;

CREATE DATABASE curso_sql;
USE curso_sql;
-- Crear la tabla de usuarios
drop table if exists usuarios;

CREATE TABLE usuarios (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
contrasenia VARCHAR(100) NOT NULL,
fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

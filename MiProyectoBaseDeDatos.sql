-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS curso_sql;
USE curso_sql;
-- Crear la tabla de usuarios
CREATE TABLE IF NOT EXISTS usuarios (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
contrasenia VARCHAR(100) NOT NULL,
fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
create database mi_escuela;
use mi_escuela;
-- 1. Tablas
CREATE TABLE usuarios (
id INT AUTO_INCREMENT PRIMARY KEY,
usuario VARCHAR(50) UNIQUE,
password VARCHAR(255)
);
CREATE TABLE alumnos (
id INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
edad INT
);
-- Creamos nuestro usuario de prueba
INSERT INTO usuarios (usuario, password) VALUES ('profe', '1234');

-- 2. Procedimiento para el Login
CREATE PROCEDURE sp_validar_usuario(IN p_user VARCHAR(50), IN p_pass
VARCHAR(255))

SELECT id, usuario FROM usuarios WHERE usuario = p_user AND password = p_pass;
-- 3. Procedimiento para Guardar Alumno
CREATE PROCEDURE sp_insertar_alumno(IN p_nombre VARCHAR(100), IN p_edad INT)

INSERT INTO alumnos (nombre, edad) VALUES (p_nombre, p_edad);

-- 4. Procedimiento para Buscar al Mayor
CREATE PROCEDURE sp_obtener_alumno_mayor()

SELECT nombre, edad FROM alumnos
WHERE edad = (SELECT MAX(edad) FROM alumnos) LIMIT 1;

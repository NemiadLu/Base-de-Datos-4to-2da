create database Veterinario;
use Veterinario;

CREATE TABLE veterinario (
    id_veterinario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    telefono VARCHAR(20),
    especialidad VARCHAR(50)
);

CREATE TABLE duenio (
    id_duenio INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    direccion VARCHAR(150),
    telefono VARCHAR(20)
);

CREATE TABLE mascota (
    id_mascota INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    tipo_especie VARCHAR(50), -- perro, gato, etc.
    edad INT,
    sexo VARCHAR(10),
    color VARCHAR(30),
    id_duenio INT,
    FOREIGN KEY (id_duenio) REFERENCES duenio(id_duenio)
);

CREATE TABLE consulta (
    id_consulta INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE,
    diagnostico TEXT,
    id_veterinario INT,
    id_mascota INT,
    FOREIGN KEY (id_veterinario) REFERENCES veterinario(id_veterinario),
    FOREIGN KEY (id_mascota) REFERENCES mascota(id_mascota)
);

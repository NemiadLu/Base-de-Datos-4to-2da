CREATE DATABASE Concesionario;
USE Concesionario;

CREATE TABLE Cliente (
    dni VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(50),
    direccion VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE Coche (
    matricula VARCHAR(15) PRIMARY KEY,
    modelo VARCHAR(50),
    marca VARCHAR(50),
    color VARCHAR(20),
    tipo ENUM('Nuevo', 'Usado'),
    unidades_stock INT DEFAULT NULL, -- Solo para nuevos
    km_recorridos INT DEFAULT NULL,   -- Solo para usados
    dni_cliente VARCHAR(20),
    FOREIGN KEY (dni_cliente) REFERENCES Cliente(dni)
);

CREATE TABLE Mecanico (
    dni VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(50),
    fecha_contratacion DATE,
    salario DECIMAL(10,2)
);

CREATE TABLE Reparacion (
    id_mecanico VARCHAR(20),
    id_coche VARCHAR(15),
    fecha DATE,
    horas INT,
    PRIMARY KEY (id_mecanico, id_coche, fecha),
    FOREIGN KEY (id_mecanico) REFERENCES Mecanico(dni),
    FOREIGN KEY (id_coche) REFERENCES Coche(matricula)
);
INSERT INTO Cliente VALUES ('1A', 'Carlos', 'Sainz', 'Madrid 1', '111'), ('2B', 'Lewis', 'Hamilton', 'London 2', '222'), ('3C', 'Max', 'Verstappen', 'Hasselt 3', '333'), ('4D', 'Fernando', 'Alonso', 'Oviedo 4', '444'), ('5E', 'Checo', 'Perez', 'Guadalajara 5', '555');
INSERT INTO Coche VALUES ('AAA111', 'Corolla', 'Toyota', 'Blanco', 'Nuevo', 10, NULL, '1A'), ('BBB222', 'Civic', 'Honda', 'Negro', 'Usado', NULL, 50000, '2B'), ('CCC333', 'Mustang', 'Ford', 'Rojo', 'Nuevo', 2, NULL, '3C'), ('DDD444', '911', 'Porsche', 'Gris', 'Usado', NULL, 12000, '4D'), ('EEE555', 'Etios', 'Toyota', 'Azul', 'Nuevo', 5, NULL, '5E');
INSERT INTO Mecanico VALUES ('M1', 'Roberto', 'Maza', '2020-01-01', 1500), ('M2', 'Esteban', 'Quito', '2021-03-15', 1400), ('M3', 'Mario', 'Bross', '2019-05-20', 1800), ('M4', 'Luigi', 'Verde', '2022-06-10', 1300), ('M5', 'Fran', 'Cesco', '2023-01-10', 1200);
INSERT INTO Reparacion VALUES ('M1', 'AAA111', '2024-01-10', 3), ('M2', 'BBB222', '2024-01-11', 5), ('M3', 'CCC333', '2024-01-12', 2), ('M1', 'DDD444', '2024-01-13', 8), ('M5', 'EEE555', '2024-01-14', 1);

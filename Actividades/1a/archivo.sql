CREATE DATABASE TiendaOnline;
USE TiendaOnline;

CREATE TABLE Vendedor (
    id_vendedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50)
);

CREATE TABLE Repartidor (
    id_repartidor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    empresa_envio VARCHAR(50)
);

CREATE TABLE Ropa (
    id_prenda INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(100),
    precio DECIMAL(10,2),
    stock INT
);
CREATE TABLE Venta (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    tipo_factura CHAR(1), -- A, B o C
    fecha DATE,
    estado_pedido VARCHAR(20), -- 'Enviado', 'Entregado', etc.
    id_vendedor INT,
    id_repartidor INT,
    FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id_vendedor),
    FOREIGN KEY (id_repartidor) REFERENCES Repartidor(id_repartidor)
);
INSERT INTO Vendedor (nombre, apellido) VALUES ('Lucas', 'Pérez'), ('Marina', 'Sosa'), ('Fabián', 'Duarte');
INSERT INTO Repartidor (nombre, empresa_envio) VALUES ('Jorge', 'Andreani'), ('Raúl', 'Correo Argentino'), ('Micaela', 'PedidosYa');
INSERT INTO Ropa (descripcion, precio, stock) VALUES ('Remera Algodón', 15000.00, 50), ('Pantalón Jean', 35000.00, 30), ('Campera Cuero', 85000.00, 10);
INSERT INTO Venta (tipo_factura, fecha, estado_pedido, id_vendedor, id_repartidor) VALUES 
('A', '2024-05-01', 'Entregado', 1, 1),
('B', '2024-05-02', 'En Camino', 2, 2),
('C', '2024-05-03', 'Pendiente', 3, 3);

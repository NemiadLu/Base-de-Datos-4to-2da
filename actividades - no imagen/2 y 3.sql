create database Productos;
use Productos;
#2
CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(50) -- camisas, pantalones, etc.
);

CREATE TABLE producto (
    codigo_producto INT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10,2),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE vendedor (
    id_vendedor INT PRIMARY KEY,
    nombre VARCHAR(100),
    area_trabajo VARCHAR(50)
);

CREATE TABLE venta (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE,
    id_cliente INT,
    id_vendedor INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor)
);

CREATE TABLE detalle_venta (
    id_venta INT,
    codigo_producto INT,
    cantidad INT,
    PRIMARY KEY (id_venta, codigo_producto),
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
    FOREIGN KEY (codigo_producto) REFERENCES producto(codigo_producto)
);

# 3
INSERT INTO categoria (nombre_categoria) VALUES 
('Camisas'),
('Pantalones'),
('Casacas'),
('Zapatos');
INSERT INTO producto (codigo_producto, nombre, precio, id_categoria) VALUES 
(101, 'Camisa Slim Fit Blanca', 29.99, 1),
(102, 'Camisa de Lino Azul', 35.50, 1),
(201, 'Jeans Azul Clásico', 45.00, 2),
(202, 'Pantalón Chino Beige', 39.90, 2),
(301, 'Casaca de Cuero Negra', 89.99, 3),
(401, 'Mocasines de Cuero Café', 65.00, 4);
INSERT INTO cliente (id_cliente, nombre, telefono) VALUES 
(7001, 'Carlos Mendoza', '555-1234'),
(7002, 'Ana Rodríguez', '555-5678'),
(7003, 'Luis Martínez', '555-9012');
INSERT INTO vendedor (id_vendedor, nombre, area_trabajo) VALUES 
(901, 'Sofía López', 'Zona de Caballeros'),
(902, 'Diego Torres', 'Zona de Calzado'),
(903, 'Elena Gómez', 'Zona de Damas');
INSERT INTO venta (fecha, id_cliente, id_vendedor) VALUES 
('2026-05-15', 7001, 901);
INSERT INTO venta (fecha, id_cliente, id_vendedor) VALUES 
('2026-05-16', 7002, 902);
INSERT INTO venta (fecha, id_cliente, id_vendedor) VALUES 
('2026-05-17', 7003, 901);
INSERT INTO detalle_venta (id_venta, codigo_producto, cantidad) VALUES 
(1, 101, 2), -- 2 camisas blancas
(1, 201, 1); -- 1 jean azul
INSERT INTO detalle_venta (id_venta, codigo_producto, cantidad) VALUES 
(2, 401, 1);
INSERT INTO detalle_venta (id_venta, codigo_producto, cantidad) VALUES 
(3, 301, 1),
(3, 202, 2);
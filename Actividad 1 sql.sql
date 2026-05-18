CREATE DATABASE EMPRESA;
USE EMPRESA;

# Parte A
CREATE TABLE EMPLEADOS (
    IDempleado INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(18),
    Apellido VARCHAR(20) NOT NULL,
    Sector ENUM('Adm', 'Ventas', 'Compras', 'RRHH'),
    Edad INT NOT NULL DEFAULT 35,
    Sexo ENUM('F', 'M') NOT NULL,
    Barrio_vivienda VARCHAR(50) DEFAULT 'Belgrano',
    CodPostal INT(4),
    Ingreso YEAR NOT NULL,
    Sueldo DECIMAL(10,2) NOT NULL,
    Antiguedad DECIMAL(10,2) NOT NULL DEFAULT 250.00,
    Celular VARCHAR(20) NOT NULL
);

# Parte B:

INSERT INTO EMPLEADOS (Nombre, Apellido, Sector, Edad, Sexo, Barrio_vivienda, CodPostal, Ingreso, Sueldo, Antiguedad, Celular) VALUES 
('Ricardo', 'Darín', 'Ventas', 65, 'M', 'Palermo', 1425, 2011, 150000, 5000, '11223344'),
('Susana', 'Giménez', 'RRHH', 70, 'F', 'Belgrano', 1426, 2011, 200000, 8000, '11334455'),
('Guillermo', 'Francella', 'Adm', 68, 'M', 'Almagro', 1178, 2011, 180000, 6000, '11445566'),
('Natalia', 'Oreiro', 'RRHH', 46, 'F', 'Flores', 1406, 2011, 120000, 3000, '11556677'),
('Diego', 'Peretti', 'Compras', 61, 'M', 'Almagro', 1178, 2011, 140000, 4500, '11667788'),
('Cecilia', 'Roth', 'RRHH', 67, 'F', 'Belgrano', 1426, 2015, 130000, 2500, '11778899'),
('Oscar', 'Martínez', 'Ventas', 74, 'M', 'Flores', 1406, 2010, 160000, 7000, '11889900'),
('Dolores', 'Fonzi', 'Adm', 45, 'F', 'Belgrano', 1426, 2012, 110000, 1500, '11990011'),
('Chino', 'Darín', 'Compras', 35, 'M', 'Almagro', 1178, 2018, 95000, 800, '11001122'),
('Graciela', 'Borges', 'RRHH', 82, 'F', 'Recoleta', 1425, 2005, 250000, 10000, '11122233'),
('Luis', 'Brandoni', 'Ventas', 83, 'M', 'Flores', 1406, 1995, 170000, 9000, '11233344'),
('Nancy', 'Dupláa', 'Adm', 54, 'F', 'Caballito', 1405, 2020, 105000, 500, '11344455'),
('Pablo', 'Echarri', 'Compras', 54, 'M', 'Flores', 1406, 2019, 108000, 600, '11455566'),
('Erica', 'Rivas', 'Ventas', 49, 'F', 'Almagro', 1178, 2014, 115000, 1200, '11566677'),
('Leonardo', 'Sbaraglia', 'Adm', 53, 'M', 'Flores', 1406, 2011, 145000, 2000, '11677788');

# Parte C:


# 1. Listado completo de la tabla
SELECT * FROM EMPLEADOS;

#  2. Nombre y apellido de los que viven en Belgrano
SELECT Nombre, Apellido FROM EMPLEADOS WHERE Barrio_vivienda = 'Belgrano';

# 3. Apellido y edad de los que ingresaron entre el 2010 y 2012
SELECT Apellido, Edad FROM EMPLEADOS WHERE Ingreso BETWEEN 2010 AND 2012;

# 4. Cuántas mujeres pertenecen a recursos humanos
SELECT COUNT(*) AS Total_Mujeres_RRHH FROM EMPLEADOS WHERE Sexo = 'F' AND Sector = 'RRHH';

# 5. Apellido, Sector, teléfono celular de todos los empleados
SELECT Apellido, Sector, Celular FROM EMPLEADOS;

# 6. Nombre, apellido, sueldo de los que viven en Almagro o Flores (Descendente)
SELECT Nombre, Apellido, Sueldo 
FROM EMPLEADOS 
WHERE Barrio_vivienda IN ('Almagro', 'Flores') 
ORDER BY Apellido DESC;

# 7. Cantidad total de empleados
SELECT COUNT(*) AS Cantidad_Total FROM EMPLEADOS;

# 8. Nombre y apellido del empleado mayor y del más joven
SELECT Nombre, Apellido, Edad, 'Mayor' AS Tipo FROM EMPLEADOS WHERE Edad = (SELECT MAX(Edad) FROM EMPLEADOS)
UNION
SELECT Nombre, Apellido, Edad, 'Joven' AS Tipo FROM EMPLEADOS WHERE Edad = (SELECT MIN(Edad) FROM EMPLEADOS);

# 9. Promedio de edades
SELECT AVG(Edad) AS Promedio_General FROM EMPLEADOS;

# 10. Promedio de edades del personal de recursos humanos
SELECT AVG(Edad) AS Promedio_RRHH FROM EMPLEADOS WHERE Sector = 'RRHH';

CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE Autor (
    id_autor INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Libro (
    id_libro INT PRIMARY KEY,
    titulo VARCHAR(150),
    isbn VARCHAR(20),
    editorial VARCHAR(100),
    paginas INT
);

CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(150),
    telefono VARCHAR(20)
);
CREATE TABLE Autor_Libro (
    id_autor INT,
    id_libro INT,
    PRIMARY KEY (id_autor, id_libro),
    FOREIGN KEY (id_autor) REFERENCES Autor(id_autor),
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro)
);

CREATE TABLE Ejemplar (
    id_ejemplar INT PRIMARY KEY,
    localizacion VARCHAR(100),
    id_libro INT,
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro)
);

CREATE TABLE Prestamo (
    id_usuario INT,
    id_ejemplar INT,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    PRIMARY KEY (id_usuario, id_ejemplar, fecha_prestamo),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_ejemplar) REFERENCES Ejemplar(id_ejemplar)
);

INSERT INTO Autor VALUES (1, 'Borges'), (2, 'Cortázar'), (3, 'Sábato'), (4, 'Mistral'), (5, 'Neruda');
INSERT INTO Libro VALUES (1, 'Ficciones', '123-A', 'Sudamericana', 200), (2, 'Rayuela', '124-B', 'Alfaguara', 600), (3, 'El Túnel', '125-C', 'Planeta', 150), (4, 'Desolación', '126-D', 'Andrés Bello', 180), (5, 'Canto General', '127-E', 'Pehuén', 400);
INSERT INTO Autor_Libro VALUES (1,1), (2,2), (3,3), (4,4), (5,5);
INSERT INTO Ejemplar VALUES (101, 'Pasillo A1', 1), (102, 'Pasillo A1', 1), (103, 'Pasillo B2', 2), (104, 'Pasillo C1', 3), (105, 'Pasillo D4', 4);
INSERT INTO Usuario VALUES (1, 'Juan Pérez', 'Calle 123', '555-111'), (2, 'Ana López', 'Av. Siempreviva', '555-222'), (3, 'Luis Gómez', 'Ruta 9', '555-333'), (4, 'Marta Díaz', 'Pueyrredón 10', '555-444'), (5, 'Pedro Ruiz', 'Belgrano 500', '555-555');
INSERT INTO Prestamo VALUES (1, 101, '2024-05-01', '2024-05-10'), (2, 103, '2024-05-02', '2024-05-12'), (3, 104, '2024-05-03', '2024-05-13'), (4, 105, '2024-05-04', '2024-05-14'), (5, 102, '2024-05-05', '2024-05-15');

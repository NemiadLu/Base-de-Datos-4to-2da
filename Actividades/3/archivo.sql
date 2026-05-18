CREATE DATABASE LigaFutbol;
USE LigaFutbol;

CREATE TABLE Equipo (
    id_equipo INT PRIMARY KEY,
    nombre VARCHAR(50),
    estadio VARCHAR(50),
    aforo INT,
    fundacion YEAR,
    ciudad VARCHAR(50)
);

CREATE TABLE Presidente (
    dni VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(50),
    fecha_nacimiento DATE,
    id_equipo INT UNIQUE, -- 1 a 1
    año_eleccion YEAR,
    FOREIGN KEY (id_equipo) REFERENCES Equipo(id_equipo)
);

CREATE TABLE Jugador (
    id_jugador INT PRIMARY KEY,
    nombre VARCHAR(50),
    fecha_nacimiento DATE,
    posicion VARCHAR(30),
    id_equipo INT,
    FOREIGN KEY (id_equipo) REFERENCES Equipo(id_equipo)
);

CREATE TABLE Partido (
    id_partido INT PRIMARY KEY,
    fecha DATE,
    goles_casa INT,
    goles_fuera INT
);

CREATE TABLE Gol (
    id_gol INT AUTO_INCREMENT PRIMARY KEY,
    minuto INT,
    descripcion TEXT,
    id_partido INT,
    id_jugador INT,
    FOREIGN KEY (id_partido) REFERENCES Partido(id_partido),
    FOREIGN KEY (id_jugador) REFERENCES Jugador(id_jugador)
);
INSERT INTO Equipo VALUES (1, 'Real Madrid', 'Bernabéu', 81000, 1902, 'Madrid'), (2, 'FC Barcelona', 'Camp Nou', 99000, 1899, 'Barcelona'), (3, 'Atlético Madrid', 'Metropolitano', 68000, 1903, 'Madrid'), (4, 'Sevilla FC', 'Pizjuán', 43000, 1890, 'Sevilla'), (5, 'Valencia CF', 'Mestalla', 49000, 1919, 'Valencia');
INSERT INTO Presidente VALUES ('P1', 'Florentino', 'Pérez', '1947-03-08', 1, 2009), ('P2', 'Joan', 'Laporta', '1962-06-29', 2, 2021), ('P3', 'Enrique', 'Cerezo', '1948-02-27', 3, 2003), ('P4', 'José', 'Castro', '1958-01-01', 4, 2013), ('P5', 'Layhoon', 'Chan', '1965-01-01', 5, 2022);
INSERT INTO Jugador VALUES (10, 'Luka Modric', '1985-09-09', 'Centrocampista', 1), (11, 'Robert Lewandowski', '1988-08-21', 'Delantero', 2), (12, 'Antoine Griezmann', '1991-03-21', 'Delantero', 3), (13, 'Ivan Rakitic', '1988-03-10', 'Centrocampista', 4), (14, 'José Gayà', '1995-05-25', 'Defensa', 5);
INSERT INTO Partido VALUES (1, '2024-04-20', 2, 1), (2, '2024-04-21', 0, 0), (3, '2024-04-22', 1, 3), (4, '2024-04-23', 2, 2), (5, '2024-04-24', 4, 0);
INSERT INTO Gol (minuto, descripcion, id_partido, id_jugador) VALUES (20, 'Cabezazo', 1, 10), (45, 'Penalti', 1, 11), (10, 'Volea', 3, 12), (88, 'Jugada colectiva', 4, 13), (30, 'Remate cerca', 5, 14);

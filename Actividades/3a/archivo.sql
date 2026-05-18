CREATE DATABASE Campeonato;
USE Campeonato;

CREATE TABLE Estadio (
    id_estadio INT PRIMARY KEY AUTO_INCREMENT,
    nombre_estadio VARCHAR(50)
);

CREATE TABLE Equipo (
    id_equipo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_equipo VARCHAR(50)
);

CREATE TABLE Jugador (
    id_jugador INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    posicion VARCHAR(20), -- 'Arquero', 'Defensor', etc.
    id_equipo INT,
    FOREIGN KEY (id_equipo) REFERENCES Equipo(id_equipo)
);

CREATE TABLE Partido (
    id_partido INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE,
    id_equipo_casa INT,
    id_equipo_fuera INT,
    goles_casa INT,
    goles_fuera INT,
    resultado VARCHAR(20),
    id_estadio INT,
    FOREIGN KEY (id_equipo_casa) REFERENCES Equipo(id_equipo),
    FOREIGN KEY (id_equipo_fuera) REFERENCES Equipo(id_equipo),
    FOREIGN KEY (id_estadio) REFERENCES Estadio(id_estadio)
);

INSERT INTO Estadio (nombre_estadio) VALUES ('Monumental'), ('Bombonera'), ('Cilindro');
INSERT INTO Equipo (nombre_equipo) VALUES ('River Plate'), ('Boca Juniors'), ('Racing Club');
INSERT INTO Jugador (nombre, posicion, id_equipo) VALUES ('Franco Armani', 'Arquero', 1), ('Edinson Cavani', 'Delantero', 2), ('Juanfer Quintero', 'Mediocampista', 3);
INSERT INTO Partido (fecha, id_equipo_casa, id_equipo_fuera, goles_casa, goles_fuera, resultado, id_estadio) VALUES 
('2024-05-15', 1, 2, 2, 1, 'Gana Local', 1),
('2024-05-20', 2, 3, 0, 0, 'Empate', 2),
('2024-05-25', 3, 1, 1, 3, 'Gana Visitante', 3);

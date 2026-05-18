CREATE DATABASE Clinica;
USE Clinica;

CREATE TABLE Especialidad (
    id_especialidad INT PRIMARY KEY AUTO_INCREMENT,
    nombre_especialidad VARCHAR(50)
);

CREATE TABLE Medico (
    id_medico INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50)
);
CREATE TABLE Medico_Especialidad (
    id_medico INT,
    id_especialidad INT,
    PRIMARY KEY (id_medico, id_especialidad),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico),
    FOREIGN KEY (id_especialidad) REFERENCES Especialidad(id_especialidad)
);

CREATE TABLE Turno (
    id_turno INT PRIMARY KEY AUTO_INCREMENT,
    paciente VARCHAR(50),
    fecha DATE,
    hora TIME,
    estado VARCHAR(20), -- 'Confirmado', 'Cancelado'
    id_medico INT,
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico)
);
INSERT INTO Especialidad (nombre_especialidad) VALUES ('Pediatría'), ('Cardiología'), ('Dermatología');
INSERT INTO Medico (nombre, apellido) VALUES ('Federico', 'Bouzón'), ('Elena', 'Rivas'), ('Carlos', 'Paz');
INSERT INTO Medico_Especialidad VALUES (1, 1), (2, 2), (3, 3);
INSERT INTO Turno (paciente, fecha, hora, estado, id_medico) VALUES 
('Juan Gómez', '2024-06-10', '09:00:00', 'Confirmado', 1),
('Ana Torres', '2024-06-10', '10:30:00', 'Pendiente', 2),
('Luis Meza', '2024-06-11', '11:00:00', 'Confirmado', 3);

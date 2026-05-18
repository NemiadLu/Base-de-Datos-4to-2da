SELECT M.nombre, M.apellido, E.nombre_especialidad 
FROM Medico M
JOIN Medico_Especialidad ME ON M.id_medico = ME.id_medico
JOIN Especialidad E ON ME.id_especialidad = E.id_especialidad;

SELECT * FROM Turno;

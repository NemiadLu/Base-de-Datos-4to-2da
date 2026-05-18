SELECT P.fecha, E1.nombre_equipo AS Local, E2.nombre_equipo AS Visitante, P.goles_casa, P.goles_fuera 
FROM Partido P
JOIN Equipo E1 ON P.id_equipo_casa = E1.id_equipo
JOIN Equipo E2 ON P.id_equipo_fuera = E2.id_equipo;
SELECT nombre, posicion FROM Jugador;


SELECT 
    S.id_serie,
    S.nombre_serie,
    S.anio_estreno,
    P.nombre_personaje,
    P.rol,
    P.nivel_energia
FROM SERIES S
INNER JOIN PERSONAJES P ON S.id_serie = P.id_serie;
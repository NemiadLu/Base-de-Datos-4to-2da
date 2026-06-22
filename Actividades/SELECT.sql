SELECT
    P.id_personaje,
    P.nombre_personaje,
    S.nombre_serie,
    P.rol,
    P.nivel_energia,
    S.id_serie
FROM SERIES S
INNER JOIN PERSONAJES P ON S.id_serie = P.id_serie;
select car.nombre, car.apellido, count(p.idpedido) as atenciones
from pedido p
join carnicero car on p.idcarnicero = car.idcarnicero
group by car.idcarnicero, car.nombre, car.apellido
order by atenciones desc
limit 1;
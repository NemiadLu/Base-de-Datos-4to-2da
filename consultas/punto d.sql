select 
    c.nombre as cliente, 
    p.idpedido, 
    group_concat(prod.corte separator ', ') as contenido,
    car.nombre as carnicero,
    sum(prod.precio * dp.cantidad) as total
from pedido p
join cliente c on p.idcliente = c.idcliente
join carnicero car on p.idcarnicero = car.idcarnicero
join detalle_pedido dp on p.idpedido = dp.idpedido
join producto prod on dp.idproducto = prod.idproducto
group by p.idpedido, c.nombre, car.nombre
order by total desc
limit 1;
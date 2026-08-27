select c.nombre, count(p.idpedido) as total_compras
from pedido p
join cliente c on p.idcliente = c.idcliente
group by c.idcliente, c.nombre
order by total_compras desc
limit 1;
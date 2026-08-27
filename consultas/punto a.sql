select p.corte, sum(dp.cantidad) as total_vendida
from detalle_pedido dp
join producto p on dp.idproducto = p.idproducto
group by p.idproducto, p.corte
order by total_vendida desc
limit 1;
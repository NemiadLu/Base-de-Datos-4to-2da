select prod.corte, ifnull(sum(dp.cantidad), 0) as cantidad_ventas
from producto prod
left join detalle_pedido dp on prod.idproducto = dp.idproducto
group by prod.idproducto, prod.corte;
select 
    m.nombre_comercial, 
    m.precio_venta, 
    lo.precio_costo, 
    (m.precio_venta - lo.precio_costo) as margen_ganancia_unitario
from lotes lo
inner join medicamentos m on lo.id_med = m.id_med
order by margen_ganancia_unitario desc;
select 
    l.nombre_lab, 
    sum(lo.stock_actual) as stock_total_acumulado
from lotes lo
inner join medicamentos m on lo.id_med = m.id_med
inner join laboratorios l on m.id_lab = l.id_lab
where lo.fecha_vencimiento between '2025-01-01' and '2025-12-31'
  and m.id_med between 100 and 500
group by l.nombre_lab
having sum(lo.stock_actual) < 200
order by stock_total_acumulado asc
limit 5;
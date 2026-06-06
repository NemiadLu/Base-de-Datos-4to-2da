select count(lo.id_lote) as cantidad_total_lotes
from lotes lo
inner join medicamentos m on lo.id_med = m.id_med
where lo.ubicacion_gondola = 'a-1'
  and m.monodroga like '%amoxi%';
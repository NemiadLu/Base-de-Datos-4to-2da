SELECT descripcion, precio FROM Ropa;

SELECT V.id_venta, V.tipo_factura, Ven.nombre AS Vendedor 
FROM Venta V
JOIN Vendedor Ven ON V.id_vendedor = Ven.id_vendedor;

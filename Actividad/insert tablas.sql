insert into laboratorios (id_lab, nombre_lab, pais_origen, telefono) values
(1, 'bayer', 'alemania', '1145678901'),
(2, 'astrazenecca', 'reino unido', '1145678902'),
(3, 'roche', 'suiza', '1145678903'),
(4, 'bagó', 'argentina', '1145678904'),
(5, 'gsk', 'reino unido', '1145678905');

insert into medicamentos (id_med, nombre_comercial, monodroga, precio_venta, id_lab) values
(105, 'amoxidal', 'amoxicilina', 1500.00, 4),
(210, 'aspirina', 'ácido acetilsalicílico', 500.00, 1),
(315, 'novalgina', 'dipirona', 800.00, 3),
(420, 'amoxoplus', 'amoxicilina + clavulánico', 2200.00, 2),
(450, 'lotrial', 'enalapril', 1200.00, 4);

insert into lotes (id_lote, id_med, stock_actual, precio_costo, fecha_vencimiento, ubicacion_gondola) values
(1001, 105, 50, 900.00, '2025-05-20', 'a-1'),
(1002, 210, 120, 300.00, '2025-08-15', 'b-2'),
(1003, 315, 80, 450.00, '2026-03-10', 'a-1'),
(1004, 420, 30, 1400.00, '2025-11-02', 'a-1'),
(1005, 450, 150, 700.00, '2025-01-25', 'c-3');
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Alumno Destacado</title>
<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
<div class="tarjeta" style="border-top: 5px solid #28a745;">
<h3 style="text-align: center;">🏆 Alumno Destacado</h3>
<h1 class="mayor-texto"> <?php echo $nombre_mayor; ?> </h1>

<p class="mayor-sub">Tiene <strong> <?php echo $edad_mayor; ?> </strong> años
de edad.</p>
<div style="text-align: center; margin-top: 20px;">
<a href="principal.php" class="btn-verde">Volver al Panel</a>
</div>
</div>
</body>
</html>
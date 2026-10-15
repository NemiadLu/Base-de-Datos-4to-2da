<?php include 'php/auth.php'; // ¡PROTEGIDO! Solo entra si hay sesión ?>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Panel de Control</title>
<link rel="stylesheet" href="css/estilo.css">
</head>
<body>
<h2>¡Hola, <?php echo $_SESSION['nombre_usuario']; ?>! 👋</h2>
<div class="tarjeta">
<h3>Registrar Nuevo Alumno</h3>
<form action="php/guardar.php" method="POST">
<label>Nombre:</label>
<input type="text" name="txt_nombre" required>
<label>Edad:</label>
<input type="number" name="num_edad" required>
<button type="submit">Guardar en Base de Datos</button>
</form>
</div>
<a href="php/logica_mayor.php" class="btn-verde">¿Quién es el alumno mayor?</a>
<br><br>
<a href="php/logout.php" class="btn-rojo">🚪 Cerrar Sesión</a>
</body>
</html>
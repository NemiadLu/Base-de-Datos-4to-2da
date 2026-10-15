<?php
include 'auth.php'; // Seguridad
include 'conexion.php';
// 1. Ejecutamos SP
$sql = "CALL sp_obtener_alumno_mayor()";
$resultado = mysqli_query($conexion, $sql);
$datos = mysqli_fetch_assoc($resultado);
// 2. Guardamos en variables para la vista
$nombre_mayor = $datos['nombre'];
$edad_mayor = $datos['edad'];
// 3. ¡CARGAMOS EL HTML!
include '../vista_mayor.php';
?>
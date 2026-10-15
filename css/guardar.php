<?php
include 'auth.php'; // Verificamos seguridad también aquí
include 'conexion.php';

$nombre = $_POST['txt_nombre'];
$edad = $_POST['num_edad'];
$sql = "CALL sp_insertar_alumno('$nombre', $edad)";
mysqli_query($conexion, $sql);
// Vuelve al panel principal
header("Location: ../principal.php");
exit();
?>
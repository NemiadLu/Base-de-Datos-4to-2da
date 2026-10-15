<?php
session_start();
include 'conexion.php';
$u = $_POST['user'];
$p = $_POST['pass'];
$sql = "CALL sp_validar_usuario('$u', '$p')";
$res = mysqli_query($conexion, $sql);
if ($fila = mysqli_fetch_assoc($res)) {
// ÉXITO: Creamos las variables de sesión

$_SESSION['usuario_id'] = $fila['id'];
$_SESSION['nombre_usuario'] = $fila['usuario'];
header("Location: ../principal.php"); // Entra al panel
} else {
// ERROR: Vuelve al login
header("Location: ../login.html");
}
?>
<?php
$host = "localhost";
$user = "root";
$password = ""; // En XAMPP por defecto es cadena vacía
$dbname = "escuela_db";

// Establecer conexión con el servidor MySQL
$connection = mysqli_connect($host, $user, $password, $dbname);

// Verificar si ocurrió un error en la conexión
if (!$connection) {
    die("Error crítico de conexión: " . mysqli_connect_error());
}
?>
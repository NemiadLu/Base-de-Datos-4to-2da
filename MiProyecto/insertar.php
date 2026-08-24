<?php
include("conexion.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = $_POST["nombre"];
    $contrasenia = $_POST["contrasenia"];

    $sql = "INSERT INTO usuarios (nombre, constrasenia) VALUES ('$nombre', '$contrasenia')";

    if ($conexion->query($sql) === TRUE) {
        echo "Registro guardado correctamente";
    } else {
        echo "Error al registrar: " . $conexion->error;
    }
}

$conexion->close();
?>
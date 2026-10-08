<?php
include("conexion.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre = mysqli_real_escape_string($conexion, $_POST['nombre']);
    $contra  = mysqli_real_escape_string($conexion, $_POST["contrasenia"]);

    $sql = "INSERT INTO usuarios (nombre, contrasenia) VALUES ('$nombre', '$contra')";

    if ($conexion->query($sql) === TRUE) {
        echo "Registro guardado correctamente";
    } else {
        echo "Error al registrar: " . $conexion->error;
    }
}

$conexion->close();
?>

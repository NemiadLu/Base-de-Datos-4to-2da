<?php
session_start(); // Arrancamos la sesión
// Si no hay sesión iniciada, lo expulsamos al login
if (!isset($_SESSION['usuario_id'])) {
header("Location: login.html");
exit();
}
?>
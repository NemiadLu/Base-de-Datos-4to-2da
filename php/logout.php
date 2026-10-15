<?php
session_start();
session_unset(); // Limpia variables
session_destroy(); // Destruye la sesión por completo
header("Location: ../login.html"); // Lo manda fuera
exit();
?>
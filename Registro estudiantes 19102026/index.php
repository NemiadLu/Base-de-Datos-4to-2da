<?php include('./PHP/conexion.php'); ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./CSs/index.css">
    <title>Listado de Estudiantes</title>
</head>
<body>
    <h2>Registro de Estudiantes Registrados</h2><table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Edad</th>
            </tr>
        </thead>
        <tbody>
        <?php
            $query = "SELECT * FROM `students`";
            $result = mysqli_query($connection, $query);
            if (!$result) {
                die("Error al consultar datos: " . mysqli_error($connection));
            } else {
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<tr>";
                    echo "<td>" . $row['id'] . "</td>";
                    echo "<td>" . $row['first_name'] . "</td>";
                    echo "<td>" . $row['last_name'] . "</td>";
                    echo "<td>" . $row['age'] . "</td>";
                    echo "</tr>";
                }
            }
        ?>
        </tbody>
    </table>
</body>
</html>
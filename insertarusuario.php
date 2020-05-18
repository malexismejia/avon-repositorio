<?php

include 'conexion.php';
$IdUsuario = $_POST['idusuario'];
$Nombre = $_POST['nombre'];
$Usuario = $_POST['usuario'];
$Clave = $_POST['clave'];
$Correo = $_POST['correo'];
$Telcel = $_POST['telcel'];
$TelFijo = $_POST['telfijo'];
$TipoUsuario = $_POST['idtipousuario'];
$FechaDeCreacion = $_POST['fechacreacion'];
$FechaInicio = $_POST['fechainicio'];
$Estado = $_POST['estado'];

$consulta="insert into usuario values('".$IdUsuario."','".$Nombre."','".$Usuario."','".$Clave."','".$Correo."',
'".$Telcel."','".$TelFijo."','".$TipoUsuario."','".$FechaDeCreacion."','".$FechaInicio."','".$Estado."')";
mysqli_query($conexion,$consulta) or die (mysqli_error());
mysqli_close($conexion);

?>
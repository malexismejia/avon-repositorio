<?php
/*$hostname='localhost';
$database='avon';
$username='root';
$password='';
*/
$hostname='avon-server.mysql.database.azure.com';
$database='avon';
$username='avonadmin@avon-server';
$password='etps1@@1234';

$conexion=new mysqli($hostname,$username,$password,$database);
if($conexion->connect_errno){
    echo "El sitio web está experimentado problemas";
}else{
    echo "Exito";
}
?>

/*
hostname='avon-server.mysql.database.azure.com';
database='avon';
username='avonadmin@avon-server';
password='etps1@@1234';
*/
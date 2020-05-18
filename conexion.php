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

//$password='avonFtp1234';

$conexion=new mysqli($hostname,$username,$password,$database);
if($conexion->connect_error){
    printf($connect_error);
    echo "El sitio web está experimentado problemas",$connect_error;
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

//usuario: Ftp-avon
//hostname: ftp://waws-prod-dm1-135.ftp.azurewebsites.windows.net
//pas: avonFtp1234
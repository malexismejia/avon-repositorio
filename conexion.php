<?php

$link = mysqli_connect("avon-server.mysql.database.azure.com", "avonadmin@avon-server", "etps1@@1234", "avon");
 
/* Comprueba la conexión */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}
 
if (!mysqli_query($link, "SET a=1")) {
    printf("Errormessage: %s\n", mysqli_error($link));
}
 
/* Cierra la conexión */
mysqli_close($link);

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
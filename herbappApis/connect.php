<?php
$servername ="localhost";
$username = "root";
$pass = "";
$db_name = "herbs";
$conn= mysqli_connect($servername,$username,$pass,$db_name);
if(!$conn)
{
die("error connection to db server".mysqli_connect_error());
}

?>
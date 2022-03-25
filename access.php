<?php
$servername = "127.0.0.1";
$username_db = "login_get";
$password = "login_get";
$dbname = "cyclando";
// Create connection
$conn = mysqli_connect($servername, $username_db, $password, $dbname);
// Check connection
if($conn === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
?>
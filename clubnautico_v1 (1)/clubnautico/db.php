<?php
$host='localhost'; $db='club_nautico'; $user='root'; $pass=''; $charset='utf8mb4';
$dsn="mysql:host=$host;dbname=$db;charset=$charset";
$options=[PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC,PDO::ATTR_EMULATE_PREPARES=>false];
try{$pdo=new PDO($dsn,$user,$pass,$options);}catch(PDOException $e){http_response_code(500);die('Error de conexión con MySQL: '.$e->getMessage());}
?>

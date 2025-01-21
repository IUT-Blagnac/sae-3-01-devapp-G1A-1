<?php

$user = 'R2024MYSAE3007';
$pass = 'z5e9A4Ggy5jK3X';
try {
    $conn = new PDO(
        'mysql:host=localhost;dbname=R2024MYSAE3007;charset=UTF8',
        $user,
        $pass,
        array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION)
    );
} catch (PDOException $e) {
    echo "Erreur: " . $e->getMessage() . "<br>";
    die();
}
?>

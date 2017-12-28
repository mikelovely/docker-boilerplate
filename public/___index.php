<?php

ini_set('display_errors', 1);

try {
    $pdo = new PDO('mysql:host=database;dbname=docker_test', 'root', 'password');
} catch (PDOException $e) {
    die("Having problems...");
}

$stmt = $pdo->query('SELECT * FROM tests');

while ($row = $stmt->fetch()) {
    echo $row['text'] . "\n";
}

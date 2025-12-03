<?php
session_start();
header('Content-Type: application/json');

if (isset($_SESSION['user_id']) && isset($_SESSION['username'])) {
    echo json_encode([
        'logged_in' => true,
        'username' => $_SESSION['username'],
        'email' => $_SESSION['email']
    ]);
} else {
    echo json_encode(['logged_in' => false]);
}
?>

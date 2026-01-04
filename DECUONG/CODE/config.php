<?php
// Cấu hình kết nối database
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'vinhlong_ditich');

// Tạo kết nối MySQLi (cho compatibility)
$conn = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);

// Kiểm tra kết nối MySQLi
if (!$conn) {
    die("Kết nối MySQLi thất bại: " . mysqli_connect_error());
}

// Thiết lập charset UTF-8 cho MySQLi
mysqli_set_charset($conn, "utf8mb4");

// Tạo kết nối PDO (cho Google Maps API)
try {
    $dsn = "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=utf8mb4";
    $pdo = new PDO($dsn, DB_USER, DB_PASS, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]);
} catch (PDOException $e) {
    die("Kết nối PDO thất bại: " . $e->getMessage());
}
?>

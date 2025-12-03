<?php
// Cấu hình kết nối database
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'vinhlong_ditich');

// Tạo kết nối
$conn = mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);

// Kiểm tra kết nối
if (!$conn) {
    die("Kết nối thất bại: " . mysqli_connect_error());
}

// Thiết lập charset UTF-8
mysqli_set_charset($conn, "utf8mb4");
?>

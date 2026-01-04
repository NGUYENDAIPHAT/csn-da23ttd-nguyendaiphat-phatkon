<?php
session_start();
require_once 'config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST['username']);
    $password = $_POST['password'];

    if (empty($username) || empty($password)) {
        echo "<script>alert('Vui lòng nhập đầy đủ thông tin!'); window.location.href='DangNhap.html';</script>";
        exit();
    }

    // Prepared statement
    $stmt = mysqli_prepare($conn, "SELECT * FROM users WHERE username = ?");
    mysqli_stmt_bind_param($stmt, "s", $username);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    if (mysqli_num_rows($result) == 1) {
        $user = mysqli_fetch_assoc($result);
        
        if (password_verify($password, $user['password'])) {
            session_regenerate_id(true);
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['username'] = $user['username'];
            $_SESSION['email'] = $user['email'];
            
            // Kiểm tra nếu có redirect parameter
            $redirect = isset($_GET['redirect']) ? $_GET['redirect'] : 'TrangChu.html';
            
            // Validate redirect URL để tránh open redirect
            $allowed_redirects = ['TrangChu.html', 'TraCuu.html'];
            if (!in_array($redirect, $allowed_redirects)) {
                $redirect = 'TrangChu.html';
            }
            
            echo "<script>
                alert('🎉 Đăng nhập thành công! Chào mừng bạn trở lại!'); 
                window.location.href='TrangChu.html';
            </script>";
        } else {
            echo "<script>alert('Mật khẩu không đúng!'); window.location.href='DangNhap.html';</script>";
        }
    } else {
        echo "<script>alert('Tên đăng nhập không tồn tại!'); window.location.href='DangNhap.html';</script>";
    }
    mysqli_stmt_close($stmt);
}
mysqli_close($conn);
?>
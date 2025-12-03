<?php
// Kết nối database
require_once 'config.php';

// Lấy ID từ URL
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

// Kiểm tra ID hợp lệ
if ($id <= 0) {
    echo "<script>alert('ID không hợp lệ!'); window.location.href='TraCuu.html';</script>";
    exit();
}

// Truy vấn dữ liệu
$sql = "SELECT * FROM ditich WHERE id = $id";
$result = mysqli_query($conn, $sql);

// Kiểm tra có dữ liệu không
if (!$result || mysqli_num_rows($result) == 0) {
    echo "<script>alert('Không tìm thấy di tích này!'); window.location.href='TraCuu.html';</script>";
    exit();
}

// Lấy dữ liệu
$ditich = mysqli_fetch_assoc($result);
?>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($ditich['ten_ditich']); ?> - Di Tích Vĩnh Long</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .detail-container {
            max-width: 900px;
            margin: 30px auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .detail-header {
            border-bottom: 3px solid #4CAF50;
            padding-bottom: 15px;
            margin-bottom: 25px;
        }
        .detail-header h1 {
            color: #4CAF50;
            margin-bottom: 10px;
            font-size: 2em;
        }
        .detail-header .tinh {
            color: #666;
            font-size: 1.1em;
        }
        .info-box {
            background: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .info-box p {
            margin-bottom: 15px;
            line-height: 1.6;
        }
        .info-box strong {
            color: #333;
        }
        .description {
            margin-top: 25px;
        }
        .description h3 {
            color: #4CAF50;
            margin-bottom: 15px;
        }
        .description p {
            text-align: justify;
            line-height: 1.8;
            color: #333;
        }
        .back-button {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 25px;
            background: #4CAF50;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            transition: background 0.3s;
        }
        .back-button:hover {
            background: #388E3C;
        }
    </style>
</head>
<body>
    <header>
        <nav class="navbar">
            <div class="logo">Vĩnh Long Di Tích</div>
            <ul class="nav-links">
                <li><a href="TrangChu.html">Trang Chủ</a></li>
                <li><a href="DangNhap.html">Đăng Nhập</a></li>
                <li><a href="DangKy.html">Đăng Ký</a></li>
                <li><a href="TraCuu.html">Tra Cứu</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <div class="detail-container">
            <div class="detail-header">
                <h1><?php echo htmlspecialchars($ditich['ten_ditich']); ?></h1>
                <?php if (!empty($ditich['tinh'])): ?>
                <p class="tinh">📍 <?php echo htmlspecialchars($ditich['tinh']); ?></p>
                <?php endif; ?>
            </div>
            
            <div class="info-box">
                <p><strong>📍 Địa chỉ:</strong> <?php echo htmlspecialchars($ditich['dia_chi']); ?></p>
                
                <?php if (!empty($ditich['loai_ditich'])): ?>
                <p><strong>🏛️ Loại di tích:</strong> <?php echo htmlspecialchars($ditich['loai_ditich']); ?></p>
                <?php endif; ?>
                
                <?php if (!empty($ditich['nam_xay_dung'])): ?>
                <p><strong>📅 Năm xây dựng:</strong> <?php echo htmlspecialchars($ditich['nam_xay_dung']); ?></p>
                <?php endif; ?>
            </div>
            
            <?php if (!empty($ditich['mo_ta'])): ?>
            <div class="description">
                <h3>📖 Mô tả chi tiết</h3>
                <p><?php echo nl2br(htmlspecialchars($ditich['mo_ta'])); ?></p>
            </div>
            <?php endif; ?>
            
            <a href="TraCuu.html" class="back-button">← Quay lại tra cứu</a>
        </div>
    </main>

    <footer class="footer">
        <div class="footer-container">
            <div class="footer-col footer-col-info">
                <div class="footer-logo">
                    <span class="logo-text">DI TÍCH LỊCH SỬ VĨNH LONG</span>
                </div>
                <p class="site-description">
                   Giúp người truy cập có thể tìm kiếm và tra cứu các địa điểm và di tích một cách nhanh nhất.
                </p>
                <p class="copyright">©2025 - All rights reserved</p>
            </div>
            <div class="footer-col">
                <h3 class="footer-heading">Về Chúng Tôi</h3>
                <ul class="footer-links">
                    <li><a href="#">Giới thiệu</a></li>
                    <li><a href="#">Liên hệ</a></li>
                    <li><a href="#">Chính sách bảo mật</a></li>
                </ul>
            </div>
            <div class="footer-col footer-col-contact">
                <h3 class="footer-heading">Thông Tin</h3>
                <ul class="contact-info">
                    <li>Số 128, Nguyễn Thiện Thành, Vĩnh Long</li>
                    <li>(+84)397923776</li>
                    <li>vinhlong2025@gmail.com</li>
                </ul>
            </div>
        </div>
    </footer>

    <script src="script.js"></script>
</body>
</html>
<?php mysqli_close($conn); ?>

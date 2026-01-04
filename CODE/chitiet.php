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
    <link rel="stylesheet" href="map-styles.css">
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
        
        /* Image Section Styles */
        .image-section {
            margin-top: 25px;
        }
        
        .image-section h3 {
            color: #4CAF50;
            margin-bottom: 15px;
        }
        
        .image-container {
            width: 100%;
            margin-bottom: 20px;
            border-radius: 10px;
            overflow: hidden;
            border: 2px solid #ddd;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        
        .detail-image {
            width: 100%;
            height: 400px;
            object-fit: cover;
            display: block;
            transition: transform 0.3s ease;
        }
        
        .detail-image:hover {
            transform: scale(1.02);
        }
        
        .no-image-placeholder {
            width: 100%;
            height: 400px;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #6c757d;
        }
        
        .placeholder-content {
            text-align: center;
            padding: 40px;
        }
        
        .placeholder-icon {
            font-size: 4em;
            display: block;
            margin-bottom: 15px;
            opacity: 0.7;
        }
        
        .placeholder-content h4 {
            margin: 0 0 10px 0;
            color: #495057;
            font-size: 1.3em;
        }
        
        .placeholder-content p {
            margin: 0;
            color: #6c757d;
            font-style: italic;
        }
        
        .image-info {
            background: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            margin-top: 15px;
        }
        
        .image-info p {
            margin-bottom: 12px;
            line-height: 1.6;
        }
        
        .image-info strong {
            color: #333;
        }
        
        .coordinates {
            color: #666;
            font-size: 0.9em;
        }
        
        .image-actions {
            margin-top: 15px;
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }
        
        .action-link {
            display: inline-block;
            padding: 10px 18px;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .action-link:hover {
            background: #0056b3;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 123, 255, 0.3);
        }
        
        @media (max-width: 768px) {
            .simple-map {
                height: 250px;
            }
            
            .province-indicator {
                padding: 20px;
                min-width: 200px;
            }
            
            .province-indicator h4 {
                font-size: 1.3em;
            }
            
            .marker-icon {
                font-size: 1.5em;
            }
            
            .marker-label {
                font-size: 0.8em;
            }
            
            .map-actions {
                flex-direction: column;
            }
            
            .map-link {
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <header>
        <nav class="navbar">
            <div class="logo">Vĩnh Long Di Tích</div>
            <ul class="nav-links">
                <li><a href="TrangChu.html">Trang Chủ</a></li>
                <li><a href="TraCuu.html">Tra Cứu</a></li>
                <li><a href="DangNhap.html">Đăng Nhập</a></li>
                <li><a href="DangKy.html">Đăng Ký</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <div class="detail-container">
            <div class="detail-header">
                <h1><?php echo htmlspecialchars($ditich['ten_ditich']); ?></h1>
                <?php if (!empty($ditich['tinh'])): ?>
                <p class="tinh"> <?php echo htmlspecialchars($ditich['tinh']); ?></p>
                <?php endif; ?>
            </div>
            
            <div class="info-box">
                <p><strong> Địa chỉ:</strong> <?php echo htmlspecialchars($ditich['dia_chi']); ?></p>
                
                <?php if (!empty($ditich['loai_ditich'])): ?>
                <p><strong> Loại di tích:</strong> <?php echo htmlspecialchars($ditich['loai_ditich']); ?></p>
                <?php endif; ?>
                
                <?php if (!empty($ditich['nam_xay_dung'])): ?>
                <p><strong> Năm xây dựng:</strong> <?php echo htmlspecialchars($ditich['nam_xay_dung']); ?></p>
                <?php endif; ?>
            </div>
            
            <?php if (!empty($ditich['mo_ta'])): ?>
            <div class="description">
                <h3> Mô tả chi tiết</h3>
                <p><?php echo nl2br(htmlspecialchars($ditich['mo_ta'])); ?></p>
            </div>
            <?php endif; ?>
            
            <!-- Hình ảnh di tích -->
            <div class="image-section">
                <h3> Hình ảnh di tích</h3>
                <div class="image-container" id="imageContainer">
                    <?php 
                    // Tìm ảnh trong thư mục images theo các pattern có thể có
                    $image_found = false;
                    $final_image_path = '';
                    
                    // Danh sách các đường dẫn có thể có
                    $possible_paths = [
                        "images/" . $ditich['id'] . "_khu_tuong_niem_bac_ho.jpg",
                        "images/" . $ditich['id'] . "_van_thanh_mieu_vinh_long.jpg", 
                        "images/" . $ditich['id'] . "_chua_tien_chau.jpg",
                        "images/" . $ditich['id'] . "_chua_ong_quan_de_mieu.jpg",
                        "img/" . $ditich['id'] . ".jpg"  // Fallback cũ
                    ];
                    
                    // Thử tìm file theo pattern
                    foreach ($possible_paths as $path) {
                        if (file_exists($path)) {
                            $final_image_path = $path;
                            $image_found = true;
                            break;
                        }
                    }
                    
                    // Nếu không tìm thấy, thử tìm bất kỳ file nào bắt đầu với ID
                    if (!$image_found) {
                        $image_dir = 'images/';
                        if (is_dir($image_dir)) {
                            $files = scandir($image_dir);
                            foreach ($files as $file) {
                                if (strpos($file, $ditich['id'] . '_') === 0 && pathinfo($file, PATHINFO_EXTENSION) === 'jpg') {
                                    $final_image_path = $image_dir . $file;
                                    $image_found = true;
                                    break;
                                }
                            }
                        }
                    }
                    
                    if ($image_found): ?>
                        <img src="<?php echo $final_image_path; ?>" 
                             alt="<?php echo htmlspecialchars($ditich['ten_ditich']); ?>" 
                             class="detail-image">
                    <?php else: ?>
                        <!-- Ảnh mặc định nếu không có ảnh -->
                        <div class="no-image-placeholder">
                            <div class="placeholder-content">
                                <span class="placeholder-icon"></span>
                                <h4><?php echo htmlspecialchars($ditich['ten_ditich']); ?></h4>
                                <p>Chưa có hình ảnh</p>
                                <small style="color: #999; font-size: 0.8em;">
                                    Tìm kiếm: images/<?php echo $ditich['id']; ?>_*.jpg
                                </small>
                            </div>
                        </div>
                    <?php endif; ?>
                </div>
                
                <!-- Thông tin vị trí chi tiết -->
                <div class="location-info">
                    <h4> Thông tin vị trí</h4>
                    <div class="location-details">
                        <div class="location-item">
                            <span class="location-icon"></span>
                            <div class="location-text">
                                <strong>Địa chỉ:</strong>
                                <p><?php echo htmlspecialchars($ditich['dia_chi']); ?></p>
                            </div>
                        </div>
                        
                        <div class="location-item">
                            <span class="location-icon"></span>
                            <div class="location-text">
                                <strong>Tỉnh/Thành phố:</strong>
                                <p><?php echo htmlspecialchars($ditich['tinh']); ?></p>
                            </div>
                        </div>
                        
                        <?php if (!empty($ditich['latitude']) && !empty($ditich['longitude'])): ?>
                        <div class="location-item">
                            <span class="location-icon"></span>
                            <div class="location-text">
                                <strong>Tọa độ GPS:</strong>
                                <p><?php echo number_format($ditich['latitude'], 6); ?>, <?php echo number_format($ditich['longitude'], 6); ?></p>
                            </div>
                        </div>
                        <?php endif; ?>
                        
                        <div class="location-item">
                            <span class="location-icon"></span>
                            <div class="location-text">
                                <strong>Hướng dẫn đi lại:</strong>
                                <p>Sử dụng các ứng dụng bản đồ để tìm đường tối ưu</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="map-actions">
                        <a href="https://www.google.com/maps/search/<?php echo urlencode($ditich['ten_ditich'] . ' ' . $ditich['dia_chi']); ?>" 
                           target="_blank" class="map-link google-maps">
                            <span class="map-icon">🗺️</span>
                            Xem trên Google Maps
                        </a>
                        <a href="https://www.bing.com/maps?q=<?php echo urlencode($ditich['ten_ditich'] . ' ' . $ditich['dia_chi']); ?>" 
                           target="_blank" class="map-link bing-maps">
                            <span class="map-icon">🗺️</span>
                            Xem trên Bing Maps
                        </a>
                        <a href="https://maps.apple.com/?q=<?php echo urlencode($ditich['ten_ditich'] . ' ' . $ditich['dia_chi']); ?>" 
                           target="_blank" class="map-link apple-maps">
                            <span class="map-icon">🗺️</span>
                            Xem trên Apple Maps
                        </a>
                    </div>
                </div>
            </div>
            
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

    <!-- Image Section Script -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Add animation to image container
            const imageContainer = document.querySelector('.image-container');
            if (imageContainer) {
                imageContainer.style.opacity = '0';
                imageContainer.style.transform = 'translateY(20px)';
                
                setTimeout(() => {
                    imageContainer.style.transition = 'all 0.6s ease';
                    imageContainer.style.opacity = '1';
                    imageContainer.style.transform = 'translateY(0)';
                }, 300);
            }
            
            // Add lightbox effect to image
            const detailImage = document.querySelector('.detail-image');
            if (detailImage) {
                detailImage.addEventListener('click', function() {
                    // Create lightbox overlay
                    const lightbox = document.createElement('div');
                    lightbox.style.cssText = `
                        position: fixed;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        background: rgba(0,0,0,0.9);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        z-index: 1000;
                        cursor: pointer;
                    `;
                    
                    const lightboxImage = document.createElement('img');
                    lightboxImage.src = this.src;
                    lightboxImage.alt = this.alt;
                    lightboxImage.style.cssText = `
                        max-width: 90%;
                        max-height: 90%;
                        object-fit: contain;
                        border-radius: 8px;
                        box-shadow: 0 8px 32px rgba(0,0,0,0.5);
                    `;
                    
                    lightbox.appendChild(lightboxImage);
                    document.body.appendChild(lightbox);
                    
                    // Close lightbox on click
                    lightbox.addEventListener('click', function() {
                        document.body.removeChild(lightbox);
                    });
                    
                    // Close lightbox on Escape key
                    document.addEventListener('keydown', function(e) {
                        if (e.key === 'Escape') {
                            if (document.body.contains(lightbox)) {
                                document.body.removeChild(lightbox);
                            }
                        }
                    });
                });
            }
        });
    </script>
    
    <script src="script.js"></script>
</body>
</html>
<?php mysqli_close($conn); ?>
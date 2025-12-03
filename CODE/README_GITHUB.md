# 🏛️ Website Tra Cứu Di Tích Lịch Sử Vĩnh Long

Website tra cứu thông tin về các di tích lịch sử trên địa bàn tỉnh Vĩnh Long, Trà Vinh và Bến Tre.

## 📋 Mô tả

Dự án xây dựng website giúp người dùng dễ dàng tra cứu và tìm hiểu về các di tích lịch sử, văn hóa của vùng đồng bằng sông Cửu Long, đặc biệt là 3 tỉnh: Vĩnh Long, Trà Vinh và Bến Tre.

## ✨ Tính năng

- ✅ **Trang chủ** - Giới thiệu di tích nổi bật với banner slider
- ✅ **Đăng ký/Đăng nhập** - Quản lý tài khoản người dùng
- ✅ **Tra cứu di tích** - Tìm kiếm theo tên, địa chỉ, loại, tỉnh
- ✅ **Xem chi tiết** - Hiển thị thông tin đầy đủ về từng di tích
- ✅ **Responsive** - Tương thích mobile và desktop
- ✅ **Bảo mật** - Prepared Statements, Password Hashing, XSS Protection

## 🛠️ Công nghệ

- **Frontend:** HTML5, CSS3, JavaScript
- **Backend:** PHP 7.4+
- **Database:** MySQL 5.7+
- **Server:** Apache (XAMPP)

## 📦 Cài đặt

### Yêu cầu hệ thống

- XAMPP (hoặc Apache + MySQL + PHP)
- Trình duyệt web hiện đại (Chrome, Firefox, Edge)

### Các bước cài đặt

1. **Clone repository**
   ```bash
   git clone https://github.com/[your-username]/vinhlong-ditich.git
   ```

2. **Copy vào htdocs**
   ```
   Copy thư mục CODE vào C:\xampp\htdocs\vinhlong
   ```

3. **Tạo database**
   - Mở phpMyAdmin: http://localhost/phpmyadmin
   - Click tab "SQL"
   - Mở file `database_50_ditich.sql`
   - Copy và paste nội dung
   - Click "Go"

4. **Cấu hình database** (nếu cần)
   - Mở file `config.php`
   - Chỉnh sửa thông tin kết nối nếu cần:
     ```php
     define('DB_HOST', 'localhost');
     define('DB_USER', 'root');
     define('DB_PASS', '');
     define('DB_NAME', 'vinhlong_ditich');
     ```

5. **Chạy website**
   ```
   http://localhost/vinhlong/TrangChu.html
   ```

## 📊 Dữ liệu

Database bao gồm **50 di tích** từ 3 tỉnh:

- **Vĩnh Long:** 20 di tích
- **Trà Vinh:** 15 di tích
- **Bến Tre:** 15 di tích

Phân loại:
- Di tích tôn giáo: 25
- Di tích lịch sử: 10
- Di tích kiến trúc: 8
- Di tích văn hóa: 5
- Di tích nghề truyền thống: 2

## 🎯 Sử dụng

### Đăng ký tài khoản
1. Vào trang Đăng Ký
2. Nhập username (3-20 ký tự)
3. Nhập email hợp lệ
4. Nhập password (tối thiểu 6 ký tự)
5. Click "Đăng Ký"

### Tra cứu di tích
1. Vào trang Tra Cứu
2. Nhập từ khóa (tên, địa chỉ, tỉnh, loại)
3. Click "Tìm Kiếm"
4. Click vào tên di tích để xem chi tiết

## 📁 Cấu trúc thư mục

```
CODE/
├── TrangChu.html          # Trang chủ
├── DangNhap.html          # Đăng nhập
├── DangKy.html            # Đăng ký
├── TraCuu.html            # Tra cứu
├── chitiet.php            # Chi tiết di tích
├── style.css              # CSS
├── script.js              # JavaScript
├── config.php             # Kết nối database
├── login.php              # Xử lý đăng nhập
├── register.php           # Xử lý đăng ký
├── search.php             # Xử lý tìm kiếm
├── check_session.php      # Kiểm tra session
├── logout.php             # Đăng xuất
├── database.sql           # Database 15 di tích
├── database_50_ditich.sql # Database 50 di tích (khuyến nghị)
└── README.md              # File này
```

## 🔒 Bảo mật

- ✅ **Prepared Statements** - Chống SQL Injection
- ✅ **Password Hashing** - Mã hóa mật khẩu (bcrypt)
- ✅ **XSS Protection** - htmlspecialchars()
- ✅ **Email Validation** - filter_var()
- ✅ **Session Management** - session_regenerate_id()
- ✅ **Input Sanitization** - trim(), validation

## 🐛 Xử lý lỗi

### Không kết nối database
- Kiểm tra Apache và MySQL đã chạy
- Kiểm tra thông tin trong config.php

### Không tìm thấy kết quả
- Kiểm tra đã import database chưa
- Kiểm tra bảng ditich có dữ liệu không

### Không đăng nhập được
- Kiểm tra đã đăng ký tài khoản chưa
- Kiểm tra username/password có đúng không

## 📝 License

© 2025 - All rights reserved

## 👥 Tác giả

- **Nguyễn Đại Phát**
- Email: vinhlong2025@gmail.com
- Phone: (+84)397923776

## 🙏 Lời cảm ơn

Cảm ơn Sở Văn hóa, Thể thao và Du lịch các tỉnh Vĩnh Long, Trà Vinh, Bến Tre đã cung cấp thông tin về các di tích lịch sử.

## 📸 Screenshots

### Trang chủ
![Trang chủ](screenshots/trangchu.png)

### Tra cứu
![Tra cứu](screenshots/tracuu.png)

### Chi tiết di tích
![Chi tiết](screenshots/chitiet.png)

---

**⭐ Nếu thấy hữu ích, hãy cho dự án một star!**

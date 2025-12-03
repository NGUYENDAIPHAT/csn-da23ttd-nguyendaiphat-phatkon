-- ═══════════════════════════════════════════════════════════════
-- DATABASE: 50 DI TÍCH LỊCH SỬ VĨNH LONG, TRÀ VINH, BẾN TRE
-- ═══════════════════════════════════════════════════════════════

CREATE DATABASE IF NOT EXISTS vinhlong_ditich CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE vinhlong_ditich;

-- Tạo bảng
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_username (username),
    INDEX idx_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS ditich (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten_ditich VARCHAR(255) NOT NULL,
    dia_chi TEXT NOT NULL,
    mo_ta TEXT,
    loai_ditich VARCHAR(100),
    nam_xay_dung VARCHAR(50),
    tinh VARCHAR(50),
    hinh_anh VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_ten_ditich (ten_ditich),
    INDEX idx_loai_ditich (loai_ditich),
    INDEX idx_tinh (tinh)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Xóa dữ liệu cũ nếu có
TRUNCATE TABLE ditich;

-- ═══════════════════════════════════════════════════════════════
-- PHẦN 1: DI TÍCH VĨNH LONG (20 di tích)
-- ═══════════════════════════════════════════════════════════════

INSERT INTO ditich (ten_ditich, dia_chi, mo_ta, loai_ditich, nam_xay_dung, tinh) VALUES

('Khu Tưởng Niệm Bác Hồ', 'Xã Long Đức, TP. Vĩnh Long', 'Di tích lịch sử cấp quốc gia đặc biệt, nơi Chủ tịch Hồ Chí Minh từng đến thăm và làm việc. Khu tưởng niệm có nhà trưng bày, tượng đài và khuôn viên rộng lớn.', 'Di tích lịch sử', '1958', 'Vĩnh Long'),

('Văn Thánh Miếu Vĩnh Long', 'Phường 4, TP. Vĩnh Long', 'Nơi thờ Khổng Tử và các bậc hiền triết, được xây dựng theo mô hình Văn Miếu truyền thống. Đây là trung tâm văn hóa giáo dục của tỉnh.', 'Di tích văn hóa', '1875', 'Vĩnh Long'),

('Chùa Tiên Châu', 'Phường 8, TP. Vĩnh Long', 'Ngôi chùa có kiến trúc cổ kính lâu đời, là một trong những ngôi chùa lớn nhất tỉnh Vĩnh Long với nhiều hiện vật quý giá.', 'Di tích tôn giáo', '1840', 'Vĩnh Long'),

('Chùa Ông (Quán Đế Miếu)', 'Phường 1, TP. Vĩnh Long', 'Ngôi chùa thờ Quan Công, có giá trị kiến trúc nghệ thuật cao với hệ thống trang trí tinh xảo theo lối kiến trúc Hoa - Việt.', 'Di tích tôn giáo', '1885', 'Vĩnh Long'),

('Nhà thờ Cái Mơn', 'Xã Cái Mơn, Huyện Vũng Liêm', 'Nhà thờ Công giáo cổ kính được xây dựng theo lối kiến trúc Gothic, là một trong những nhà thờ đẹp nhất vùng đồng bằng sông Cửu Long.', 'Di tích tôn giáo', '1890', 'Vĩnh Long'),

('Khu di tích Cù Lao Giêng', 'Huyện Tam Bình', 'Căn cứ cách mạng lịch sử, là nơi diễn ra nhiều trận đánh anh dũng trong kháng chiến chống Mỹ với hệ thống hầm hào và công sự.', 'Di tích lịch sử', '1960', 'Vĩnh Long'),

('Khu lưu niệm GS Trần Đại Nghĩa', 'Xã Tường Lộc, Huyện Tam Bình', 'Khu lưu niệm người học trò xuất sắc của Chủ tịch Hồ Chí Minh, nhà khoa học lỗi lạc có nhiều đóng góp cho sự nghiệp cách mạng.', 'Di tích lịch sử', '2013', 'Vĩnh Long'),

('Đình Bình Thạnh', 'Xã Bình Thạnh, Huyện Bình Minh', 'Đình làng cổ với kiến trúc truyền thống Nam Bộ, được xây dựng theo lối kiến trúc tam quan, hai chái.', 'Di tích kiến trúc', '1850', 'Vĩnh Long'),

('Chùa Phước Hậu', 'Phường 1, TP. Vĩnh Long', 'Ngôi chùa cổ nổi tiếng với kiến trúc độc đáo, được xây dựng theo lối kiến trúc Phật giáo Nam Bộ với nhiều pho tượng Phật quý giá.', 'Di tích tôn giáo', '1820', 'Vĩnh Long'),

('Bảo tàng tỉnh Vĩnh Long', 'Phường 1, TP. Vĩnh Long', 'Bảo tàng thành lập năm 1981 với diện tích 20.000m2, nơi lưu giữ và trưng bày các hiện vật lịch sử, văn hóa quý giá.', 'Di tích văn hóa', '1981', 'Vĩnh Long');

INSERT INTO ditich (ten_ditich, dia_chi, mo_ta, loai_ditich, nam_xay_dung, tinh) VALUES

('Làng nghề gốm Mang Thít', 'Huyện Mang Thít', 'Làng nghề gốm truyền thống với lịch sử hàng trăm năm, được mệnh danh là "Vương quốc gạch gốm" lớn nhất đồng bằng sông Cửu Long.', 'Di tích nghề truyền thống', '1800', 'Vĩnh Long'),

('Đình Tân Hòa', 'Xã Tân Hòa, Huyện Vũng Liêm', 'Đình làng được xây dựng theo lối kiến trúc truyền thống miền Nam, có giá trị về mặt kiến trúc và văn hóa tín ngưỡng.', 'Di tích kiến trúc', '1865', 'Vĩnh Long'),

('Nhà thờ Tân Hòa', 'Xã Tân Hòa, Huyện Vũng Liêm', 'Nhà thờ Công giáo với kiến trúc đẹp, là trung tâm sinh hoạt tôn giáo của cộng đồng Công giáo tại Vũng Liêm.', 'Di tích tôn giáo', '1920', 'Vĩnh Long'),

('Cầu Vĩnh Long (Cầu Cổ Chiên)', 'TP. Vĩnh Long', 'Cây cầu bắc qua sông Cổ Chiên, kết nối hai bờ sông và là biểu tượng của sự phát triển kinh tế - xã hội của tỉnh.', 'Di tích kiến trúc', '2005', 'Vĩnh Long'),

('Chùa Vĩnh Tràng', 'Xã Vĩnh Tràng, Huyện Long Hồ', 'Ngôi chùa cổ với kiến trúc độc đáo, kết hợp giữa phong cách Việt Nam và Trung Hoa, có nhiều tượng Phật quý giá.', 'Di tích tôn giáo', '1849', 'Vĩnh Long'),

('Đình Long Hồ', 'Thị trấn Long Hồ, Huyện Long Hồ', 'Đình làng cổ thờ Thành hoàng bổn cảnh, được xây dựng theo lối kiến trúc truyền thống với hệ thống cột trụ, kèo rui tinh xảo.', 'Di tích kiến trúc', '1870', 'Vĩnh Long'),

('Chùa Phước Lâm', 'Xã Phước Lâm, Huyện Trà Ôn', 'Ngôi chùa cổ kính với kiến trúc Phật giáo Nam Bộ, là nơi tu hành của nhiều Tăng Ni và trung tâm sinh hoạt tôn giáo.', 'Di tích tôn giáo', '1835', 'Vĩnh Long'),

('Khu di tích Ấp Bắc', 'Xã Mỹ Hạnh, Huyện Mang Thít', 'Nơi diễn ra trận đánh Ấp Bắc nổi tiếng trong kháng chiến chống Mỹ, có ý nghĩa lịch sử quan trọng.', 'Di tích lịch sử', '1963', 'Vĩnh Long'),

('Chợ Vĩnh Long', 'TP. Vĩnh Long', 'Chợ truyền thống lâu đời, là trung tâm thương mại và văn hóa của tỉnh, phản ánh đời sống kinh tế - xã hội của người dân.', 'Di tích văn hóa', '1920', 'Vĩnh Long'),

('Miếu Bà Chúa Xứ Núi Sam', 'Xã Núi Sam, Huyện Vũng Liêm', 'Miếu thờ Bà Chúa Xứ, là nơi tín ngưỡng linh thiêng của người dân địa phương, thu hút nhiều du khách đến hành hương.', 'Di tích tôn giáo', '1880', 'Vĩnh Long');

-- ═══════════════════════════════════════════════════════════════
-- PHẦN 2: DI TÍCH TRÀ VINH (15 di tích)
-- ═══════════════════════════════════════════════════════════════

INSERT INTO ditich (ten_ditich, dia_chi, mo_ta, loai_ditich, nam_xay_dung, tinh) VALUES

('Đền thờ Bác Hồ Trà Vinh', 'Ấp Vĩnh Hội, Xã Long Đức, TP. Trà Vinh', 'Đền thờ Chủ tịch Hồ Chí Minh, biểu tượng "Công trình của Trái tim" với ý nghĩa thiêng liêng trong đời sống tinh thần của quân dân tỉnh.', 'Di tích lịch sử', '1970', 'Trà Vinh'),

('Chùa Âng (Angkor Borei)', 'Phường 4, TP. Trà Vinh', 'Ngôi chùa Khmer cổ nhất tỉnh Trà Vinh, được xây dựng theo kiến trúc Khmer truyền thống với nhiều hoa văn tinh xảo.', 'Di tích tôn giáo', '1533', 'Trà Vinh'),

('Chùa Hang (Kompong Chrây)', 'Xã Ngũ Lạc, Huyện Châu Thành', 'Ngôi chùa Khmer nổi tiếng với kiến trúc độc đáo, có nhiều tượng Phật và tranh vẽ quý giá.', 'Di tích tôn giáo', '1637', 'Trà Vinh'),

('Bảo tàng Văn hóa Khmer', 'Phường 1, TP. Trà Vinh', 'Bảo tàng lưu giữ và trưng bày các hiện vật văn hóa Khmer, phản ánh đời sống và truyền thống của đồng bào Khmer.', 'Di tích văn hóa', '1992', 'Trà Vinh'),

('Chùa Dơi (Chùa Kompong Chrây)', 'Xã Tân Hiệp, Huyện Châu Thành', 'Ngôi chùa nổi tiếng với hàng nghìn con dơi sinh sống, là điểm du lịch tâm linh độc đáo của tỉnh.', 'Di tích tôn giáo', '1700', 'Trà Vinh'),

('Nhà thờ Cô Giang', 'Xã Cô Giang, Huyện Càng Long', 'Nhà thờ Công giáo cổ kính với kiến trúc Gothic, là trung tâm sinh hoạt tôn giáo của cộng đồng Công giáo.', 'Di tích tôn giáo', '1895', 'Trà Vinh'),

('Khu di tích Bà Đầm', 'Xã Bà Đầm, Huyện Trà Cú', 'Khu di tích lịch sử cách mạng, nơi diễn ra nhiều hoạt động cách mạng trong kháng chiến chống Pháp và chống Mỹ.', 'Di tích lịch sử', '1945', 'Trà Vinh'),

('Chùa Chén Kiểu (Srah Srang)', 'Xã Ngãi Xuyên, Huyện Càng Long', 'Ngôi chùa Khmer cổ với kiến trúc độc đáo, có giá trị về lịch sử và văn hóa Khmer.', 'Di tích tôn giáo', '1815', 'Trà Vinh'),

('Đình Cầu Quan', 'Xã Cầu Quan, Huyện Tiểu Cần', 'Đình làng cổ thờ Thành hoàng, được xây dựng theo lối kiến trúc truyền thống Nam Bộ.', 'Di tích kiến trúc', '1860', 'Trà Vinh'),

('Chùa Ông Mẹt (Ông Bổn)', 'Phường 3, TP. Trà Vinh', 'Ngôi chùa thờ Ông Bổn, có kiến trúc Hoa - Việt độc đáo, là nơi sinh hoạt tôn giáo của cộng đồng người Hoa.', 'Di tích tôn giáo', '1890', 'Trà Vinh');

INSERT INTO ditich (ten_ditich, dia_chi, mo_ta, loai_ditich, nam_xay_dung, tinh) VALUES

('Khu di tích Long Đức', 'Xã Long Đức, TP. Trà Vinh', 'Khu di tích lịch sử cách mạng, nơi Chủ tịch Hồ Chí Minh từng đến thăm và làm việc.', 'Di tích lịch sử', '1958', 'Trà Vinh'),

('Chùa Pô Thi Mơ Rai', 'Xã Lưu Nghiệp Anh, Huyện Tiểu Cần', 'Ngôi chùa Khmer với kiến trúc truyền thống, là trung tâm sinh hoạt tôn giáo và văn hóa của đồng bào Khmer.', 'Di tích tôn giáo', '1750', 'Trà Vinh'),

('Đình Long Thành', 'Xã Long Thành, Huyện Cầu Kè', 'Đình làng cổ với kiến trúc truyền thống, là nơi thờ Thành hoàng và tổ chức các lễ hội truyền thống.', 'Di tích kiến trúc', '1875', 'Trà Vinh'),

('Chợ Trà Vinh', 'TP. Trà Vinh', 'Chợ truyền thống lâu đời, là trung tâm thương mại và văn hóa của tỉnh, phản ánh đời sống người dân.', 'Di tích văn hóa', '1925', 'Trà Vinh'),

('Khu di tích Cầu Kè', 'Thị trấn Cầu Kè, Huyện Cầu Kè', 'Khu di tích lịch sử cách mạng, nơi diễn ra nhiều hoạt động cách mạng trong kháng chiến.', 'Di tích lịch sử', '1950', 'Trà Vinh');

-- ═══════════════════════════════════════════════════════════════
-- PHẦN 3: DI TÍCH BẾN TRE (15 di tích)
-- ═══════════════════════════════════════════════════════════════

INSERT INTO ditich (ten_ditich, dia_chi, mo_ta, loai_ditich, nam_xay_dung, tinh) VALUES

('Bảo tàng Bến Tre', 'Phường Phú Khương, TP. Bến Tre', 'Bảo tàng thành lập năm 1981 với diện tích 20.000m2, trưng bày các hiện vật lịch sử, văn hóa của tỉnh.', 'Di tích văn hóa', '1981', 'Bến Tre'),

('Khu di tích Đồng Khởi', 'Xã Mỹ Long, Huyện Mỏ Cày Nam', 'Nơi khởi nghĩa Đồng Khởi nổ ra ngày 17/1/1960, mở đầu phong trào cách mạng miền Nam.', 'Di tích lịch sử', '1960', 'Bến Tre'),

('Nhà thờ Đức Bà Bến Tre', 'Phường 7, TP. Bến Tre', 'Nhà thờ Công giáo cổ kính với kiến trúc Gothic, là biểu tượng tôn giáo của tỉnh.', 'Di tích tôn giáo', '1900', 'Bến Tre'),

('Chùa Vĩnh Tràng', 'Phường 4, TP. Bến Tre', 'Ngôi chùa cổ với kiến trúc độc đáo, kết hợp giữa phong cách Việt Nam, Trung Hoa và Khmer.', 'Di tích tôn giáo', '1849', 'Bến Tre'),

('Khu lưu niệm Nguyễn Đình Chiểu', 'Xã Tân Thạch, Huyện Châu Thành', 'Khu lưu niệm nhà thơ yêu nước Nguyễn Đình Chiểu, tác giả "Lục Vân Tiên" và "Văn tế nghĩa sĩ Cần Giuộc".', 'Di tích lịch sử', '1858', 'Bến Tre'),

('Đình Phước Mỹ Trung', 'Xã Phước Mỹ Trung, Huyện Mỏ Cày Bắc', 'Đình làng cổ với kiến trúc truyền thống Nam Bộ, là nơi thờ Thành hoàng và tổ chức lễ hội.', 'Di tích kiến trúc', '1865', 'Bến Tre'),

('Chùa Phước Lộc', 'Xã Phước Lộc, Huyện Châu Thành', 'Ngôi chùa cổ với kiến trúc Phật giáo Nam Bộ, có nhiều tượng Phật và hiện vật quý giá.', 'Di tích tôn giáo', '1830', 'Bến Tre'),

('Khu di tích Bà Triệu', 'Xã Bà Triệu, Huyện Châu Thành', 'Khu di tích lịch sử cách mạng, nơi diễn ra nhiều hoạt động cách mạng trong kháng chiến.', 'Di tích lịch sử', '1945', 'Bến Tre'),

('Chợ Bến Tre', 'TP. Bến Tre', 'Chợ truyền thống lâu đời, là trung tâm thương mại và văn hóa của tỉnh, nổi tiếng với đặc sản dừa.', 'Di tích văn hóa', '1920', 'Bến Tre'),

('Nhà thờ Cái Mơn', 'Xã Cái Mơn, Huyện Châu Thành', 'Nhà thờ Công giáo cổ kính với kiến trúc đẹp, là trung tâm sinh hoạt tôn giáo của cộng đồng Công giáo.', 'Di tích tôn giáo', '1892', 'Bến Tre');

INSERT INTO ditich (ten_ditich, dia_chi, mo_ta, loai_ditich, nam_xay_dung, tinh) VALUES

('Đình Thạnh Phú', 'Xã Thạnh Phú, Huyện Thạnh Phú', 'Đình làng cổ thờ Thành hoàng, được xây dựng theo lối kiến trúc truyền thống với hệ thống cột trụ tinh xảo.', 'Di tích kiến trúc', '1870', 'Bến Tre'),

('Chùa Phước Thạnh', 'Xã Phước Thạnh, Huyện Mỏ Cày Nam', 'Ngôi chùa cổ với kiến trúc Phật giáo Nam Bộ, là nơi tu hành và sinh hoạt tôn giáo.', 'Di tích tôn giáo', '1840', 'Bến Tre'),

('Khu di tích Giồng Trôm', 'Thị trấn Giồng Trôm, Huyện Giồng Trôm', 'Khu di tích lịch sử cách mạng, nơi diễn ra nhiều trận đánh anh dũng trong kháng chiến.', 'Di tích lịch sử', '1965', 'Bến Tre'),

('Làng nghề dừa Bến Tre', 'Xã Phú Nhuận, Huyện Châu Thành', 'Làng nghề truyền thống chế biến dừa, nổi tiếng với các sản phẩm từ dừa như kẹo dừa, dầu dừa.', 'Di tích nghề truyền thống', '1850', 'Bến Tre'),

('Cầu Rạch Miễu', 'Huyện Châu Thành', 'Cây cầu dây văng bắc qua sông Tiền, kết nối Bến Tre với Tiền Giang, là biểu tượng của sự phát triển.', 'Di tích kiến trúc', '2009', 'Bến Tre');

-- ═══════════════════════════════════════════════════════════════
-- THỐNG KÊ DỮ LIỆU
-- ═══════════════════════════════════════════════════════════════

SELECT '═══════════════════════════════════════════════════════════════' AS '';
SELECT 'THỐNG KÊ DI TÍCH THEO TỈNH' AS '';
SELECT '═══════════════════════════════════════════════════════════════' AS '';

SELECT tinh AS 'Tỉnh', COUNT(*) AS 'Số lượng' 
FROM ditich 
GROUP BY tinh 
ORDER BY COUNT(*) DESC;

SELECT '' AS '';
SELECT '═══════════════════════════════════════════════════════════════' AS '';
SELECT 'THỐNG KÊ DI TÍCH THEO LOẠI' AS '';
SELECT '═══════════════════════════════════════════════════════════════' AS '';

SELECT loai_ditich AS 'Loại di tích', COUNT(*) AS 'Số lượng' 
FROM ditich 
GROUP BY loai_ditich 
ORDER BY COUNT(*) DESC;

SELECT '' AS '';
SELECT '═══════════════════════════════════════════════════════════════' AS '';
SELECT 'TỔNG QUAN' AS '';
SELECT '═══════════════════════════════════════════════════════════════' AS '';

SELECT 
    'Tổng số di tích' AS 'Thống kê',
    COUNT(*) AS 'Số lượng'
FROM ditich
UNION ALL
SELECT 'Vĩnh Long', COUNT(*) FROM ditich WHERE tinh = 'Vĩnh Long'
UNION ALL
SELECT 'Trà Vinh', COUNT(*) FROM ditich WHERE tinh = 'Trà Vinh'
UNION ALL
SELECT 'Bến Tre', COUNT(*) FROM ditich WHERE tinh = 'Bến Tre';

-- ═══════════════════════════════════════════════════════════════
-- HOÀN TẤT
-- ═══════════════════════════════════════════════════════════════
-- Database đã sẵn sàng với 50 di tích lịch sử!
-- Vĩnh Long: 20 di tích
-- Trà Vinh: 15 di tích  
-- Bến Tre: 15 di tích
-- ═══════════════════════════════════════════════════════════════

INSERT INTO ditich (ten_ditich, dia_chi, mo_ta, loai_ditich, nam_xay_dung, tinh) VALUES

('Chùa Bà Đen', 'Xã Bà Đen, Huyện Trà Cú', 'Ngôi chùa Khmer cổ với kiến trúc độc đáo, là nơi sinh hoạt tôn giáo và văn hóa của đồng bào Khmer.', 'Di tích tôn giáo', '1720', 'Trà Vinh'),

('Khu di tích Định An', 'Xã Định An, Huyện Trà Cú', 'Khu di tích lịch sử cách mạng, nơi diễn ra nhiều hoạt động cách mạng trong kháng chiến chống Pháp.', 'Di tích lịch sử', '1946', 'Trà Vinh'),

('Chùa Sà Lôn (Sà Lon)', 'Xã Sà Lôn, Huyện Trà Cú', 'Ngôi chùa Khmer với kiến trúc truyền thống, có nhiều tượng Phật và tranh vẽ quý giá.', 'Di tích tôn giáo', '1750', 'Trà Vinh'),

('Đình Cầu Kè', 'Thị trấn Cầu Kè, Huyện Cầu Kè', 'Đình làng cổ thờ Thành hoàng, được xây dựng theo lối kiến trúc truyền thống với hệ thống cột trụ tinh xảo.', 'Di tích kiến trúc', '1880', 'Trà Vinh'),

('Chùa Pô Thi Mơ Rai', 'Xã Lưu Nghiệp Anh, Huyện Tiểu Cần', 'Ngôi chùa Khmer với kiến trúc truyền thống, là trung tâm sinh hoạt tôn giáo và văn hóa của đồng bào Khmer.', 'Di tích tôn giáo', '1750', 'Trà Vinh');

INSERT INTO ditich (ten_ditich, dia_chi, mo_ta, loai_ditich, nam_xay_dung, tinh) VALUES

('Khu di tích Giồng Trôm', 'Thị trấn Giồng Trôm, Huyện Giồng Trôm', 'Khu di tích lịch sử cách mạng, nơi diễn ra nhiều trận đánh anh dũng trong kháng chiến chống Mỹ.', 'Di tích lịch sử', '1965', 'Bến Tre'),

('Chùa Phước Thạnh', 'Xã Phước Thạnh, Huyện Mỏ Cày Nam', 'Ngôi chùa cổ với kiến trúc Phật giáo Nam Bộ, là nơi tu hành và sinh hoạt tôn giáo của Phật tử.', 'Di tích tôn giáo', '1840', 'Bến Tre'),

('Đình Thạnh Phú', 'Xã Thạnh Phú, Huyện Thạnh Phú', 'Đình làng cổ thờ Thành hoàng, được xây dựng theo lối kiến trúc truyền thống với hệ thống cột trụ tinh xảo.', 'Di tích kiến trúc', '1870', 'Bến Tre'),

('Cầu Rạch Miễu', 'Huyện Châu Thành', 'Cây cầu dây văng bắc qua sông Tiền, kết nối Bến Tre với Tiền Giang, là biểu tượng của sự phát triển kinh tế.', 'Di tích kiến trúc', '2009', 'Bến Tre'),

('Làng nghề dừa Bến Tre', 'Xã Phú Nhuận, Huyện Châu Thành', 'Làng nghề truyền thống chế biến dừa, nổi tiếng với các sản phẩm từ dừa như kẹo dừa, dầu dừa, nước dừa.', 'Di tích nghề truyền thống', '1850', 'Bến Tre');

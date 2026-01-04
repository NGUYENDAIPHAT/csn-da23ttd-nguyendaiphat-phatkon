-- ═══════════════════════════════════════════════════════════════
-- DATABASE: WEBSITE TRA CỨU DI TÍCH LỊCH SỬ VĨNH LONG
-- ═══════════════════════════════════════════════════════════════

-- Xóa database cũ nếu tồn tại (cẩn thận!)
-- DROP DATABASE IF EXISTS vinhlong_ditich;

-- Tạo database mới
CREATE DATABASE IF NOT EXISTS vinhlong_ditich 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE vinhlong_ditich;

-- ═══════════════════════════════════════════════════════════════
-- BẢNG 1: USERS (Người dùng)
-- ═══════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_username (username),
    INDEX idx_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ═══════════════════════════════════════════════════════════════
-- BẢNG 2: DITICH (Di tích lịch sử)
-- ═══════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS ditich (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten_ditich VARCHAR(255) NOT NULL,
    dia_chi TEXT NOT NULL,
    mo_ta TEXT,
    loai_ditich VARCHAR(100),
    nam_xay_dung VARCHAR(50),
    tinh VARCHAR(50),
    hinh_anh VARCHAR(255),
    latitude DECIMAL(10, 8) NULL,
    longitude DECIMAL(11, 8) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_ten_ditich (ten_ditich),
    INDEX idx_loai_ditich (loai_ditich),
    INDEX idx_tinh (tinh),
    INDEX idx_coordinates (latitude, longitude)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ═══════════════════════════════════════════════════════════════
-- DỮ LIỆU MẪU: DI TÍCH LỊCH SỬ VĨNH LONG
-- ═══════════════════════════════════════════════════════════════

INSERT INTO ditich (ten_ditich, dia_chi, mo_ta, loai_ditich, nam_xay_dung) VALUES

-- Di tích kiến trúc
('Đình Bình Thạnh', 
 'Xã Bình Thạnh, Huyện Bình Minh, Vĩnh Long', 
 'Đình làng cổ với kiến trúc truyền thống Nam Bộ, được xây dựng theo lối kiến trúc tam quan, hai chái. Đình có giá trị về lịch sử, văn hóa và kiến trúc nghệ thuật của vùng đất Vĩnh Long. Đây là nơi thờ Thành hoàng làng và tổ chức các lễ hội truyền thống của người dân địa phương.', 
 'Di tích kiến trúc', 
 '1850'),

('Đình Tân Hòa', 
 'Xã Tân Hòa, Huyện Vũng Liêm, Vĩnh Long', 
 'Đình làng được xây dựng theo lối kiến trúc truyền thống miền Nam, có giá trị về mặt kiến trúc và văn hóa tín ngưỡng của người dân vùng sông nước. Đình là nơi thờ Thành hoàng bổn cảnh và tổ chức các hoạt động văn hóa cộng đồng.', 
 'Di tích kiến trúc', 
 '1865'),

-- Di tích tôn giáo
('Chùa Phước Hậu', 
 'Phường 1, Thành phố Vĩnh Long', 
 'Ngôi chùa cổ nổi tiếng với kiến trúc độc đáo, được xây dựng theo lối kiến trúc Phật giáo Nam Bộ. Chùa có nhiều pho tượng Phật quý giá và là trung tâm sinh hoạt tôn giáo của Phật tử trong vùng. Kiến trúc chùa mang đậm nét văn hóa Nam Bộ với hệ thống cột trụ, kèo rui tinh xảo.', 
 'Di tích tôn giáo', 
 '1820'),

('Chùa Tiên Châu', 
 'Phường 8, Thành phố Vĩnh Long', 
 'Ngôi chùa có kiến trúc cổ kính lâu đời, là một trong những ngôi chùa lớn nhất tỉnh Vĩnh Long. Chùa có nhiều hiện vật quý giá, tượng Phật cổ và là nơi tu hành của nhiều Tăng Ni. Kiến trúc chùa kết hợp giữa phong cách truyền thống và hiện đại.', 
 'Di tích tôn giáo', 
 '1840'),

('Nhà thờ Cái Mơn', 
 'Xã Cái Mơn, Huyện Vũng Liêm, Vĩnh Long', 
 'Nhà thờ Công giáo cổ kính được xây dựng theo lối kiến trúc Gothic, là một trong những nhà thờ đẹp nhất vùng đồng bằng sông Cửu Long. Nhà thờ có tháp chuông cao, cửa sổ kính màu và hệ thống kiến trúc độc đáo. Đây là trung tâm sinh hoạt tôn giáo của cộng đồng Công giáo địa phương.', 
 'Di tích tôn giáo', 
 '1890'),

('Chùa Ông (Quán Đế Miếu)', 
 'Phường 1, Thành phố Vĩnh Long', 
 'Ngôi chùa thờ Quan Công (Quan Đế), có giá trị kiến trúc nghệ thuật cao với hệ thống trang trí tinh xảo. Chùa được xây dựng theo lối kiến trúc Hoa - Việt, là nơi sinh hoạt tôn giáo của cộng đồng người Hoa tại Vĩnh Long. Chùa có nhiều hiện vật quý giá và là điểm du lịch văn hóa tâm linh.', 
 'Di tích tôn giáo', 
 '1885'),

-- Di tích lịch sử cách mạng
('Khu di tích Cù Lao Giêng', 
 'Huyện Tam Bình, Vĩnh Long', 
 'Căn cứ cách mạng lịch sử, là nơi diễn ra nhiều trận đánh anh dũng trong kháng chiến chống Mỹ. Khu di tích gồm hệ thống hầm hào, công sự và các địa điểm lịch sử. Đây là biểu tượng của tinh thần bất khuất của quân và dân Vĩnh Long trong cuộc kháng chiến chống Mỹ cứu nước.', 
 'Di tích lịch sử', 
 '1960'),

('Khu Tưởng Niệm Bác Hồ', 
 'Xã Long Đức, Thành phố Vĩnh Long', 
 'Di tích lịch sử cấp quốc gia đặc biệt, nơi Chủ tịch Hồ Chí Minh từng đến thăm và làm việc. Khu tưởng niệm có nhà trưng bày, tượng đài và khuôn viên rộng lớn. Đây là địa điểm giáo dục truyền thống cách mạng cho thế hệ trẻ và là điểm du lịch văn hóa lịch sử quan trọng của tỉnh.', 
 'Di tích lịch sử', 
 '1958'),

('Khu lưu niệm Giáo sư, Viện sĩ Trần Đại Nghĩa', 
 'Xã Tường Lộc, Huyện Tam Bình, Vĩnh Long', 
 'Khu lưu niệm người học trò xuất sắc của Chủ tịch Hồ Chí Minh, người con ưu tú của quê hương Vĩnh Long. Giáo sư Trần Đại Nghĩa là nhà khoa học lỗi lạc, có nhiều đóng góp cho sự nghiệp cách mạng và khoa học của đất nước. Khu lưu niệm trưng bày nhiều hiện vật, tài liệu quý giá về cuộc đời và sự nghiệp của Giáo sư.', 
 'Di tích lịch sử', 
 '2013'),

-- Di tích văn hóa
('Văn Thánh Miếu Vĩnh Long', 
 'Phường 4, Thành phố Vĩnh Long', 
 'Nơi thờ Khổng Tử và các bậc hiền triết, được xây dựng theo mô hình Văn Miếu truyền thống. Đây là trung tâm văn hóa giáo dục của tỉnh, nơi tổ chức các hoạt động văn hóa, giáo dục và tôn vinh các bậc hiền tài. Kiến trúc Văn Thánh Miếu mang đậm nét văn hóa Nho giáo.', 
 'Di tích văn hóa', 
 '1875'),

('Bảo tàng tỉnh Vĩnh Long', 
 'Phường 1, Thành phố Vĩnh Long', 
 'Bảo tàng thành lập năm 1981 với diện tích 20.000m2, nơi lưu giữ và trưng bày các hiện vật lịch sử, văn hóa quý giá của tỉnh Vĩnh Long. Bảo tàng có nhiều chuyên đề trưng bày về lịch sử, văn hóa, tự nhiên và cách mạng của địa phương. Đây là địa điểm giáo dục lịch sử, văn hóa quan trọng cho người dân và du khách.', 
 'Di tích văn hóa', 
 '1981'),

-- Di tích nghề truyền thống
('Làng nghề gốm Mang Thít', 
 'Huyện Mang Thít, Vĩnh Long', 
 'Làng nghề gốm truyền thống với lịch sử hàng trăm năm, được mệnh danh là "Vương quốc gạch gốm" lớn nhất đồng bằng sông Cửu Long. Làng nghề sản xuất các sản phẩm gốm sứ chất lượng cao, từ gạch ngói đến đồ gốm mỹ nghệ. Đây là di sản văn hóa phi vật thể quan trọng cần được bảo tồn và phát triển.', 
 'Di tích nghề truyền thống', 
 '1800'),

('Chợ nổi Cái Bè', 
 'Huyện Cái Bè (giáp Vĩnh Long), Tiền Giang', 
 'Chợ nổi truyền thống trên sông Tiền, là nét văn hóa đặc trưng của vùng sông nước miền Tây. Chợ họp từ sáng sớm với các ghe thuyền chở đầy nông sản, trái cây. Đây là điểm du lịch văn hóa hấp dẫn, thu hút nhiều du khách trong và ngoài nước đến tham quan và trải nghiệm.', 
 'Di tích văn hóa', 
 '1900'),

-- Thêm di tích khác
('Cầu Vĩnh Long (Cầu Cổ Chiên)', 
 'Thành phố Vĩnh Long', 
 'Cây cầu bắc qua sông Cổ Chiên, kết nối hai bờ sông và là biểu tượng của sự phát triển kinh tế - xã hội của tỉnh Vĩnh Long. Cầu có ý nghĩa quan trọng trong giao thông vận tải và phát triển kinh tế vùng đồng bằng sông Cửu Long.', 
 'Di tích kiến trúc', 
 '2005'),

('Nhà thờ Tân Hòa', 
 'Xã Tân Hòa, Huyện Vũng Liêm, Vĩnh Long', 
 'Nhà thờ Công giáo với kiến trúc đẹp, là trung tâm sinh hoạt tôn giáo của cộng đồng Công giáo tại Vũng Liêm. Nhà thờ có kiến trúc kết hợp giữa phong cách truyền thống và hiện đại, là điểm nhấn kiến trúc tôn giáo của vùng.', 
 'Di tích tôn giáo', 
 '1920'),

-- ═══════════════════════════════════════════════════════════════
-- DI TÍCH TRÀ VINH
-- ═══════════════════════════════════════════════════════════════

('Ao Bà Om', 
 'Phường 8, Thành phố Trà Vinh, Trà Vinh', 
 'Ao Bà Om là một di tích văn hóa tâm linh nổi tiếng của đồng bào Khmer Nam Bộ, có diện tích khoảng 90ha. Đây là nơi tổ chức lễ hội Ok Om Bok (lễ cúng trăng) hàng năm của người Khmer. Ao có hình dáng giống như chiếc lá Bodhi thiêng liêng trong Phật giáo, xung quanh có nhiều cây cổ thụ và chùa Khmer. Ao Bà Om không chỉ là địa điểm tâm linh mà còn là công viên sinh thái, nơi nghỉ dưỡng và du lịch của người dân và du khách.', 
 'Di tích văn hóa', 
 '1200'),

('Bà Biển Ba Động', 
 'Xã Ba Động, Huyện Trà Cú, Trà Vinh', 
 'Bà Biển Ba Động là một di tích tâm linh quan trọng của tỉnh Trà Vinh, nơi thờ Thiên Y A Na (Bà Biển) - vị thần bảo hộ của ngư dân và người dân vùng biển. Đền thờ được xây dựng theo kiến trúc truyền thống Nam Bộ, có không gian trang nghiêm và linh thiêng. Hàng năm, nơi đây tổ chức nhiều lễ hội truyền thống, đặc biệt là lễ hội Nghinh Ông (rước cá Ông) vào tháng 8 âm lịch. Đây là nơi gửi gắm niềm tin và lòng thành kính của ngư dân với biển cả, cầu mong được bình an và mưa thuận gió hòa.', 
 'Di tích tôn giáo', 
 '1850'),

('Biển Ba Động', 
 'Xã Ba Động, Huyện Trà Cú, Trà Vinh', 
 'Biển Ba Động là một trong những bãi biển đẹp và hoang sơ nhất của tỉnh Trà Vinh, nằm ở cực Nam của huyện Trà Cú. Bãi biển có cát trắng mịn, nước trong xanh và sóng êm ái, là điểm đến lý tưởng cho du lịch sinh thái biển. Khu vực này còn có hệ sinh thái rừng ngập mặn phong phú, là nơi cư trú của nhiều loài chim quý hiếm. Biển Ba Động không chỉ có giá trị du lịch mà còn là nguồn sinh kế quan trọng của ngư dân địa phương, nơi có nhiều loại hải sản tươi ngon. Đây cũng là địa điểm tổ chức các lễ hội biển truyền thống của người dân vùng ven biển Trà Vinh.', 
 'Di tích tự nhiên', 
 'Tự nhiên');

-- ═══════════════════════════════════════════════════════════════
-- CẬP NHẬT THÔNG TIN TỈNH CHO CÁC DI TÍCH
-- ═══════════════════════════════════════════════════════════════

-- Cập nhật tỉnh cho các di tích Vĩnh Long (những di tích không có thông tin tỉnh)
UPDATE ditich SET tinh = 'Vĩnh Long' WHERE tinh IS NULL OR tinh = '';

-- ═══════════════════════════════════════════════════════════════
-- CẬP NHẬT TỌA ĐỘ GPS CHO CÁC DI TÍCH
-- ═══════════════════════════════════════════════════════════════

-- Cập nhật tọa độ cho Ao Bà Om (Trà Vinh)
UPDATE ditich SET 
    latitude = 9.9347222, 
    longitude = 106.3425000 
WHERE ten_ditich = 'Ao Bà Om';

-- Cập nhật tọa độ cho Bà Biển Ba Động (Trà Vinh)
UPDATE ditich SET 
    latitude = 9.7500000, 
    longitude = 106.4833333 
WHERE ten_ditich = 'Bà Biển Ba Động';

-- Cập nhật tọa độ cho Biển Ba Động (Trà Vinh)
UPDATE ditich SET 
    latitude = 9.7400000, 
    longitude = 106.4900000 
WHERE ten_ditich = 'Biển Ba Động';

-- Cập nhật tọa độ cho một số di tích Vĩnh Long chính
UPDATE ditich SET 
    latitude = 10.2397222, 
    longitude = 105.9722222 
WHERE ten_ditich = 'Khu Tưởng Niệm Bác Hồ';

UPDATE ditich SET 
    latitude = 10.2530556, 
    longitude = 105.9719444 
WHERE ten_ditich = 'Văn Thánh Miếu Vĩnh Long';

UPDATE ditich SET 
    latitude = 10.2500000, 
    longitude = 105.9700000 
WHERE ten_ditich = 'Bảo tàng tỉnh Vĩnh Long';

UPDATE ditich SET 
    latitude = 10.2525000, 
    longitude = 105.9708333 
WHERE ten_ditich = 'Chùa Ông (Quán Đế Miếu)';

-- ═══════════════════════════════════════════════════════════════
-- THỐNG KÊ DỮ LIỆU
-- ═══════════════════════════════════════════════════════════════

SELECT 'Tổng số di tích:' AS Thong_ke, COUNT(*) AS So_luong FROM ditich
UNION ALL
SELECT 'Di tích Vĩnh Long:', COUNT(*) FROM ditich WHERE tinh = 'Vĩnh Long'
UNION ALL
SELECT 'Di tích Trà Vinh:', COUNT(*) FROM ditich WHERE tinh = 'Trà Vinh'
UNION ALL
SELECT 'Di tích có tọa độ GPS:', COUNT(*) FROM ditich WHERE latitude IS NOT NULL AND longitude IS NOT NULL
UNION ALL
SELECT 'Di tích kiến trúc:', COUNT(*) FROM ditich WHERE loai_ditich = 'Di tích kiến trúc'
UNION ALL
SELECT 'Di tích tôn giáo:', COUNT(*) FROM ditich WHERE loai_ditich = 'Di tích tôn giáo'
UNION ALL
SELECT 'Di tích lịch sử:', COUNT(*) FROM ditich WHERE loai_ditich = 'Di tích lịch sử'
UNION ALL
SELECT 'Di tích văn hóa:', COUNT(*) FROM ditich WHERE loai_ditich = 'Di tích văn hóa'
UNION ALL
SELECT 'Di tích nghề truyền thống:', COUNT(*) FROM ditich WHERE loai_ditich = 'Di tích nghề truyền thống'
UNION ALL
SELECT 'Di tích tự nhiên:', COUNT(*) FROM ditich WHERE loai_ditich = 'Di tích tự nhiên';

-- ═══════════════════════════════════════════════════════════════
-- HOÀN TẤT
-- ═══════════════════════════════════════════════════════════════
-- Database đã sẵn sàng với 18 di tích lịch sử:
-- - 15 di tích Vĩnh Long
-- - 3 di tích Trà Vinh (Ao Bà Om, Bà Biển Ba Động, Biển Ba Động)
-- 
-- Tọa độ GPS đã được cập nhật cho:
-- - Ao Bà Om: 9.9347222, 106.3425000
-- - Bà Biển Ba Động: 9.7500000, 106.4833333
-- - Biển Ba Động: 9.7400000, 106.4900000
-- - Khu Tưởng Niệm Bác Hồ: 10.2397222, 105.9722222
-- - Văn Thánh Miếu Vĩnh Long: 10.2530556, 105.9719444
-- - Bảo tàng tỉnh Vĩnh Long: 10.2500000, 105.9700000
-- - Chùa Ông (Quán Đế Miếu): 10.2525000, 105.9708333
-- ═══════════════════════════════════════════════════════════════

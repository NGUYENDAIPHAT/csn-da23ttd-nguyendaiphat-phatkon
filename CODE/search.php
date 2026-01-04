<?php
require_once 'config.php';

header('Content-Type: application/json');

if ($_SERVER["REQUEST_METHOD"] == "GET") {
    $keyword = isset($_GET['keyword']) ? trim($_GET['keyword']) : '';
    $tinh = isset($_GET['tinh']) ? trim($_GET['tinh']) : '';
    $loai = isset($_GET['loai']) ? trim($_GET['loai']) : '';
    
    // Xây dựng câu query động
    $conditions = [];
    $params = [];
    $types = '';
    
    // Điều kiện tìm kiếm theo từ khóa
    if (!empty($keyword)) {
        $search_term = "%$keyword%";
        $conditions[] = "(ten_ditich LIKE ? OR dia_chi LIKE ? OR mo_ta LIKE ? OR loai_ditich LIKE ? OR tinh LIKE ?)";
        $params = array_merge($params, [$search_term, $search_term, $search_term, $search_term, $search_term]);
        $types .= 'sssss';
    }
    
    // Điều kiện lọc theo tỉnh
    if (!empty($tinh)) {
        $conditions[] = "tinh = ?";
        $params[] = $tinh;
        $types .= 's';
    }
    
    // Điều kiện lọc theo loại
    if (!empty($loai)) {
        $conditions[] = "loai_ditich = ?";
        $params[] = $loai;
        $types .= 's';
    }
    
    // Nếu không có điều kiện nào, lấy tất cả
    if (empty($conditions)) {
        $sql = "SELECT id, ten_ditich, dia_chi, mo_ta, loai_ditich, nam_xay_dung, tinh, hinh_anh FROM ditich ORDER BY ten_ditich ASC LIMIT 50";
        $result = mysqli_query($conn, $sql);
    } else {
        $sql = "SELECT id, ten_ditich, dia_chi, mo_ta, loai_ditich, nam_xay_dung, tinh, hinh_anh FROM ditich WHERE " . implode(' AND ', $conditions) . " ORDER BY ten_ditich ASC";
        $stmt = mysqli_prepare($conn, $sql);
        mysqli_stmt_bind_param($stmt, $types, ...$params);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
    }
    
    if (mysqli_num_rows($result) > 0) {
        $ditich_list = [];
        while ($row = mysqli_fetch_assoc($result)) {
            $ditich_list[] = [
                'id' => (int)$row['id'],
                'ten_ditich' => htmlspecialchars($row['ten_ditich'], ENT_QUOTES, 'UTF-8'),
                'dia_chi' => htmlspecialchars($row['dia_chi'], ENT_QUOTES, 'UTF-8'),
                'mo_ta' => htmlspecialchars($row['mo_ta'], ENT_QUOTES, 'UTF-8'),
                'loai_ditich' => htmlspecialchars($row['loai_ditich'], ENT_QUOTES, 'UTF-8'),
                'nam_xay_dung' => htmlspecialchars($row['nam_xay_dung'], ENT_QUOTES, 'UTF-8'),
                'tinh' => htmlspecialchars($row['tinh'] ?? '', ENT_QUOTES, 'UTF-8')
            ];
        }
        echo json_encode(['success' => true, 'data' => $ditich_list], JSON_UNESCAPED_UNICODE);
    } else {
        echo json_encode(['success' => false, 'message' => 'Không tìm thấy kết quả!']);
    }
    
    // Chỉ đóng statement nếu nó được tạo
    if (!empty($conditions) && isset($stmt)) {
        mysqli_stmt_close($stmt);
    }
}
mysqli_close($conn);
?>
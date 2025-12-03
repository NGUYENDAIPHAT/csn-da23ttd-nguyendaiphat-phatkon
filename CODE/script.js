document.addEventListener('DOMContentLoaded', () => {
    // Quản lý session
    const userDisplayElements = document.querySelectorAll('#user-display');
    
    fetch('check_session.php')
        .then(response => response.json())
        .then(data => {
            if (data.logged_in) {
                userDisplayElements.forEach(el => {
                    el.innerHTML = `
                        <span>👋 ${data.username}</span>
                        <a href="logout.php" style="margin-left: 10px; color: white;">(Thoát)</a>
                    `;
                });
            }
        })
        .catch(error => console.error('Error:', error));

    // Đăng ký - Đã tích hợp vào DangKy.html

    // Banner slider
    const slides = document.querySelectorAll('.slide');
    let currentSlide = 0;
    
    function showSlide(index) {
        slides.forEach((slide, i) => {
            slide.classList.toggle('active', i === index);
        });
    }
    
    if (slides.length > 0) {
        setInterval(() => {
            currentSlide = (currentSlide + 1) % slides.length;
            showSlide(currentSlide);
        }, 5000);
    }

    // Tra cứu với bộ lọc
    const searchButton = document.getElementById('search-button');
    const searchInput = document.getElementById('search-input');
    const filterTinh = document.getElementById('filter-tinh');
    const filterLoai = document.getElementById('filter-loai');
    const resetButton = document.getElementById('reset-filter');
    const quickTags = document.querySelectorAll('.tag');
    
    if (searchButton) {
        searchButton.addEventListener('click', handleSearch);
        searchInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') handleSearch();
        });
    }
    
    // Xử lý bộ lọc
    if (filterTinh) {
        filterTinh.addEventListener('change', handleSearch);
    }
    
    if (filterLoai) {
        filterLoai.addEventListener('change', handleSearch);
    }
    
    // Xử lý reset bộ lọc
    if (resetButton) {
        resetButton.addEventListener('click', () => {
            searchInput.value = '';
            filterTinh.value = '';
            filterLoai.value = '';
            document.getElementById('search-results').innerHTML = '<p class="no-results-msg">Hãy nhập từ khóa hoặc chọn bộ lọc để bắt đầu tìm kiếm.</p>';
        });
    }
    
    // Xử lý tìm kiếm nhanh
    quickTags.forEach(tag => {
        tag.addEventListener('click', () => {
            searchInput.value = tag.dataset.keyword;
            handleSearch();
        });
    });
    
    function handleSearch() {
        const keyword = searchInput.value.trim();
        const tinh = filterTinh ? filterTinh.value : '';
        const loai = filterLoai ? filterLoai.value : '';
        const resultsDiv = document.getElementById('search-results');
        
        // Hiển thị loading
        resultsDiv.innerHTML = '<p class="no-results-msg">⏳ Đang tìm kiếm...</p>';
        
        // Tạo URL với các tham số
        let url = `search.php?keyword=${encodeURIComponent(keyword)}`;
        if (tinh) url += `&tinh=${encodeURIComponent(tinh)}`;
        if (loai) url += `&loai=${encodeURIComponent(loai)}`;
        
        fetch(url)
            .then(response => response.json())
            .then(data => {
                if (data.success && data.data.length > 0) {
                    resultsDiv.innerHTML = `
                        <p style="color: #4CAF50; font-weight: bold; margin-bottom: 15px;">
                            ✅ Tìm thấy ${data.data.length} kết quả
                        </p>
                    ` + data.data.map(item => `
                        <div class="result-item">
                            <h4>
                                <a href="chitiet.php?id=${item.id}">
                                    ${item.ten_ditich}
                                </a>
                            </h4>
                            ${item.tinh ? `<p style="color: #666; font-size: 0.9em;">📍 ${item.tinh}</p>` : ''}
                            <p><strong>Địa chỉ:</strong> ${item.dia_chi}</p>
                            <p><strong>Loại:</strong> ${item.loai_ditich || 'Chưa phân loại'}</p>
                            ${item.nam_xay_dung ? `<p><strong>Năm xây dựng:</strong> ${item.nam_xay_dung}</p>` : ''}
                            <p style="color: #666;">${item.mo_ta ? item.mo_ta.substring(0, 150) + '...' : ''}</p>
                            <a href="chitiet.php?id=${item.id}" style="color: #007bff; font-weight: bold;">
                                Xem chi tiết →
                            </a>
                        </div>
                    `).join('');
                } else {
                    resultsDiv.innerHTML = '<p class="no-results-msg">❌ Không tìm thấy kết quả phù hợp. Thử thay đổi bộ lọc hoặc từ khóa khác.</p>';
                }
            })
            .catch(error => {
                resultsDiv.innerHTML = '<p class="no-results-msg">❌ Có lỗi xảy ra. Vui lòng thử lại!</p>';
                console.error('Error:', error);
            });
    }
});

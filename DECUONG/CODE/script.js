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
                            ${item.tinh ? `<p class="result-province">📍 ${item.tinh}</p>` : ''}
                            <p><strong>Địa chỉ:</strong> ${item.dia_chi}</p>
                            <p><strong>Loại:</strong> ${item.loai_ditich || 'Chưa phân loại'}</p>
                            ${item.nam_xay_dung ? `<p><strong>Năm xây dựng:</strong> ${item.nam_xay_dung}</p>` : ''}
                            <p class="result-description">${item.mo_ta ? item.mo_ta.substring(0, 150) + '...' : ''}</p>
                            <a href="chitiet.php?id=${item.id}" class="view-detail-link">
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

// Enhanced Image Handling
document.addEventListener('DOMContentLoaded', function() {
    // Handle image loading errors
    const images = document.querySelectorAll('img');
    
    images.forEach(img => {
        img.addEventListener('error', function() {
            // Create placeholder if image fails to load
            if (!this.classList.contains('error-handled')) {
                this.classList.add('error-handled');
                
                // Try fallback image first
                if (this.hasAttribute('data-fallback')) {
                    this.src = this.getAttribute('data-fallback');
                    return;
                }
                
                // Create placeholder div
                const placeholder = document.createElement('div');
                placeholder.className = 'image-placeholder';
                placeholder.style.cssText = `
                    width: 100%;
                    height: ${this.offsetHeight || 200}px;
                    background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    color: #6c757d;
                    font-size: 2em;
                    border: 2px dashed #dee2e6;
                    border-radius: 8px;
                `;
                placeholder.innerHTML = '🏛️<br><small style="font-size: 0.5em;">Chưa có ảnh</small>';
                
                // Replace image with placeholder
                this.parentNode.replaceChild(placeholder, this);
            }
        });
        
        // Add loading animation
        img.addEventListener('load', function() {
            this.style.opacity = '1';
        });
    });
    
    // Lazy loading for images
    if ('IntersectionObserver' in window) {
        const imageObserver = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const img = entry.target;
                    if (img.dataset.src) {
                        img.src = img.dataset.src;
                        img.removeAttribute('data-src');
                        observer.unobserve(img);
                    }
                }
            });
        });
        
        // Observe all images with data-src
        document.querySelectorAll('img[data-src]').forEach(img => {
            imageObserver.observe(img);
        });
    }
});

// Image optimization function
function optimizeImages() {
    const images = document.querySelectorAll('img');
    
    images.forEach(img => {
        // Add loading="lazy" for modern browsers
        if (!img.hasAttribute('loading')) {
            img.setAttribute('loading', 'lazy');
        }
        
        // Add proper alt text if missing
        if (!img.hasAttribute('alt') || img.alt === '') {
            const src = img.src;
            const filename = src.substring(src.lastIndexOf('/') + 1);
            const altText = filename.replace(/\.(jpg|jpeg|png|gif)$/i, '').replace(/_/g, ' ');
            img.alt = altText;
        }
    });
}

// Run optimization when DOM is ready
document.addEventListener('DOMContentLoaded', optimizeImages);
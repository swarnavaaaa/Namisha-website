
document.addEventListener('DOMContentLoaded', () => {
    const accessibilityBtn = document.getElementById('accessibilityBtn');
    const accessibilityMenu = document.getElementById('accessibilityMenu');
    const options = document.querySelectorAll('.accessibility-option');

    // Create Reading Guide if not exists
    if (!document.querySelector('.reading-guide-overlay')) {
        const overlay = document.createElement('div');
        overlay.className = 'reading-guide-overlay';
        document.body.appendChild(overlay);
    }
    const readingGuideOverlay = document.querySelector('.reading-guide-overlay');

    // Store last mouse position for immediate updates
    let lastMouseY = window.innerHeight / 2;

    function updateReadingGuide(y) {
        if (readingGuideOverlay) {
            const centerY = y - 50; // Center a 100px gap
            readingGuideOverlay.style.setProperty('--dy', `${centerY}px`);
        }
    }

    // Toggle Menu
    if (accessibilityBtn && accessibilityMenu) {
        accessibilityBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            accessibilityMenu.classList.toggle('active');
        });

        // Close menu when clicking outside
        document.addEventListener('click', (e) => {
            if (!accessibilityMenu.contains(e.target) && e.target !== accessibilityBtn) {
                accessibilityMenu.classList.remove('active');
            }
        });
    }

    // Toggle Modes
    options.forEach(option => {
        const mode = option.dataset.mode;
        
        // Load state from local storage
        if (localStorage.getItem(mode) === 'true') {
            document.body.classList.add(mode);
            option.classList.add('active');
            if (mode === 'reading-guide') updateReadingGuide(lastMouseY);
        }

        option.addEventListener('click', (e) => {
            e.stopPropagation();
            const isActive = document.body.classList.toggle(mode);
            option.classList.toggle('active');
            localStorage.setItem(mode, isActive);
            
            if (mode === 'reading-guide' && isActive) {
                updateReadingGuide(lastMouseY);
            }

            // Mutual exclusivity for Dark Mode and High Contrast
            if (isActive) {
                if (mode === 'dark-mode' || mode === 'high-contrast') {
                    const other = mode === 'dark-mode' ? 'high-contrast' : 'dark-mode';
                    if (document.body.classList.contains(other)) {
                        document.body.classList.remove(other);
                        const otherOption = document.querySelector(`.accessibility-option[data-mode="${other}"]`);
                        if (otherOption) otherOption.classList.remove('active');
                        localStorage.setItem(other, 'false');
                    }
                }
            }
        });
    });

    // Reading Guide Listeners
    const handleMove = (e) => {
        const y = e.clientY || (e.touches && e.touches[0].clientY);
        if (y !== undefined) {
            lastMouseY = y;
            if (document.body.classList.contains('reading-guide')) {
                updateReadingGuide(lastMouseY);
            }
        }
    };

    document.addEventListener('mousemove', handleMove);
    document.addEventListener('touchmove', handleMove);
    document.addEventListener('touchstart', handleMove);
    
    // Also track scroll to keep the guide responsive
    window.addEventListener('scroll', () => {
        if (document.body.classList.contains('reading-guide')) {
            updateReadingGuide(lastMouseY);
        }
    }, { passive: true });
});

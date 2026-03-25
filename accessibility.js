
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
        }

        option.addEventListener('click', (e) => {
            e.stopPropagation();
            const isActive = document.body.classList.toggle(mode);
            option.classList.toggle('active');
            localStorage.setItem(mode, isActive);
            
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

    // Reading Guide Mouse Follower
    document.addEventListener('mousemove', (e) => {
        if (document.body.classList.contains('reading-guide')) {
            const y = e.clientY - 50; // Center the 100px gap
            readingGuideOverlay.style.setProperty('--dy', `${y}px`);
        }
    });
});

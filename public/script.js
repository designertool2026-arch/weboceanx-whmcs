/**
 * WebOceanX WHMCS Theme Scripts
 * Mobile Menu, Smooth Scrolling, UI Interactions
 */

document.addEventListener('DOMContentLoaded', function() {
    'use strict';

    // --- Apply Theme Settings from LocalStorage ---
    const themeSettings = JSON.parse(localStorage.getItem('themeSettings'));
    if (themeSettings) {
        const root = document.documentElement;
        if (themeSettings.primary) root.style.setProperty('--wo-primary-green', themeSettings.primary);
        if (themeSettings.secondary) root.style.setProperty('--wo-neon-green', themeSettings.secondary);
        if (themeSettings.dark) root.style.setProperty('--wo-dark-green', themeSettings.dark);
        if (themeSettings.font) {
            root.style.setProperty('--wo-font-primary', themeSettings.font);
            
            // Dynamically load Google Font if not Inter
            if (!themeSettings.font.includes('Inter')) {
                const fontName = themeSettings.font.split(',')[0].replace(/'/g, '').replace(/ /g, '+');
                const link = document.createElement('link');
                link.href = `https://fonts.googleapis.com/css2?family=${fontName}:wght@400;500;600;700&display=swap`;
                link.rel = 'stylesheet';
                document.head.appendChild(link);
            }
        }
    }

    // --- Mobile Menu Toggle ---
    const navbarToggler = document.querySelector('.navbar-toggler');
    const mainNavbar = document.querySelector('#mainNavbar');

    if (navbarToggler && mainNavbar) {
        navbarToggler.addEventListener('click', function() {
            mainNavbar.classList.toggle('show');
            const isExpanded = mainNavbar.classList.contains('show');
            navbarToggler.setAttribute('aria-expanded', isExpanded);
        });
    }

    // --- Smooth Scrolling for Anchor Links ---
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            const targetId = this.getAttribute('href');
            if (targetId === '#') return;

            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                e.preventDefault();
                targetElement.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });

                // Close mobile menu if open
                if (mainNavbar && mainNavbar.classList.contains('show')) {
                    mainNavbar.classList.remove('show');
                    navbarToggler.setAttribute('aria-expanded', 'false');
                }
            }
        });
    });

    // --- Sticky Header Shadow on Scroll ---
    const stickyHeader = document.querySelector('.wo-navbar.sticky-top');
    if (stickyHeader) {
        window.addEventListener('scroll', function() {
            if (window.scrollY > 50) {
                stickyHeader.style.boxShadow = '0 10px 30px rgba(0, 0, 0, 0.1)';
                stickyHeader.style.padding = '0.75rem 0';
            } else {
                stickyHeader.style.boxShadow = 'none';
                stickyHeader.style.padding = '1rem 0';
            }
        });
    }

    // --- Dark Mode Toggle ---
    const darkModeToggle = document.getElementById('darkModeToggle');
    const themeSwitcher = document.getElementById('themeSwitcher');
    const mobileDarkModeToggle = document.getElementById('mobileDarkModeToggle');

    // Initial state check
    const isDark = localStorage.getItem('darkMode') === 'true';
    if (isDark) {
        document.body.classList.add('dark-mode');
        updateDarkModeIcons(true);
    }

    if (darkModeToggle) {
        darkModeToggle.addEventListener('click', function(e) {
            e.preventDefault();
            toggleDarkMode();
        });
    }

    if (themeSwitcher) {
        themeSwitcher.addEventListener('click', function(e) {
            e.preventDefault();
            toggleDarkMode();
        });
    }

    if (mobileDarkModeToggle) {
        mobileDarkModeToggle.addEventListener('click', function(e) {
            e.preventDefault();
            toggleDarkMode();
        });
    }

    // Sidebar Search Filtering
    const sidebarSearch = document.getElementById('sidebarSearch');
    const sidebarLinks = document.querySelectorAll('.sidebar-link');
    
    if (sidebarSearch) {
        sidebarSearch.addEventListener('input', function() {
            const query = this.value.toLowerCase().trim();
            
            sidebarLinks.forEach(link => {
                const text = link.textContent.toLowerCase();
                const keywords = link.getAttribute('data-keywords').toLowerCase();
                
                if (text.includes(query) || keywords.includes(query)) {
                    link.style.display = 'block';
                } else {
                    link.style.display = 'none';
                }
            });
        });
    }

    function toggleDarkMode() {
        document.body.classList.toggle('dark-mode');
        const isNowDark = document.body.classList.contains('dark-mode');
        localStorage.setItem('darkMode', isNowDark);
        updateDarkModeIcons(isNowDark);
    }

    function updateDarkModeIcons(isDark) {
        const icons = document.querySelectorAll('#darkModeToggle i, #mobileDarkModeToggle i, #themeSwitcher i');
        icons.forEach(icon => {
            if (isDark) {
                icon.classList.replace('bi-moon-stars', 'bi-sun');
            } else {
                icon.classList.replace('bi-sun', 'bi-moon-stars');
            }
        });
    }

    // --- Cookie Banner Logic ---
    const cookieBanner = document.getElementById('cookieBanner');
    const acceptCookiesBtn = document.getElementById('acceptCookies');
    const declineCookiesBtn = document.getElementById('declineCookies');

    if (cookieBanner) {
        // Show banner after a short delay if not already decided
        if (!localStorage.getItem('cookieConsent')) {
            setTimeout(() => {
                cookieBanner.classList.add('show');
            }, 2000);
        }

        if (acceptCookiesBtn) {
            acceptCookiesBtn.addEventListener('click', function() {
                localStorage.setItem('cookieConsent', 'accepted');
                cookieBanner.classList.remove('show');
            });
        }

        if (declineCookiesBtn) {
            declineCookiesBtn.addEventListener('click', function() {
                localStorage.setItem('cookieConsent', 'declined');
                cookieBanner.classList.remove('show');
            });
        }
    }

    // --- Card Hover Effects (Optional JS enhancement) ---
    const hoverCards = document.querySelectorAll('.hover-lift');
    hoverCards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.zIndex = '10';
        });
        card.addEventListener('mouseleave', function() {
            this.style.zIndex = '1';
        });
    });

    // --- Form Validation Feedback (Bootstrap 5) ---
    const forms = document.querySelectorAll('.needs-validation');
    Array.from(forms).forEach(form => {
        form.addEventListener('submit', event => {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
    });

    // --- Tooltip Initialization (Bootstrap 5) ---
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    tooltipTriggerList.map(function (tooltipTriggerEl) {
        if (typeof bootstrap !== 'undefined') {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        }
    });

    // --- Domain Autocomplete Logic ---
    const popularTlds = [
        { tld: '.com', price: '$12.99', premium: true },
        { tld: '.net', price: '$14.99', premium: false },
        { tld: '.org', price: '$15.99', premium: false },
        { tld: '.io', price: '$39.99', premium: true },
        { tld: '.co', price: '$24.99', premium: false },
        { tld: '.info', price: '$11.99', premium: false },
        { tld: '.biz', price: '$13.99', premium: false },
        { tld: '.me', price: '$19.99', premium: true },
        { tld: '.us', price: '$9.99', premium: false },
        { tld: '.uk', price: '$10.99', premium: false },
        { tld: '.ca', price: '$12.99', premium: false },
        { tld: '.ai', price: '$69.99', premium: true },
        { tld: '.tech', price: '$8.99', premium: true },
        { tld: '.online', price: '$4.99', premium: false },
        { tld: '.store', price: '$6.99', premium: false },
        { tld: '.xyz', price: '$2.99', premium: false }
    ];
    
    function setupAutocomplete(inputId, dropdownId, listId) {
        const input = document.getElementById(inputId);
        const dropdown = document.getElementById(dropdownId);
        const list = document.getElementById(listId);
        let currentFocus = -1;

        if (!input || !dropdown || !list) return;

        input.addEventListener('input', function() {
            const query = this.value.trim();
            currentFocus = -1;
            
            if (query.length < 1) {
                dropdown.classList.add('d-none');
                return;
            }

            // Extract domain and current extension if any
            let domainPart = query;
            let currentExt = '';
            if (query.includes('.')) {
                const parts = query.split('.');
                domainPart = parts[0];
                currentExt = '.' + parts.slice(1).join('.');
            }

            // Filter suggestions
            const suggestions = popularTlds.filter(item => item.tld.startsWith(currentExt) || currentExt === '');
            
            if (suggestions.length > 0) {
                list.innerHTML = '';
                suggestions.forEach((item, index) => {
                    const li = document.createElement('li');
                    li.className = 'list-group-item list-group-item-action d-flex justify-content-between align-items-center py-3 border-0 border-bottom';
                    li.style.cursor = 'pointer';
                    li.setAttribute('data-index', index);
                    
                    const premiumBadge = item.premium ? '<span class="badge bg-warning-subtle text-warning ms-2" style="font-size: 0.6rem;">PREMIUM</span>' : '';
                    
                    li.innerHTML = `
                        <div>
                            <span class="fw-bold text-dark">${domainPart}</span><span class="text-success">${item.tld}</span>
                            ${premiumBadge}
                        </div>
                        <div class="text-end">
                            <span class="fw-bold text-dark">${item.price}</span>
                            <div class="small text-muted" style="font-size: 0.7rem;">/year</div>
                        </div>
                    `;
                    
                    li.addEventListener('click', () => {
                        input.value = domainPart + item.tld;
                        dropdown.classList.add('d-none');
                        input.closest('form').submit();
                    });
                    
                    list.appendChild(li);
                });
                dropdown.classList.remove('d-none');
            } else {
                dropdown.classList.add('d-none');
            }
        });

        input.addEventListener('keydown', function(e) {
            const items = list.getElementsByTagName('li');
            if (e.keyCode === 40) { // Down
                currentFocus++;
                addActive(items);
            } else if (e.keyCode === 38) { // Up
                currentFocus--;
                addActive(items);
            } else if (e.keyCode === 13) { // Enter
                if (currentFocus > -1) {
                    if (items[currentFocus]) items[currentFocus].click();
                    e.preventDefault();
                }
            }
        });

        function addActive(items) {
            if (!items) return false;
            removeActive(items);
            if (currentFocus >= items.length) currentFocus = 0;
            if (currentFocus < 0) currentFocus = (items.length - 1);
            items[currentFocus].classList.add('active-suggestion');
            items[currentFocus].scrollIntoView({ block: 'nearest' });
        }

        function removeActive(items) {
            for (let i = 0; i < items.length; i++) {
                items[i].classList.remove('active-suggestion');
            }
        }

        // Close dropdown when clicking outside
        document.addEventListener('click', function(e) {
            if (!input.contains(e.target) && !dropdown.contains(e.target)) {
                dropdown.classList.add('d-none');
            }
        });
    }

    setupAutocomplete('domainSearchInput', 'tldSuggestions', 'tldSuggestionsList');
    setupAutocomplete('domainCheckerInput', 'checkerTldSuggestions', 'checkerTldSuggestionsList');

    console.log('WebOceanX Theme Scripts Loaded Successfully');

    // --- AI Tools Dashboard & Logic ---
    const userCreditsDisplay = document.querySelectorAll('#userCreditsDisplay');
    
    // Function to update credits display across the page
    function updateCreditsUI(credits) {
        userCreditsDisplay.forEach(el => {
            el.textContent = credits;
        });
    }

    // Initialize credits listener if Firebase is ready
    function initCreditsListener() {
        if (window.woFirebase && window.woFirebase.auth.currentUser) {
            const uid = window.woFirebase.auth.currentUser.uid;
            window.woFirebase.subscribeToCredits(uid, (credits) => {
                updateCreditsUI(credits);
            });
        } else if (window.woFirebase) {
            // If not logged in, show a placeholder or handle accordingly
            // For demo purposes, we'll use a fixed UID if not logged in
            const demoUid = 'demo_user_123';
            window.woFirebase.subscribeToCredits(demoUid, (credits) => {
                updateCreditsUI(credits);
            });
        } else {
            // Retry after a short delay if Firebase logic isn't loaded yet
            setTimeout(initCreditsListener, 500);
        }
    }

    initCreditsListener();

    // --- AI Logo Generator Logic ---
    const logoForm = document.getElementById('logoGeneratorForm');
    if (logoForm) {
        logoForm.addEventListener('submit', async function(e) {
            e.preventDefault();
            
            const brandName = document.getElementById('brandName').value;
            const logoStyle = document.querySelector('name="logoStyle"]:checked')?.value || 'Modern';
            const colorPalette = document.getElementById('colorPalette').value;
            const layoutVariation = document.getElementById('layoutVariation').value;

            const emptyState = document.getElementById('emptyState');
            const loadingState = document.getElementById('loadingState');
            const resultState = document.getElementById('resultState');
            const generatedLogoImg = document.getElementById('generatedLogoImg');

            try {
                // Deduct credits (10 credits)
                const uid = window.woFirebase.auth.currentUser?.uid || 'demo_user_123';
                await window.woFirebase.deductCredits(uid, 10, 'logo_generator');

                // Show loading
                emptyState.classList.add('d-none');
                resultState.classList.add('d-none');
                loadingState.classList.remove('d-none');

                // Simulate AI Generation (In a real app, call an API)
                setTimeout(() => {
                    loadingState.classList.add('d-none');
                    resultState.classList.remove('d-none');
                    
                    // Use a placeholder image that looks like a logo
                    const seed = encodeURIComponent(`${brandName}-${logoStyle}-${colorPalette}`);
                    generatedLogoImg.src = `https://picsum.photos/seed/${seed}/400/400`;
                    
                    console.log(`Generated logo for ${brandName} in ${logoStyle} style with ${colorPalette} palette and ${layoutVariation} layout.`);
                }, 3000);

            } catch (error) {
                alert(error.message === 'Insufficient credits' ? 'Insufficient credits. Please top up your account.' : 'An error occurred during generation.');
                if (error.message === 'Insufficient credits') {
                    window.location.href = 'clientarea.php?action=addfunds';
                }
            }
        });

        // Export as Vector (SVG) - Mock implementation
        const exportSvgBtn = document.getElementById('exportSvgBtn');
        if (exportSvgBtn) {
            exportSvgBtn.addEventListener('click', function() {
                alert('Exporting as SVG... Your high-quality vector file is being prepared.');
            });
        }
    }

    // --- Business Name Generator Logic ---
    const nameForm = document.getElementById('businessNameForm');
    if (nameForm) {
        nameForm.addEventListener('submit', async function(e) {
            e.preventDefault();
            
            const industry = document.getElementById('industry').value;
            const keywords = document.getElementById('keywords').value;
            
            const emptyState = document.getElementById('emptyState');
            const loadingState = document.getElementById('loadingState');
            const resultState = document.getElementById('resultState');
            const namesList = document.getElementById('namesList');

            try {
                const uid = window.woFirebase.auth.currentUser?.uid || 'demo_user_123';
                await window.woFirebase.deductCredits(uid, 5, 'name_generator');

                emptyState.classList.add('d-none');
                resultState.classList.add('d-none');
                loadingState.classList.remove('d-none');

                setTimeout(() => {
                    loadingState.classList.add('d-none');
                    resultState.classList.remove('d-none');
                    
                    const mockNames = [
                        { name: `${keywords.split(',')[0] || 'Cloud'}Flow`, score: 95 },
                        { name: `Neo${industry.split(' ')[0]}`, score: 88 },
                        { name: `${industry.split(' ')[0]}Vantage`, score: 92 },
                        { name: `Pure${keywords.split(',')[1] || 'Secure'}`, score: 85 },
                        { name: `Zenith${industry.split(' ')[0]}`, score: 90 },
                        { name: `Aero${keywords.split(',')[0] || 'Fast'}`, score: 87 }
                    ];

                    namesList.innerHTML = '';
                    mockNames.forEach(item => {
                        const col = document.createElement('div');
                        col.className = 'col-md-6';
                        col.innerHTML = `
                            <div class="p-4 rounded-4 border bg-white hover-lift shadow-sm d-flex justify-content-between align-items-center">
                                <div>
                                    <h5 class="fw-bold mb-1">${item.name}</h5>
                                    <div class="d-flex align-items-center gap-2">
                                        <span class="badge bg-success-subtle text-success small">Available</span>
                                        <span class="small text-muted">Score: ${item.score}</span>
                                    </div>
                                </div>
                                <button class="btn btn-link text-muted p-0"><i class="bi bi-heart"></i></button>
                            </div>
                        `;
                        namesList.appendChild(col);
                    });
                }, 2000);

            } catch (error) {
                alert(error.message === 'Insufficient credits' ? 'Insufficient credits. Please top up your account.' : 'An error occurred.');
            }
        });
    }

    // --- Branding Generator Logic ---
    const brandingForm = document.getElementById('brandingForm');
    if (brandingForm) {
        brandingForm.addEventListener('submit', async function(e) {
            e.preventDefault();
            
            const emptyState = document.getElementById('emptyState');
            const loadingState = document.getElementById('loadingState');
            const resultState = document.getElementById('resultState');

            try {
                const uid = window.woFirebase.auth.currentUser?.uid || 'demo_user_123';
                await window.woFirebase.deductCredits(uid, 25, 'branding_generator');

                emptyState.classList.add('d-none');
                resultState.classList.add('d-none');
                loadingState.classList.remove('d-none');

                setTimeout(() => {
                    loadingState.classList.add('d-none');
                    resultState.classList.remove('d-none');
                    
                    document.getElementById('brandVoiceDesc').textContent = "Your brand voice is professional yet approachable, focusing on clarity and innovation. Use active verbs and avoid overly technical jargon unless necessary.";
                    document.getElementById('logoStyleDesc').textContent = "We recommend a minimalist icon-based logo with clean sans-serif typography. The icon should represent growth and connectivity.";
                    
                    const colors = ['#00ff66', '#0a2a12', '#ffffff', '#1a1a1a'];
                    const colorPalette = document.getElementById('colorPalette');
                    colorPalette.innerHTML = '';
                    colors.forEach(c => {
                        const div = document.createElement('div');
                        div.className = 'rounded-circle shadow-sm border';
                        div.style.width = '40px';
                        div.style.height = '40px';
                        div.style.backgroundColor = c;
                        div.title = c;
                        colorPalette.appendChild(div);
                    });

                    const typography = ['Inter (Sans-serif)', 'JetBrains Mono (Monospace)'];
                    const typographyList = document.getElementById('typographyList');
                    typographyList.innerHTML = '';
                    typography.forEach(t => {
                        const p = document.createElement('p');
                        p.className = 'mb-1 text-muted';
                        p.textContent = t;
                        typographyList.appendChild(p);
                    });
                }, 2500);

            } catch (error) {
                alert(error.message === 'Insufficient credits' ? 'Insufficient credits.' : 'An error occurred.');
            }
        });
    }

    // --- AI Site Builder Logic ---
    const siteForm = document.getElementById('siteBuilderForm');
    if (siteForm) {
        siteForm.addEventListener('submit', async function(e) {
            e.preventDefault();
            
            const emptyState = document.getElementById('emptyState');
            const loadingState = document.getElementById('loadingState');
            const resultState = document.getElementById('resultState');
            const sitePreviewContent = document.getElementById('sitePreviewContent');

            try {
                const uid = window.woFirebase.auth.currentUser?.uid || 'demo_user_123';
                await window.woFirebase.deductCredits(uid, 50, 'site_builder');

                emptyState.classList.add('d-none');
                resultState.classList.add('d-none');
                loadingState.classList.remove('d-none');

                setTimeout(() => {
                    loadingState.classList.add('d-none');
                    resultState.classList.remove('d-none');
                    
                    sitePreviewContent.innerHTML = `
                        <div class="text-center py-5">
                            <h1 class="fw-bold mb-4">Welcome to Your New Business</h1>
                            <p class="lead text-muted mb-5">We provide the best solutions for your digital needs. Secure, fast, and reliable.</p>
                            <div class="row g-4 mb-5">
                                <div class="col-md-4"><div class="p-4 border rounded-4"><h3>Feature 1</h3><p>Details about feature 1.</p></div></div>
                                <div class="col-md-4"><div class="p-4 border rounded-4"><h3>Feature 2</h3><p>Details about feature 2.</p></div></div>
                                <div class="col-md-4"><div class="p-4 border rounded-4"><h3>Feature 3</h3><p>Details about feature 3.</p></div></div>
                            </div>
                            <button class="btn btn-primary rounded-pill px-5">Get Started</button>
                        </div>
                    `;
                }, 4000);

            } catch (error) {
                alert(error.message === 'Insufficient credits' ? 'Insufficient credits.' : 'An error occurred.');
            }
        });
    }

    // --- AI Image Generator Logic ---
    const imageForm = document.getElementById('imageGeneratorForm');
    if (imageForm) {
        imageForm.addEventListener('submit', async function(e) {
            e.preventDefault();
            
            const prompt = document.getElementById('imagePrompt').value;
            const emptyState = document.getElementById('emptyState');
            const loadingState = document.getElementById('loadingState');
            const resultState = document.getElementById('resultState');
            const generatedImageImg = document.getElementById('generatedImageImg');

            try {
                const uid = window.woFirebase.auth.currentUser?.uid || 'demo_user_123';
                await window.woFirebase.deductCredits(uid, 8, 'image_generator');

                emptyState.classList.add('d-none');
                resultState.classList.add('d-none');
                loadingState.classList.remove('d-none');

                setTimeout(() => {
                    loadingState.classList.add('d-none');
                    resultState.classList.remove('d-none');
                    
                    const seed = encodeURIComponent(prompt);
                    generatedImageImg.src = `https://picsum.photos/seed/${seed}/800/600`;
                }, 3000);

            } catch (error) {
                alert(error.message === 'Insufficient credits' ? 'Insufficient credits.' : 'An error occurred.');
            }
        });
    }
});

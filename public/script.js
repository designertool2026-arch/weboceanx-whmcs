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
    if (darkModeToggle) {
        const icon = darkModeToggle.querySelector('i');
        const isDark = localStorage.getItem('darkMode') === 'true';
        
        if (isDark) {
            document.body.classList.add('dark-mode');
            if (icon) icon.classList.replace('bi-moon-stars', 'bi-sun');
        }

        darkModeToggle.addEventListener('click', function(e) {
            e.preventDefault();
            document.body.classList.toggle('dark-mode');
            const isNowDark = document.body.classList.contains('dark-mode');
            localStorage.setItem('darkMode', isNowDark);
            
            if (icon) {
                if (isNowDark) {
                    icon.classList.replace('bi-moon-stars', 'bi-sun');
                } else {
                    icon.classList.replace('bi-sun', 'bi-moon-stars');
                }
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
    const popularTlds = ['.com', '.net', '.org', '.io', '.co', '.info', '.biz', '.me', '.us', '.uk', '.ca', '.de', '.fr', '.ai', '.tech', '.online', '.store', '.xyz'];
    
    function setupAutocomplete(inputId, dropdownId, listId) {
        const input = document.getElementById(inputId);
        const dropdown = document.getElementById(dropdownId);
        const list = document.getElementById(listId);

        if (!input || !dropdown || !list) return;

        input.addEventListener('input', function() {
            const query = this.value.trim();
            if (query.length < 2) {
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
            const suggestions = popularTlds.filter(tld => tld.startsWith(currentExt) || currentExt === '');
            
            if (suggestions.length > 0) {
                list.innerHTML = '';
                suggestions.forEach(tld => {
                    const li = document.createElement('li');
                    li.className = 'list-group-item list-group-item-action cursor-pointer py-2';
                    li.style.cursor = 'pointer';
                    li.innerHTML = `<span class="fw-bold text-dark">${domainPart}</span><span class="text-success">${tld}</span>`;
                    li.addEventListener('click', () => {
                        input.value = domainPart + tld;
                        dropdown.classList.add('d-none');
                        input.focus();
                    });
                    list.appendChild(li);
                });
                dropdown.classList.remove('d-none');
            } else {
                dropdown.classList.add('d-none');
            }
        });

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
});

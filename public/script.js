/**
 * WebOceanX WHMCS Theme Scripts
 * Mobile Menu, Smooth Scrolling, UI Interactions
 */

document.addEventListener('DOMContentLoaded', function() {
    'use strict';

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

    // --- Cookie Banner Logic ---
    const cookieBanner = document.querySelector('.cookie-banner');
    const acceptCookiesBtn = document.querySelector('.cookie-banner .btn-neon');

    if (cookieBanner) {
        // Show banner after a short delay if not already accepted
        if (!localStorage.getItem('cookiesAccepted')) {
            setTimeout(() => {
                cookieBanner.classList.add('show');
            }, 2000);
        }

        if (acceptCookiesBtn) {
            acceptCookiesBtn.addEventListener('click', function(e) {
                e.preventDefault();
                cookieBanner.classList.remove('show');
                localStorage.setItem('cookiesAccepted', 'true');
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

    console.log('WebOceanX Theme Scripts Loaded Successfully');
});

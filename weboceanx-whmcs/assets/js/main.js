document.addEventListener('DOMContentLoaded', function() {
    // Dark Mode Persistence
    const body = document.body;
    const isDarkMode = localStorage.getItem('darkMode') === 'true';
    if (isDarkMode) {
        body.classList.add('dark-mode');
    }

    // Toggle Dark Mode
    const toggleBtn = document.getElementById('darkModeToggle');
    if (toggleBtn) {
        toggleBtn.addEventListener('click', function() {
            body.classList.toggle('dark-mode');
            localStorage.setItem('darkMode', body.classList.contains('dark-mode'));
        });
    }

    // Cookie Banner
    const cookieBanner = document.getElementById('cookieBanner');
    const acceptCookies = document.getElementById('acceptCookies');
    const declineCookies = document.getElementById('declineCookies');

    if (cookieBanner && !localStorage.getItem('cookiesAccepted')) {
        setTimeout(() => {
            cookieBanner.classList.add('show');
        }, 1000);
    }

    if (acceptCookies) {
        acceptCookies.addEventListener('click', () => {
            localStorage.setItem('cookiesAccepted', 'true');
            cookieBanner.classList.remove('show');
        });
    }

    if (declineCookies) {
        declineCookies.addEventListener('click', () => {
            localStorage.setItem('cookiesAccepted', 'false');
            cookieBanner.classList.remove('show');
        });
    }

    // Domain Search Autocomplete (Placeholder)
    const domainInput = document.getElementById('domainSearchInput');
    if (domainInput) {
        domainInput.addEventListener('input', function(e) {
            const value = e.target.value;
            if (value.length > 2) {
                // Fetch suggestions or show static ones
                console.log('Searching for:', value);
            }
        });
    }

    // Sticky Header Effect
    const navbar = document.querySelector('.wo-navbar');
    if (navbar) {
        window.addEventListener('scroll', function() {
            if (window.scrollY > 50) {
                navbar.classList.add('navbar-scrolled');
            } else {
                navbar.classList.remove('navbar-scrolled');
            }
        });
    }

    // Tooltips
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });

    // Bootstrap Form Validation
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
});

// Password Strength Checker
function checkPasswordStrength(password) {
    const bar = document.getElementById('strengthBar');
    const text = document.getElementById('strengthText');
    if (!bar || !text) return;

    let strength = 0;
    if (password.length > 5) strength++;
    if (password.length > 8) strength++;
    if (/[A-Z]/.test(password)) strength++;
    if (/[0-9]/.test(password)) strength++;
    if (/[^A-Za-z0-9]/.test(password)) strength++;

    bar.className = 'password-strength-progress';
    if (strength < 2) {
        bar.style.width = '33%';
        bar.classList.add('strength-weak');
        text.innerText = 'Weak password';
        text.className = 'password-strength-text text-danger';
    } else if (strength < 4) {
        bar.style.width = '66%';
        bar.classList.add('strength-medium');
        text.innerText = 'Medium password';
        text.className = 'password-strength-text text-warning';
    } else {
        bar.style.width = '100%';
        bar.classList.add('strength-strong');
        text.innerText = 'Strong password';
        text.className = 'password-strength-text text-neon';
    }
}

// Sidebar Toggle
function toggleSidebar() {
    const sidebar = document.getElementById('clientSidebar');
    if (sidebar) {
        sidebar.classList.toggle('sidebar-collapsed');
    }
}

<div class="auth-wrapper">
    <div class="auth-form-side">
        <div class="auth-logo">
            <a href="{$WEB_ROOT}/index.php">
                <img src="{$WEB_ROOT}/templates/{$template}/img/logo.png" alt="Web Oceanx" onerror="this.src='https://via.placeholder.com/200x50?text=WEB+OCEANX'">
            </a>
        </div>

        <h1 class="auth-heading">Sign Up</h1>

        {if $errormessage}
            <div class="alert alert-danger rounded-4 border-0 small mb-4">
                <i class="bi bi-exclamation-triangle-fill me-2"></i>
                {$errormessage}
            </div>
        {/if}

        <form method="post" action="register.php" role="form">
            <div class="row g-3">
                <div class="col-md-6 mb-3">
                    <label class="auth-label">First name *</label>
                    <input type="text" name="firstname" class="auth-input" placeholder="Enter first name" required value="{$clientfirstname}">
                </div>
                <div class="col-md-6 mb-3">
                    <label class="auth-label">Last name *</label>
                    <input type="text" name="lastname" class="auth-input" placeholder="Enter last name" required value="{$clientlastname}">
                </div>
            </div>

            <div class="mb-3">
                <label class="auth-label">Email *</label>
                <input type="email" name="email" class="auth-input" placeholder="Enter email address" required value="{$clientemail}">
            </div>

            <div class="mb-4">
                <label class="auth-label">Password *</label>
                <div class="position-relative">
                    <input type="password" name="password" id="inputPassword" class="auth-input" placeholder="Enter password" required>
                    <button type="button" class="btn position-absolute end-0 top-50 translate-middle-y border-0" onclick="togglePassword()">
                        <i class="bi bi-eye-slash text-muted" id="toggleIcon"></i>
                    </button>
                </div>
            </div>

            <div class="form-check form-switch mb-4 d-flex align-items-center gap-3">
                <input class="form-check-input" type="checkbox" role="switch" id="marketingPersonalization" name="marketing" checked style="width: 3rem; height: 1.5rem;">
                <label class="form-check-label small text-muted" for="marketingPersonalization">
                    Please tick this box if you are happy for us to personalize your marketing
                </label>
            </div>

            <button type="submit" class="auth-btn-gradient">Sign Up</button>

            <div class="auth-footer-text">
                Already have an account? <a href="login.php">Login</a>
            </div>
        </form>

        <div class="mt-auto pt-5 text-center text-muted small">
            <div class="d-flex justify-content-center gap-3 mb-2">
                <a href="#" class="text-muted text-decoration-none">Cookie Settings</a>
                <span>|</span>
                <a href="#" class="text-muted text-decoration-none">Give Feedback</a>
            </div>
            hosting.com Panel v0.4.21 | Copyright 2026
        </div>
    </div>

    <div class="auth-image-side">
        <!-- Same decoration as login for consistency -->
        <div class="auth-image-content">
            <div class="auth-marketing-text">
                <h2>Join the Web Oceanx community today.</h2>
                <p>Experience the next generation of cloud hosting with <strong>unmatched performance</strong> and <strong>24/7 support</strong>.</p>
                <a href="#" class="auth-status-link">Check for service updates here status.hosting.com</a>
            </div>
        </div>
    </div>
</div>

<script>
function togglePassword() {
    const input = document.getElementById('inputPassword');
    const icon = document.getElementById('toggleIcon');
    if (input.type === 'password') {
        input.type = 'text';
        icon.classList.replace('bi-eye-slash', 'bi-eye');
    } else {
        input.type = 'password';
        icon.classList.replace('bi-eye', 'bi-eye-slash');
    }
}
</script>

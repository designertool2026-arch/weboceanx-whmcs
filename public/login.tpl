<div class="auth-wrapper">
    <div class="auth-form-side">
        <div class="auth-logo">
            <a href="{$WEB_ROOT}/index.php">
                <img src="{$WEB_ROOT}/templates/{$template}/img/logo.png" alt="Web Oceanx" onerror="this.src='https://via.placeholder.com/200x50?text=WEB+OCEANX'">
            </a>
        </div>

        <h1 class="auth-heading">Login</h1>

        {if $incorrect}
            <div class="alert alert-danger rounded-4 border-0 small mb-4">
                <i class="bi bi-exclamation-triangle-fill me-2"></i>
                {$LANG.loginincorrect}
            </div>
        {/if}

        <form method="post" action="{$systemurl}dologin.php" role="form">
            <div class="mb-4">
                <label class="auth-label">Username *</label>
                <input type="email" name="username" class="auth-input" placeholder="Enter your username" required autofocus>
                {if $incorrect}<div class="auth-input-error">Username is required</div>{/if}
            </div>

            <div class="mb-4">
                <label class="auth-label">Password *</label>
                <div class="position-relative">
                    <input type="password" name="password" id="inputPassword" class="auth-input" placeholder="Enter your password" required>
                    <button type="button" class="btn position-absolute end-0 top-50 translate-middle-y border-0" onclick="togglePassword()">
                        <i class="bi bi-eye-slash text-muted" id="toggleIcon"></i>
                    </button>
                </div>
                {if $incorrect}<div class="auth-input-error">Password is required</div>{/if}
            </div>

            <button type="submit" class="auth-btn-gradient">Login</button>

            <div class="auth-footer-text">
                New to hosting.com? <a href="register.php">Create an account</a> to get started
            </div>

            <a href="passwordreset.php" class="auth-forgot-link">Forgot password?</a>
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
        <div class="auth-notification">
            <div class="bg-success rounded-circle p-1 d-flex align-items-center justify-content-center" style="width: 24px; height: 24px;">
                <i class="bi bi-emoji-smile text-white" style="font-size: 0.8rem;"></i>
            </div>
            <div>
                <div class="fw-bold">Go you!</div>
                <div class="opacity-75">You've earned 12% more this month!</div>
            </div>
            <button type="button" class="btn-close btn-close-white ms-auto" style="font-size: 0.6rem;"></button>
        </div>

        <img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?q=80&w=2071&auto=format&fit=crop" alt="Marketing" class="auth-marketing-img">

        <div class="auth-card-overlay">
            <div class="d-flex align-items-center gap-2 mb-3">
                <div class="bg-white rounded-circle p-1" style="width: 24px; height: 24px;">
                    <img src="https://via.placeholder.com/20" alt="icon" class="w-100">
                </div>
                <div class="small opacity-75">Your funds</div>
            </div>
            <div class="h3 fw-bold mb-1">$1,440.32</div>
            <div class="small text-success">+ 4.8% this month</div>
            <div class="d-flex gap-2 mt-3">
                <div class="bg-white bg-opacity-10 rounded-circle p-2 d-flex align-items-center justify-content-center" style="width: 32px; height: 32px;">
                    <i class="bi bi-arrow-up-right"></i>
                </div>
                <div class="bg-white bg-opacity-10 rounded-circle p-2 d-flex align-items-center justify-content-center" style="width: 32px; height: 32px;">
                    <i class="bi bi-three-dots"></i>
                </div>
            </div>
        </div>

        <div class="auth-image-content">
            <div class="auth-marketing-text">
                <h2>Spread the word about the service you trust.</h2>
                <p>Give friends <strong>$20 off</strong> their first plan — and earn up to <strong>$130+</strong>.</p>
                <p>To obtain your referral link, just login and click on the Refer a Friend button</p>
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

<!-- passwordreset.tpl -->
<div class="auth-wrapper">
    <div class="auth-form-side">
        <div class="auth-logo">
            <a href="{$WEB_ROOT}/index.php">
                <img src="{$WEB_ROOT}/templates/{$template}/assets/images/logo.png" alt="Web Oceanx" onerror="this.src='https://via.placeholder.com/200x50?text=WEB+OCEANX'">
            </a>
        </div>

        <h1 class="auth-heading">Reset Password</h1>

        {if $success}
            <div class="alert alert-success rounded-4 border-0 small mb-4">
                <i class="bi bi-check-circle-fill me-2"></i>
                {$LANG.pwresetemailcheck}
            </div>
        {else}
            {if $error}
                <div class="alert alert-danger rounded-4 border-0 small mb-4">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    {$error}
                </div>
            {/if}

            <form method="post" action="passwordreset.php" role="form">
                <input type="hidden" name="action" value="reset">
                <input type="hidden" name="token" value="{$token}" />
                
                <div class="mb-4">
                    <label class="auth-label">Email *</label>
                    <input type="email" name="email" class="auth-input" placeholder="Enter the email address listed on your account" required autofocus>
                </div>

                <button type="submit" class="auth-btn-gradient">Send reset instructions</button>

                <div class="auth-footer-text">
                    <a href="login.php" class="text-decoration-none"><i class="bi bi-arrow-left me-1"></i> Back to Login</a>
                </div>
            </form>
        {/if}

        <div class="mt-auto pt-5 text-center text-muted small">
            <div class="d-flex justify-content-center gap-3 mb-2">
                <a href="#" class="text-muted text-decoration-none">Cookie Settings</a>
                <span>|</span>
                <a href="#" class="text-muted text-decoration-none">Give Feedback</a>
            </div>
            Web Oceanx Panel v1.0.0 | Copyright 2026
        </div>
    </div>

    <div class="auth-image-side">
        <div class="auth-image-content">
            <!-- Decorative content -->
        </div>
    </div>
</div>

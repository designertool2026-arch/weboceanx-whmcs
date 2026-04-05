<div class="auth-wrapper">
    <div class="auth-form-side">
        <div class="auth-logo">
            <a href="{$WEB_ROOT}/index.php">
                <img src="{$WEB_ROOT}/templates/{$template}/img/logo.png" alt="Web Oceanx" onerror="this.src='https://via.placeholder.com/200x50?text=WEB+OCEANX'">
            </a>
        </div>

        <h1 class="auth-heading">Reset your password</h1>

        {if $smarty.get.action == 'recover'}
            <h1 class="auth-heading">Account Recovery</h1>
            
            {if !$smarty.get.step}
                <p class="text-muted mb-4">What would you like to recover?</p>
                
                <a href="passwordreset.php?action=recover&step=verify" class="text-decoration-none">
                    <div class="recovery-option">
                        <i class="bi bi-shield-lock"></i>
                        <div class="recovery-option-text">
                            <h4>Lost Access to Hosting Account</h4>
                            <p>Recover access if you've lost your password or email.</p>
                        </div>
                        <i class="bi bi-chevron-right ms-auto small"></i>
                    </div>
                </a>

                <a href="passwordreset.php?action=recover&step=2fa" class="text-decoration-none">
                    <div class="recovery-option">
                        <i class="bi bi-phone"></i>
                        <div class="recovery-option-text">
                            <h4>2FA Removal</h4>
                            <p>Remove two-factor authentication from your account.</p>
                        </div>
                        <i class="bi bi-chevron-right ms-auto small"></i>
                    </div>
                </a>

                <div class="auth-footer-text mt-4">
                    <a href="passwordreset.php" class="text-decoration-none"><i class="bi bi-arrow-left me-1"></i> Back to Reset Password</a>
                </div>

            {elseif $smarty.get.step == 'verify'}
                <p class="text-muted mb-4">Account Owner Verification</p>
                <h4 class="fw-bold mb-4">Are you the account owner?</h4>

                <div class="recovery-radio-group mb-4">
                    <label class="recovery-radio-item">
                        <span>Yes, I am the owner</span>
                        <input type="radio" name="owner" value="yes" checked>
                    </label>
                    <label class="recovery-radio-item">
                        <span>No, I am acting on behalf of the owner</span>
                        <input type="radio" name="owner" value="no">
                    </label>
                </div>

                <div class="recovery-info-box">
                    <i class="bi bi-info-circle-fill"></i>
                    <div>Only the registered account owner can request recovery.</div>
                </div>

                <a href="passwordreset.php?action=recover&step=email_check" class="auth-btn-gradient text-center text-decoration-none d-block">Continue</a>

            {elseif $smarty.get.step == '2fa'}
                <p class="text-muted mb-4">Reason for 2FA Removal</p>
                <h4 class="fw-bold mb-4">Why do you need to remove 2FA?</h4>

                <div class="recovery-radio-group mb-4">
                    <label class="recovery-radio-item">
                        <span>I lost my phone / recovery device</span>
                        <input type="radio" name="reason" value="lost" checked>
                    </label>
                    <label class="recovery-radio-item">
                        <span>I have a new phone and can't access the old one</span>
                        <input type="radio" name="reason" value="new">
                    </label>
                    <label class="recovery-radio-item">
                        <span>The 2FA codes are not working</span>
                        <input type="radio" name="reason" value="not_working">
                    </label>
                </div>

                <a href="passwordreset.php?action=recover&step=email_check" class="auth-btn-gradient text-center text-decoration-none d-block">Continue</a>

            {elseif $smarty.get.step == 'email_check'}
                <p class="text-muted mb-4">Email Access Check</p>
                <h4 class="fw-bold mb-4">Do you have access to the email address on file?</h4>

                <div class="recovery-radio-group mb-4">
                    <label class="recovery-radio-item">
                        <span>Yes, I have access</span>
                        <input type="radio" name="email_access" value="yes" checked>
                    </label>
                    <label class="recovery-radio-item">
                        <span>No, I no longer have access to that email</span>
                        <input type="radio" name="email_access" value="no">
                    </label>
                </div>

                <a href="passwordreset.php?action=recover&step=domain" class="auth-btn-gradient text-center text-decoration-none d-block">Continue</a>

            {elseif $smarty.get.step == 'domain'}
                <p class="text-muted mb-4">Domain Information</p>
                
                <div class="mb-4">
                    <label class="auth-label">Primary Domain Name *</label>
                    <input type="text" class="auth-input" placeholder="example.com" required>
                </div>

                <div class="mb-4">
                    <label class="auth-label">Domain Registrar</label>
                    <input type="text" class="auth-input" placeholder="Where is your domain registered?">
                </div>

                <div class="recovery-warning-box">
                    <i class="bi bi-exclamation-triangle-fill"></i>
                    <div>Providing accurate domain info helps us verify your identity faster.</div>
                </div>

                <a href="passwordreset.php?action=recover&step=contact" class="auth-btn-gradient text-center text-decoration-none d-block">Continue</a>

            {elseif $smarty.get.step == 'contact'}
                <p class="text-muted mb-4">Contact Information</p>
                
                <div class="mb-4">
                    <label class="auth-label">Alternative Email Address *</label>
                    <input type="email" class="auth-input" placeholder="Where can we reach you?" required>
                </div>

                <div class="mb-4">
                    <label class="auth-label">Phone Number</label>
                    <input type="tel" class="auth-input" placeholder="+1 (555) 000-0000">
                </div>

                <div class="mb-4">
                    <label class="auth-label">Additional Details</label>
                    <textarea class="auth-input" rows="3" placeholder="Any other information that might help?"></textarea>
                </div>

                <button type="button" class="auth-btn-gradient" onclick="alert('Recovery request submitted!')">Submit Recovery Request</button>
            {/if}

        {elseif $success}
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
                
                <div class="mb-4">
                    <label class="auth-label">Email *</label>
                    <input type="email" name="email" class="auth-input" placeholder="Enter the email address listed on your account" required autofocus>
                </div>

                <button type="submit" class="auth-btn-gradient">Send reset instructions</button>

                <div class="auth-footer-text">
                    <a href="login.php" class="text-decoration-none"><i class="bi bi-arrow-left me-1"></i> Back to Login</a>
                </div>

                <div class="auth-footer-text mt-4">
                    Forgot your email? <a href="passwordreset.php?action=recover">Recover your account</a>
                </div>
            </form>
        {/if}

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
        <div class="auth-image-content">
            <!-- Decorative content can be added here if needed -->
        </div>
    </div>
</div>

{if $success}
<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 1100">
    <div class="toast show align-items-center text-white bg-success border-0 rounded-4 shadow-lg" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex p-3">
            <div class="me-3">
                <i class="bi bi-check-circle-fill fs-4"></i>
            </div>
            <div class="toast-body">
                <div class="fw-bold">Reset Password Link Sent!</div>
                <div class="small opacity-75">Check your email for reset instructions.</div>
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</div>
{/if}

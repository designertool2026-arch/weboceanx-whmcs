{* supportticketsubmit-stepone.tpl *}
<style>
    .auth-card { display: flex; min-height: 80vh; background: #ffffff; border-radius: 24px; box-shadow: 0 20px 40px rgba(0,0,0,0.08); overflow: hidden; margin-top: 2rem; margin-bottom: 2rem; }
    .auth-left { flex: 1; padding: 4rem; display: flex; flex-direction: column; justify-content: center; }
    .auth-right { flex: 1; background: linear-gradient(135deg, #4ade80, #0a251c); position: relative; display: flex; flex-direction: column; align-items: center; justify-content: center; padding: 4rem; color: white; }
    .btn-gradient { background: linear-gradient(135deg, #4ade80, #22c55e); color: #0a251c; font-weight: 600; border: none; transition: all 0.3s; }
    .btn-gradient:hover { transform: translateY(-2px); box-shadow: 0 10px 20px rgba(34, 197, 94, 0.2); color: #0a251c; }
    .form-control-lg, .form-select-lg { border-radius: 12px; border: 1px solid #e2e8f0; padding: 0.75rem 1.25rem; font-size: 1rem; }
    .form-control-lg:focus, .form-select-lg:focus { border-color: #22c55e; box-shadow: 0 0 0 3px rgba(34, 197, 94, 0.1); }
    .radio-card { border: 1px solid #e2e8f0; border-radius: 12px; padding: 1.5rem; cursor: pointer; transition: all 0.2s; display: flex; align-items: flex-start; gap: 1rem; margin-bottom: 1rem; }
    .radio-card:hover { border-color: #4ade80; background-color: #f0fdf4; }
    .radio-card.selected { border-color: #22c55e; background-color: #f0fdf4; box-shadow: 0 4px 12px rgba(34, 197, 94, 0.1); }
    @media (max-width: 991px) { .auth-card { flex-direction: column; } .auth-left, .auth-right { width: 100%; } .auth-right { display: none; } }
</style>


<div class="auth-card">
    <div class="auth-left">
        <div class="mb-5">
            <a href="{$WEB_ROOT}/index.php" class="text-decoration-none text-dark fw-bold fs-3 d-flex align-items-center gap-2">
                <i class="bi bi-cloud-fill" style="color: #22c55e;"></i> WebOceanX
            </a>
        </div>
        <h1 class="display-5 fw-bold mb-2 text-dark">Account Recovery</h1>
        <p class="text-muted mb-5">What would you like to recover? Select the type of account recovery you need.</p>
        
        <form method="post" action="submitticket.php?step=2" role="form">
            <input type="hidden" name="deptid" value="1"> {* Assuming dept 1 is support/recovery *}
            <input type="hidden" name="token" value="{$token}" />
            
            <label class="radio-card">
                <input type="radio" name="subject" value="Lost Access to Hosting Account" class="form-check-input mt-1" required>
                <div>
                    <div class="fw-bold text-dark">Lost Access to Hosting Account</div>
                    <div class="small text-muted">Email/phone no longer available</div>
                </div>
            </label>
            
            <label class="radio-card">
                <input type="radio" name="subject" value="2FA Removal Request" class="form-check-input mt-1" required>
                <div>
                    <div class="fw-bold text-dark">2FA Removal</div>
                    <div class="small text-muted">Remove two-factor authentication</div>
                </div>
            </label>
            
            <label class="radio-card">
                <input type="radio" name="subject" value="Account Hacked" class="form-check-input mt-1" required>
                <div>
                    <div class="fw-bold text-dark">Account Hacked</div>
                    <div class="small text-muted">Report suspicious activity on your account</div>
                </div>
            </label>
            
            <div class="mt-4 mb-4">
                <label class="form-label fw-bold text-dark small">Please provide a detailed explanation <span class="text-danger">*</span></label>
                <textarea name="message" class="form-control form-control-lg" rows="4" placeholder="Explain why you need recovery..." required></textarea>
            </div>
            
            <div class="d-flex justify-content-between align-items-center mt-5">
                <a href="login.php" class="text-dark fw-bold text-decoration-none"><i class="bi bi-arrow-left me-2"></i> Back to Login</a>
                <button type="submit" class="btn btn-gradient px-5 py-2 rounded-pill">Next</button>
            </div>
        </form>
    </div>
    <div class="auth-right">
        <!-- Background gradient only -->
    </div>
</div>

<script>
    document.querySelectorAll('input[name="subject"]').forEach(radio => {
        radio.addEventListener('change', function() {
            document.querySelectorAll('.radio-card').forEach(card => card.classList.remove('selected'));
            if(this.checked) {
                this.closest('.radio-card').classList.add('selected');
            }
        });
    });
</script>



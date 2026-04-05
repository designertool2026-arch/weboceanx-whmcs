{* password-reset-confirm.tpl *}
<style>
    .auth-card { display: flex; min-height: 80vh; background: #ffffff; border-radius: 24px; box-shadow: 0 20px 40px rgba(0,0,0,0.08); overflow: hidden; margin-top: 2rem; margin-bottom: 2rem; }
    .auth-left { flex: 1; padding: 4rem; display: flex; flex-direction: column; justify-content: center; }
    .auth-right { flex: 1; background: linear-gradient(135deg, #4ade80, #0a251c); position: relative; display: flex; flex-direction: column; align-items: center; justify-content: center; padding: 4rem; color: white; }
    .btn-gradient { background: linear-gradient(135deg, #4ade80, #22c55e); color: #0a251c; font-weight: 600; border: none; transition: all 0.3s; }
    .btn-gradient:hover { transform: translateY(-2px); box-shadow: 0 10px 20px rgba(34, 197, 94, 0.2); color: #0a251c; }
    .form-control-lg { border-radius: 12px; border: 1px solid #e2e8f0; padding: 0.75rem 1.25rem; font-size: 1rem; }
    .form-control-lg:focus { border-color: #22c55e; box-shadow: 0 0 0 3px rgba(34, 197, 94, 0.1); }
    @media (max-width: 991px) { .auth-card { flex-direction: column; } .auth-left, .auth-right { width: 100%; } .auth-right { display: none; } }
</style>


<div class="auth-card">
    <div class="auth-left">
        <div class="mb-5">
            <a href="{$WEB_ROOT}/index.php" class="text-decoration-none text-dark fw-bold fs-3 d-flex align-items-center gap-2">
                <i class="bi bi-cloud-fill" style="color: #22c55e;"></i> WebOceanX
            </a>
        </div>
        <h1 class="display-5 fw-bold mb-2 text-dark">Reset your password</h1>
        <p class="text-muted mb-5">Enter your new password below.</p>
        
        {if $errormessage}
            <div class="alert alert-danger rounded-3 border-0 bg-danger bg-opacity-10 text-danger">
                {$errormessage}
            </div>
        {/if}
        {if $successmessage}
            <div class="alert alert-success rounded-3 border-0 bg-success bg-opacity-10 text-success">
                {$successmessage}
                <div class="mt-3">
                    <a href="login.php" class="btn btn-success rounded-pill px-4">Login Now</a>
                </div>
            </div>
        {else}
            <form method="post" action="pwreset.php?action=reset" role="form">
                <input type="hidden" name="key" value="{$key}">
                <input type="hidden" name="token" value="{$token}" />
                
                <div class="mb-4">
                    <label class="form-label fw-bold text-dark small">New Password <span class="text-danger">*</span></label>
                    <input type="password" name="newpw" class="form-control form-control-lg" required autofocus>
                </div>
                <div class="mb-4">
                    <label class="form-label fw-bold text-dark small">Confirm New Password <span class="text-danger">*</span></label>
                    <input type="password" name="confirmpw" class="form-control form-control-lg" required>
                </div>
                
                <button type="submit" class="btn btn-gradient btn-lg w-100 rounded-pill mb-4">Save New Password</button>
            </form>
        {/if}
    </div>
    <div class="auth-right">
        <!-- Background gradient only -->
    </div>
</div>


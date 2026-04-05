{* login.tpl *}
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
        <h1 class="display-5 fw-bold mb-4 text-dark">Login</h1>
        
        {if $incorrect}
            <div class="alert alert-danger rounded-3 border-0 bg-danger bg-opacity-10 text-danger">
                <i class="bi bi-exclamation-triangle-fill me-2"></i> Login details incorrect. Please try again.
            </div>
        {/if}
        
        <form method="post" action="{$systemurl}dologin.php" role="form">
            <input type="hidden" name="token" value="{$token}" />
            <div class="mb-4">
                <label class="form-label fw-bold text-dark small">Username <span class="text-danger">*</span></label>
                <input type="email" name="username" class="form-control form-control-lg" placeholder="Email address" required autofocus>
            </div>
            <div class="mb-4">
                <label class="form-label fw-bold text-dark small">Password <span class="text-danger">*</span></label>
                <div class="input-group">
                    <input type="password" name="password" class="form-control form-control-lg border-end-0" placeholder="Password" required>
                    <span class="input-group-text bg-white border-start-0 text-muted" style="border-radius: 0 12px 12px 0;"><i class="bi bi-eye-slash"></i></span>
                </div>
            </div>
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" name="rememberme" id="rememberme">
                    <label class="form-check-label small text-muted" for="rememberme">Remember me</label>
                </div>
            </div>
            <button type="submit" class="btn btn-gradient btn-lg w-100 rounded-pill mb-4">Login</button>
            
            <div class="text-center text-muted small">
                New to WebOceanX? <a href="register.php" class="text-dark fw-bold text-decoration-underline">Create an account</a> to get started<br><br>
                <a href="pwreset.php" class="text-dark fw-bold text-decoration-underline">Forgot password?</a>
            </div>
        </form>
    </div>
    <div class="auth-right">
        <h2 class="fw-bold mb-4">Spread the word about the service you trust.</h2>
        <p class="lead opacity-75 mb-5">Give friends $20 off their first plan — and earn up to $130+.</p>
        <p class="small opacity-50 mt-auto">Check for service updates here <a href="serverstatus.php" class="text-white text-decoration-underline">status.weboceanx.com</a></p>
    </div>
</div>


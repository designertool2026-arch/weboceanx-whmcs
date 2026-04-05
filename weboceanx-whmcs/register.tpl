{* register.tpl *}
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
        <h1 class="display-5 fw-bold mb-4 text-dark">Sign Up</h1>
        
        {if $errormessage}
            <div class="alert alert-danger rounded-3 border-0 bg-danger bg-opacity-10 text-danger">
                <ul class="mb-0">
                    {$errormessage}
                </ul>
            </div>
        {/if}
        
        <form method="post" action="register.php?action=register" role="form">
            <input type="hidden" name="token" value="{$token}" />
            <div class="row g-3 mb-3">
                <div class="col-md-6">
                    <label class="form-label fw-bold text-dark small">First name <span class="text-danger">*</span></label>
                    <input type="text" name="firstname" class="form-control form-control-lg" value="{$clientfirstname}" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold text-dark small">Last name <span class="text-danger">*</span></label>
                    <input type="text" name="lastname" class="form-control form-control-lg" value="{$clientlastname}" required>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold text-dark small">Email <span class="text-danger">*</span></label>
                <input type="email" name="email" class="form-control form-control-lg" value="{$clientemail}" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold text-dark small">Phone number <span class="text-danger">*</span></label>
                <input type="tel" name="phonenumber" class="form-control form-control-lg" value="{$clientphonenumber}" required>
            </div>
            <div class="row g-3 mb-4">
                <div class="col-md-6">
                    <label class="form-label fw-bold text-dark small">Password <span class="text-danger">*</span></label>
                    <input type="password" name="password" class="form-control form-control-lg" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold text-dark small">Confirm Password <span class="text-danger">*</span></label>
                    <input type="password" name="confirmpassword" class="form-control form-control-lg" required>
                </div>
            </div>
            
            <div class="form-check mb-4">
                <input type="checkbox" class="form-check-input" name="accepttos" id="accepttos" required>
                <label class="form-check-label small text-muted" for="accepttos">
                    I agree to the <a href="{$tosurl}" target="_blank" class="text-dark fw-bold">Terms of Service</a> and <a href="#" class="text-dark fw-bold">Privacy Policy</a>
                </label>
            </div>
            
            <button type="submit" class="btn btn-gradient btn-lg w-100 rounded-pill mb-4">Sign Up</button>
            
            <div class="text-center text-muted small">
                Already have an account? <a href="login.php" class="text-dark fw-bold text-decoration-underline">Login</a>
            </div>
        </form>
    </div>
    <div class="auth-right">
        <h2 class="fw-bold mb-4">Join WebOceanX today.</h2>
        <p class="lead opacity-75 mb-5">Experience lightning-fast hosting, top-tier security, and 24/7 expert support.</p>
    </div>
</div>


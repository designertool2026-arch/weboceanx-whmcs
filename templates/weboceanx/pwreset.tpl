{* pwreset.tpl *}
<style>
    .auth-card { background-color: #1e293b; border-radius: 24px; box-shadow: 0 20px 40px rgba(0,0,0,0.3); padding: 2rem; }
    .btn-neon { background: linear-gradient(135deg, #4ade80, #22c55e); color: #0a251c; font-weight: 600; border: none; transition: all 0.3s; }
    .btn-neon:hover { transform: translateY(-2px); box-shadow: 0 10px 20px rgba(34, 197, 94, 0.2); }
    .form-control { background-color: #0f172a; border: 1px solid #334155; color: #e2e8f0; border-radius: 12px; padding: 0.75rem 1.25rem; }
    .form-control:focus { border-color: #4ade80; box-shadow: 0 0 0 3px rgba(74, 222, 128, 0.1); background-color: #0f172a; color: #e2e8f0; }
</style>

<div class="row justify-content-center">
    <div class="col-md-6 col-lg-5">
        <div class="auth-card">
            <h3 class="fw-bold text-white mb-4">Password Reset</h3>
            
            {if $errormessage}
                <div class="alert alert-danger mb-4 bg-danger bg-opacity-10 border-0 text-danger">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i> {$errormessage}
                </div>
            {/if}

            {if $successful}
                <div class="alert alert-success mb-4 bg-success bg-opacity-10 border-0 text-success">
                    <i class="bi bi-check-circle-fill me-2"></i> {$successful}
                </div>
            {else}
                <form method="post" action="pwreset.php" class="needs-validation" novalidate>
                    <input type="hidden" name="action" value="reset" />
                    
                    <div class="mb-3">
                        <label for="email" class="form-label text-white fw-bold small">Email Address</label>
                        <input type="email" name="email" id="email" class="form-control" required>
                    </div>
                    
                    <button type="submit" class="btn btn-neon w-100 rounded-pill fw-bold mt-3">Request Reset</button>
                </form>
            {/if}
            
            <div class="text-center mt-4">
                <a href="login.php" class="text-muted small text-decoration-none">Back to Login</a>
            </div>
        </div>
    </div>
</div>

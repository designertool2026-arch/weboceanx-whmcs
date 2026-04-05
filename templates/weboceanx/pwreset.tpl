{* pwreset.tpl *}
<div class="row justify-content-center">
    <div class="col-md-6 col-lg-5">
        <div class="card border-0 shadow-sm rounded-4 p-4" style="background-color: var(--wo-bg-card);">
            <div class="card-body">
                <h3 class="fw-bold text-white mb-4">Password Reset</h3>
                
                {if $errormessage}
                    <div class="alert alert-danger mb-4">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i> {$errormessage}
                    </div>
                {/if}

                {if $successful}
                    <div class="alert alert-success mb-4">
                        <i class="bi bi-check-circle-fill me-2"></i> {$successful}
                    </div>
                {else}
                    <form method="post" action="pwreset.php" class="needs-validation" novalidate>
                        <input type="hidden" name="action" value="reset" />
                        
                        <div class="mb-3">
                            <label for="email" class="form-label text-white fw-bold small">Email Address</label>
                            <input type="email" name="email" id="email" class="form-control bg-dark border-secondary text-white" required>
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
</div>

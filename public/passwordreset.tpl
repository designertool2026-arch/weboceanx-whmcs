<div class="row justify-content-center py-5">
    <div class="col-md-6 col-lg-4">
        <div class="card border-0 shadow-lg rounded-4 overflow-hidden">
            <div class="card-header bg-dark-green text-white p-5 text-center">
                <h2 class="fw-bold mb-3 text-neon">Reset Password</h2>
                <p class="opacity-75 mb-0">Enter your email to receive a reset link.</p>
            </div>
            <div class="card-body p-5">
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
                        
                        <div class="mb-4">
                            <label class="form-label fw-bold">Email Address</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light border-0 rounded-start-pill ps-4 pe-3">
                                    <i class="bi bi-envelope text-muted"></i>
                                </span>
                                <input type="email" name="email" class="form-control bg-light border-0 rounded-end-pill py-2 pe-4" placeholder="name@example.com" required autofocus>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-neon w-100 rounded-pill py-3 fw-bold shadow-lg mb-4">
                            Send Reset Link
                        </button>

                        <div class="text-center">
                            <p class="text-muted small mb-0">Remembered your password? <a href="login.php" class="text-success text-decoration-none fw-bold">Back to Login</a></p>
                        </div>
                    </form>
                {/if}
            </div>
        </div>
    </div>
</div>

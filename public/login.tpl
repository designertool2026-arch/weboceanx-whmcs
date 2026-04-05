<div class="row justify-content-center py-5">
    <div class="col-md-6 col-lg-4">
        <div class="card border-0 shadow-lg rounded-4 overflow-hidden">
            <div class="card-header bg-dark-green text-white p-5 text-center">
                <h2 class="fw-bold mb-3 text-neon">Welcome Back</h2>
                <p class="opacity-75 mb-0">Sign in to manage your hosting services.</p>
            </div>
            <div class="card-body p-5">
                {if $incorrect}
                    <div class="alert alert-danger rounded-4 border-0 small mb-4">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>
                        {$LANG.loginincorrect}
                    </div>
                {/if}

                <form method="post" action="{$systemurl}dologin.php" role="form">
                    <div class="mb-4">
                        <label class="form-label fw-bold">Email Address</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-0 rounded-start-pill ps-4 pe-3">
                                <i class="bi bi-envelope text-muted"></i>
                            </span>
                            <input type="email" name="username" class="form-control bg-light border-0 rounded-end-pill py-2 pe-4" placeholder="name@example.com" required autofocus>
                        </div>
                    </div>

                    <div class="mb-4">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <label class="form-label fw-bold m-0">Password</label>
                            <a href="passwordreset.php" class="small text-success text-decoration-none fw-bold">Forgot?</a>
                        </div>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-0 rounded-start-pill ps-4 pe-3">
                                <i class="bi bi-lock text-muted"></i>
                            </span>
                            <input type="password" name="password" class="form-control bg-light border-0 rounded-end-pill py-2 pe-4" placeholder="••••••••" required>
                        </div>
                    </div>

                    <div class="form-check mb-4">
                        <input class="form-check-input" type="checkbox" name="rememberme" id="rememberme">
                        <label class="form-check-label small text-muted" for="rememberme">
                            Remember me for 30 days
                        </label>
                    </div>

                    <button type="submit" class="btn btn-neon w-100 rounded-pill py-3 fw-bold shadow-lg mb-4">
                        Login to Dashboard
                    </button>

                    <div class="text-center">
                        <p class="text-muted small mb-0">Don't have an account? <a href="register.php" class="text-success text-decoration-none fw-bold">Create one now</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

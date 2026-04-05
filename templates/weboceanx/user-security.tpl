{* user-security.tpl *}
<style>
    .security-card { border-radius: 16px; border: 1px solid #334155; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.3); transition: all 0.3s; background-color: #1e293b; color: #e2e8f0; }
    .security-card:hover { box-shadow: 0 10px 25px -5px rgba(0,0,0,0.5); border-color: #4ade80; }
    .icon-box { width: 48px; height: 48px; border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 1.5rem; }
    .bg-green-soft { background-color: #064e3b; color: #4ade80; }
    .bg-gray-soft { background-color: #334155; color: #94a3b8; }
    .btn-gradient { background: linear-gradient(135deg, #4ade80, #22c55e); color: #0a251c; font-weight: 600; border: none; }
    .btn-gradient:hover { transform: translateY(-1px); box-shadow: 0 4px 12px rgba(34, 197, 94, 0.2); color: #0a251c; }
    .form-control { background-color: #0f172a; border: 1px solid #334155; color: #e2e8f0; border-radius: 12px; padding: 0.75rem 1.25rem; }
</style>

<div class="row mb-4">
    <div class="col-12">
        <h2 class="fw-bold text-white mb-2">Security Settings</h2>
        <p class="text-muted">Manage your account security, two-factor authentication, and backup codes.</p>
    </div>
</div>

<div class="row g-4">
    <div class="col-md-6">
        <div class="card security-card h-100 p-4">
            <div class="d-flex align-items-start mb-4">
                <div class="icon-box {if $twofaenabled}bg-green-soft{else}bg-gray-soft{/if} me-3">
                    <i class="bi bi-shield-lock-fill"></i>
                </div>
                <div>
                    <h5 class="fw-bold text-white mb-1">Two-Factor Authentication</h5>
                    <p class="text-muted small mb-0">Add an extra layer of security to your account.</p>
                </div>
            </div>
            
            {if $twofaenabled}
                <div class="alert alert-success bg-success bg-opacity-10 border-0 rounded-3 text-success small mb-4">
                    <i class="bi bi-check-circle-fill me-2"></i> Two-factor authentication is currently enabled.
                </div>
                <div class="mt-auto">
                    <a href="clientarea.php?action=security&twofadisable=1" class="btn btn-outline-danger rounded-pill px-4">Disable 2FA</a>
                </div>
            {else}
                <div class="alert alert-secondary bg-secondary bg-opacity-10 border-0 rounded-3 text-secondary small mb-4">
                    <i class="bi bi-info-circle-fill me-2"></i> Two-factor authentication is currently disabled.
                </div>
                <div class="mt-auto">
                    <a href="clientarea.php?action=security&twofaenable=1" class="btn btn-gradient rounded-pill px-4">Enable 2FA</a>
                </div>
            {/if}
        </div>
    </div>
    
    <div class="col-md-6">
        <div class="card security-card h-100 p-4">
            <div class="d-flex align-items-start mb-4">
                <div class="icon-box bg-gray-soft me-3">
                    <i class="bi bi-key-fill"></i>
                </div>
                <div>
                    <h5 class="fw-bold text-white mb-1">Password Management</h5>
                    <p class="text-muted small mb-0">Update your password regularly to keep your account secure.</p>
                </div>
            </div>
            
            <div class="mt-auto">
                <a href="clientarea.php?action=changepw" class="btn btn-outline-light rounded-pill px-4">Change Password</a>
            </div>
        </div>
    </div>

    <div class="col-md-12">
        <div class="card security-card p-4">
            <h5 class="fw-bold text-white mb-4">Security Questions</h5>
            <form method="post" action="clientarea.php?action=security">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label text-white small">Question 1</label>
                        <select name="question1" class="form-select bg-dark border-secondary text-white">
                            <option value="1">What was your first pet's name?</option>
                            <option value="2">What is your mother's maiden name?</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label text-white small">Answer 1</label>
                        <input type="text" name="answer1" class="form-control" placeholder="Your answer">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label text-white small">Question 2</label>
                        <select name="question2" class="form-select bg-dark border-secondary text-white">
                            <option value="3">What city were you born in?</option>
                            <option value="4">What is your favorite book?</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label text-white small">Answer 2</label>
                        <input type="text" name="answer2" class="form-control" placeholder="Your answer">
                    </div>
                </div>
                <button type="submit" class="btn btn-gradient rounded-pill px-4 mt-4">Save Security Questions</button>
            </form>
        </div>
    </div>
</div>

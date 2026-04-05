<!-- clientarea.tpl -->
{if $loggedin}
<div class="row g-4 mb-4">
    <div class="col-md-4">
        <div class="card border-0 shadow-sm rounded-4 p-4 d-flex flex-row align-items-center gap-3" style="background-color: var(--wo-bg-card);">
            <div class="stat-icon bg-success bg-opacity-10 text-success rounded-3 p-3">
                <i class="bi bi-hdd-network fs-3"></i>
            </div>
            <div>
                <h3 class="m-0 fw-bold text-white">{$clientsstats.productsnumactive}</h3>
                <p class="text-muted small m-0 text-uppercase fw-bold">Active Services</p>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card border-0 shadow-sm rounded-4 p-4 d-flex flex-row align-items-center gap-3" style="background-color: var(--wo-bg-card);">
            <div class="stat-icon bg-primary bg-opacity-10 text-primary rounded-3 p-3">
                <i class="bi bi-globe fs-3"></i>
            </div>
            <div>
                <h3 class="m-0 fw-bold text-white">{$clientsstats.numactivedomains}</h3>
                <p class="text-muted small m-0 text-uppercase fw-bold">Domains</p>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card border-0 shadow-sm rounded-4 p-4 d-flex flex-row align-items-center gap-3" style="background-color: var(--wo-bg-card);">
            <div class="stat-icon bg-warning bg-opacity-10 text-warning rounded-3 p-3">
                <i class="bi bi-ticket-detailed fs-3"></i>
            </div>
            <div>
                <h3 class="m-0 fw-bold text-white">{$clientsstats.numactivetickets}</h3>
                <p class="text-muted small m-0 text-uppercase fw-bold">Active Tickets</p>
            </div>
        </div>
    </div>
</div>
{/if}

{if $successful}
    <div class="alert alert-success">
        <i class="bi bi-check-circle-fill me-2"></i> Changes Saved Successfully!
    </div>
{/if}

{if $errormessage}
    <div class="alert alert-danger">
        <i class="bi bi-exclamation-triangle-fill me-2"></i> {$errormessage}
    </div>
{/if}

<div class="row g-4">
    <div class="col-lg-8">
        <div class="card border-0 shadow-sm rounded-4 mb-4" style="background-color: var(--wo-bg-card);">
            <div class="card-header border-bottom border-secondary p-4 bg-transparent">
                <h3 class="m-0 fw-bold text-white">My Details</h3>
                <p class="text-muted small m-0 mt-1">Update your personal information and contact details.</p>
            </div>
            <div class="card-body p-4">
                <form method="post" action="clientarea.php?action=details" class="needs-validation" novalidate>
                    <input type="hidden" name="token" value="{$token}" />
                    <div class="row g-4">
                        <div class="col-md-6">
                            <label for="firstname" class="form-label text-white fw-bold small">First Name</label>
                            <input type="text" name="firstname" id="firstname" value="{$clientfirstname}" class="form-control bg-dark border-secondary text-white" required>
                        </div>
                        <div class="col-md-6">
                            <label for="lastname" class="form-label text-white fw-bold small">Last Name</label>
                            <input type="text" name="lastname" id="lastname" value="{$clientlastname}" class="form-control bg-dark border-secondary text-white" required>
                        </div>
                        <div class="col-md-6">
                            <label for="email" class="form-label text-white fw-bold small">Email Address</label>
                            <input type="email" name="email" id="email" value="{$clientemail}" class="form-control bg-dark border-secondary text-white" required>
                        </div>
                        <div class="col-md-6">
                            <label for="phonenumber" class="form-label text-white fw-bold small">Phone Number</label>
                            <input type="tel" name="phonenumber" id="phonenumber" value="{$clientphonenumber}" class="form-control bg-dark border-secondary text-white" required>
                        </div>
                        <div class="col-md-12">
                            <label for="companyname" class="form-label text-white fw-bold small">Company Name (Optional)</label>
                            <input type="text" name="companyname" id="companyname" value="{$clientcompanyname}" class="form-control bg-dark border-secondary text-white">
                        </div>
                        <div class="col-md-12">
                            <label for="address1" class="form-label text-white fw-bold small">Address 1</label>
                            <input type="text" name="address1" id="address1" value="{$clientaddress1}" class="form-control bg-dark border-secondary text-white" required>
                        </div>
                        <div class="col-md-12">
                            <label for="address2" class="form-label text-white fw-bold small">Address 2 (Optional)</label>
                            <input type="text" name="address2" id="address2" value="{$clientaddress2}" class="form-control bg-dark border-secondary text-white">
                        </div>
                        <div class="col-md-4">
                            <label for="city" class="form-label text-white fw-bold small">City</label>
                            <input type="text" name="city" id="city" value="{$clientcity}" class="form-control bg-dark border-secondary text-white" required>
                        </div>
                        <div class="col-md-4">
                            <label for="state" class="form-label text-white fw-bold small">State/Region</label>
                            <input type="text" name="state" id="state" value="{$clientstate}" class="form-control bg-dark border-secondary text-white" required>
                        </div>
                        <div class="col-md-4">
                            <label for="postcode" class="form-label text-white fw-bold small">Zip/Postcode</label>
                            <input type="text" name="postcode" id="postcode" value="{$clientpostcode}" class="form-control bg-dark border-secondary text-white" required>
                        </div>
                        <div class="col-md-12">
                            <label for="country" class="form-label text-white fw-bold small">Country</label>
                            {$clientcountriesdropdown|replace:'class="form-control"':'class="form-select bg-dark border-secondary text-white"'}
                        </div>
                    </div>

                    <div class="mt-5 pt-4 border-top border-secondary d-flex justify-content-end gap-3">
                        <button type="reset" class="btn btn-outline-light rounded-pill px-4">Cancel</button>
                        <button type="submit" name="save" class="btn btn-neon rounded-pill px-4">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="col-lg-4">
        <div class="card border-0 shadow-sm rounded-4 mb-4" style="background-color: var(--wo-bg-card);">
            <div class="card-header border-bottom border-secondary p-4 bg-transparent">
                <h5 class="m-0 fw-bold text-white">Quick Actions</h5>
            </div>
            <div class="card-body p-0">
                <div class="list-group list-group-flush">
                    <a href="clientarea.php?action=products" class="list-group-item list-group-item-action bg-transparent border-secondary text-white py-3 px-4 hover-bg-dark">
                        <i class="bi bi-hdd-network me-2 text-success"></i> View All Services
                    </a>
                    <a href="clientarea.php?action=domains" class="list-group-item list-group-item-action bg-transparent border-secondary text-white py-3 px-4 hover-bg-dark">
                        <i class="bi bi-globe me-2 text-primary"></i> Manage Domains
                    </a>
                    <a href="submitticket.php" class="list-group-item list-group-item-action bg-transparent border-0 text-white py-3 px-4 hover-bg-dark">
                        <i class="bi bi-life-preserver me-2 text-warning"></i> Open Support Ticket
                    </a>
                </div>
            </div>
        </div>
        
        <div class="card border-0 shadow-sm rounded-4 bg-gradient-primary text-white p-4">
            <h6 class="fw-bold mb-2">Account Security</h6>
            <p class="small mb-3 opacity-75">Keep your account safe by enabling two-factor authentication.</p>
            <a href="clientarea.php?action=security" class="btn btn-light btn-sm rounded-pill w-100 fw-bold">Manage Security</a>
        </div>
    </div>
</div>

<style>
    .hover-bg-dark:hover { background-color: rgba(255,255,255,0.05); }
    .bg-gradient-primary { background: linear-gradient(135deg, #114232 0%, #0a251c 100%); }
</style>

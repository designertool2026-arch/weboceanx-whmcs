<!-- domaintransfer.tpl -->
<div class="card border-0 shadow-lg rounded-4 overflow-hidden mb-5 bg-dark-green text-white">
    <div class="card-body p-5 text-center">
        <h1 class="display-5 fw-bold mb-4">Transfer your domain</h1>
        <p class="lead mb-5 opacity-75">Transfer your existing domain to Web Oceanx and save on renewal fees.</p>
        
        <form method="post" action="cart.php?a=add&domain=transfer" class="mx-auto text-start" style="max-width: 600px;">
            <input type="hidden" name="token" value="{$token}" />
            <div class="mb-4">
                <label class="form-label fw-bold text-white opacity-75">Domain Name</label>
                <input type="text" name="domain" class="form-control form-control-lg rounded-3 border-0 py-3" placeholder="e.g. example.com" required>
            </div>
            <div class="mb-4">
                <label class="form-label fw-bold text-white opacity-75">EPP Code / Auth Code</label>
                <input type="text" name="epp" class="form-control form-control-lg rounded-3 border-0 py-3" placeholder="Enter your authorization code" required>
                <div class="form-text text-white opacity-50 mt-2"><i class="bi bi-info-circle me-1"></i> You can obtain the EPP code from your current domain registrar.</div>
            </div>
            <button class="btn btn-gradient btn-lg w-100 rounded-pill fw-bold py-3 mt-2" type="submit">Initiate Transfer <i class="bi bi-arrow-right ms-2"></i></button>
        </form>
    </div>
</div>

<div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-5">
    <div class="card-header bg-white border-0 p-4 d-flex justify-content-between align-items-center">
        <h5 class="m-0 fw-bold text-dark">Recent Transfer Status</h5>
        <a href="clientarea.php?action=domains" class="btn btn-sm btn-light rounded-pill px-3">Manage All Domains</a>
    </div>
    <div class="table-responsive">
        <table class="table table-hover align-middle mb-0 text-dark">
            <thead class="bg-light">
                <tr>
                    <th class="ps-4">Domain Name</th>
                    <th>Initiated Date</th>
                    <th>Status</th>
                    <th class="pe-4 text-end">Action</th>
                </tr>
            </thead>
            <tbody>
                {* This is a placeholder section as WHMCS typically handles transfer status in the domains list *}
                <tr>
                    <td class="ps-4">
                        <div class="fw-bold">example-transfer.com</div>
                    </td>
                    <td>2026-04-01</td>
                    <td>
                        <span class="badge rounded-pill bg-warning text-dark px-3 py-2">
                            <i class="bi bi-clock-history me-1"></i> Transfer Pending
                        </span>
                    </td>
                    <td class="pe-4 text-end">
                        <a href="#" class="btn btn-sm btn-outline-dark rounded-pill px-3">Details</a>
                    </td>
                </tr>
                <tr>
                    <td class="ps-4">
                        <div class="fw-bold">mywebsite-old.net</div>
                    </td>
                    <td>2026-03-25</td>
                    <td>
                        <span class="badge rounded-pill bg-success text-white px-3 py-2">
                            <i class="bi bi-check-circle me-1"></i> Transfer Complete
                        </span>
                    </td>
                    <td class="pe-4 text-end">
                        <a href="#" class="btn btn-sm btn-outline-dark rounded-pill px-3">Manage</a>
                    </td>
                </tr>
                <tr>
                    <td class="ps-4">
                        <div class="fw-bold">failed-domain.org</div>
                    </td>
                    <td>2026-03-20</td>
                    <td>
                        <span class="badge rounded-pill bg-danger text-white px-3 py-2">
                            <i class="bi bi-x-circle me-1"></i> Transfer Failed
                        </span>
                    </td>
                    <td class="pe-4 text-end">
                        <a href="#" class="btn btn-sm btn-outline-danger rounded-pill px-3">Retry</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<div class="row g-4 mb-5">
    <div class="col-12 text-center mb-4">
        <h2 class="fw-bold text-dark">How to transfer your domain</h2>
        <p class="text-muted">Follow these simple steps to move your domain to Web Oceanx.</p>
    </div>
    <div class="col-md-4">
        <div class="card border-0 shadow-sm rounded-4 h-100 p-4 text-center hover-lift">
            <div class="bg-light rounded-circle d-inline-flex align-items-center justify-content-center mx-auto mb-4" style="width: 80px; height: 80px;">
                <i class="bi bi-unlock fs-1 text-success"></i>
            </div>
            <h4 class="fw-bold mb-3">1. Unlock Domain</h4>
            <p class="text-muted mb-0">Log in to your current registrar's control panel and unlock your domain name to allow the transfer.</p>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card border-0 shadow-sm rounded-4 h-100 p-4 text-center hover-lift">
            <div class="bg-light rounded-circle d-inline-flex align-items-center justify-content-center mx-auto mb-4" style="width: 80px; height: 80px;">
                <i class="bi bi-key fs-1 text-success"></i>
            </div>
            <h4 class="fw-bold mb-3">2. Get EPP Code</h4>
            <p class="text-muted mb-0">Request the Authorization Code (EPP Code) from your current registrar. You'll need this to prove ownership.</p>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card border-0 shadow-sm rounded-4 h-100 p-4 text-center hover-lift">
            <div class="bg-light rounded-circle d-inline-flex align-items-center justify-content-center mx-auto mb-4" style="width: 80px; height: 80px;">
                <i class="bi bi-check2-circle fs-1 text-success"></i>
            </div>
            <h4 class="fw-bold mb-3">3. Initiate Transfer</h4>
            <p class="text-muted mb-0">Enter your domain and EPP code above, complete the checkout, and we'll handle the rest automatically.</p>
        </div>
    </div>
</div>

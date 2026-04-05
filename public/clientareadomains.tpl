{include file="$template/header.tpl"}

<div class="container-fluid px-lg-5 py-5">
    <!-- Page Header -->
    <div class="d-md-flex justify-content-between align-items-center mb-5">
        <div>
            <h1 class="display-5 fw-bold mb-2">My <span class="text-success">Domains</span></h1>
            <p class="text-muted lead mb-0">Manage your registered domain names and renewals.</p>
        </div>
        <div class="mt-4 mt-md-0 d-flex gap-2">
            <a href="domainchecker.php" class="btn btn-neon btn-lg rounded-pill px-5 fw-bold shadow-lg">
                <i class="bi bi-plus-lg me-2"></i> Register New
            </a>
            <a href="cart.php?a=add&domain=transfer" class="btn btn-outline-success btn-lg rounded-pill px-5 fw-bold">
                <i class="bi bi-arrow-left-right me-2"></i> Transfer
            </a>
        </div>
    </div>

    <!-- Domains Table -->
    <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
        <div class="card-header bg-white border-0 p-4 d-flex justify-content-between align-items-center">
            <h5 class="m-0 fw-bold">Active Domains</h5>
            <div class="badge bg-light text-dark rounded-pill px-3 py-2">Total: {$numdomains}</div>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-light">
                        <tr>
                            <th class="ps-4">Domain Name</th>
                            <th>Registration Date</th>
                            <th>Expiry Date</th>
                            <th>Auto Renew</th>
                            <th>Status</th>
                            <th class="pe-4 text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $domains as $domain}
                        <tr>
                            <td class="ps-4">
                                <div class="fw-bold fs-5">{$domain.domain}</div>
                            </td>
                            <td>
                                <span class="small text-muted">{$domain.registrationdate}</span>
                            </td>
                            <td>
                                <span class="small text-muted">{$domain.expirydate}</span>
                            </td>
                            <td>
                                {if $domain.autorenew}
                                    <span class="text-success fw-bold small"><i class="bi bi-check-circle-fill me-1"></i> Enabled</span>
                                {else}
                                    <span class="text-muted small"><i class="bi bi-x-circle-fill me-1"></i> Disabled</span>
                                {/if}
                            </td>
                            <td>
                                {if $domain.status == 'Active'}
                                    <span class="badge bg-success-subtle text-success rounded-pill px-3 py-2">Active</span>
                                {elseif $domain.status == 'Pending'}
                                    <span class="badge bg-warning-subtle text-warning rounded-pill px-3 py-2">Pending</span>
                                {elseif $domain.status == 'Expired'}
                                    <span class="badge bg-danger-subtle text-danger rounded-pill px-3 py-2">Expired</span>
                                {else}
                                    <span class="badge bg-light text-dark rounded-pill px-3 py-2">{$domain.status}</span>
                                {/if}
                            </td>
                            <td class="pe-4 text-end">
                                <a href="clientarea.php?action=domaindetails&id={$domain.id}" class="btn btn-sm btn-outline-success rounded-pill px-4 fw-bold">
                                    Manage
                                </a>
                            </td>
                        </tr>
                        {foreachelse}
                        <tr>
                            <td colspan="6" class="text-center py-5 text-muted">
                                <div class="py-4">
                                    <i class="bi bi-globe display-4 opacity-25 d-block mb-3"></i>
                                    <p class="fs-5 mb-0">No domains found.</p>
                                    <a href="domainchecker.php" class="text-success fw-bold text-decoration-none">Register your first domain now</a>
                                </div>
                            </td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<style>
    .btn-neon { background-color: #00ff66; color: #0a251c; border: none; transition: all 0.3s ease; }
    .btn-neon:hover { background-color: #00e65c; transform: translateY(-2px); box-shadow: 0 8px 15px rgba(0, 255, 102, 0.3); }
    .bg-success-subtle { background-color: rgba(0, 255, 102, 0.1); }
    .bg-warning-subtle { background-color: rgba(255, 193, 7, 0.1); }
    .bg-danger-subtle { background-color: rgba(220, 53, 69, 0.1); }
</style>

{include file="$template/footer.tpl"}

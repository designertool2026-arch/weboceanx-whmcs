{include file="$template/header.tpl"}

<div class="container-fluid px-lg-5 py-5">
    <!-- Page Header -->
    <div class="d-md-flex justify-content-between align-items-center mb-5">
        <div>
            <h1 class="display-5 fw-bold mb-2">My <span class="text-success">Products & Services</span></h1>
            <p class="text-muted lead mb-0">Manage your active hosting plans and other services.</p>
        </div>
        <div class="mt-4 mt-md-0">
            <a href="cart.php" class="btn btn-neon btn-lg rounded-pill px-5 fw-bold shadow-lg">
                <i class="bi bi-plus-lg me-2"></i> Order New Service
            </a>
        </div>
    </div>

    <!-- Services Table -->
    <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
        <div class="card-header bg-white border-0 p-4 d-flex justify-content-between align-items-center">
            <h5 class="m-0 fw-bold">Active Services</h5>
            <div class="badge bg-light text-dark rounded-pill px-3 py-2">Total: {$numservices}</div>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-light">
                        <tr>
                            <th class="ps-4">Product/Service</th>
                            <th>Pricing</th>
                            <th>Next Due Date</th>
                            <th>Status</th>
                            <th class="pe-4 text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $services as $service}
                        <tr>
                            <td class="ps-4">
                                <div class="fw-bold fs-5">{$service.product}</div>
                                <div class="small text-muted">{$service.domain}</div>
                            </td>
                            <td>
                                <div class="fw-bold">{$service.amount}</div>
                                <div class="small text-muted">{$service.billingcycle}</div>
                            </td>
                            <td>
                                <span class="small text-muted">{$service.nextduedate}</span>
                            </td>
                            <td>
                                {if $service.status == 'Active'}
                                    <span class="badge bg-success-subtle text-success rounded-pill px-3 py-2">Active</span>
                                {elseif $service.status == 'Pending'}
                                    <span class="badge bg-warning-subtle text-warning rounded-pill px-3 py-2">Pending</span>
                                {elseif $service.status == 'Suspended'}
                                    <span class="badge bg-danger-subtle text-danger rounded-pill px-3 py-2">Suspended</span>
                                {elseif $service.status == 'Terminated'}
                                    <span class="badge bg-secondary-subtle text-secondary rounded-pill px-3 py-2">Terminated</span>
                                {else}
                                    <span class="badge bg-light text-dark rounded-pill px-3 py-2">{$service.status}</span>
                                {/if}
                            </td>
                            <td class="pe-4 text-end">
                                <a href="clientarea.php?action=productdetails&id={$service.id}" class="btn btn-sm btn-outline-success rounded-pill px-4 fw-bold">
                                    Manage
                                </a>
                            </td>
                        </tr>
                        {foreachelse}
                        <tr>
                            <td colspan="5" class="text-center py-5 text-muted">
                                <div class="py-4">
                                    <i class="bi bi-box-seam display-4 opacity-25 d-block mb-3"></i>
                                    <p class="fs-5 mb-0">No services found.</p>
                                    <a href="cart.php" class="text-success fw-bold text-decoration-none">Order your first service now</a>
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
    .bg-secondary-subtle { background-color: rgba(108, 117, 125, 0.1); }
</style>

{include file="$template/footer.tpl"}

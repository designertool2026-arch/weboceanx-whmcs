<!-- clientareabilling.tpl -->
<div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-4">
    <div class="card-header bg-white border-0 p-4">
        <h5 class="m-0 fw-bold text-dark">Billing Information</h5>
    </div>
    <div class="card-body p-4 text-dark">
        <div class="row g-4">
            <div class="col-md-6">
                <div class="mb-3">
                    <label class="form-label fw-bold text-muted small text-uppercase">Payment Method</label>
                    <div class="d-flex align-items-center gap-3 p-3 bg-light rounded-3">
                        <i class="bi bi-credit-card fs-3 text-success"></i>
                        <div>
                            <h6 class="fw-bold mb-0">{$paymentmethod}</h6>
                            <p class="m-0 small text-muted">Default payment method for your account.</p>
                        </div>
                        <a href="clientarea.php?action=details" class="btn btn-sm btn-outline-success rounded-pill ms-auto">Change</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="mb-3">
                    <label class="form-label fw-bold text-muted small text-uppercase">Credit Balance</label>
                    <div class="d-flex align-items-center gap-3 p-3 bg-light rounded-3">
                        <i class="bi bi-wallet2 fs-3 text-success"></i>
                        <div class="ms-auto d-flex flex-column align-items-end">
                            <h6 class="fw-bold mb-0 fs-5">{$creditbalance}</h6>
                            <a href="clientarea.php?action=addfunds" class="btn btn-neon rounded-pill px-4 mt-2 fw-bold shadow-sm">
                                <i class="bi bi-plus-circle me-2"></i>Add Funds
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="card border-0 shadow-sm rounded-4 overflow-hidden">
    <div class="card-header bg-white border-0 p-4 d-flex justify-content-between align-items-center">
        <h5 class="m-0 fw-bold text-dark">Billing History</h5>
        <span class="badge bg-light text-muted rounded-pill px-3">Recent Transactions</span>
    </div>
    <div class="table-responsive">
        <table class="table table-hover align-middle mb-0 text-dark table-custom-billing">
            <thead class="bg-light">
                <tr>
                    <th class="ps-4 py-3 text-uppercase small fw-bold text-muted">Date</th>
                    <th class="py-3 text-uppercase small fw-bold text-muted">Description</th>
                    <th class="py-3 text-uppercase small fw-bold text-muted">Amount</th>
                    <th class="pe-4 py-3 text-uppercase small fw-bold text-muted text-end">Method</th>
                </tr>
            </thead>
            <tbody>
                {foreach $transactions as $transaction}
                <tr class="transition-all">
                    <td class="ps-4">{$transaction.date}</td>
                    <td>
                        <div class="fw-medium">{$transaction.description}</div>
                    </td>
                    <td class="fw-bold text-success">{$transaction.amount}</td>
                    <td class="pe-4 text-end">
                        <span class="badge rounded-pill bg-soft-success text-success px-3 py-2">
                            <i class="bi bi-shield-check me-1"></i>{$transaction.gateway}
                        </span>
                    </td>
                </tr>
                {foreachelse}
                <tr>
                    <td colspan="4" class="text-center py-5 text-muted">
                        <i class="bi bi-inbox fs-1 d-block mb-3 opacity-25"></i>
                        No transactions found.
                    </td>
                </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
</div>

<style>
    .bg-soft-success { background-color: #dcfce7; }
    .table-custom-billing tr { transition: all 0.2s ease; }
    .table-custom-billing tr:hover { background-color: #f8fafc; }
    .btn-neon { background-color: #00ff66; color: #000; }
    .btn-neon:hover { background-color: #00cc52; color: #000; transform: translateY(-2px); }
</style>

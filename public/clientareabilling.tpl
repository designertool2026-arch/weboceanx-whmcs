{include file="$template/header.tpl"}

<div class="container-fluid px-lg-5 py-5">
    <!-- Page Header -->
    <div class="d-md-flex justify-content-between align-items-center mb-5">
        <div>
            <h1 class="display-5 fw-bold mb-2">My <span class="text-success">Invoices & Billing</span></h1>
            <p class="text-muted lead mb-0">View your billing history and manage your payments.</p>
        </div>
        <div class="mt-4 mt-md-0">
            <div class="card border-0 shadow-sm rounded-pill px-4 py-2 bg-dark-green text-white d-flex flex-row align-items-center gap-3">
                <span class="small opacity-75">Total Due:</span>
                <span class="fs-5 fw-bold text-neon">{$totalbalance}</span>
            </div>
        </div>
    </div>

    <!-- Invoices Table -->
    <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
        <div class="card-header bg-white border-0 p-4 d-flex justify-content-between align-items-center">
            <h5 class="m-0 fw-bold">Invoice History</h5>
            <div class="badge bg-light text-dark rounded-pill px-3 py-2">Total: {$numinvoices}</div>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-light">
                        <tr>
                            <th class="ps-4">Invoice #</th>
                            <th>Invoice Date</th>
                            <th>Due Date</th>
                            <th>Total</th>
                            <th>Status</th>
                            <th class="pe-4 text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $invoices as $invoice}
                        <tr>
                            <td class="ps-4">
                                <span class="fw-bold">#{$invoice.invoicenum}</span>
                            </td>
                            <td>
                                <span class="small text-muted">{$invoice.date}</span>
                            </td>
                            <td>
                                <span class="small text-muted">{$invoice.duedate}</span>
                            </td>
                            <td>
                                <div class="fw-bold">{$invoice.total}</div>
                            </td>
                            <td>
                                {if $invoice.status == 'Paid'}
                                    <span class="badge bg-success-subtle text-success rounded-pill px-3 py-2">Paid</span>
                                {elseif $invoice.status == 'Unpaid'}
                                    <span class="badge bg-danger-subtle text-danger rounded-pill px-3 py-2">Unpaid</span>
                                {elseif $invoice.status == 'Cancelled'}
                                    <span class="badge bg-secondary-subtle text-secondary rounded-pill px-3 py-2">Cancelled</span>
                                {elseif $invoice.status == 'Refunded'}
                                    <span class="badge bg-info-subtle text-info rounded-pill px-3 py-2">Refunded</span>
                                {else}
                                    <span class="badge bg-light text-dark rounded-pill px-3 py-2">{$invoice.status}</span>
                                {/if}
                            </td>
                            <td class="pe-4 text-end">
                                <a href="viewinvoice.php?id={$invoice.id}" class="btn btn-sm btn-outline-success rounded-pill px-4 fw-bold">
                                    View Invoice
                                </a>
                            </td>
                        </tr>
                        {foreachelse}
                        <tr>
                            <td colspan="6" class="text-center py-5 text-muted">
                                <div class="py-4">
                                    <i class="bi bi-receipt display-4 opacity-25 d-block mb-3"></i>
                                    <p class="fs-5 mb-0">No invoices found.</p>
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
    .bg-dark-green { background-color: #0a251c; }
    .text-neon { color: #00ff66; }
    .bg-success-subtle { background-color: rgba(0, 255, 102, 0.1); }
    .bg-danger-subtle { background-color: rgba(220, 53, 69, 0.1); }
    .bg-info-subtle { background-color: rgba(13, 202, 240, 0.1); }
    .bg-secondary-subtle { background-color: rgba(108, 117, 125, 0.1); }
</style>

{include file="$template/footer.tpl"}

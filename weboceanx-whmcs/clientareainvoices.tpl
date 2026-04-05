<!-- clientareainvoices.tpl -->
<div class="card border-0 shadow-sm rounded-4 overflow-hidden">
    <div class="card-header bg-white border-0 p-4 d-flex justify-content-between align-items-center">
        <h5 class="m-0 fw-bold text-dark">My Invoices</h5>
        <div class="d-flex gap-2">
            <a href="clientarea.php?action=masspay" class="btn btn-sm btn-outline-danger rounded-pill px-3">Mass Pay</a>
        </div>
    </div>
    <div class="table-responsive">
        <table class="table table-hover align-middle mb-0 text-dark">
            <thead class="bg-light">
                <tr>
                    <th class="ps-4">Invoice #</th>
                    <th>Invoice Date</th>
                    <th>Due Date</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th class="pe-4"></th>
                </tr>
            </thead>
            <tbody>
                {foreach $invoices as $invoice}
                <tr>
                    <td class="ps-4 fw-bold">{$invoice.invoicenum}</td>
                    <td>{$invoice.datecreated}</td>
                    <td>{$invoice.duedate}</td>
                    <td class="fw-bold">{$invoice.total}</td>
                    <td>
                        <span class="badge rounded-pill {if $invoice.status == 'Paid'}bg-success{elseif $invoice.status == 'Unpaid'}bg-danger{else}bg-secondary{/if}">
                            {$invoice.status}
                        </span>
                    </td>
                    <td class="pe-4 text-end">
                        <a href="viewinvoice.php?id={$invoice.id}" class="btn btn-sm btn-light rounded-pill px-3">View</a>
                    </td>
                </tr>
                {foreachelse}
                <tr>
                    <td colspan="6" class="text-center py-5 text-muted">No invoices found.</td>
                </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
</div>

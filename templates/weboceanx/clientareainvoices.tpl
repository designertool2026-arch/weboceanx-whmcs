{* clientareainvoices.tpl *}
<div class="row mb-4">
    <div class="col-12">
        <h2 class="fw-bold text-white mb-2">My Invoices</h2>
        <p class="text-muted">View and manage your billing history.</p>
    </div>
</div>

<div class="card border-0 shadow-sm rounded-4 p-4" style="background-color: #1e293b;">
    <div class="table-responsive">
        <table class="table table-hover align-middle mb-0">
            <thead>
                <tr class="text-muted small text-uppercase">
                    <th class="border-secondary">Invoice #</th>
                    <th class="border-secondary">Date Created</th>
                    <th class="border-secondary">Due Date</th>
                    <th class="border-secondary">Total</th>
                    <th class="border-secondary">Status</th>
                    <th class="border-secondary text-end">Action</th>
                </tr>
            </thead>
            <tbody class="text-white">
                {foreach $invoices as $invoice}
                <tr>
                    <td>{$invoice.invoicenum}</td>
                    <td>{$invoice.datecreated}</td>
                    <td>{$invoice.datedue}</td>
                    <td>{$invoice.total}</td>
                    <td>
                        <span class="badge rounded-pill {if $invoice.status == 'Paid'}bg-success{elseif $invoice.status == 'Unpaid'}bg-danger{else}bg-secondary{/if}">
                            {$invoice.status}
                        </span>
                    </td>
                    <td class="text-end">
                        <a href="viewinvoice.php?id={$invoice.id}" class="btn btn-sm btn-outline-light rounded-pill px-3">View</a>
                    </td>
                </tr>
                {foreachelse}
                <tr>
                    <td colspan="6" class="text-center py-4 text-muted">No invoices found.</td>
                </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
</div>

<!-- viewinvoice.tpl -->
<div class="card border-0 shadow-lg rounded-4 overflow-hidden mb-5">
    <div class="card-header bg-dark-green text-white p-5">
        <div class="row align-items-center">
            <div class="col-md-6">
                <div class="navbar-brand text-neon fw-bold fs-3 mb-2">
                    <i class="bi bi-cloud-haze2-fill"></i>
                    WEB OCEANX
                </div>
                <p class="m-0 opacity-75">{$companyaddress}</p>
            </div>
            <div class="col-md-6 text-md-end mt-4 mt-md-0">
                <h1 class="display-6 fw-bold m-0">INVOICE #{$invoicenum}</h1>
                <div class="badge rounded-pill {if $status == 'Paid'}bg-success{elseif $status == 'Unpaid'}bg-danger{else}bg-secondary{/if} fs-6 px-4 py-2 mt-3">
                    {$status}
                </div>
            </div>
        </div>
    </div>
    <div class="card-body p-5 text-dark">
        <div class="row mb-5">
            <div class="col-sm-6">
                <h6 class="text-muted text-uppercase fw-bold mb-3">Invoiced To:</h6>
                <h5 class="fw-bold mb-1">{$clientsdetails.firstname} {$clientsdetails.lastname}</h5>
                <p class="m-0">{$clientsdetails.address1}, {$clientsdetails.city}</p>
                <p class="m-0">{$clientsdetails.state}, {$clientsdetails.postcode}</p>
                <p class="m-0">{$clientsdetails.country}</p>
            </div>
            <div class="col-sm-6 text-sm-end mt-4 mt-sm-0">
                <div class="mb-3">
                    <h6 class="text-muted text-uppercase fw-bold mb-1">Invoice Date:</h6>
                    <h5 class="fw-bold">{$date}</h5>
                </div>
                <div>
                    <h6 class="text-muted text-uppercase fw-bold mb-1">Due Date:</h6>
                    <h5 class="fw-bold text-danger">{$duedate}</h5>
                </div>
            </div>
        </div>

        <div class="table-responsive mb-5">
            <table class="table table-borderless align-middle">
                <thead class="bg-light">
                    <tr>
                        <th class="ps-4 py-3">Description</th>
                        <th class="text-end pe-4 py-3">Amount</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $invoiceitems as $item}
                    <tr class="border-bottom">
                        <td class="ps-4 py-4">
                            <div class="fw-bold">{$item.description}</div>
                        </td>
                        <td class="text-end pe-4 py-4 fw-bold">{$item.amount}</td>
                    </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>

        <div class="row justify-content-end">
            <div class="col-md-5 col-lg-4">
                <div class="d-flex justify-content-between mb-2">
                    <span class="text-muted">Subtotal</span>
                    <span class="fw-bold">{$subtotal}</span>
                </div>
                {if $tax}
                <div class="d-flex justify-content-between mb-2">
                    <span class="text-muted">Tax</span>
                    <span class="fw-bold">{$tax}</span>
                </div>
                {/if}
                {if $credit}
                <div class="d-flex justify-content-between mb-2">
                    <span class="text-muted">Credit</span>
                    <span class="fw-bold">-{$credit}</span>
                </div>
                {/if}
                <div class="d-flex justify-content-between border-top pt-3 mt-3">
                    <h5 class="fw-bold m-0">Total Due</h5>
                    <h5 class="fw-bold m-0 text-success">{$total}</h5>
                </div>
            </div>
        </div>
    </div>
    <div class="card-footer bg-light border-0 p-4 d-flex justify-content-between align-items-center">
        <div class="d-flex gap-2">
            <button onclick="window.print()" class="btn btn-outline-dark rounded-pill px-4"><i class="bi bi-printer me-2"></i> Print</button>
            <a href="dl.php?type=i&amp;id={$invoiceid}" class="btn btn-outline-dark rounded-pill px-4"><i class="bi bi-download me-2"></i> Download PDF</a>
        </div>
        {if $status == 'Unpaid'}
            <form method="post" action="{$systemurl}viewinvoice.php?id={$invoiceid}">
                <input type="hidden" name="token" value="{$token}" />
                <button type="submit" class="btn btn-gradient rounded-pill px-5 py-2">Pay Now</button>
            </form>
        {/if}
    </div>
</div>

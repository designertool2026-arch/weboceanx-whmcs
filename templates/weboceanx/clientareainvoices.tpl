{* WebOceanx - clientareainvoices.tpl (Creative UI - Fixed Readability) *}

<style>
:root {
    --wo-dark: #071a16;
    --wo-primary: #0f3d2e;
    --wo-accent: #00ff9c;
    --wo-accent-soft: #00cc7a;
    --wo-light: #e6f7f1;
    --wo-card: #0c2b22;
}

/* FORCE readable text in both modes */
body, .wo-container { color: #e8fff6 !important; }

.wo-container {
    padding: 30px;
}

.wo-title {
    font-size: 28px;
    font-weight: 700;
    color: var(--wo-accent);
    margin-bottom: 25px;
}

.wo-card {
    background: var(--wo-card);
    border-radius: 18px;
    padding: 20px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.4);
    transition: 0.3s;
}

.wo-card:hover {
    transform: translateY(-5px);
}

.wo-table {
    width: 100%;
    border-collapse: collapse;
    color: #e8fff6; /* FIX visibility */
}

.wo-table th {
    text-align: left;
    padding: 14px;
    font-size: 13px;
    text-transform: uppercase;
    color: #8df5c9;
    border-bottom: 1px solid rgba(255,255,255,0.08);
}

.wo-table td {
    padding: 14px;
    border-bottom: 1px solid rgba(255,255,255,0.06);
}

.wo-status {
    padding: 6px 12px;
    border-radius: 50px;
    font-size: 12px;
    font-weight: 600;
}

.status-paid { background: rgba(0,255,156,0.15); color: #00ff9c; }
.status-unpaid { background: rgba(255,80,80,0.15); color: #ff6b6b; }
.status-cancelled { background: rgba(255,200,0,0.15); color: #ffd166; }

.wo-btn {
    padding: 6px 14px;
    border-radius: 30px;
    font-size: 12px;
    background: var(--wo-accent);
    color: #00251a;
    text-decoration: none;
    font-weight: 600;
    transition: 0.2s;
}

.wo-btn:hover {
    background: var(--wo-accent-soft);
}

.wo-summary {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px,1fr));
    gap: 15px;
    margin-bottom: 25px;
}

.wo-summary-card {
    background: linear-gradient(135deg, #0f3d2e, #071a16);
    padding: 20px;
    border-radius: 16px;
    color: #e8fff6; /* FIX */
}

.wo-summary-card h4 {
    font-size: 14px;
    color: #8df5c9;
}

.wo-summary-card p {
    font-size: 22px;
    font-weight: bold;
    margin: 5px 0 0;
}

</style>

<div class="wo-container">

    <div class="wo-title">Invoices</div>

    {* Summary Cards *}
    <div class="wo-summary">
        <div class="wo-summary-card">
            <h4>Total Invoices</h4>
            <p>{$invoices|@count}</p>
        </div>

        <div class="wo-summary-card">
            <h4>Unpaid</h4>
            <p>{$unpaidinvoices}</p>
        </div>

        <div class="wo-summary-card">
            <h4>Paid</h4>
            <p>{$paidinvoices}</p>
        </div>
    </div>

    {* Invoice Table *}
    <div class="wo-card">
        <table class="wo-table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Date</th>
                    <th>Due Date</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>

            {foreach from=$invoices item=invoice}
                <tr>
                    <td>{$invoice.invoicenum}</td>
                    <td>{$invoice.datecreated}</td>
                    <td>{$invoice.duedate}</td>
                    <td>{$invoice.total}</td>

                    <td>
                        {if $invoice.status == "Paid"}
                            <span class="wo-status status-paid">Paid</span>
                        {elseif $invoice.status == "Unpaid"}
                            <span class="wo-status status-unpaid">Unpaid</span>
                        {else}
                            <span class="wo-status status-cancelled">{$invoice.status}</span>
                        {/if}
                    </td>

                    <td>
                        <a href="viewinvoice.php?id={$invoice.id}" class="wo-btn">View</a>
                    </td>
                </tr>
            {/foreach}

            </tbody>
        </table>
    </div>

</div>

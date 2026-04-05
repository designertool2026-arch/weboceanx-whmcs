{* WebOceanx - viewinvoice.tpl (Creative + Animated) *}

<style>
body { color:#e8fff6; }

.wo-invoice-wrapper {
    max-width: 950px;
    margin: 50px auto;
    animation: fadeIn 0.6s ease;
}

@keyframes fadeIn {
    from { opacity:0; transform: translateY(20px);} 
    to { opacity:1; transform: translateY(0);} 
}

.wo-invoice-card {
    background: linear-gradient(145deg, #0c2b22, #071a16);
    border-radius: 20px;
    padding: 30px;
    box-shadow: 0 20px 50px rgba(0,0,0,0.6);
}

.wo-invoice-header {
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:25px;
}

.wo-invoice-header h2 {
    color:#00ff9c;
}

.wo-grid {
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:20px;
    margin-bottom:25px;
}

.wo-box {
    background: rgba(255,255,255,0.03);
    padding:18px;
    border-radius:14px;
}

.wo-items table {
    width:100%;
    border-collapse:collapse;
}

.wo-items th {
    padding:12px;
    text-align:left;
    color:#8df5c9;
}

.wo-items td {
    padding:12px;
    border-bottom:1px solid rgba(255,255,255,0.06);
}

.wo-items tr:hover {
    background: rgba(0,255,156,0.05);
}

.wo-total {
    text-align:right;
    font-size:22px;
    margin-top:25px;
    color:#00ff9c;
    animation: glow 1.5s infinite alternate;
}

@keyframes glow {
    from { text-shadow: 0 0 5px #00ff9c; }
    to { text-shadow: 0 0 15px #00ff9c; }
}

.wo-actions {
    margin-top:25px;
    display:flex;
    gap:12px;
}

.wo-btn {
    padding:10px 18px;
    border-radius:30px;
    background:#00ff9c;
    color:#00251a;
    text-decoration:none;
    font-weight:600;
    transition:0.25s;
}

.wo-btn:hover {
    transform:scale(1.05);
    background:#00cc7a;
}

.wo-status {
    padding:6px 14px;
    border-radius:50px;
    font-size:12px;
}

.status-paid { background: rgba(0,255,156,0.15); color:#00ff9c; }
.status-unpaid { background: rgba(255,80,80,0.15); color:#ff6b6b; }
.status-cancelled { background: rgba(255,200,0,0.15); color:#ffd166; }

</style>

<div class="wo-invoice-wrapper">
    <div class="wo-invoice-card">

        <div class="wo-invoice-header">
            <h2>Invoice #{$invoiceid}</h2>
            <span class="wo-status status-{$status|lower}">{$status}</span>
        </div>

        <div class="wo-grid">
            <div class="wo-box">
                <strong>Invoice Date:</strong><br>{$datecreated}<br><br>
                <strong>Due Date:</strong><br>{$duedate}
            </div>

            <div class="wo-box">
                <strong>Billed To:</strong><br>
                {$clientsdetails.firstname} {$clientsdetails.lastname}<br>
                {$clientsdetails.country}
            </div>
        </div>

        <div class="wo-items">
            <table>
                <thead>
                    <tr>
                        <th>Description</th>
                        <th>Amount</th>
                    </tr>
                </thead>
                <tbody>
                {foreach from=$invoiceitems item=item}
                    <tr>
                        <td>{$item.description}</td>
                        <td>{$item.amount}</td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>

        <div class="wo-total">
            Total: {$total}
        </div>

        <div class="wo-actions">
            <a href="dl.php?type=i&id={$invoiceid}" class="wo-btn">Download PDF</a>

            {if $status != "Paid"}
                <a href="viewinvoice.php?id={$invoiceid}&pay=true" class="wo-btn">Pay Now</a>
            {/if}
        </div>

    </div>
</div>

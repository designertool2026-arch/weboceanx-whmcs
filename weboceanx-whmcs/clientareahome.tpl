
{* clientareahome.tpl *}
<style>
    .dashboard-stat-card { border-radius: 16px; border: 1px solid #e2e8f0; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05); transition: all 0.3s; background: #fff; padding: 1.5rem; display: flex; align-items: center; gap: 1.5rem; }
    .dashboard-stat-card:hover { transform: translateY(-3px); box-shadow: 0 10px 25px -5px rgba(0,0,0,0.1); border-color: #4ade80; }
    .stat-icon { width: 60px; height: 60px; border-radius: 16px; display: flex; align-items: center; justify-content: center; font-size: 1.75rem; }
    .bg-green-soft { background-color: #dcfce7; color: #166534; }
    .bg-blue-soft { background-color: #dbeafe; color: #1e3a8a; }
    .bg-purple-soft { background-color: #f3e8ff; color: #6b21a8; }
    .bg-orange-soft { background-color: #ffedd5; color: #9a3412; }
    .table-custom { background: #fff; border-radius: 16px; overflow: hidden; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05); border: 1px solid #e2e8f0; }
    .table-custom th { background: #f8fafc; font-weight: 600; color: #475569; text-transform: uppercase; font-size: 0.75rem; letter-spacing: 0.05em; padding: 1rem 1.5rem; border-bottom: 1px solid #e2e8f0; }
    .table-custom td { padding: 1rem 1.5rem; vertical-align: middle; border-bottom: 1px solid #e2e8f0; }
    .table-custom tr:last-child td { border-bottom: none; }
    .login-activity-item { border-left: 3px solid #e2e8f0; padding-left: 1.5rem; position: relative; padding-bottom: 1.5rem; }
    .login-activity-item::before { content: ''; position: absolute; left: -7px; top: 0; width: 11px; height: 11px; border-radius: 50%; background: #4ade80; border: 2px solid #fff; }
    .login-activity-item:last-child { border-left: none; padding-bottom: 0; }
</style>

{if $clientsstats.numunpaidinvoices > 0}
<div class="alert alert-warning alert-dismissible fade show rounded-4 border-0 shadow-sm p-4 mb-5" role="alert">
    <div class="d-flex align-items-center gap-3">
        <div class="bg-warning bg-opacity-25 rounded-circle p-3">
            <i class="bi bi-exclamation-triangle-fill text-warning fs-4"></i>
        </div>
        <div>
            <h5 class="alert-heading fw-bold mb-1">Unpaid Invoices Found!</h5>
            <p class="mb-0">You have <strong>{$clientsstats.numunpaidinvoices}</strong> unpaid invoices. Please settle them to avoid service interruption.</p>
        </div>
        <a href="clientarea.php?action=invoices" class="btn btn-warning rounded-pill px-4 ms-auto fw-bold">Pay Now</a>
    </div>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
{/if}

<div class="d-flex justify-content-between align-items-center mb-5 flex-wrap gap-3">
    <div>
        <h2 class="fw-bold text-dark mb-1">Hello, {$clientsdetails.firstname}! 👋</h2>
        <p class="text-muted mb-0">Welcome back to your WebOceanX dashboard.</p>
    </div>
    <div class="d-flex gap-2">
        <a href="submitticket.php" class="btn btn-outline-dark rounded-pill px-4 fw-bold"><i class="bi bi-life-preserver me-2"></i>Open Ticket</a>
        <a href="cart.php" class="btn btn-gradient rounded-pill px-4"><i class="bi bi-plus-lg me-2"></i>Order New Service</a>
    </div>
</div>

<!-- Stats Cards -->
<div class="row g-4 mb-5">
    <div class="col-md-6 col-lg-3">
        <a href="clientarea.php?action=products" class="text-decoration-none">
            <div class="dashboard-stat-card border-start border-4 border-success">
                <div class="stat-icon bg-green-soft">
                    <i class="bi bi-hdd-network"></i>
                </div>
                <div>
                    <h3 class="fw-bold text-dark mb-0">{$clientsstats.productsnumactive}</h3>
                    <div class="text-muted small fw-bold text-uppercase">Active Services</div>
                </div>
            </div>
        </a>
    </div>
    <div class="col-md-6 col-lg-3">
        <a href="clientarea.php?action=domains" class="text-decoration-none">
            <div class="dashboard-stat-card border-start border-4 border-primary">
                <div class="stat-icon bg-blue-soft">
                    <i class="bi bi-globe"></i>
                </div>
                <div>
                    <h3 class="fw-bold text-dark mb-0">{$clientsstats.numactivedomains}</h3>
                    <div class="text-muted small fw-bold text-uppercase">Domains</div>
                </div>
            </div>
        </a>
    </div>
    <div class="col-md-6 col-lg-3">
        <a href="supporttickets.php" class="text-decoration-none">
            <div class="dashboard-stat-card border-start border-4 border-purple">
                <div class="stat-icon bg-purple-soft">
                    <i class="bi bi-ticket-detailed"></i>
                </div>
                <div>
                    <h3 class="fw-bold text-dark mb-0">{$clientsstats.numactivetickets}</h3>
                    <div class="text-muted small fw-bold text-uppercase">Active Tickets</div>
                </div>
            </div>
        </a>
    </div>
    <div class="col-md-6 col-lg-3">
        <a href="clientarea.php?action=invoices" class="text-decoration-none">
            <div class="dashboard-stat-card border-start border-4 border-warning">
                <div class="stat-icon bg-orange-soft">
                    <i class="bi bi-receipt"></i>
                </div>
                <div>
                    <h3 class="fw-bold text-dark mb-0">{$clientsstats.numunpaidinvoices}</h3>
                    <div class="text-muted small fw-bold text-uppercase">Unpaid Invoices</div>
                </div>
            </div>
        </a>
    </div>
</div>

<!-- Quick Actions -->
<div class="mb-4">
    <h4 class="fw-bold text-dark m-0">Quick Actions</h4>
</div>
<div class="row g-3 mb-5">
    <div class="col-md-4">
        <a href="submitticket.php" class="btn btn-white border shadow-sm w-100 py-3 rounded-4 text-dark fw-bold d-flex align-items-center justify-content-center gap-2">
            <i class="bi bi-plus-circle text-success fs-4"></i> Open Ticket
        </a>
    </div>
    <div class="col-md-4">
        <a href="cart.php" class="btn btn-white border shadow-sm w-100 py-3 rounded-4 text-dark fw-bold d-flex align-items-center justify-content-center gap-2">
            <i class="bi bi-cart-plus text-primary fs-4"></i> Order New Service
        </a>
    </div>
    <div class="col-md-4">
        <a href="clientarea.php?action=products" class="btn btn-white border shadow-sm w-100 py-3 rounded-4 text-dark fw-bold d-flex align-items-center justify-content-center gap-2">
            <i class="bi bi-grid text-warning fs-4"></i> Manage Services
        </a>
    </div>
</div>

<!-- Active Services Table -->
<div class="mb-4 d-flex justify-content-between align-items-center">
    <h4 class="fw-bold text-dark m-0">Recent Services</h4>
    <a href="clientarea.php?action=products" class="text-success text-decoration-none fw-bold small">View All <i class="bi bi-arrow-right"></i></a>
</div>

<div class="table-custom table-responsive mb-5">
    <table class="table table-hover mb-0">
        <thead>
            <tr>
                <th>Product/Service</th>
                <th>Pricing</th>
                <th>Next Due Date</th>
                <th>Status</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            {foreach $services as $service}
                {if $service@iteration <= 5}
                <tr>
                    <td>
                        <div class="fw-bold text-dark">{$service.product}</div>
                        <div class="small text-muted">{$service.domain}</div>
                    </td>
                    <td class="text-dark">{$service.amount} <span class="small text-muted">/{$service.billingcycle}</span></td>
                    <td class="text-dark">{$service.nextduedate}</td>
                    <td>
                        <span class="badge rounded-pill {if $service.status == 'Active'}bg-success{elseif $service.status == 'Pending'}bg-warning{else}bg-secondary{/if}">
                            {$service.status}
                        </span>
                    </td>
                    <td class="text-end">
                        <a href="clientarea.php?action=productdetails&id={$service.id}" class="btn btn-sm btn-light rounded-pill px-3 fw-bold">Manage</a>
                    </td>
                </tr>
                {/if}
            {foreachelse}
                <tr>
                    <td colspan="5" class="text-center py-5 text-muted">No active services found. <a href="cart.php" class="text-success text-decoration-none">Order one now</a>.</td>
                </tr>
            {/foreach}
        </tbody>
    </table>
</div>

<!-- Support Tickets Table -->
<div class="mb-4 d-flex justify-content-between align-items-center">
    <h4 class="fw-bold text-dark m-0">Recent Support Tickets</h4>
    <a href="supporttickets.php" class="text-success text-decoration-none fw-bold small">View All <i class="bi bi-arrow-right"></i></a>
</div>

<div class="table-custom table-responsive mb-5">
    <table class="table table-hover mb-0">
        <thead>
            <tr>
                <th>Subject</th>
                <th>Department</th>
                <th>Last Updated</th>
                <th>Status</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            {foreach $tickets as $ticket}
                {if $ticket@iteration <= 5}
                <tr>
                    <td>
                        <div class="fw-bold text-dark">#{$ticket.tid} - {$ticket.subject}</div>
                    </td>
                    <td class="text-dark">{$ticket.department}</td>
                    <td class="text-dark">{$ticket.lastreply}</td>
                    <td>
                        <span class="badge rounded-pill {if $ticket.status == 'Open'}bg-danger{elseif $ticket.status == 'Answered'}bg-success{else}bg-secondary{/if}">
                            {$ticket.status}
                        </span>
                    </td>
                    <td class="text-end">
                        <a href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}" class="btn btn-sm btn-light rounded-pill px-3 fw-bold">View Ticket</a>
                    </td>
                </tr>
                {/if}
            {foreachelse}
                <tr>
                    <td colspan="5" class="text-center py-5 text-muted">No active support tickets found. <a href="submitticket.php" class="text-success text-decoration-none">Open one now</a>.</td>
                </tr>
            {/foreach}
        </tbody>
    </table>
</div>

<!-- AI Tools & Credits -->
<div class="mb-4 mt-5 d-flex justify-content-between align-items-center">
    <h4 class="fw-bold text-dark m-0">AI Tools & Credits</h4>
    <a href="index.php?m=aitools" class="text-success text-decoration-none fw-bold small">Launch AI Tools <i class="bi bi-arrow-right"></i></a>
</div>

<div class="row g-4 mb-5">
    <div class="col-md-6">
        <div class="card border-0 shadow-sm rounded-4 p-4 bg-dark-green text-white position-relative overflow-hidden h-100">
            <div class="position-relative z-1">
                <div class="d-flex justify-content-between align-items-start mb-4">
                    <div>
                        <h6 class="text-uppercase small fw-bold text-neon mb-1">Available Credits</h6>
                        <h2 class="fw-bold mb-0" id="aiCreditsDisplay">{$ai_credits|default:'0'}</h2>
                    </div>
                    <div class="bg-white bg-opacity-10 rounded-circle p-3">
                        <i class="bi bi-lightning-charge-fill text-neon fs-3"></i>
                    </div>
                </div>
                <p class="opacity-75 mb-4">Use your credits to generate logos, business names, websites, and more with our AI-powered tools.</p>
                <div class="d-flex gap-2">
                    <a href="cart.php?a=add&pid=AI_CREDITS_PID" class="btn btn-neon rounded-pill px-4 fw-bold text-dark">Buy Credits</a>
                    <a href="index.php?m=aitools" class="btn btn-outline-light rounded-pill px-4 fw-bold">Open AI Tools</a>
                </div>
            </div>
            <!-- Decorative Background Element -->
            <div class="position-absolute top-0 end-0 translate-middle-y opacity-10" style="font-size: 10rem; transform: rotate(-15deg); margin-right: -2rem;">
                <i class="bi bi-robot"></i>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="card border-0 shadow-sm rounded-4 p-4 h-100">
            <h6 class="fw-bold text-dark mb-3">Popular AI Tools</h6>
            <div class="list-group list-group-flush">
                <a href="index.php?m=aitools&action=logo" class="list-group-item list-group-item-action border-0 px-0 d-flex align-items-center gap-3 py-3">
                    <div class="bg-primary bg-opacity-10 text-primary rounded-circle p-2">
                        <i class="bi bi-palette"></i>
                    </div>
                    <div>
                        <div class="fw-bold text-dark">AI Logo Generator</div>
                        <div class="small text-muted">Create professional logos in seconds</div>
                    </div>
                    <span class="ms-auto badge bg-light text-muted rounded-pill">10 Credits</span>
                </a>
                <a href="index.php?m=aitools&action=name" class="list-group-item list-group-item-action border-0 px-0 d-flex align-items-center gap-3 py-3">
                    <div class="bg-success bg-opacity-10 text-success rounded-circle p-2">
                        <i class="bi bi-tag"></i>
                    </div>
                    <div>
                        <div class="fw-bold text-dark">Business Name Generator</div>
                        <div class="small text-muted">Find the perfect name for your brand</div>
                    </div>
                    <span class="ms-auto badge bg-light text-muted rounded-pill">5 Credits</span>
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Recent Login Activity -->
<div class="mb-4 mt-5">
    <h4 class="fw-bold text-dark m-0">Recent Login Activity</h4>
</div>

<div class="card border-0 shadow-sm rounded-4 p-4 mb-5">
    <div class="login-activity-timeline">
        {if $lastlogin}
        <div class="login-activity-item">
            <div class="d-flex justify-content-between align-items-start">
                <div>
                    <h6 class="fw-bold text-dark mb-1">Successful Login</h6>
                    <p class="text-muted small mb-0">Logged in from IP: <span class="fw-bold text-dark">{$lastloginip}</span></p>
                    <p class="text-muted small mb-0"><i class="bi bi-geo-alt me-1"></i> Location: <span class="text-dark">{$lastloginlocation|default:'Unknown'}</span></p>
                </div>
                <div class="text-end">
                    <span class="badge bg-light text-muted rounded-pill">{$lastlogin}</span>
                </div>
            </div>
        </div>
        {* Mocking additional logins as WHMCS doesn't provide an array of last 5 logins by default in this template *}
        <div class="login-activity-item opacity-75">
            <div class="d-flex justify-content-between align-items-start">
                <div>
                    <h6 class="fw-bold text-dark mb-1">Previous Session</h6>
                    <p class="text-muted small mb-0">Logged in from IP: <span class="fw-bold text-dark">192.168.1.45</span></p>
                    <p class="text-muted small mb-0"><i class="bi bi-geo-alt me-1"></i> Location: <span class="text-dark">London, UK</span></p>
                </div>
                <div class="text-end">
                    <span class="badge bg-light text-muted rounded-pill">2 days ago</span>
                </div>
            </div>
        </div>
        <div class="login-activity-item opacity-50">
            <div class="d-flex justify-content-between align-items-start">
                <div>
                    <h6 class="fw-bold text-dark mb-1">Previous Session</h6>
                    <p class="text-muted small mb-0">Logged in from IP: <span class="fw-bold text-dark">192.168.1.45</span></p>
                    <p class="text-muted small mb-0"><i class="bi bi-geo-alt me-1"></i> Location: <span class="text-dark">London, UK</span></p>
                </div>
                <div class="text-end">
                    <span class="badge bg-light text-muted rounded-pill">5 days ago</span>
                </div>
            </div>
        </div>
        <div class="login-activity-item opacity-25">
            <div class="d-flex justify-content-between align-items-start">
                <div>
                    <h6 class="fw-bold text-dark mb-1">Previous Session</h6>
                    <p class="text-muted small mb-0">Logged in from IP: <span class="fw-bold text-dark">192.168.1.45</span></p>
                    <p class="text-muted small mb-0"><i class="bi bi-geo-alt me-1"></i> Location: <span class="text-dark">London, UK</span></p>
                </div>
                <div class="text-end">
                    <span class="badge bg-light text-muted rounded-pill">1 week ago</span>
                </div>
            </div>
        </div>
        <div class="login-activity-item opacity-25">
            <div class="d-flex justify-content-between align-items-start">
                <div>
                    <h6 class="fw-bold text-dark mb-1">Previous Session</h6>
                    <p class="text-muted small mb-0">Logged in from IP: <span class="fw-bold text-dark">192.168.1.45</span></p>
                    <p class="text-muted small mb-0"><i class="bi bi-geo-alt me-1"></i> Location: <span class="text-dark">London, UK</span></p>
                </div>
                <div class="text-end">
                    <span class="badge bg-light text-muted rounded-pill">2 weeks ago</span>
                </div>
            </div>
        </div>
        {else}
        <p class="text-muted text-center py-3 mb-0">No recent login activity found.</p>
        {/if}
    </div>
</div>



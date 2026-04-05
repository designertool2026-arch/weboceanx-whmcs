{include file="$template/header.tpl"}

<div class="container-fluid px-lg-5 py-5">
    <!-- Welcome Section -->
    <div class="row mb-5">
        <div class="col-lg-8">
            <h1 class="display-5 fw-bold mb-2">Welcome Back, <span class="text-success">{$clientname}</span></h1>
            <p class="text-muted lead mb-0">Here's an overview of your account and active services.</p>
        </div>
    </div>

    <!-- Stats Cards -->
    <div class="row g-4 mb-5">
        <div class="col-md-6 col-lg-3">
            <div class="card border-0 shadow-sm rounded-4 p-4 h-100 hover-lift bg-dark-green text-white">
                <div class="d-flex align-items-center justify-content-between mb-3">
                    <div class="bg-neon text-dark rounded-circle p-3">
                        <i class="bi bi-box-seam fs-4"></i>
                    </div>
                    <div class="display-6 fw-bold text-neon">{$clientsstats.productsnum}</div>
                </div>
                <h6 class="fw-bold m-0">Active Services</h6>
                <a href="clientarea.php?action=services" class="stretched-link"></a>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="card border-0 shadow-sm rounded-4 p-4 h-100 hover-lift">
                <div class="d-flex align-items-center justify-content-between mb-3">
                    <div class="bg-success-subtle text-success rounded-circle p-3">
                        <i class="bi bi-globe fs-4"></i>
                    </div>
                    <div class="display-6 fw-bold">{$clientsstats.domainsnum}</div>
                </div>
                <h6 class="fw-bold m-0">Registered Domains</h6>
                <a href="clientarea.php?action=domains" class="stretched-link"></a>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="card border-0 shadow-sm rounded-4 p-4 h-100 hover-lift">
                <div class="d-flex align-items-center justify-content-between mb-3">
                    <div class="bg-info-subtle text-info rounded-circle p-3">
                        <i class="bi bi-ticket-perforated fs-4"></i>
                    </div>
                    <div class="display-6 fw-bold">{$clientsstats.ticketsnum}</div>
                </div>
                <h6 class="fw-bold m-0">Support Tickets</h6>
                <a href="supporttickets.php" class="stretched-link"></a>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="card border-0 shadow-sm rounded-4 p-4 h-100 hover-lift">
                <div class="d-flex align-items-center justify-content-between mb-3">
                    <div class="bg-danger-subtle text-danger rounded-circle p-3">
                        <i class="bi bi-receipt fs-4"></i>
                    </div>
                    <div class="display-6 fw-bold">{$clientsstats.invoicesnum}</div>
                </div>
                <h6 class="fw-bold m-0">Unpaid Invoices</h6>
                <a href="clientarea.php?action=invoices" class="stretched-link"></a>
            </div>
        </div>
    </div>

    <div class="row g-4">
        <!-- Active Services Preview -->
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-4">
                <div class="card-header bg-white border-0 p-4 d-flex justify-content-between align-items-center">
                    <h5 class="m-0 fw-bold">Active <span class="text-success">Services</span></h5>
                    <a href="clientarea.php?action=services" class="btn btn-sm btn-light rounded-pill px-3">View All</a>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead class="bg-light">
                            <tr>
                                <th class="ps-4">Product/Service</th>
                                <th>Pricing</th>
                                <th>Status</th>
                                <th class="pe-4"></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach $services as $service}
                            <tr>
                                <td class="ps-4">
                                    <div class="fw-bold">{$service.product}</div>
                                    <div class="small text-muted">{$service.domain}</div>
                                </td>
                                <td>
                                    <div class="fw-bold">{$service.amount}</div>
                                    <div class="small text-muted">{$service.billingcycle}</div>
                                </td>
                                <td>
                                    <span class="badge bg-success-subtle text-success rounded-pill px-3 py-2">{$service.status}</span>
                                </td>
                                <td class="pe-4 text-end">
                                    <a href="clientarea.php?action=productdetails&id={$service.id}" class="btn btn-sm btn-outline-success rounded-pill px-3">Manage</a>
                                </td>
                            </tr>
                            {foreachelse}
                            <tr>
                                <td colspan="4" class="text-center py-5 text-muted">No active services found.</td>
                            </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Recent News/Announcements -->
            <div class="card border-0 shadow-sm rounded-4 p-4">
                <h5 class="fw-bold mb-4">Recent <span class="text-success">Announcements</span></h5>
                {foreach $announcements as $announcement}
                <div class="mb-4 last-child-mb-0">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <h6 class="fw-bold m-0">{$announcement.title}</h6>
                        <span class="small text-muted">{$announcement.date}</span>
                    </div>
                    <p class="small text-muted mb-2">{$announcement.text|truncate:150}</p>
                    <a href="announcements.php?id={$announcement.id}" class="text-success small fw-bold text-decoration-none">Read More <i class="bi bi-arrow-right ms-1"></i></a>
                </div>
                {foreachelse}
                <p class="text-muted m-0">No recent announcements.</p>
                {/foreach}
            </div>
        </div>

        <!-- Sidebar Info -->
        <div class="col-lg-4">
            <!-- Account Info -->
            <div class="card border-0 shadow-sm rounded-4 p-4 mb-4 bg-dark-green text-white">
                <h6 class="fw-bold mb-4 text-neon">Account Information</h6>
                <div class="d-flex align-items-center gap-3 mb-4">
                    <div class="bg-white text-dark rounded-circle d-flex align-items-center justify-content-center fw-bold" style="width: 48px; height: 48px;">
                        {$clientname|substr:0:1}
                    </div>
                    <div>
                        <div class="fw-bold">{$clientname}</div>
                        <div class="small opacity-75">{$clientemail}</div>
                    </div>
                </div>
                <div class="small opacity-75 mb-4">
                    {$clientaddress1}, {$clientcity}<br>
                    {$clientstate}, {$clientpostcode}<br>
                    {$clientcountry}
                </div>
                <a href="clientarea.php?action=details" class="btn btn-neon w-100 rounded-pill py-2 fw-bold">Update Details</a>
            </div>

            <!-- Support Shortcuts -->
            <div class="card border-0 shadow-sm rounded-4 p-4">
                <h6 class="fw-bold mb-4">Quick <span class="text-success">Support</span></h6>
                <div class="list-group list-group-flush">
                    <a href="submitticket.php" class="list-group-item list-group-item-action border-0 px-0 py-3 d-flex align-items-center gap-3">
                        <i class="bi bi-plus-circle text-success fs-5"></i>
                        <div>
                            <div class="fw-bold small">Open New Ticket</div>
                            <div class="text-muted x-small">Get help from our experts</div>
                        </div>
                    </a>
                    <a href="knowledgebase.php" class="list-group-item list-group-item-action border-0 px-0 py-3 d-flex align-items-center gap-3">
                        <i class="bi bi-book text-success fs-5"></i>
                        <div>
                            <div class="fw-bold small">Knowledgebase</div>
                            <div class="text-muted x-small">Browse our help articles</div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .bg-dark-green { background-color: #0a251c; }
    .text-neon { color: #00ff66; }
    .bg-neon { background-color: #00ff66; }
    .btn-neon { background-color: #00ff66; color: #0a251c; border: none; transition: all 0.3s ease; }
    .btn-neon:hover { background-color: #00e65c; }
    .bg-success-subtle { background-color: rgba(0, 255, 102, 0.1); }
    .bg-info-subtle { background-color: rgba(13, 202, 240, 0.1); }
    .bg-danger-subtle { background-color: rgba(220, 53, 69, 0.1); }
    .hover-lift { transition: transform 0.2s ease; }
    .hover-lift:hover { transform: translateY(-5px); }
    .x-small { font-size: 0.75rem; }
    .last-child-mb-0:last-child { margin-bottom: 0 !important; }
</style>

{include file="$template/footer.tpl"}

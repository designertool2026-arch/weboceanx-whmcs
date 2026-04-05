{if $templatefile == 'clientarea'}
    <div class="row g-4 mb-5">
        <!-- Dashboard Overview Cards -->
        <div class="col-md-3">
            <div class="card border-0 shadow-sm rounded-4 p-4 h-100 hover-lift bg-primary-green text-white">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="icon-box bg-white bg-opacity-10 p-3 rounded-3 text-neon">
                        <i class="bi bi-box-seam fs-4"></i>
                    </div>
                    <h2 class="m-0 fw-bold">{$clientsstats.productsnumactive}</h2>
                </div>
                <h6 class="fw-bold opacity-75">Active Services</h6>
                <a href="clientarea.php?action=services" class="text-neon text-decoration-none small mt-3 d-block">Manage Services <i class="bi bi-arrow-right"></i></a>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card border-0 shadow-sm rounded-4 p-4 h-100 hover-lift bg-white">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="icon-box bg-light p-3 rounded-3 text-success">
                        <i class="bi bi-globe fs-4"></i>
                    </div>
                    <h2 class="m-0 fw-bold">{$clientsstats.numdomains}</h2>
                </div>
                <h6 class="fw-bold text-muted">Total Domains</h6>
                <a href="clientarea.php?action=domains" class="text-success text-decoration-none small mt-3 d-block">Manage Domains <i class="bi bi-arrow-right"></i></a>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card border-0 shadow-sm rounded-4 p-4 h-100 hover-lift bg-white">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="icon-box bg-light p-3 rounded-3 text-danger">
                        <i class="bi bi-receipt fs-4"></i>
                    </div>
                    <h2 class="m-0 fw-bold">{$clientsstats.numunpaidinvoices}</h2>
                </div>
                <h6 class="fw-bold text-muted">Unpaid Invoices</h6>
                <a href="clientarea.php?action=invoices" class="text-danger text-decoration-none small mt-3 d-block">Pay Invoices <i class="bi bi-arrow-right"></i></a>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card border-0 shadow-sm rounded-4 p-4 h-100 hover-lift bg-white">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="icon-box bg-light p-3 rounded-3 text-primary">
                        <i class="bi bi-ticket-perforated fs-4"></i>
                    </div>
                    <h2 class="m-0 fw-bold">{$clientsstats.numactivetickets}</h2>
                </div>
                <h6 class="fw-bold text-muted">Active Tickets</h6>
                <a href="supporttickets.php" class="text-primary text-decoration-none small mt-3 d-block">View Tickets <i class="bi bi-arrow-right"></i></a>
            </div>
        </div>
    </div>

    <div class="row g-4">
        <!-- Recent Invoices -->
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-4">
                <div class="card-header bg-white border-0 p-4 d-flex justify-content-between align-items-center">
                    <h5 class="m-0 fw-bold">Recent Invoices</h5>
                    <a href="clientarea.php?action=invoices" class="btn btn-sm btn-outline-success rounded-pill px-3">View All</a>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
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

            <!-- Recent Support Tickets -->
            <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                <div class="card-header bg-white border-0 p-4 d-flex justify-content-between align-items-center">
                    <h5 class="m-0 fw-bold">Support Tickets</h5>
                    <a href="supporttickets.php" class="btn btn-sm btn-outline-success rounded-pill px-3">View All</a>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0">
                        <thead class="bg-light">
                            <tr>
                                <th class="ps-4">Subject</th>
                                <th>Department</th>
                                <th>Status</th>
                                <th>Last Updated</th>
                                <th class="pe-4"></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach $tickets as $ticket}
                            <tr>
                                <td class="ps-4 fw-bold">{$ticket.subject}</td>
                                <td>{$ticket.department}</td>
                                <td>
                                    <span class="badge rounded-pill {if $ticket.status == 'Open'}bg-primary{elseif $ticket.status == 'Answered'}bg-success{else}bg-secondary{/if}">
                                        {$ticket.status}
                                    </span>
                                </td>
                                <td>{$ticket.lastreply}</td>
                                <td class="pe-4 text-end">
                                    <a href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}" class="btn btn-sm btn-light rounded-pill px-3">View</a>
                                </td>
                            </tr>
                            {foreachelse}
                            <tr>
                                <td colspan="5" class="text-center py-5 text-muted">No support tickets found.</td>
                            </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Sidebar Info -->
        <div class="col-lg-4 sticky-top" style="top: 100px; height: fit-content; z-index: 10;">
            <div class="card border-0 shadow-sm rounded-4 p-4 mb-4 bg-dark-green text-white">
                <h5 class="fw-bold mb-4 text-neon">Account Information</h5>
                <div class="d-flex align-items-center mb-4">
                    <div class="avatar bg-white bg-opacity-10 rounded-circle p-3 me-3">
                        <i class="bi bi-person fs-3 text-neon"></i>
                    </div>
                    <div>
                        <h6 class="m-0 fw-bold">{$clientsdetails.firstname} {$clientsdetails.lastname}</h6>
                        <p class="m-0 small opacity-75">{$clientsdetails.email}</p>
                    </div>
                </div>
                <div class="mb-3">
                    <label class="small opacity-50 d-block">Company</label>
                    <span class="fw-bold">{$clientsdetails.companyname|default:"N/A"}</span>
                </div>
                <div class="mb-4">
                    <label class="small opacity-50 d-block">Address</label>
                    <span class="fw-bold">{$clientsdetails.address1}, {$clientsdetails.city}</span>
                </div>
                <a href="clientarea.php?action=details" class="btn btn-neon w-100 rounded-pill">Edit Profile</a>
            </div>

            <div class="card border-0 shadow-sm rounded-4 p-4">
                <h5 class="fw-bold mb-3">Quick Actions</h5>
                
                <!-- Sidebar Search Bar -->
                <div class="mb-4">
                    <div class="input-group input-group-sm">
                        <span class="input-group-text bg-light border-0 rounded-start-pill ps-3">
                            <i class="bi bi-search text-muted"></i>
                        </span>
                        <input type="text" id="sidebarSearch" class="form-control bg-light border-0 rounded-end-pill py-2" placeholder="Search actions...">
                    </div>
                </div>

                <div class="d-grid gap-2" id="sidebarNavLinks">
                    <a href="clientarea.php?action=services" class="btn btn-light rounded-pill text-start px-4 py-2 sidebar-link" data-keywords="services products manage active"><i class="bi bi-box-seam me-2 text-success"></i> View All Services</a>
                    <a href="clientarea.php?action=domains" class="btn btn-light rounded-pill text-start px-4 py-2 sidebar-link" data-keywords="domains manage register transfer"><i class="bi bi-globe me-2 text-success"></i> Manage Domains</a>
                    <a href="cart.php" class="btn btn-light rounded-pill text-start px-4 py-2 sidebar-link" data-keywords="order new buy service hosting"><i class="bi bi-plus-circle me-2 text-success"></i> Order New Service</a>
                    <a href="cart.php?a=add&domain=register" class="btn btn-light rounded-pill text-start px-4 py-2 sidebar-link" data-keywords="register new domain buy name"><i class="bi bi-globe-central-south-asia me-2 text-success"></i> Register New Domain</a>
                    <a href="submitticket.php" class="btn btn-light rounded-pill text-start px-4 py-2 sidebar-link" data-keywords="support ticket help open issue"><i class="bi bi-ticket-perforated me-2 text-success"></i> Open Support Ticket</a>
                    <a href="clientarea.php?action=invoices" class="btn btn-light rounded-pill text-start px-4 py-2 sidebar-link" data-keywords="billing invoices pay money history"><i class="bi bi-receipt me-2 text-success"></i> Billing & Invoices</a>
                    <a href="clientarea.php?action=details" class="btn btn-light rounded-pill text-start px-4 py-2 sidebar-link" data-keywords="profile account details edit settings"><i class="bi bi-person-gear me-2 text-success"></i> Account Settings</a>
                    <a href="logout.php" class="btn btn-light rounded-pill text-start px-4 py-2 sidebar-link" data-keywords="logout signout exit"><i class="bi bi-box-arrow-right me-2 text-danger"></i> Logout</a>
                </div>
            </div>
        </div>
    </div>
{/if}

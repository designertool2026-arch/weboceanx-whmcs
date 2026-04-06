{* WebOceanx - clientarea.tpl (Client Area / Products List with Sidebar) *}

<style>
    .wo-sidebar {
        background-color: #011714;
        border-radius: 16px;
        padding: 1.5rem;
        border: 1px solid rgba(255,255,255,0.05);
    }
    .wo-nav-link {
        display: flex;
        align-items: center;
        gap: 0.75rem;
        padding: 0.75rem 1rem;
        color: #8ea19e;
        text-decoration: none;
        border-radius: 8px;
        transition: all 0.2s;
        font-weight: 500;
    }
    .wo-nav-link:hover, .wo-nav-link.active {
        background-color: rgba(255, 255, 255, 0.06);
        color: #ffffff;
    }
    .wo-nav-link i {
        font-size: 1.25rem;
    }
    .ai-credits-widget {
        background: #021b18;
        border-radius: 12px;
        padding: 1.5rem;
        text-align: center;
        border: 1px solid rgba(180,245,60,0.2);
        margin-top: 1.5rem;
    }
    .btn-neon-primary {
        background-color: #b4f53c;
        color: #011d1a;
        border: none;
        font-weight: 600;
        transition: all 0.2s;
    }
    .btn-neon-primary:hover {
        background-color: #6ee7a0;
        color: #011d1a;
        transform: translateY(-1px);
    }
    .wo-content-card {
        background-color: #052a26;
        border-radius: 16px;
        border: 1px solid rgba(255,255,255,0.05);
        padding: 2rem;
    }
    .table-dark-custom {
        color: #e2e8f0;
    }
    .table-dark-custom th {
        border-bottom: 1px solid rgba(255,255,255,0.1);
        color: #8ea19e;
        font-weight: 600;
        text-transform: uppercase;
        font-size: 0.85rem;
        padding-bottom: 1rem;
    }
    .table-dark-custom td {
        border-bottom: 1px solid rgba(255,255,255,0.05);
        padding: 1rem 0;
        vertical-align: middle;
    }
    
    /* Collapse Icon Animation */
    [data-bs-toggle="collapse"][aria-expanded="false"] .wo-collapse-icon {
        transform: rotate(-90deg);
    }
</style>

<div class="row g-4">
    <!-- Sidebar Navigation -->
    <div class="col-lg-3">
        <div class="wo-sidebar mb-4">
            <h6 class="text-uppercase text-muted fw-bold mb-3 px-3" style="font-size: 0.75rem; letter-spacing: 1px;">Main Menu</h6>
            <div class="d-flex flex-column gap-1 mb-4">
                <a href="clientarea.php" class="wo-nav-link active">
                    <i class="bi bi-grid-1x2"></i> Dashboard
                </a>
                <a href="clientarea.php?action=products" class="wo-nav-link">
                    <i class="bi bi-hdd-network"></i> My Services
                </a>
                <a href="clientarea.php?action=domains" class="wo-nav-link">
                    <i class="bi bi-globe"></i> My Domains
                </a>
                <a href="clientarea.php?action=invoices" class="wo-nav-link">
                    <i class="bi bi-receipt"></i> Billing
                </a>
                <a href="supporttickets.php" class="wo-nav-link">
                    <i class="bi bi-chat-square-text"></i> Support
                </a>
            </div>

            <!-- Collapsible AI Tools Section -->
            <div class="d-flex justify-content-between align-items-center px-3 mt-4 mb-3" data-bs-toggle="collapse" data-bs-target="#aiToolsCollapse" aria-expanded="true" aria-controls="aiToolsCollapse" style="cursor: pointer;">
                <h6 class="text-uppercase fw-bold m-0" style="font-size: 0.75rem; letter-spacing: 1px; color: #b4f53c;">AI Tools Dashboard</h6>
                <i class="bi bi-chevron-down text-muted wo-collapse-icon" style="font-size: 0.8rem; transition: transform 0.3s;"></i>
            </div>
            
            <div class="collapse show" id="aiToolsCollapse">
                <div class="d-flex flex-column gap-1">
                    <a href="index.php?m=aitools" class="wo-nav-link">
                        <i class="bi bi-robot"></i> AI Overview
                    </a>
                    <a href="index.php?m=aitools&action=logo" class="wo-nav-link">
                        <i class="bi bi-palette"></i> Logo Generator
                    </a>
                    <a href="index.php?m=aitools&action=name" class="wo-nav-link">
                        <i class="bi bi-tag"></i> Name Generator
                    </a>
                    <a href="index.php?m=aitools&action=branding" class="wo-nav-link">
                        <i class="bi bi-stars"></i> Branding Generator
                    </a>
                    <a href="index.php?m=aitools&action=sitebuilder" class="wo-nav-link">
                        <i class="bi bi-window-desktop"></i> AI Site Builder
                    </a>
                    <a href="index.php?m=aitools&action=image" class="wo-nav-link">
                        <i class="bi bi-image"></i> AI Image Generator
                    </a>
                </div>
            </div>

            <!-- AI Credits Widget -->
            <div class="ai-credits-widget">
                <i class="bi bi-lightning-charge-fill fs-3 mb-2 d-block" style="color: #b4f53c;"></i>
                <h6 class="text-white fw-bold mb-1">AI Credits</h6>
                <div class="display-6 fw-bold mb-3" style="color: #b4f53c;">{$ai_credits|default:'0'}</div>
                <a href="cart.php?a=add&pid=1" class="btn btn-neon-primary btn-sm w-100 rounded-pill">Buy Credits</a>
            </div>
        </div>
    </div>

    <!-- Main Content Area -->
    <div class="col-lg-9">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold text-white m-0">My Products & Services</h2>
            <a href="cart.php" class="btn btn-neon-primary rounded-pill px-4">Order New Service</a>
        </div>

        <div class="wo-content-card">
            {if $services}
                <div class="table-responsive">
                    <table class="table table-borderless table-dark-custom w-100 m-0">
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
                            {foreach from=$services item=service}
                                <tr>
                                    <td>
                                        <div class="fw-bold text-white">{$service.group} - {$service.product}</div>
                                        <div class="small text-muted">{$service.domain}</div>
                                    </td>
                                    <td>
                                        <div class="fw-bold text-white">{$service.amount}</div>
                                        <div class="small text-muted">{$service.billingcycle}</div>
                                    </td>
                                    <td class="text-white">{$service.nextduedate}</td>
                                    <td>
                                        <span class="badge rounded-pill {if $service.status eq 'Active'}bg-success{elseif $service.status eq 'Pending'}bg-warning{elseif $service.status eq 'Suspended'}bg-danger{else}bg-secondary{/if} bg-opacity-25 border {if $service.status eq 'Active'}border-success text-success{elseif $service.status eq 'Pending'}border-warning text-warning{elseif $service.status eq 'Suspended'}border-danger text-danger{else}border-secondary text-secondary{/if} px-3 py-2">
                                            {$service.statustext}
                                        </span>
                                    </td>
                                    <td class="text-end">
                                        <a href="clientarea.php?action=productdetails&id={$service.id}" class="btn btn-sm btn-outline-secondary rounded-pill px-3">Manage</a>
                                    </td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            {else}
                <div class="text-center py-5">
                    <i class="bi bi-box-seam display-1 text-muted mb-3 opacity-50"></i>
                    <h4 class="text-white fw-bold">No Services Found</h4>
                    <p class="text-muted mb-4">You don't have any active products or services with us yet.</p>
                    <a href="cart.php" class="btn btn-neon-primary rounded-pill px-4 py-2">Browse Our Products</a>
                </div>
            {/if}
        </div>
    </div>
</div>

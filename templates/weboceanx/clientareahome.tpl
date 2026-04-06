{* WebOceanx - clientareahome.tpl (Redesigned Dashboard with AI Tools) *}

<style>
    /* Dashboard Specific Variables - Adapts to Light/Dark Mode */
    :root {
        --wo-dash-bg: #f8fafc;
        --wo-dash-card: #ffffff;
        --wo-dash-text: #0f172a;
        --wo-dash-muted: #64748b;
        --wo-dash-border: #e2e8f0;
        --wo-dash-hover: #f1f5f9;
        --wo-dash-tab-bg: #f1f5f9;
        --wo-dash-tab-active: #ffffff;
    }

    body.dark-mode {
        --wo-dash-bg: #0f172a;
        --wo-dash-card: #1e293b;
        --wo-dash-text: #f8fafc;
        --wo-dash-muted: #94a3b8;
        --wo-dash-border: #334155;
        --wo-dash-hover: #334155;
        --wo-dash-tab-bg: rgba(0,0,0,0.2);
        --wo-dash-tab-active: #1e293b;
    }

    @media (prefers-color-scheme: dark) {
        :root {
            --wo-dash-bg: #0f172a;
            --wo-dash-card: #1e293b;
            --wo-dash-text: #f8fafc;
            --wo-dash-muted: #94a3b8;
            --wo-dash-border: #334155;
            --wo-dash-hover: #334155;
            --wo-dash-tab-bg: rgba(0,0,0,0.2);
            --wo-dash-tab-active: #1e293b;
        }
    }

    .wo-dashboard {
        color: var(--wo-dash-text);
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
    }

    .wo-dash-card {
        background-color: var(--wo-dash-card);
        border: 1px solid var(--wo-dash-border);
        border-radius: 16px;
    }

    .wo-stat-box {
        background-color: var(--wo-dash-card);
        border: 1px solid var(--wo-dash-border);
        border-radius: 12px;
        padding: 16px 20px;
        min-width: 150px;
        flex: 1;
    }

    .hide-scrollbar::-webkit-scrollbar { display: none; }
    .hide-scrollbar { -ms-overflow-style: none; scrollbar-width: none; }

    .wo-todo-item {
        border: 1px solid var(--wo-dash-border);
        border-radius: 12px;
        transition: background-color 0.2s;
        color: var(--wo-dash-text);
        text-decoration: none;
    }
    .wo-todo-item:hover {
        background-color: var(--wo-dash-hover);
        color: var(--wo-dash-text);
    }

    .wo-help-item {
        border-bottom: 1px solid var(--wo-dash-border);
        transition: background-color 0.2s, border-radius 0.2s;
        color: var(--wo-dash-text);
        text-decoration: none;
    }
    .wo-help-item:hover {
        background-color: var(--wo-dash-hover);
        border-radius: 8px;
        color: var(--wo-dash-text);
    }
    .wo-help-item:last-child {
        border-bottom: none;
    }

    .btn-neon-primary {
        background-color: #4ade80;
        color: #064e3b;
        border: none;
        font-weight: 600;
        transition: all 0.2s;
    }
    .btn-neon-primary:hover {
        background-color: #22c55e;
        color: #064e3b;
        transform: translateY(-1px);
    }

    .btn-dash-outline {
        background-color: transparent;
        border: 1px solid var(--wo-dash-border);
        color: var(--wo-dash-text);
        font-weight: 600;
        transition: all 0.2s;
    }
    .btn-dash-outline:hover {
        background-color: var(--wo-dash-hover);
        color: var(--wo-dash-text);
    }
    
    .ai-tool-card {
        border: 1px solid var(--wo-dash-border);
        border-radius: 12px;
        transition: all 0.3s ease;
        background-color: var(--wo-dash-card);
    }
    .ai-tool-card:hover {
        border-color: #4ade80;
        box-shadow: 0 4px 12px rgba(74, 222, 128, 0.1);
        transform: translateY(-2px);
    }
</style>

<div class="wo-dashboard">
    
    <!-- Stats Row -->
    <div class="d-flex gap-3 mb-4 overflow-auto pb-2 hide-scrollbar">
        <div class="wo-stat-box">
            <div class="d-flex align-items-center gap-2 mb-1" style="color: var(--wo-dash-muted);">
                <i class="bi bi-globe"></i> <span class="small fw-medium">Domains</span>
            </div>
            <div class="fs-4 fw-bold">{$clientsstats.numactivedomains}</div>
        </div>
        <div class="wo-stat-box">
            <div class="d-flex align-items-center gap-2 mb-1" style="color: var(--wo-dash-muted);">
                <i class="bi bi-hdd-network"></i> <span class="small fw-medium">Hosting</span>
            </div>
            <div class="fs-4 fw-bold">{$clientsstats.productsnumactive}</div>
        </div>
        <div class="wo-stat-box">
            <div class="d-flex align-items-center gap-2 mb-1" style="color: var(--wo-dash-muted);">
                <i class="bi bi-window-desktop"></i> <span class="small fw-medium">Websites</span>
            </div>
            <div class="fs-4 fw-bold">0</div>
        </div>
        <div class="wo-stat-box">
            <div class="d-flex align-items-center gap-2 mb-1" style="color: var(--wo-dash-muted);">
                <i class="bi bi-envelope"></i> <span class="small fw-medium">Email & ...</span>
            </div>
            <div class="fs-4 fw-bold">0</div>
        </div>
        <div class="wo-stat-box">
            <div class="d-flex align-items-center gap-2 mb-1" style="color: var(--wo-dash-muted);">
                <i class="bi bi-grid-1x2"></i> <span class="small fw-medium">Applications</span>
            </div>
            <div class="fs-4 fw-bold">0</div>
        </div>
        <div class="wo-stat-box">
            <div class="d-flex align-items-center gap-2 mb-1" style="color: var(--wo-dash-muted);">
                <i class="bi bi-box"></i> <span class="small fw-medium">Other</span>
            </div>
            <div class="fs-4 fw-bold">0</div>
        </div>
    </div>

    <!-- DEDICATED AI TOOLS DASHBOARD SECTION -->
    <div class="row g-4 mb-4">
        <!-- AI Tools List (Main Content) -->
        <div class="col-lg-8">
            <div class="wo-dash-card h-100 p-4">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div>
                        <h5 class="fw-bold m-0">AI Tools Dashboard</h5>
                        <p class="small m-0 mt-1" style="color: var(--wo-dash-muted);">Generate assets instantly using your credits.</p>
                    </div>
                    <a href="index.php?m=aitools" class="btn btn-sm btn-dash-outline d-none d-sm-inline-block">View All Tools</a>
                </div>
                
                <div class="row g-3">
                    <!-- Logo Generator -->
                    <div class="col-md-6">
                        <div class="ai-tool-card p-3 d-flex flex-column h-100">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <div class="d-flex align-items-center gap-2">
                                    <div class="bg-success bg-opacity-10 p-2 rounded-3">
                                        <i class="bi bi-palette fs-5 text-success"></i>
                                    </div>
                                    <span class="fw-bold">Logo Generator</span>
                                </div>
                                <span class="badge bg-secondary bg-opacity-10 text-secondary rounded-pill border">10 Credits</span>
                            </div>
                            <p class="small mb-3 mt-2 flex-grow-1" style="color: var(--wo-dash-muted);">Create professional, high-quality logos for your brand instantly.</p>
                            <a href="index.php?m=aitools&action=logo" class="btn btn-sm btn-dash-outline w-100 fw-bold">Launch Tool</a>
                        </div>
                    </div>
                    
                    <!-- Business Name Generator -->
                    <div class="col-md-6">
                        <div class="ai-tool-card p-3 d-flex flex-column h-100">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <div class="d-flex align-items-center gap-2">
                                    <div class="bg-primary bg-opacity-10 p-2 rounded-3">
                                        <i class="bi bi-tag fs-5 text-primary"></i>
                                    </div>
                                    <span class="fw-bold">Name Generator</span>
                                </div>
                                <span class="badge bg-secondary bg-opacity-10 text-secondary rounded-pill border">5 Credits</span>
                            </div>
                            <p class="small mb-3 mt-2 flex-grow-1" style="color: var(--wo-dash-muted);">Find the perfect, catchy name for your new business or project.</p>
                            <a href="index.php?m=aitools&action=name" class="btn btn-sm btn-dash-outline w-100 fw-bold">Launch Tool</a>
                        </div>
                    </div>

                    <!-- Branding Generator -->
                    <div class="col-md-6">
                        <div class="ai-tool-card p-3 d-flex flex-column h-100">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <div class="d-flex align-items-center gap-2">
                                    <div class="bg-warning bg-opacity-10 p-2 rounded-3">
                                        <i class="bi bi-stars fs-5 text-warning"></i>
                                    </div>
                                    <span class="fw-bold">Branding Generator</span>
                                </div>
                                <span class="badge bg-secondary bg-opacity-10 text-secondary rounded-pill border">15 Credits</span>
                            </div>
                            <p class="small mb-3 mt-2 flex-grow-1" style="color: var(--wo-dash-muted);">Generate full brand guidelines, color palettes, and typography.</p>
                            <a href="index.php?m=aitools&action=branding" class="btn btn-sm btn-dash-outline w-100 fw-bold">Launch Tool</a>
                        </div>
                    </div>

                    <!-- AI Site Builder -->
                    <div class="col-md-6">
                        <div class="ai-tool-card p-3 d-flex flex-column h-100">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <div class="d-flex align-items-center gap-2">
                                    <div class="bg-info bg-opacity-10 p-2 rounded-3">
                                        <i class="bi bi-window-desktop fs-5 text-info"></i>
                                    </div>
                                    <span class="fw-bold">AI Site Builder</span>
                                </div>
                                <span class="badge bg-secondary bg-opacity-10 text-secondary rounded-pill border">50 Credits</span>
                            </div>
                            <p class="small mb-3 mt-2 flex-grow-1" style="color: var(--wo-dash-muted);">Describe your idea and let AI build a complete, working website.</p>
                            <a href="index.php?m=aitools&action=sitebuilder" class="btn btn-sm btn-dash-outline w-100 fw-bold">Launch Tool</a>
                        </div>
                    </div>

                    <!-- AI Image Generator (Full Width) -->
                    <div class="col-12">
                        <div class="ai-tool-card p-3 d-flex flex-column flex-sm-row justify-content-between align-items-sm-center gap-3">
                            <div class="d-flex align-items-center gap-3">
                                <div class="bg-danger bg-opacity-10 p-3 rounded-3">
                                    <i class="bi bi-image fs-4 text-danger"></i>
                                </div>
                                <div>
                                    <div class="fw-bold d-flex align-items-center gap-2 mb-1">
                                        AI Image Generator 
                                        <span class="badge bg-secondary bg-opacity-10 text-secondary rounded-pill border">5 Credits</span>
                                    </div>
                                    <div class="small" style="color: var(--wo-dash-muted);">Generate custom images, graphics, and illustrations from text prompts.</div>
                                </div>
                            </div>
                            <a href="index.php?m=aitools&action=image" class="btn btn-dash-outline text-nowrap fw-bold px-4">Launch Tool</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- AI Credits Balance Card (Right-Hand Sidebar) -->
        <div class="col-lg-4">
            <div class="wo-dash-card h-100 p-4 d-flex flex-column justify-content-center align-items-center text-center position-relative overflow-hidden" style="background: linear-gradient(135deg, #0f3d2e, #071a16); color: white; border: none;">
                <div class="position-relative z-1 w-100">
                    <div class="d-flex justify-content-center align-items-center gap-2 mb-3">
                        <i class="bi bi-lightning-charge-fill fs-4" style="color: #4ade80;"></i>
                        <h5 class="fw-bold m-0 text-white">AI Credits Balance</h5>
                    </div>
                    <div class="display-3 fw-bold mb-3" style="color: #4ade80; text-shadow: 0 0 20px rgba(74, 222, 128, 0.4);">
                        {$ai_credits|default:'0'}
                    </div>
                    <p class="small opacity-75 mb-4">Use credits to power your AI generation tools. Credits are deducted per usage.</p>
                    <a href="cart.php?a=add&pid=1" class="btn btn-neon-primary rounded-pill px-4 py-3 w-100 fw-bold shadow-lg">
                        <i class="bi bi-cart-plus me-2"></i> Buy More Credits
                    </a>
                </div>
                <!-- Decorative Background Element -->
                <div class="position-absolute top-50 start-50 translate-middle opacity-10" style="font-size: 15rem; color: #4ade80;">
                    <i class="bi bi-robot"></i>
                </div>
            </div>
        </div>
    </div>

    <!-- Todos Section -->
    <div class="wo-dash-card mb-4">
        <div class="card-body p-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h5 class="fw-bold m-0">Todos</h5>
                <span class="small fw-medium" style="color: var(--wo-dash-muted);">0/4 completed</span>
            </div>
            
            <div class="d-flex p-1 rounded-3 mb-4" style="background-color: var(--wo-dash-tab-bg);">
                <div class="flex-fill text-center py-2 rounded-2 fw-semibold" style="cursor:pointer; color: var(--wo-dash-muted);">
                    Product setup <i class="bi bi-check-circle-fill text-success ms-1"></i>
                </div>
                <div class="flex-fill text-center py-2 rounded-2 fw-semibold" style="background-color: var(--wo-dash-tab-active); cursor:pointer; box-shadow: 0 1px 3px rgba(0,0,0,0.1);">
                    Account setup <span class="badge bg-secondary rounded-pill ms-1">4</span>
                </div>
            </div>

            <div class="d-flex flex-column gap-3">
                <a href="clientarea.php?action=security" class="wo-todo-item d-flex align-items-center gap-3 p-3">
                    <i class="bi bi-shield-check fs-5" style="color: var(--wo-dash-muted);"></i>
                    <div class="flex-fill">
                        <div class="fw-semibold mb-1">Enable 2FA</div>
                        <div class="small" style="color: var(--wo-dash-muted);">Add an extra layer of security to protect your account</div>
                    </div>
                    <i class="bi bi-arrow-up-right" style="color: var(--wo-dash-muted);"></i>
                </a>
                
                <a href="clientarea.php?action=creditcard" class="wo-todo-item d-flex align-items-center gap-3 p-3">
                    <i class="bi bi-credit-card fs-5" style="color: var(--wo-dash-muted);"></i>
                    <div class="flex-fill">
                        <div class="fw-semibold mb-1">Add a payment method</div>
                        <div class="small" style="color: var(--wo-dash-muted);">Securely store a card to make future purchases faster</div>
                    </div>
                    <i class="bi bi-arrow-up-right" style="color: var(--wo-dash-muted);"></i>
                </a>
                
                <a href="clientarea.php?action=details" class="wo-todo-item d-flex align-items-center gap-3 p-3">
                    <i class="bi bi-globe-americas fs-5" style="color: var(--wo-dash-muted);"></i>
                    <div class="flex-fill">
                        <div class="fw-semibold mb-1">Add an address</div>
                        <div class="small" style="color: var(--wo-dash-muted);">Add an address to your account</div>
                    </div>
                    <i class="bi bi-arrow-up-right" style="color: var(--wo-dash-muted);"></i>
                </a>
                
                <a href="clientarea.php?action=details" class="wo-todo-item d-flex align-items-center gap-3 p-3">
                    <i class="bi bi-telephone fs-5" style="color: var(--wo-dash-muted);"></i>
                    <div class="flex-fill">
                        <div class="fw-semibold mb-1">Add a phone number</div>
                        <div class="small" style="color: var(--wo-dash-muted);">Add a phone number to your account for security and verification</div>
                    </div>
                    <i class="bi bi-arrow-up-right" style="color: var(--wo-dash-muted);"></i>
                </a>
            </div>
        </div>
    </div>

    <!-- Promo Banners -->
    <div class="rounded-4 p-4 mb-4 d-flex justify-content-between align-items-center flex-wrap gap-3" style="background-color: #bbf7d0; color: #166534;">
        <div>
            <h5 class="fw-bold mb-1">Find the right product for you</h5>
            <p class="mb-0 small opacity-75 fw-medium">Browse our complete catalogue to discover the tools and services to power your online presence.</p>
        </div>
        <a href="cart.php" class="btn bg-white text-dark fw-bold rounded-3 px-4 py-2 d-flex align-items-center gap-2 shadow-sm">
            <i class="bi bi-arrow-up-right"></i> Browse products
        </a>
    </div>

    <!-- Domain Search -->
    <div class="rounded-4 p-4 mb-4" style="background-color: #064e3b; color: white;">
        <h5 class="fw-bold mb-1">Lock in a new domain for your business</h5>
        <p class="small opacity-75 mb-4 fw-medium">Search for the perfect domain to represent your brand or business.</p>
        
        <form action="domainchecker.php" method="post">
            <div class="d-flex bg-white rounded-3 p-1 align-items-center">
                <input type="text" name="domain" class="form-control border-0 shadow-none py-2 px-3" placeholder="Start with a domain" style="background: transparent; color: #0f172a; font-weight: 500;">
                <button type="submit" class="btn text-muted px-3"><i class="bi bi-search"></i></button>
            </div>
        </form>
    </div>

</div>

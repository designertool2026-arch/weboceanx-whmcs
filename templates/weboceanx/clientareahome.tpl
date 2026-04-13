<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <title>WebOceanX – Client Dashboard</title>
    <!-- Font & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        /* ---------- RESET & GLOBAL ---------- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Force WHMCS to hide all its default wrappers */
        #header, #footer, .header-lined, .breadcrumb-wrapper, .navbar,
        footer, .topbar, .main-header, .page-header, .whmcs-header,
        .whmcs-footer, .global-header, .global-footer {
            display: none !important;
        }

        body, html {
            margin: 0 !important;
            padding: 0 !important;
            background: #011d1a !important;
            font-family: 'Inter', sans-serif;
            color: #ffffff;
            overflow-x: hidden;
        }

        /* ---------- APP LAYOUT ---------- */
        .app-wrapper {
            display: flex;
            min-height: 100vh;
        }

        /* ---------- SIDEBAR (hosting.com style) ---------- */
        .app-sidebar {
            width: 280px;
            background: #011714;
            position: fixed;
            height: 100vh;
            padding: 2rem 1.5rem;
            display: flex;
            flex-direction: column;
            border-right: 1px solid rgba(255,255,255,0.05);
        }

        .sidebar-brand {
            font-size: 1.7rem;
            font-weight: 800;
            margin-bottom: 2.5rem;
            background: linear-gradient(135deg, #b4f53c, #59e38c);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .nav-btn {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 16px;
            margin-bottom: 6px;
            border-radius: 14px;
            color: #8ea19e;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.2s;
        }

        .nav-btn i {
            font-size: 1.3rem;
        }

        .nav-btn:hover, .nav-btn.active {
            background: rgba(255,255,255,0.06);
            color: #ffffff;
        }

        .sidebar-footer {
            margin-top: auto;
            font-size: 0.75rem;
            color: #4a6a66;
            padding-top: 2rem;
        }

        /* ---------- TOP BAR ---------- */
        .top-header {
            position: fixed;
            left: 280px;
            right: 0;
            top: 0;
            height: 70px;
            background: #02211e;
            backdrop-filter: blur(10px);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 2rem;
            border-bottom: 1px solid rgba(255,255,255,0.05);
            z-index: 100;
        }

        .top-header .right {
            display: flex;
            align-items: center;
            gap: 1.2rem;
        }

        .right-icon {
            font-size: 1.3rem;
            cursor: pointer;
            color: #b4f53c;
        }

        /* ---------- MAIN CONTENT ---------- */
        .app-content {
            margin-left: 280px;
            padding: 100px 2.5rem 2.5rem;
            width: 100%;
        }

        /* ---------- STATS STRIP (hosting.com grid) ---------- */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
            gap: 1rem;
            margin: 1.5rem 0 2rem;
        }

        .stat-card {
            background: #052a26;
            border-radius: 1.2rem;
            padding: 1.2rem;
            transition: transform 0.2s;
        }

        .stat-card:hover {
            transform: translateY(-3px);
            background: #07332e;
        }

        .stat-label {
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            color: #8ea19e;
            margin-bottom: 0.4rem;
        }

        .stat-number {
            font-size: 1.8rem;
            font-weight: 700;
            line-height: 1.2;
        }

        /* ---------- TODO / CHECKLIST ---------- */
        .todo-card {
            background: #052a26;
            border-radius: 1.5rem;
            padding: 1.5rem;
            margin-bottom: 1.8rem;
        }

        .todo-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.9rem 0;
            border-bottom: 1px solid rgba(255,255,255,0.05);
        }

        .todo-item:last-child {
            border-bottom: none;
        }

        /* ---------- BANNERS (modern gradients) ---------- */
        .promo-banner {
            padding: 1.5rem;
            border-radius: 1.5rem;
            margin-bottom: 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .banner-lime {
            background: linear-gradient(105deg, #b4f53c, #6ee7a0);
            color: #011d1a;
        }

        .banner-teal {
            background: linear-gradient(105deg, #2dd4bf, #14b8a6);
            color: #011d1a;
        }

        .btn-outline-light-custom {
            background: rgba(0,0,0,0.2);
            border: 1px solid rgba(255,255,255,0.3);
            border-radius: 2rem;
            padding: 0.5rem 1.2rem;
            font-weight: 600;
            color: inherit;
            text-decoration: none;
            transition: all 0.2s;
        }

        .btn-outline-light-custom:hover {
            background: rgba(0,0,0,0.4);
        }

        /* ---------- DARK CARDS (services, tickets, AI) ---------- */
        .dark-card {
            background: #052a26;
            border-radius: 1.5rem;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.2rem;
            flex-wrap: wrap;
        }

        .section-title {
            font-size: 1.2rem;
            font-weight: 600;
        }

        .btn-ghost {
            background: transparent;
            border: 1px solid rgba(255,255,255,0.2);
            border-radius: 2rem;
            padding: 0.3rem 1rem;
            font-size: 0.8rem;
            color: #fff;
            text-decoration: none;
        }

        .btn-ghost:hover {
            background: rgba(255,255,255,0.05);
        }

        /* Tables */
        .modern-table {
            width: 100%;
            border-collapse: collapse;
        }

        .modern-table th {
            text-align: left;
            padding: 0.8rem 0;
            font-size: 0.7rem;
            font-weight: 600;
            text-transform: uppercase;
            color: #8ea19e;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        .modern-table td {
            padding: 0.9rem 0;
            border-bottom: 1px solid rgba(255,255,255,0.05);
            vertical-align: middle;
        }

        .status-badge {
            background: rgba(180,245,60,0.15);
            color: #b4f53c;
            padding: 0.2rem 0.7rem;
            border-radius: 2rem;
            font-size: 0.75rem;
            font-weight: 500;
        }

        /* AI Tools Grid */
        .ai-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 1rem;
            margin-top: 1rem;
        }

        .ai-tool-item {
            background: #07332e;
            border-radius: 1.2rem;
            padding: 1.2rem;
            transition: all 0.3s ease;
            border: 1px solid rgba(255,255,255,0.02);
        }

        .ai-tool-item:hover {
            background: #0a423c;
            transform: translateY(-4px);
            border-color: rgba(180,245,60,0.3);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }

        /* Domain search input */
        .domain-input {
            width: 100%;
            padding: 0.9rem 1rem;
            border-radius: 1.2rem;
            background: #021b18;
            border: 1px solid rgba(255,255,255,0.1);
            color: white;
            font-size: 1rem;
        }

        .domain-input:focus {
            outline: none;
            border-color: #b4f53c;
        }

        /* Two columns */
        .two-col {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }

        /* Responsive */
        @media (max-width: 1000px) {
            .app-sidebar { width: 240px; }
            .top-header { left: 240px; }
            .app-content { margin-left: 240px; padding: 100px 1.5rem 1.5rem; }
        }

        @media (max-width: 800px) {
            .app-sidebar { display: none; }
            .top-header { left: 0; }
            .app-content { margin-left: 0; }
            .two-col { grid-template-columns: 1fr; }
            .stats-grid { grid-template-columns: repeat(2, 1fr); }
        }
    </style>
</head>
<body>
<div class="app-wrapper">

    <!-- SIDEBAR (hosting.com style) -->
    <aside class="app-sidebar">
        <div class="sidebar-brand">WebOceanX</div>
        <nav style="flex:1;">
            <a href="clientarea.php" class="nav-btn active"><i class="bi bi-house-door"></i> Dashboard</a>
            
            <!-- Collapsible AI Tools -->
            <div style="margin: 0.5rem 0;">
                <a href="#aiToolsMenu" data-bs-toggle="collapse" class="nav-btn" style="justify-content: space-between; margin-bottom: 0;">
                    <span style="display:flex; align-items:center; gap:12px;"><i class="bi bi-cpu"></i> AI Studio</span>
                    <i class="bi bi-chevron-down" style="font-size: 0.8rem;"></i>
                </a>
                <div class="collapse show" id="aiToolsMenu" style="margin-left: 1rem; border-left: 1px solid rgba(255,255,255,0.05); padding-left: 0.5rem; margin-top: 0.5rem;">
                    <a href="index.php?m=aitools" class="nav-btn" style="font-size: 0.85rem; padding: 8px 12px; margin-bottom: 2px;"><i class="bi bi-grid"></i> Dashboard</a>
                    <a href="index.php?m=aitools&action=logo" class="nav-btn" style="font-size: 0.85rem; padding: 8px 12px; margin-bottom: 2px;"><i class="bi bi-palette"></i> Logo Generator</a>
                    <a href="index.php?m=aitools&action=name" class="nav-btn" style="font-size: 0.85rem; padding: 8px 12px; margin-bottom: 2px;"><i class="bi bi-tag"></i> Business Name</a>
                    <a href="index.php?m=aitools&action=branding" class="nav-btn" style="font-size: 0.85rem; padding: 8px 12px; margin-bottom: 2px;"><i class="bi bi-stars"></i> Branding</a>
                    <a href="index.php?m=aitools&action=sitebuilder" class="nav-btn" style="font-size: 0.85rem; padding: 8px 12px; margin-bottom: 2px;"><i class="bi bi-window-desktop"></i> Site Builder</a>
                    <a href="index.php?m=aitools&action=image" class="nav-btn" style="font-size: 0.85rem; padding: 8px 12px; margin-bottom: 2px;"><i class="bi bi-image"></i> Image Gen</a>
                </div>
            </div>

            <a href="clientarea.php?action=services" class="nav-btn"><i class="bi bi-box-seam"></i> Services</a>
            <a href="clientarea.php?action=domains" class="nav-btn"><i class="bi bi-globe2"></i> Domains</a>
            <a href="clientarea.php?action=invoices" class="nav-btn"><i class="bi bi-receipt"></i> Billing</a>
            <a href="supporttickets.php" class="nav-btn"><i class="bi bi-chat-dots"></i> Support</a>
        </nav>
        <div class="sidebar-footer">
            <i class="bi bi-shield-check"></i> System status: All systems operational
        </div>
    </aside>

    <!-- TOP BAR (no WHMCS elements) -->
    <div class="top-header">
        <div>
            <a href="cart.php" class="btn-outline-light-custom" style="background:#b4f53c; color:#011d1a; border:none;">+ New Order</a>
        </div>
        <div class="right">
            <span class="right-icon"><i class="bi bi-question-circle"></i></span>
            <span class="right-icon"><i class="bi bi-bell"></i></span>
            <span class="right-icon"><i class="bi bi-person-circle"></i></span>
        </div>
    </div>

    <!-- MAIN CONTENT -->
    <main class="app-content">

        <!-- Welcome -->
        <div style="margin-bottom: 1rem;">
            <h1 style="font-size: 1.8rem; font-weight: 600;">Welcome, {$clientname}</h1>
            <p style="color: #8ea19e;">Manage your hosting, AI tools, and billing from one dashboard.</p>
        </div>

        <!-- STATS CARDS (like hosting.com) -->
        <div class="stats-grid">
            <div class="stat-card"><div class="stat-label">Domains</div><div class="stat-number">{$clientsstats.numactivedomains|default:0}</div></div>
            <div class="stat-card"><div class="stat-label">Hosting Plans</div><div class="stat-number">{$clientsstats.productsnumactive|default:0}</div></div>
            <div class="stat-card"><div class="stat-label">Active Tickets</div><div class="stat-number">{$clientsstats.numactivetickets|default:0}</div></div>
            <div class="stat-card"><div class="stat-label">Unpaid Invoices</div><div class="stat-number">{$clientsstats.numunpaidinvoices|default:0}</div></div>
            <div class="stat-card"><div class="stat-label">AI Credits</div><div class="stat-number">{$ai_credits|default:'0'}</div></div>
        </div>

        <!-- TODO / QUICK ACTIONS (security checklist) -->
        <div class="todo-card">
            <div class="section-header" style="margin-bottom: 0.5rem;">
                <span class="section-title"><i class="bi bi-check2-square"></i> Security checklist</span>
            </div>
            <div class="todo-item"><div><i class="bi bi-shield-lock"></i> Enable two‑factor authentication</div> <i class="bi bi-arrow-right"></i></div>
            <div class="todo-item"><div><i class="bi bi-credit-card"></i> Add a payment method</div> <i class="bi bi-arrow-right"></i></div>
            <div class="todo-item"><div><i class="bi bi-house-door"></i> Verify your address</div> <i class="bi bi-arrow-right"></i></div>
            <div class="todo-item"><div><i class="bi bi-telephone"></i> Add phone number</div> <i class="bi bi-arrow-right"></i></div>
        </div>

        <!-- PROMO BANNERS (modern) -->
        <div class="promo-banner banner-lime">
            <div><strong>🚀 Find the right product for you</strong><br>Browse our complete catalogue</div>
            <a href="cart.php" class="btn-outline-light-custom">Browse products →</a>
        </div>
        <div class="promo-banner banner-teal">
            <div><strong>🤖 Build your app with AI</strong><br>Generate websites, logos & more</div>
            <a href="index.php?m=aitools" class="btn-outline-light-custom">Launch AI Studio →</a>
        </div>

        <!-- PROMINENT DOMAIN SEARCH -->
        <div class="dark-card" style="padding: 2.5rem; text-align: center; position: relative; overflow: hidden; border: 1px solid rgba(180,245,60,0.1);">
            <div style="position: absolute; top: -50%; left: 50%; transform: translateX(-50%); width: 400px; height: 400px; background: radial-gradient(circle, rgba(180,245,60,0.1) 0%, rgba(1,29,26,0) 70%); z-index: 0;"></div>
            <div style="position: relative; z-index: 1;">
                <h3 style="font-weight: 700; margin-bottom: 0.5rem;"><i class="bi bi-search" style="color: #b4f53c;"></i> Find your perfect domain</h3>
                <p style="color: #8ea19e; margin-bottom: 1.5rem;">Search for availability and secure your digital identity today.</p>
                <form action="domainchecker.php" method="post" style="display: flex; max-width: 600px; margin: 0 auto; background: #021b18; border: 2px solid rgba(180,245,60,0.3); border-radius: 100px; padding: 0.4rem; transition: all 0.3s;" onfocusin="this.style.borderColor='#b4f53c'; this.style.boxShadow='0 0 20px rgba(180,245,60,0.15)';" onfocusout="this.style.borderColor='rgba(180,245,60,0.3)'; this.style.boxShadow='none';">
                    <input type="text" name="domain" placeholder="Enter your ideal domain name..." required style="flex: 1; background: transparent; border: none; color: #ffffff; padding: 0.8rem 1.5rem; outline: none; font-size: 1.1rem;">
                    <button type="submit" style="background: #b4f53c; color: #011d1a; border: none; border-radius: 100px; padding: 0 2rem; font-weight: 700; font-size: 1rem; cursor: pointer; transition: all 0.2s;" onmouseover="this.style.background='#9be026'; this.style.transform='scale(1.02)';" onmouseout="this.style.background='#b4f53c'; this.style.transform='none';">Search</button>
                </form>
            </div>
        </div>

        <!-- TWO COLUMN: Active Services + AI Tools / Recent Tickets -->
        <div class="two-col">
            <!-- LEFT: Active Services -->
            <div class="dark-card">
                <div class="section-header">
                    <span class="section-title"><i class="bi bi-hdd-stack"></i> Active Services</span>
                    <a href="clientarea.php?action=services" class="btn-ghost">View all</a>
                </div>
                <table class="modern-table">
                    <thead>
                        <tr><th>Product</th><th>Next Due</th><th>Status</th><th></th></tr>
                    </thead>
                    <tbody>
                        {foreach $services as $service}
                            {if $service@iteration <= 3}
                            <tr>
                                <td><strong>{$service.product}</strong><br><span style="font-size:0.7rem; color:#8ea19e;">{$service.domain}</span></td>
                                <td>{$service.nextduedate}</td>
                                <td><span class="status-badge">{$service.status}</span></td>
                                <td><a href="clientarea.php?action=productdetails&id={$service.id}" class="btn-ghost" style="padding:0.2rem 0.8rem;">Manage</a></td>
                            </tr>
                            {/if}
                        {foreachelse}
                            <tr><td colspan="4" style="text-align:center; padding:2rem;">No active services. <a href="cart.php" style="color:#b4f53c;">Order now</a></td></tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>

            <!-- RIGHT: AI Tools Quick Access -->
            <div class="dark-card">
                <div class="section-header">
                    <span class="section-title"><i class="bi bi-stars"></i> AI Tools</span>
                    <a href="index.php?m=aitools" class="btn-ghost">All tools</a>
                </div>
                <div class="ai-grid">
                    <a href="index.php?m=aitools&action=logo" class="ai-tool-item" style="text-decoration: none; color: inherit; display: flex; flex-direction: column; height: 100%;">
                        <div style="display: flex; align-items: center; gap: 0.8rem; margin-bottom: 0.8rem;">
                            <div style="background: rgba(180,245,60,0.1); width: 40px; height: 40px; border-radius: 10px; display: flex; align-items: center; justify-content: center;">
                                <i class="bi bi-palette" style="color:#b4f53c; font-size: 1.2rem;"></i>
                            </div>
                            <strong style="font-size: 1.05rem; color: #fff;">Logo Generator</strong>
                        </div>
                        <div style="font-size:0.85rem; color:#8ea19e; margin-bottom:1.2rem; flex-grow: 1;">Create professional logos instantly.</div>
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: auto; padding-top: 0.8rem; border-top: 1px solid rgba(255,255,255,0.05);">
                            <span style="font-size:0.8rem; color:#b4f53c; font-weight: 600;"><i class="bi bi-lightning-charge-fill"></i> 10 credits</span>
                            <span style="font-size:0.85rem; color:#fff; font-weight: 500;">Launch <i class="bi bi-arrow-right"></i></span>
                        </div>
                    </a>
                    <a href="index.php?m=aitools&action=name" class="ai-tool-item" style="text-decoration: none; color: inherit; display: flex; flex-direction: column; height: 100%;">
                        <div style="display: flex; align-items: center; gap: 0.8rem; margin-bottom: 0.8rem;">
                            <div style="background: rgba(180,245,60,0.1); width: 40px; height: 40px; border-radius: 10px; display: flex; align-items: center; justify-content: center;">
                                <i class="bi bi-tag" style="color:#b4f53c; font-size: 1.2rem;"></i>
                            </div>
                            <strong style="font-size: 1.05rem; color: #fff;">Business Name</strong>
                        </div>
                        <div style="font-size:0.85rem; color:#8ea19e; margin-bottom:1.2rem; flex-grow: 1;">Generate catchy brand names.</div>
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: auto; padding-top: 0.8rem; border-top: 1px solid rgba(255,255,255,0.05);">
                            <span style="font-size:0.8rem; color:#b4f53c; font-weight: 600;"><i class="bi bi-lightning-charge-fill"></i> 5 credits</span>
                            <span style="font-size:0.85rem; color:#fff; font-weight: 500;">Launch <i class="bi bi-arrow-right"></i></span>
                        </div>
                    </a>
                    <a href="index.php?m=aitools&action=branding" class="ai-tool-item" style="text-decoration: none; color: inherit; display: flex; flex-direction: column; height: 100%;">
                        <div style="display: flex; align-items: center; gap: 0.8rem; margin-bottom: 0.8rem;">
                            <div style="background: rgba(180,245,60,0.1); width: 40px; height: 40px; border-radius: 10px; display: flex; align-items: center; justify-content: center;">
                                <i class="bi bi-stars" style="color:#b4f53c; font-size: 1.2rem;"></i>
                            </div>
                            <strong style="font-size: 1.05rem; color: #fff;">Branding Kit</strong>
                        </div>
                        <div style="font-size:0.85rem; color:#8ea19e; margin-bottom:1.2rem; flex-grow: 1;">Full brand identity generation.</div>
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: auto; padding-top: 0.8rem; border-top: 1px solid rgba(255,255,255,0.05);">
                            <span style="font-size:0.8rem; color:#b4f53c; font-weight: 600;"><i class="bi bi-lightning-charge-fill"></i> 15 credits</span>
                            <span style="font-size:0.85rem; color:#fff; font-weight: 500;">Launch <i class="bi bi-arrow-right"></i></span>
                        </div>
                    </a>
                    <a href="index.php?m=aitools&action=sitebuilder" class="ai-tool-item" style="text-decoration: none; color: inherit; display: flex; flex-direction: column; height: 100%;">
                        <div style="display: flex; align-items: center; gap: 0.8rem; margin-bottom: 0.8rem;">
                            <div style="background: rgba(180,245,60,0.1); width: 40px; height: 40px; border-radius: 10px; display: flex; align-items: center; justify-content: center;">
                                <i class="bi bi-window-desktop" style="color:#b4f53c; font-size: 1.2rem;"></i>
                            </div>
                            <strong style="font-size: 1.05rem; color: #fff;">AI Site Builder</strong>
                        </div>
                        <div style="font-size:0.85rem; color:#8ea19e; margin-bottom:1.2rem; flex-grow: 1;">Build a complete website with AI.</div>
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: auto; padding-top: 0.8rem; border-top: 1px solid rgba(255,255,255,0.05);">
                            <span style="font-size:0.8rem; color:#b4f53c; font-weight: 600;"><i class="bi bi-lightning-charge-fill"></i> 50 credits</span>
                            <span style="font-size:0.85rem; color:#fff; font-weight: 500;">Launch <i class="bi bi-arrow-right"></i></span>
                        </div>
                    </a>
                    <a href="index.php?m=aitools&action=image" class="ai-tool-item" style="text-decoration: none; color: inherit; display: flex; flex-direction: column; height: 100%;">
                        <div style="display: flex; align-items: center; gap: 0.8rem; margin-bottom: 0.8rem;">
                            <div style="background: rgba(180,245,60,0.1); width: 40px; height: 40px; border-radius: 10px; display: flex; align-items: center; justify-content: center;">
                                <i class="bi bi-image" style="color:#b4f53c; font-size: 1.2rem;"></i>
                            </div>
                            <strong style="font-size: 1.05rem; color: #fff;">Image Gen</strong>
                        </div>
                        <div style="font-size:0.85rem; color:#8ea19e; margin-bottom:1.2rem; flex-grow: 1;">Generate custom stock photos.</div>
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: auto; padding-top: 0.8rem; border-top: 1px solid rgba(255,255,255,0.05);">
                            <span style="font-size:0.8rem; color:#b4f53c; font-weight: 600;"><i class="bi bi-lightning-charge-fill"></i> 5 credits</span>
                            <span style="font-size:0.85rem; color:#fff; font-weight: 500;">Launch <i class="bi bi-arrow-right"></i></span>
                        </div>
                    </a>
                </div>
                <div style="margin-top:1.5rem; background: linear-gradient(135deg, #052a26 0%, #0a423c 100%); border-radius:1.2rem; padding:1.8rem; display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap; gap:1.5rem; border: 1px solid rgba(180,245,60,0.4); box-shadow: 0 10px 30px rgba(0,0,0,0.2);">
                    <div style="display: flex; align-items: center; gap: 1rem;">
                        <div style="background: rgba(180,245,60,0.15); width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center;">
                            <i class="bi bi-lightning-charge-fill" style="color:#b4f53c; font-size: 2rem;"></i>
                        </div>
                        <div>
                            <div style="color:#8ea19e; font-size: 0.9rem; text-transform: uppercase; letter-spacing: 1px; font-weight: 600; margin-bottom: 0.2rem;">Available AI Credits</div>
                            <div style="display: flex; align-items: baseline; gap: 0.5rem;">
                                <strong style="font-size:2.5rem; color: #fff; line-height: 1;">{$ai_credits|default:'0'}</strong>
                                <span style="color: #b4f53c; font-size: 0.9rem; font-weight: 500;">Credits ready to use</span>
                            </div>
                        </div>
                    </div>
                    <a href="cart.php?a=add&pid=1" style="background:#b4f53c; color:#011d1a; border:none; border-radius: 100px; padding:0.8rem 2rem; font-weight: 800; font-size: 1.1rem; text-decoration: none; box-shadow: 0 0 20px rgba(180,245,60,0.4); transition: all 0.2s;" onmouseover="this.style.transform='scale(1.05)'; this.style.boxShadow='0 0 30px rgba(180,245,60,0.6)';" onmouseout="this.style.transform='none'; this.style.boxShadow='0 0 20px rgba(180,245,60,0.4)';">Buy More Credits</a>
                </div>
            </div>
        </div>

        <!-- RECENT TICKETS & ANNOUNCEMENTS (two more columns) -->
        <div class="two-col" style="margin-top: 0.5rem;">
            <div class="dark-card">
                <div class="section-header">
                    <span class="section-title"><i class="bi bi-chat"></i> Recent Support Tickets</span>
                    <a href="supporttickets.php" class="btn-ghost">All tickets</a>
                </div>
                <table class="modern-table">
                    <thead><tr><th>Subject</th><th>Status</th><th></th></tr></thead>
                    <tbody>
                        {foreach $tickets as $ticket}
                            {if $ticket@iteration <= 3}
                            <tr>
                                <td><a href="viewticket.php?tid={$ticket.tid}&c={$ticket.c}" style="color:white; text-decoration:none;">#{$ticket.tid} - {$ticket.subject}</a></td>
                                <td><span class="status-badge">{$ticket.status}</span></td>
                                <td><a href="viewticket.php?tid={$ticket.tid}&c={$ticket.c}" class="btn-ghost">View</a></td>
                            </tr>
                            {/if}
                        {foreachelse}
                            <tr><td colspan="3" style="text-align:center;">No open tickets</td></tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
            <div class="dark-card">
                <div class="section-header">
                    <span class="section-title"><i class="bi bi-megaphone"></i> Announcements</span>
                    <a href="announcements.php" class="btn-ghost">View all</a>
                </div>
                {foreach $announcements as $announcement}
                    {if $announcement@iteration <= 2}
                    <div style="margin-bottom:1rem; border-bottom:1px solid rgba(255,255,255,0.05); padding-bottom:0.8rem;">
                        <div style="display:flex; justify-content:space-between;"><strong>{$announcement.title}</strong> <span style="font-size:0.7rem;">{$announcement.date}</span></div>
                        <div style="font-size:0.8rem; color:#8ea19e;">{$announcement.text|truncate:100}</div>
                        <a href="announcements.php?id={$announcement.id}" style="color:#b4f53c; font-size:0.75rem;">Read more →</a>
                    </div>
                    {/if}
                {foreachelse}
                    <div>No recent announcements.</div>
                {/foreach}
            </div>
        </div>

        <!-- RECENT INVOICES (full width optional) -->
        <div class="dark-card" style="margin-top: 0;">
            <div class="section-header">
                <span class="section-title"><i class="bi bi-receipt"></i> Recent Invoices</span>
                <a href="clientarea.php?action=invoices" class="btn-ghost">All invoices</a>
            </div>
            <table class="modern-table">
                <thead><tr><th>Invoice #</th><th>Date</th><th>Total</th><th>Status</th><th></th></tr></thead>
                <tbody>
                    {foreach $invoices as $invoice}
                        {if $invoice@iteration <= 4}
                        <tr>
                            <td><a href="viewinvoice.php?id={$invoice.id}" style="color:white;">{$invoice.invoicenum}</a></td>
                            <td>{$invoice.datecreated}</td>
                            <td>{$invoice.total}</td>
                            <td><span class="status-badge" style="{if $invoice.status == 'Paid'}background:#1f5c4b; color:#b4f53c;{elseif $invoice.status == 'Unpaid'}background:#7a2e2e; color:#ff8a8a;{/if}">{$invoice.status}</span></td>
                            <td><a href="viewinvoice.php?id={$invoice.id}" class="btn-ghost">View</a></td>
                        </tr>
                        {/if}
                    {foreachelse}
                        <tr><td colspan="5" style="text-align:center;">No invoices found</td></tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    </main>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

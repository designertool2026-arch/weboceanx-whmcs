<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-width=1.0, maximum-scale=1.0, user-scalable=0">
    <title>{if isset($kbarticle.title)}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>

    <!-- Bootstrap 5 CSS & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    {$headoutput}

    <style>
        .sidebar-sticky {
            position: sticky;
            top: 100px;
            z-index: 100;
        }

        .wo-navbar.navbar-scrolled {
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            padding-top: 0.5rem;
            padding-bottom: 0.5rem;
            background-color: rgba(255, 255, 255, 0.98) !important;
        }

        body.dark-mode .wo-navbar.navbar-scrolled {
            background-color: rgba(15, 23, 42, 0.98) !important;
            box-shadow: 0 4px 12px rgba(0,0,0,0.3);
        }
        
        /* Dark Mode Styles */
        body.dark-mode {
            background-color: #0f172a;
            color: #e2e8f0;
        }
        body.dark-mode .bg-light, body.dark-mode .bg-white {
            background-color: #1e293b !important;
            color: #e2e8f0 !important;
        }
        body.dark-mode .offcanvas {
            background-color: #0f172a;
            color: #e2e8f0;
        }
        body.dark-mode .offcanvas-header {
            border-bottom-color: #1e293b;
        }
        body.dark-mode .offcanvas .dropdown-menu {
            background-color: #1e293b;
        }
        body.dark-mode .offcanvas .dropdown-item {
            color: #e2e8f0;
        }
        body.dark-mode .offcanvas .dropdown-item:hover {
            background-color: #334155;
        }
        body.dark-mode .offcanvas .btn-close {
            filter: invert(1) grayscale(100%) brightness(200%);
        }
        body.dark-mode .offcanvas .border-bottom {
            border-bottom-color: #1e293b !important;
        }
        body.dark-mode .offcanvas .bg-light {
            background-color: #1e293b !important;
        }
        body.dark-mode .text-dark, body.dark-mode .text-muted {
            color: #cbd5e1 !important;
        }
        body.dark-mode .card, body.dark-mode .accordion-item, body.dark-mode .dashboard-stat-card, body.dark-mode .table-custom {
            background-color: #1e293b !important;
            border-color: #334155 !important;
            color: #e2e8f0 !important;
        }
        body.dark-mode .table-custom th {
            background-color: #0f172a !important;
            color: #94a3b8 !important;
            border-color: #334155 !important;
        }
        body.dark-mode .table-custom td {
            border-color: #334155 !important;
            color: #e2e8f0 !important;
        }
        body.dark-mode .list-group-item {
            background-color: #1e293b !important;
            color: #e2e8f0 !important;
            border-color: #334155 !important;
        }
        body.dark-mode .list-group-item:hover {
            background-color: #334155 !important;
        }
        body.dark-mode .list-group-item.active {
            background-color: #22c55e !important;
            color: #fff !important;
        }
        body.dark-mode .btn-white {
            background-color: #1e293b !important;
            color: #e2e8f0 !important;
            border-color: #334155 !important;
        }
        body.dark-mode .btn-white:hover {
            background-color: #334155 !important;
        }
        body.dark-mode .accordion-button {
            background-color: #1e293b;
            color: #e2e8f0;
        }
        body.dark-mode .accordion-button:not(.collapsed) {
            background-color: #334155;
            color: #4ade80;
        }
        body.dark-mode .accordion-button::after {
            filter: invert(1);
        }
        body.dark-mode .wo-navbar, body.dark-mode .wo-topbar, body.dark-mode .wo-domain-bar, body.dark-mode .domain-search-section {
            background-color: #1e293b !important;
            border-color: #334155 !important;
        }
        body.dark-mode .nav-link, body.dark-mode .navbar-brand, body.dark-mode .nav-icons a {
            color: #e2e8f0 !important;
        }
        body.dark-mode .mega-menu {
            background-color: #1e293b !important;
            border-color: #334155 !important;
        }
        body.dark-mode .mega-menu-item {
            background-color: #0f172a !important;
            color: #e2e8f0 !important;
        }
        body.dark-mode .mega-menu-item:hover {
            background-color: #1e293b !important;
        }
        body.dark-mode .mega-menu-col-title {
            color: #4ade80 !important;
        }
        
        /* Cookie Banner */
        .cookie-banner {
            position: fixed;
            bottom: -100%;
            left: 0;
            right: 0;
            background: #112520;
            color: white;
            padding: 1rem 2rem;
            z-index: 9999;
            transition: bottom 0.5s ease-in-out;
            box-shadow: 0 -4px 20px rgba(0,0,0,0.15);
        }
        .cookie-banner.show {
            bottom: 0;
        }

        /* Web Oceanx Header Styles */
        :root {
            --wo-neon-green: #4ade80; /* Adjusted to match screenshot */
            --wo-text-dark: #1a1a1a;
            --wo-gray-light: #f8f9fa;
            --wo-border-color: #eaeaea;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            color: var(--wo-text-dark);
            padding-top: 0;
        }

        /* Top Bar */
        .wo-topbar {
            background-color: var(--wo-gray-light);
            border-bottom: 1px solid var(--wo-border-color);
            padding: 0.4rem 0;
            font-size: 0.8rem;
        }

        .wo-topbar .contact-info {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 1rem;
        }

        .wo-topbar a {
            color: var(--wo-text-dark);
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.4rem;
        }

        .wo-topbar a:hover {
            color: var(--wo-neon-green);
        }

        /* Main Navigation */
        .wo-navbar {
            background-color: #ffffff;
            padding: 1rem 0;
            /* Removed shadow to match screenshot */
        }

        .wo-navbar .navbar-brand {
            font-weight: 700;
            font-size: 1.4rem;
            color: var(--wo-text-dark);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .wo-navbar .nav-link {
            color: var(--wo-text-dark);
            font-weight: 500;
            font-size: 0.95rem;
            padding: 0.5rem 1.2rem !important;
            transition: color 0.2s ease;
        }

        .wo-navbar .nav-link:hover {
            color: var(--wo-neon-green);
        }

        .wo-navbar .badge-new {
            background-color: var(--wo-neon-green);
            color: #000;
            font-size: 0.65rem;
            font-weight: 600;
            padding: 0.2rem 0.5rem;
            border-radius: 12px;
            margin-left: 0.25rem;
            vertical-align: middle;
        }

        .wo-navbar .nav-icons {
            display: flex;
            align-items: center;
            gap: 1.5rem;
        }

        .wo-navbar .nav-icons a {
            color: var(--wo-text-dark);
            font-size: 1.3rem;
            transition: color 0.2s ease;
        }

        .wo-navbar .nav-icons a:hover {
            color: var(--wo-neon-green);
        }

        /* Domain Search Bar (Below Nav) */
        .wo-domain-bar {
            background-color: #e8f5e9; /* Light green matching screenshot */
            padding: 1rem 0;
        }

        .wo-domain-form {
            display: flex;
            gap: 0.5rem;
            align-items: center;
        }

        .wo-domain-input {
            flex-grow: 1;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            padding: 0.75rem 1rem;
            font-size: 0.95rem;
            color: #6b7280;
        }
        
        .wo-domain-input::placeholder {
            color: #9ca3af;
        }

        .wo-domain-btn {
            background: linear-gradient(135deg, #4ade80 0%, #22c55e 100%);
            color: #000;
            border: none;
            border-radius: 6px;
            padding: 0.75rem 2rem;
            font-weight: 600;
            font-size: 0.95rem;
            transition: opacity 0.2s ease;
        }

        .wo-domain-btn:hover {
            opacity: 0.9;
        }

        .wo-domain-promos {
            display: flex;
            gap: 0.75rem;
            align-items: center;
        }

        .wo-promo-card {
            background: white;
            border-radius: 6px;
            padding: 0.5rem 0.75rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.8rem;
        }

        .wo-promo-card .tld {
            font-weight: 800;
            font-size: 1.1rem;
        }

        .wo-promo-card .tld.com { color: #0056b3; }
        .wo-promo-card .tld.net { color: #d39e00; }
        .wo-promo-card .tld.org { color: #0056b3; }

        .wo-promo-card .details {
            line-height: 1.2;
        }

        .wo-promo-card .price {
            font-weight: 700;
            color: var(--wo-text-dark);
        }
        
        .wo-promo-card .subtext {
            font-size: 0.65rem;
            color: #6c757d;
        }

        /* Mega Menu Styles */
        .wo-navbar .nav-item.dropdown {
            position: static !important;
        }
        
        .wo-navbar .mega-menu {
            width: 100%;
            left: 0;
            right: 0;
            padding: 2rem;
            border-radius: 0 0 12px 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            border: none;
            border-top: 1px solid var(--wo-border-color);
            background-color: #ffffff;
        }

        .mega-menu-col-title {
            font-weight: 700;
            font-size: 0.9rem;
            margin-bottom: 1rem;
            color: var(--wo-text-dark);
        }

        .mega-menu-item {
            display: flex;
            align-items: flex-start;
            padding: 0.75rem;
            border-radius: 8px;
            transition: background-color 0.2s ease;
            text-decoration: none;
            color: var(--wo-text-dark);
            margin-bottom: 0.5rem;
            background-color: #f8f9fa;
            position: relative;
        }

        .mega-menu-item:hover {
            background-color: #f0fdf4; /* Light neon green */
        }

        .mega-menu-item .icon-wrapper {
            width: 40px;
            height: 40px;
            background-color: #112520;
            color: #4ade80;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            flex-shrink: 0;
            transition: transform 0.3s ease;
        }

        .mega-menu-item:hover .icon-wrapper {
            transform: scale(1.1) rotate(5deg);
        }

        .mega-menu-item .content {
            flex-grow: 1;
        }

        .mega-menu-item .title {
            font-weight: 600;
            font-size: 0.95rem;
            margin-bottom: 0.2rem;
            display: block;
        }

        .mega-menu-item .desc {
            font-size: 0.8rem;
            color: #6b7280;
            margin-bottom: 0;
            line-height: 1.3;
        }

        .mega-menu-item .arrow {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            opacity: 0;
            transition: opacity 0.2s ease, transform 0.2s ease;
            color: #112520;
        }

        .mega-menu-item:hover .arrow {
            opacity: 1;
            transform: translate(5px, -50%);
        }

        .mega-menu-banner {
            background-color: #0d3b26; /* Dark green */
            border-radius: 12px;
            padding: 2rem;
            color: white;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        .mega-menu-banner h3 {
            font-weight: 700;
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: white;
        }

        .mega-menu-banner p {
            color: #a3b8b0;
            font-size: 0.95rem;
            margin-bottom: 2rem;
        }

        .mega-menu-banner .banner-link {
            color: white;
            text-decoration: none;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: gap 0.2s ease;
        }

        .mega-menu-banner .banner-link:hover {
            gap: 0.8rem;
            color: white;
        }

        @media (min-width: 992px) {
            .wo-navbar .dropdown:hover .dropdown-menu {
                display: block;
                opacity: 1;
                visibility: visible;
                transform: translateY(0);
            }
            .wo-navbar .dropdown-menu {
                display: block;
                opacity: 0;
                visibility: hidden;
                transform: translateY(10px);
                transition: all 0.3s ease;
                margin-top: 0;
            }
        }
        
        @media (max-width: 991.98px) {
            .wo-navbar .mega-menu {
                padding: 1rem;
                box-shadow: none;
                border: none;
                border-radius: 0;
            }
            .mega-menu-banner {
                margin-top: 1rem;
            }
            .wo-domain-form {
                flex-direction: column;
                margin-bottom: 1.5rem;
            }
            .wo-domain-input, .wo-domain-btn {
                width: 100%;
            }
            .wo-domain-promos {
                flex-wrap: wrap;
                justify-content: center;
            }
            .wo-topbar .contact-info {
                justify-content: center;
            }
        }
    </style>
    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous" defer></script>
</head>
<body data-phone-cc-input="{$phoneNumberInputStyle}">

{$headeroutput}

<!-- Top Bar -->
<div class="wo-topbar d-none d-md-block">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="contact-info d-flex justify-content-end align-items-center">
                    <!-- Language Dropdown -->
                    {if $languagechangeenabled && count($locales) > 1}
                    <div class="dropdown me-3">
                        <a href="#" class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            {foreach $locales as $locale}
                                {if $locale.active}
                                    <img src="https://flagcdn.com/w20/{if $locale.language == 'english'}us{elseif $locale.language == 'spanish'}es{elseif $locale.language == 'french'}fr{elseif $locale.language == 'german'}de{else}us{/if}.png" alt="{$locale.localisedName}" width="16" class="me-1"> {$locale.localisedName}
                                {/if}
                            {/foreach}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            {foreach $locales as $locale}
                                <li><a class="dropdown-item" href="{$currentpagelinkback}language={$locale.language}">{$locale.localisedName}</a></li>
                            {/foreach}
                        </ul>
                    </div>
                    {/if}
                    <!-- Currency Dropdown -->
                    {if !$loggedin && $currencies}
                    <div class="dropdown me-3">
                        <a href="#" class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            {$activeCurrency.code} ({$activeCurrency.prefix})
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            {foreach $currencies as $currency}
                                <li><a class="dropdown-item" href="{$currentpagelinkback}currency={$currency.id}">{$currency.code} ({$currency.prefix})</a></li>
                            {/foreach}
                        </ul>
                    </div>
                    {/if}
                    <span class="text-muted me-3">|</span>
                    <!-- Phone Number -->
                    <a href="tel:+233508598832"><i class="bi bi-telephone-fill"></i> +233 50 859 8832</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Main Navbar -->
<nav class="navbar navbar-expand-lg wo-navbar sticky-top">
    <div class="container">
        <!-- Logo -->
        <a class="navbar-brand" href="{$WEB_ROOT}/index.php">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="me-2">
                <path d="M12 2L2 7L12 12L22 7L12 2Z" fill="currentColor"/>
                <path d="M2 17L12 22L22 17" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M2 12L12 17L22 12" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            Web Oceanx
        </a>

        <!-- Mobile Toggle -->
        <button class="navbar-toggler border-0 shadow-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
            <i class="bi bi-list fs-1"></i>
        </button>

        <!-- Offcanvas Navbar -->
        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header border-bottom">
                <h5 class="offcanvas-title fw-bold" id="offcanvasNavbarLabel">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="me-2 text-success">
                        <path d="M12 2L2 7L12 12L22 7L12 2Z" fill="currentColor"/>
                        <path d="M2 17L12 22L22 17" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        <path d="M2 12L12 17L22 12" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                    Web Oceanx
                </h5>
                <button type="button" class="btn-close shadow-none" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body p-0">
                <ul class="navbar-nav justify-content-end flex-grow-1">
                    <!-- Domain -->
                    <li class="nav-item dropdown px-3 py-2 border-bottom">
                        <a class="nav-link dropdown-toggle fw-bold" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Domain
                        </a>
                        <ul class="dropdown-menu border-0 shadow-none bg-light rounded-3 mt-2">
                            <li><a class="dropdown-item py-2" href="{$WEB_ROOT}/cart.php?a=add&domain=register"><i class="bi bi-globe2 me-2"></i> Register Domains</a></li>
                            <li><a class="dropdown-item py-2" href="{$WEB_ROOT}/cart.php?a=add&domain=transfer"><i class="bi bi-arrow-left-right me-2"></i> Transfer Domains</a></li>
                            <li><a class="dropdown-item py-2" href="{$WEB_ROOT}/domainchecker.php"><i class="bi bi-search me-2"></i> WHOIS Lookup</a></li>
                        </ul>
                    </li>
                    <!-- Hosting -->
                    <li class="nav-item dropdown px-3 py-2 border-bottom">
                        <a class="nav-link dropdown-toggle fw-bold" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Hosting
                        </a>
                        <ul class="dropdown-menu border-0 shadow-none bg-light rounded-3 mt-2">
                            <li><a class="dropdown-item py-2" href="{$WEB_ROOT}/store/hosting"><i class="bi bi-hdd-network me-2"></i> Web Hosting</a></li>
                            <li><a class="dropdown-item py-2" href="{$WEB_ROOT}/store/wordpress"><i class="bi bi-wordpress me-2"></i> WordPress Hosting</a></li>
                            <li><a class="dropdown-item py-2" href="{$WEB_ROOT}/store/cloud"><i class="bi bi-cloud me-2"></i> Cloud Hosting</a></li>
                        </ul>
                    </li>
                    <!-- Support -->
                    <li class="nav-item px-3 py-2 border-bottom">
                        <a class="nav-link fw-bold" href="{$WEB_ROOT}/contact.php">Support</a>
                    </li>
                    <!-- Client Area (Mobile) -->
                    {if $loggedin}
                        <li class="nav-item px-3 py-2 border-bottom bg-light">
                            <div class="d-flex align-items-center gap-2 mb-2">
                                <i class="bi bi-person-circle fs-4"></i>
                                <span class="fw-bold">{$clientsdetails.firstname}</span>
                            </div>
                            <div class="row g-2">
                                <div class="col-6"><a href="clientarea.php" class="btn btn-sm btn-outline-dark w-100">Dashboard</a></div>
                                <div class="col-6"><a href="logout.php" class="btn btn-sm btn-danger w-100">Logout</a></div>
                            </div>
                        </li>
                    {else}
                        <li class="nav-item px-3 py-4">
                            <a href="login.php" class="btn btn-neon w-100 rounded-pill py-3 fw-bold">Login / Register</a>
                        </li>
                    {/if}
                </ul>
            </div>
        </div>

        <!-- Desktop Nav Links (Hidden on mobile) -->
        <div class="collapse navbar-collapse d-none d-lg-block" id="mainNavbar">
            <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                <!-- Domain -->
                <li class="nav-item dropdown position-static">
                    <a class="nav-link dropdown-toggle" href="#" id="domainDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Domain
                    </a>
                    <div class="dropdown-menu w-100 shadow-lg border-0 rounded-4 mt-0 p-4 mega-menu" aria-labelledby="domainDropdown">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-9">
                                    <div class="row">
                                        <div class="col-md-6 mb-4 mb-md-0">
                                            <div class="mega-menu-col-title">Registration & Transfer</div>
                                            <a href="{$WEB_ROOT}/cart.php?a=add&domain=register" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-globe2"></i></div>
                                                <div class="content">
                                                    <span class="title">Register Domains</span>
                                                    <p class="desc">Find your perfect domain name</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                            <a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-arrow-left-right"></i></div>
                                                <div class="content">
                                                    <span class="title">Transfer Domains</span>
                                                    <p class="desc">Move your domain to Web Oceanx</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                            <a href="{$WEB_ROOT}/domainchecker.php" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-search"></i></div>
                                                <div class="content">
                                                    <span class="title">WHOIS Lookup</span>
                                                    <p class="desc">Check domain ownership information</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mega-menu-col-title">Security & Services</div>
                                            <a href="{$WEB_ROOT}/store/ssl" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-shield-lock"></i></div>
                                                <div class="content">
                                                    <span class="title">SSL Certificates</span>
                                                    <p class="desc">Secure your website and build trust</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                            <a href="{$WEB_ROOT}/store/domain-services" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-gear"></i></div>
                                                <div class="content">
                                                    <span class="title">Domain Services</span>
                                                    <p class="desc">Privacy protection and management</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="mega-menu-banner">
                                        <h3>Domain Sale!</h3>
                                        <p>Get .com domains for just $9.99 for the first year.</p>
                                        <a href="{$WEB_ROOT}/cart.php?a=add&domain=register" class="banner-link">Search Now <i class="bi bi-arrow-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>

                <!-- Emails -->
                <li class="nav-item dropdown position-static">
                    <a class="nav-link dropdown-toggle" href="#" id="emailDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Emails
                    </a>
                    <div class="dropdown-menu w-100 shadow-lg border-0 rounded-4 mt-0 p-4 mega-menu" aria-labelledby="emailDropdown">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-9">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mega-menu-col-title">Solutions</div>
                                            <a href="{$WEB_ROOT}/store/email" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-envelope"></i></div>
                                                <div class="content">
                                                    <span class="title">Business Emails</span>
                                                    <p class="desc">Professional email for your brand</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                            <a href="{$WEB_ROOT}/store/google-workspace" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-google"></i></div>
                                                <div class="content">
                                                    <span class="title">Google Workspace</span>
                                                    <p class="desc">Collaborate with familiar tools</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="mega-menu-banner">
                                        <h3>Professional Look</h3>
                                        <p>Upgrade your business with custom email addresses.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>

                <!-- AI Tools -->
                <li class="nav-item dropdown position-static">
                    <a class="nav-link dropdown-toggle" href="#" id="aiDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        AI Tools <span class="badge-new">New</span>
                    </a>
                    <div class="dropdown-menu w-100 shadow-lg border-0 rounded-4 mt-0 p-4 mega-menu" aria-labelledby="aiDropdown">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-9">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mega-menu-col-title">AI Generators</div>
                                            <a href="{$WEB_ROOT}/store/name-generator" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-magic"></i></div>
                                                <div class="content">
                                                    <span class="title">Business Name Generator</span>
                                                    <p class="desc">Find the perfect name for your brand</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                            <a href="{$WEB_ROOT}/store/logo-generator" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-palette"></i></div>
                                                <div class="content">
                                                    <span class="title">AI Logo Generator</span>
                                                    <p class="desc">Create a stunning logo in seconds</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                            <a href="{$WEB_ROOT}/store/site-builder" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-window-desktop"></i></div>
                                                <div class="content">
                                                    <span class="title">AI Site Builder</span>
                                                    <p class="desc">Build a website with AI assistance</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>

                <!-- Hosting -->
                <li class="nav-item dropdown position-static">
                    <a class="nav-link dropdown-toggle" href="#" id="hostingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Hosting
                    </a>
                    <div class="dropdown-menu w-100 shadow-lg border-0 rounded-4 mt-0 p-4 mega-menu" aria-labelledby="hostingDropdown">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-9">
                                    <div class="row">
                                        <div class="col-md-4 mb-4 mb-md-0">
                                            <div class="mega-menu-col-title">Web Hosting</div>
                                            <a href="{$WEB_ROOT}/store/hosting" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-hdd-network"></i></div>
                                                <div class="content">
                                                    <span class="title">Web Hosting</span>
                                                    <p class="desc">Fast and reliable shared hosting</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                            <a href="{$WEB_ROOT}/store/wordpress" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-wordpress"></i></div>
                                                <div class="content">
                                                    <span class="title">Hosting for WordPress</span>
                                                    <p class="desc">Optimized for WP performance</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                            <a href="{$WEB_ROOT}/store/woocommerce" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-cart"></i></div>
                                                <div class="content">
                                                    <span class="title">Hosting for WooCommerce</span>
                                                    <p class="desc">Built for online stores</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                        </div>
                                        <div class="col-md-4 mb-4 mb-md-0">
                                            <div class="mega-menu-col-title">Advanced Hosting</div>
                                            <a href="{$WEB_ROOT}/store/cloud" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-cloud"></i></div>
                                                <div class="content">
                                                    <span class="title">Cloud Hosting</span>
                                                    <p class="desc">Scalable cloud infrastructure</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                            <a href="{$WEB_ROOT}/store/hosting-services" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-tools"></i></div>
                                                <div class="content">
                                                    <span class="title">Hosting Services</span>
                                                    <p class="desc">Management and optimization</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="mega-menu-col-title">Pricing</div>
                                            <a href="{$WEB_ROOT}/store/hosting" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-tags"></i></div>
                                                <div class="content">
                                                    <span class="title">Pricing</span>
                                                    <p class="desc">Compare all hosting plans</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="mega-menu-banner">
                                        <h3>Need Help?</h3>
                                        <p>Our experts are here to help you choose the right plan.</p>
                                        <a href="{$WEB_ROOT}/contact.php" class="banner-link">Contact Us <i class="bi bi-arrow-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>

                <!-- Websites -->
                <li class="nav-item dropdown position-static">
                    <a class="nav-link dropdown-toggle" href="#" id="websitesDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Websites
                    </a>
                    <div class="dropdown-menu w-100 shadow-lg border-0 rounded-4 mt-0 p-4 mega-menu" aria-labelledby="websitesDropdown">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-9">
                                    <div class="row">
                                        <div class="col-md-6 mb-4 mb-md-0">
                                            <div class="mega-menu-col-title">Services</div>
                                            <a href="{$WEB_ROOT}/store/website-services" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-laptop"></i></div>
                                                <div class="content">
                                                    <span class="title">Website Services</span>
                                                    <p class="desc">Design and development solutions</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                            <a href="{$WEB_ROOT}/portfolio" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-images"></i></div>
                                                <div class="content">
                                                    <span class="title">Portfolio</span>
                                                    <p class="desc">Check out our latest work</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                            <a href="{$WEB_ROOT}/store/migration" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-arrow-repeat"></i></div>
                                                <div class="content">
                                                    <span class="title">Website Migration</span>
                                                    <p class="desc">Free expert migration service</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mega-menu-col-title">Resources</div>
                                            <a href="{$WEB_ROOT}/hire-expert" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-person-badge"></i></div>
                                                <div class="content">
                                                    <span class="title">Hire an Expert</span>
                                                    <p class="desc">Get professional help for your site</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                            <a href="{$WEB_ROOT}/website-resources" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-book"></i></div>
                                                <div class="content">
                                                    <span class="title">Website Resources</span>
                                                    <p class="desc">Tools and guides for success</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>

                <!-- Support -->
                <li class="nav-item dropdown position-static">
                    <a class="nav-link dropdown-toggle" href="#" id="supportDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Support
                    </a>
                    <div class="dropdown-menu w-100 shadow-lg border-0 rounded-4 mt-0 p-4 mega-menu" aria-labelledby="supportDropdown">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-9">
                                    <div class="row">
                                        <div class="col-md-4 mb-4 mb-md-0">
                                            <div class="mega-menu-col-title">Help Center</div>
                                            <a href="{$WEB_ROOT}/knowledgebase" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-info-circle"></i></div>
                                                <div class="content">
                                                    <span class="title">Knowledge Base</span>
                                                    <p class="desc">Find answers to common questions</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                            <a href="{$WEB_ROOT}/video-tutorials" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-play-btn"></i></div>
                                                <div class="content">
                                                    <span class="title">Video Tutorials</span>
                                                    <p class="desc">Step-by-step video guides</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                            <a href="{$WEB_ROOT}/blog" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-journal-text"></i></div>
                                                <div class="content">
                                                    <span class="title">Blog</span>
                                                    <p class="desc">Latest news and insights</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                        </div>
                                        <div class="col-md-4 mb-4 mb-md-0">
                                            <div class="mega-menu-col-title">Contact</div>
                                            <a href="{$WEB_ROOT}/contact.php" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-telephone"></i></div>
                                                <div class="content">
                                                    <span class="title">Contact Us</span>
                                                    <p class="desc">Get in touch with our team</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                            <a href="{$WEB_ROOT}/serverstatus.php" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-activity"></i></div>
                                                <div class="content">
                                                    <span class="title">Service Status</span>
                                                    <p class="desc">Check our network status</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="mega-menu-col-title">Social</div>
                                            <a href="#" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-share"></i></div>
                                                <div class="content">
                                                    <span class="title">Social Media Feeds</span>
                                                    <p class="desc">Follow us for updates</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>

                <!-- Company -->
                <li class="nav-item dropdown position-static">
                    <a class="nav-link dropdown-toggle" href="#" id="companyDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Company
                    </a>
                    <div class="dropdown-menu w-100 shadow-lg border-0 rounded-4 mt-0 p-4 mega-menu" aria-labelledby="companyDropdown">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-9">
                                    <div class="row">
                                        <div class="col-md-4 mb-4 mb-md-0">
                                            <div class="mega-menu-col-title">About</div>
                                            <a href="{$WEB_ROOT}/about" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-people"></i></div>
                                                <div class="content">
                                                    <span class="title">About Us</span>
                                                    <p class="desc">Learn more about Web Oceanx</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                            <a href="{$WEB_ROOT}/payment-gateway" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-credit-card"></i></div>
                                                <div class="content">
                                                    <span class="title">Payment Gateway</span>
                                                    <p class="desc">Secure payment options</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                            <a href="{$WEB_ROOT}/affiliates.php" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-diagram-3"></i></div>
                                                <div class="content">
                                                    <span class="title">Affiliate Program</span>
                                                    <p class="desc">Earn with Web Oceanx</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                        </div>
                                        <div class="col-md-4 mb-4 mb-md-0">
                                            <div class="mega-menu-col-title">Partners</div>
                                            <a href="{$WEB_ROOT}/partners" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-handshake"></i></div>
                                                <div class="content">
                                                    <span class="title">Partners</span>
                                                    <p class="desc">Our global network</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                            <a href="{$WEB_ROOT}/marketplace" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-shop"></i></div>
                                                <div class="content">
                                                    <span class="title">Global Marketplace</span>
                                                    <p class="desc">Discover more services</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="mega-menu-col-title">Other</div>
                                            <a href="{$WEB_ROOT}/sitemap" class="mega-menu-item">
                                                <div class="icon-wrapper"><i class="bi bi-map"></i></div>
                                                <div class="content">
                                                    <span class="title">Sitemap</span>
                                                    <p class="desc">Navigate our website</p>
                                                </div>
                                                <i class="bi bi-arrow-right arrow"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>

            <!-- Right Icons (Cart & Login) -->
            <div class="nav-icons d-flex align-items-center mt-3 mt-lg-0">
                <a href="#" id="darkModeToggle" title="Toggle Dark Mode" class="me-3 d-flex align-items-center gap-2 text-decoration-none">
                    <i class="bi bi-moon-stars"></i>
                    <span class="d-lg-none small fw-bold">Toggle Dark Mode</span>
                </a>
                <a href="{$WEB_ROOT}/cart.php?a=view" title="{$LANG.viewcart}" class="position-relative">
                    <i class="bi bi-cart3"></i>
                    {if isset($cartitemcount) && $cartitemcount > 0}
                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="font-size: 0.5rem;">
                            {$cartitemcount}
                        </span>
                    {/if}
                </a>
                {if $loggedin}
                <div class="dropdown ms-4">
                    <a href="#" class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" style="color: inherit; text-decoration: none;">
                        <i class="bi bi-person-circle" style="font-size: 1.3rem;"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end shadow border-0 rounded-3 mt-2">
                        <li><div class="dropdown-header fw-bold text-dark">Welcome, {$clientsdetails.firstname}</div></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item py-2" href="clientarea.php"><i class="bi bi-speedometer2 me-2"></i> Dashboard</a></li>
                        <li><a class="dropdown-item py-2" href="clientarea.php?action=products"><i class="bi bi-hdd-network me-2"></i> Services</a></li>
                        <li><a class="dropdown-item py-2" href="clientarea.php?action=domains"><i class="bi bi-globe me-2"></i> Domains</a></li>
                        <li><a class="dropdown-item py-2" href="supporttickets.php"><i class="bi bi-ticket-detailed me-2"></i> Tickets</a></li>
                        <li><a class="dropdown-item py-2" href="clientarea.php?action=invoices"><i class="bi bi-receipt me-2"></i> Billing</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item py-2 text-danger" href="logout.php"><i class="bi bi-box-arrow-right me-2"></i> Logout</a></li>
                    </ul>
                </div>
                {else}
                <a href="{$WEB_ROOT}/clientarea.php" title="{$LANG.clientareatitle}" class="ms-4">
                    <i class="bi bi-person-circle"></i>
                </a>
                {/if}
            </div>
        </div>
    </div>
</nav>

<!-- Domain Search Bar Section -->
{if $templatefile == 'homepage' || $templatefile == 'domainchecker' || $templatefile == 'domainregister' || $templatefile == 'domaintransfer'}
<div class="domain-search-section py-3" style="background-color: #eef8f0; border-bottom: 1px solid rgba(0,0,0,0.05);">
    <div class="container">
        <div class="d-flex flex-column flex-lg-row align-items-center gap-3">
            <!-- Search Input -->
            <form method="post" action="{$WEB_ROOT}/cart.php?a=add&domain=register" class="d-flex flex-grow-1 w-100 position-relative" style="max-width: 600px;">
                <input type="hidden" name="token" value="{$token}" />
                <input type="text" name="query" id="domainSearchInput" class="form-control form-control-lg border-0 shadow-sm" placeholder="Search for your domain here" style="border-radius: 8px 0 0 8px;" autocomplete="off">
                <button type="submit" class="btn btn-lg px-4 fw-bold shadow-sm" style="background: linear-gradient(135deg, #4ade80 0%, #22c55e 100%); color: #000; border-radius: 0 8px 8px 0; border: none;">Search</button>
                
                <!-- TLD Suggestions Dropdown -->
                <div id="headerTldSuggestions" class="position-absolute w-100 bg-white shadow rounded mt-1 d-none" style="top: 100%; z-index: 1000; max-height: 250px; overflow-y: auto; border: 1px solid #eee;">
                    <ul class="list-group list-group-flush" id="headerTldSuggestionsList">
                        <!-- Suggestions will be populated here by JS -->
                    </ul>
                </div>
            </form>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const input = document.getElementById('domainSearchInput');
    const suggestions = document.getElementById('headerTldSuggestions');
    const list = document.getElementById('headerTldSuggestionsList');
    const tlds = ['.com', '.net', '.org', '.io', '.co', '.info', '.me', '.biz'];
    
    if (input && suggestions && list) {
        input.addEventListener('input', function() {
            const val = this.value.trim();
            if (val.length > 2) {
                suggestions.classList.remove('d-none');
                let html = '';
                const domainName = val.split('.')[0];
                tlds.forEach((tld, index) => {
                    const isPremium = index % 3 === 0; // Mock premium status
                    html += `<li class="list-group-item list-group-item-action py-2 px-3 cursor-pointer header-suggestion-item d-flex justify-content-between align-items-center" data-domain="${domainName}${tld}">
                                <div>
                                    <i class="bi bi-search me-2 text-muted"></i> ${domainName}<span class="text-success fw-bold">${tld}</span>
                                </div>
                                ${isPremium ? '<span class="badge bg-warning text-dark small" style="font-size: 0.6rem;">Premium</span>' : ''}
                             </li>`;
                });
                list.innerHTML = html;
                
                document.querySelectorAll('.header-suggestion-item').forEach(item => {
                    item.addEventListener('click', function() {
                        input.value = this.getAttribute('data-domain');
                        suggestions.classList.add('d-none');
                    });
                });
            } else {
                suggestions.classList.add('d-none');
            }
        });

        document.addEventListener('click', function(e) {
            if (!input.contains(e.target) && !suggestions.contains(e.target)) {
                suggestions.classList.add('d-none');
            }
        });
    }
});
</script>

            <!-- Promo Cards -->
            <div class="d-flex flex-wrap gap-2 justify-content-center flex-grow-1 align-items-center">
                <div class="domain-promo-card bg-white shadow-sm rounded px-3 py-2 d-flex align-items-center gap-2 border border-success border-opacity-25 position-relative">
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="font-size: 0.6rem;">Hot</span>
                    <span class="fw-bold fs-5 text-primary">.com</span>
                    <div class="lh-sm">
                        <div class="fw-bold text-success">Free / 1<sup style="font-size: 0.6em;">st</sup> year</div>
                        <div class="text-muted" style="font-size: 0.75rem;">2-year purchase required</div>
                    </div>
                </div>
                <div class="domain-promo-card bg-white shadow-sm rounded px-3 py-2 d-flex align-items-center gap-2 border border-success border-opacity-25">
                    <span class="fw-bold fs-5 text-dark"><span class="text-warning">.</span>net</span>
                    <div class="lh-sm">
                        <div class="fw-bold text-success">Free / 1<sup style="font-size: 0.6em;">st</sup> year</div>
                        <div class="text-muted" style="font-size: 0.75rem;">2-year purchase required</div>
                    </div>
                </div>
                <div class="domain-promo-card bg-white shadow-sm rounded px-3 py-2 d-flex align-items-center gap-2">
                    <span class="fw-bold fs-5 text-primary" style="background: #005198; color: white !important; border-radius: 4px; padding: 0 4px;">.org</span>
                    <div class="lh-sm">
                        <div class="fw-bold text-dark">$9.99</div>
                        <div class="text-muted" style="font-size: 0.75rem;">for the 1<sup style="font-size: 0.6em;">st</sup> year</div>
                    </div>
                </div>
                <a href="{$WEB_ROOT}/domainchecker.php" class="text-decoration-none text-success fw-bold ms-2 d-flex align-items-center gap-1" style="transition: transform 0.2s;" onmouseover="this.style.transform='translateX(3px)'" onmouseout="this.style.transform='translateX(0)'">
                    More TLDs <i class="bi bi-arrow-right"></i>
                </a>
            </div>
        </div>
    </div>
</div>
{/if}

<!-- Cookie Banner -->
<div id="cookieBanner" class="cookie-banner d-flex justify-content-between align-items-center flex-wrap gap-3">
    <div>
        <strong>We value your privacy</strong><br>
        We use cookies to enhance your browsing experience and analyze our traffic. By clicking "Accept", you consent to our use of cookies.
    </div>
    <div class="d-flex gap-2">
        <button id="declineCookies" class="btn btn-outline-light btn-sm">Decline</button>
        <button id="acceptCookies" class="btn btn-sm text-dark fw-bold" style="background-color: var(--wo-neon-green);">Accept</button>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', () => {
    // Dark Mode Toggle
    const darkModeToggle = document.getElementById('darkModeToggle');
    if(darkModeToggle) {
        const icon = darkModeToggle.querySelector('i');
        const isDark = localStorage.getItem('darkMode') === 'true';
        if (isDark) {
            document.body.classList.add('dark-mode');
            icon.classList.replace('bi-moon-stars', 'bi-sun');
        }
        darkModeToggle.addEventListener('click', (e) => {
            e.preventDefault();
            document.body.classList.toggle('dark-mode');
            const isNowDark = document.body.classList.contains('dark-mode');
            localStorage.setItem('darkMode', isNowDark);
            if (isNowDark) {
                icon.classList.replace('bi-moon-stars', 'bi-sun');
            } else {
                icon.classList.replace('bi-sun', 'bi-moon-stars');
            }
        });
    }

    // Cookie Banner
    const cookieBanner = document.getElementById('cookieBanner');
    if (cookieBanner && !localStorage.getItem('cookieConsent')) {
        setTimeout(() => cookieBanner.classList.add('show'), 1000);
    }
    const acceptBtn = document.getElementById('acceptCookies');
    if(acceptBtn) {
        acceptBtn.addEventListener('click', () => {
            localStorage.setItem('cookieConsent', 'accepted');
            cookieBanner.classList.remove('show');
        });
    }
    const declineBtn = document.getElementById('declineCookies');
    if(declineBtn) {
        declineBtn.addEventListener('click', () => {
            localStorage.setItem('cookieConsent', 'declined');
            cookieBanner.classList.remove('show');
        });
    }
});
</script>

{if $templatefile != 'homepage'}
<section id="main-body" class="py-5">
    <div class="container">
        <div class="row">
            {if $loggedin && $templatefile != 'login' && $templatefile != 'register' && $templatefile != 'passwordreset'}
            <div class="col-lg-3 d-none d-lg-block">
                <div class="sidebar-sticky">
                    <div class="card border-0 shadow-sm rounded-4 mb-4 overflow-hidden">
                        <div class="card-body p-0">
                            <div class="list-group list-group-flush">
                                <a href="clientarea.php" class="list-group-item list-group-item-action border-0 py-3 px-4 {if $templatefile == 'clientareahome'}active bg-success text-white{/if}">
                                    <i class="bi bi-speedometer2 me-2"></i> Dashboard
                                </a>
                                <a href="clientarea.php?action=products" class="list-group-item list-group-item-action border-0 py-3 px-4 {if $templatefile == 'clientareaproducts'}active bg-success text-white{/if}">
                                    <i class="bi bi-hdd-network me-2"></i> Services
                                </a>
                                <a href="clientarea.php?action=domains" class="list-group-item list-group-item-action border-0 py-3 px-4 {if $templatefile == 'clientareadomains'}active bg-success text-white{/if}">
                                    <i class="bi bi-globe me-2"></i> Domains
                                </a>
                                <a href="supporttickets.php" class="list-group-item list-group-item-action border-0 py-3 px-4 {if $templatefile == 'supportticketslist'}active bg-success text-white{/if}">
                                    <i class="bi bi-ticket-detailed me-2"></i> Tickets
                                </a>
                                <a href="clientarea.php?action=invoices" class="list-group-item list-group-item-action border-0 py-3 px-4 {if $templatefile == 'clientareainvoices'}active bg-success text-white{/if}">
                                    <i class="bi bi-receipt me-2"></i> Billing
                                </a>
                                <a href="clientarea.php?action=details" class="list-group-item list-group-item-action border-0 py-3 px-4 {if $templatefile == 'clientarea'}active bg-success text-white{/if}">
                                    <i class="bi bi-person me-2"></i> My Details
                                </a>
                                <a href="logout.php" class="list-group-item list-group-item-action border-0 py-3 px-4 text-danger">
                                    <i class="bi bi-box-arrow-right me-2"></i> Logout
                                </a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="card border-0 shadow-sm rounded-4 mb-4 bg-success text-white">
                        <div class="card-body p-4">
                            <h6 class="fw-bold mb-2">Need Help?</h6>
                            <p class="small mb-3 opacity-75">Our support team is available 24/7 to assist you.</p>
                            <a href="submitticket.php" class="btn btn-light btn-sm w-100 rounded-pill fw-bold">Contact Support</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9">
            {else}
            <div class="col-12">
            {/if}
{/if}

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <title>Register Domain Name - {$companyname}</title>
    
    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* ---------- RESET & HIDE WHMCS DEFAULTS ---------- */
        #header, #footer, .header-lined, .breadcrumb-wrapper, .navbar,
        footer, .topbar, .main-header, .page-header, .whmcs-header,
        .whmcs-footer, .global-header, .global-footer, #main-body {
            display: none !important;
        }

        body, html {
            margin: 0 !important;
            padding: 0 !important;
            font-family: 'Inter', sans-serif;
            color: #0f172a;
            background-color: #ffffff;
            overflow-x: hidden;
        }

        /* ---------- VARIABLES ---------- */
        :root {
            --primary-dark: #0a1915;
            --primary-green: #22c55e;
            --light-green: #86efac;
            --text-dark: #0f172a;
            --text-muted: #64748b;
            --bg-light: #f8fafc;
            --border-color: #e2e8f0;
        }

        /* ---------- CUSTOM HEADER ---------- */
        .custom-header {
            background: #ffffff;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid var(--border-color);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .header-brand {
            font-size: 1.5rem;
            font-weight: 800;
            color: var(--text-dark);
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .header-nav {
            display: flex;
            gap: 2rem;
        }

        .header-nav a {
            color: var(--text-dark);
            text-decoration: none;
            font-weight: 500;
            font-size: 0.95rem;
            transition: color 0.2s;
        }

        .header-nav a:hover {
            color: var(--primary-green);
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 1.5rem;
        }

        .header-actions i {
            font-size: 1.2rem;
            color: var(--text-dark);
            cursor: pointer;
        }

        /* ---------- HERO SECTION ---------- */
        .hero-section {
            background: linear-gradient(135deg, #0d2b26 0%, #1a5c4f 100%);
            padding: 6rem 2rem;
            color: #ffffff;
            position: relative;
            overflow: hidden;
        }

        .hero-content {
            max-width: 600px;
            position: relative;
            z-index: 2;
        }

        .hero-title {
            font-size: 3.5rem;
            font-weight: 800;
            line-height: 1.1;
            margin-bottom: 1.5rem;
        }

        .hero-subtitle {
            font-size: 1.1rem;
            opacity: 0.9;
            margin-bottom: 2.5rem;
            line-height: 1.6;
        }

        .domain-search-box {
            display: flex;
            background: #ffffff;
            padding: 0.5rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
        }

        .domain-search-box input {
            flex: 1;
            border: none;
            padding: 1rem 1.5rem;
            font-size: 1.1rem;
            outline: none;
            color: var(--text-dark);
            background: transparent;
        }

        .domain-search-box button {
            background: var(--primary-green);
            color: #ffffff;
            border: none;
            padding: 0 2rem;
            border-radius: 6px;
            font-weight: 600;
            font-size: 1.1rem;
            cursor: pointer;
            transition: background 0.2s;
        }

        .domain-search-box button:hover {
            background: #16a34a;
        }

        .tld-badges {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
            flex-wrap: wrap;
        }

        .tld-badge {
            background: #ffffff;
            color: var(--text-dark);
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-size: 0.85rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .hero-features {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .hero-features li {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 0.75rem;
            font-size: 0.95rem;
            opacity: 0.9;
        }

        .hero-features i {
            color: var(--primary-green);
        }

        .hero-images {
            position: absolute;
            right: 5%;
            top: 50%;
            transform: translateY(-50%);
            width: 45%;
            z-index: 1;
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .hero-img-main {
            width: 100%;
            border-radius: 16px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.3);
        }

        .hero-floating-card {
            background: #0a1915;
            border: 1px solid rgba(255,255,255,0.1);
            padding: 1.5rem;
            border-radius: 12px;
            width: 80%;
            align-self: flex-end;
            margin-top: -3rem;
            position: relative;
            z-index: 2;
            box-shadow: 0 10px 30px rgba(0,0,0,0.4);
        }

        /* ---------- TLD GRID SECTION ---------- */
        .section-padding {
            padding: 6rem 2rem;
        }

        .section-header {
            text-align: center;
            margin-bottom: 4rem;
        }

        .section-header h2 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .section-header p {
            color: var(--text-muted);
            font-size: 1.1rem;
            max-width: 600px;
            margin: 0 auto;
        }

        .tld-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 0;
            border: 1px solid var(--border-color);
            border-radius: 16px;
            overflow: hidden;
            max-width: 1200px;
            margin: 0 auto;
        }

        .tld-card {
            padding: 3rem 2rem;
            text-align: center;
            border-right: 1px solid var(--border-color);
            border-bottom: 1px solid var(--border-color);
            background: #ffffff;
        }

        .tld-card:nth-child(3n) { border-right: none; }
        .tld-card:nth-last-child(-n+3) { border-bottom: none; }

        .tld-ext {
            font-size: 4rem;
            font-weight: 800;
            letter-spacing: -2px;
            margin-bottom: 1rem;
            color: var(--text-dark);
        }

        .tld-ext.blue { color: #2563eb; }
        .tld-ext.orange { color: #ea580c; }
        .tld-ext.dark { color: #0f172a; }

        .tld-price {
            font-size: 1.5rem;
            font-weight: 700;
            margin: 1rem 0;
        }

        .btn-light-green {
            background: var(--light-green);
            color: #064e3b;
            border: none;
            padding: 0.6rem 1.5rem;
            border-radius: 6px;
            font-weight: 600;
            text-decoration: none;
            display: inline-block;
            transition: background 0.2s;
        }

        .btn-light-green:hover {
            background: #4ade80;
        }

        /* ---------- FEATURES SLIDER ---------- */
        .bg-light-section {
            background-color: var(--bg-light);
        }

        .features-slider {
            display: flex;
            gap: 1.5rem;
            overflow-x: auto;
            padding-bottom: 2rem;
            scrollbar-width: none; /* Firefox */
        }
        .features-slider::-webkit-scrollbar { display: none; } /* Chrome */

        .feature-card {
            min-width: 300px;
            background: #ffffff;
            padding: 2rem;
            border-radius: 16px;
            border: 1px solid var(--border-color);
            flex: 0 0 auto;
        }

        .feature-icon {
            width: 48px;
            height: 48px;
            background: var(--light-green);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: #064e3b;
            margin-bottom: 1.5rem;
        }

        .feature-card h4 {
            font-size: 1.2rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .feature-card p {
            color: var(--text-muted);
            font-size: 0.95rem;
            line-height: 1.6;
            margin: 0;
        }

        /* ---------- PROMO SPLIT SECTION ---------- */
        .promo-split {
            display: flex;
            align-items: center;
            gap: 4rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .promo-image {
            flex: 1;
            position: relative;
        }

        .promo-image img {
            width: 100%;
            border-radius: 16px;
        }

        .promo-floating-badge {
            position: absolute;
            bottom: -20px;
            right: -20px;
            background: #0a1915;
            color: white;
            padding: 1.5rem;
            border-radius: 12px;
            display: flex;
            align-items: center;
            gap: 1rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        .promo-text {
            flex: 1;
        }

        .promo-text h2 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
        }

        .promo-text p {
            color: var(--text-muted);
            font-size: 1.1rem;
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        /* ---------- DARK SECTIONS (Addons & Testimonials) ---------- */
        .bg-dark-section {
            background-color: var(--primary-dark);
            color: #ffffff;
        }

        .bg-dark-section .section-header p {
            color: #94a3b8;
        }

        .addon-card {
            background: #0d2b26;
            border-radius: 16px;
            padding: 2.5rem;
            height: 100%;
            display: flex;
            flex-direction: column;
            border: 1px solid rgba(255,255,255,0.05);
        }

        .addon-card h3 {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .addon-card p {
            color: #cbd5e1;
            line-height: 1.6;
            flex-grow: 1;
            margin-bottom: 2rem;
        }

        .testimonial-card {
            background: #0d2b26;
            border-radius: 12px;
            padding: 2rem;
            border: 1px solid rgba(255,255,255,0.05);
        }

        .stars {
            color: var(--primary-green);
            margin-bottom: 1rem;
            font-size: 1.2rem;
        }

        /* ---------- FAQ SECTION ---------- */
        .faq-container {
            max-width: 1000px;
            margin: 0 auto;
            display: flex;
            gap: 4rem;
        }

        .faq-title {
            flex: 0 0 300px;
        }

        .faq-title h2 {
            font-size: 2.5rem;
            font-weight: 700;
        }

        .faq-list {
            flex: 1;
        }

        .accordion-item {
            border: none;
            border-bottom: 1px solid var(--border-color);
            background: transparent;
        }

        .accordion-button {
            background: transparent !important;
            color: var(--text-dark) !important;
            font-weight: 600;
            font-size: 1.1rem;
            padding: 1.5rem 0;
            box-shadow: none !important;
        }

        .accordion-button::after {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-plus' viewBox='0 0 16 16'%3E%3Cpath d='M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z'/%3E%3C/svg%3E");
            transition: all 0.3s;
        }

        .accordion-button:not(.collapsed)::after {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-dash' viewBox='0 0 16 16'%3E%3Cpath d='M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z'/%3E%3C/svg%3E");
            transform: rotate(180deg);
        }

        .accordion-body {
            padding: 0 0 1.5rem 0;
            color: var(--text-muted);
            line-height: 1.6;
        }

        /* ---------- CUSTOM FOOTER ---------- */
        .custom-footer {
            background: var(--primary-dark);
            color: #ffffff;
            padding: 5rem 2rem 2rem;
        }

        .footer-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 2rem;
            max-width: 1200px;
            margin: 0 auto 4rem;
        }

        .footer-col h5 {
            font-size: 1rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
        }

        .footer-col ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .footer-col ul li {
            margin-bottom: 0.8rem;
        }

        .footer-col ul a {
            color: #94a3b8;
            text-decoration: none;
            font-size: 0.9rem;
            transition: color 0.2s;
        }

        .footer-col ul a:hover {
            color: #ffffff;
        }

        .footer-bottom {
            max-width: 1200px;
            margin: 0 auto;
            padding-top: 2rem;
            border-top: 1px solid rgba(255,255,255,0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .footer-brand {
            font-size: 1.5rem;
            font-weight: 800;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .footer-social {
            display: flex;
            gap: 1rem;
        }

        .footer-social a {
            color: #ffffff;
            font-size: 1.2rem;
            opacity: 0.8;
            transition: opacity 0.2s;
        }

        .footer-social a:hover {
            opacity: 1;
        }

        .footer-legal {
            font-size: 0.85rem;
            color: #64748b;
        }

        .footer-legal a {
            color: #64748b;
            text-decoration: none;
            margin-left: 1rem;
        }

        /* Responsive Adjustments */
        @media (max-width: 991px) {
            .hero-images { display: none; }
            .hero-content { max-width: 100%; }
            .promo-split { flex-direction: column; }
            .faq-container { flex-direction: column; gap: 2rem; }
            .faq-title { flex: none; }
            .header-nav { display: none; } /* Simple mobile handling */
        }
    </style>
</head>
<body>

    <!-- CUSTOM HEADER -->
    <header class="custom-header">
        <a href="index.php" class="header-brand">
            <i class="bi bi-hexagon-fill" style="color: var(--primary-green);"></i> {$companyname}
        </a>
        <nav class="header-nav">
            <a href="cart.php">Hosting & Servers</a>
            <a href="index.php?m=aitools">AI Application Hosting <span class="badge bg-success rounded-pill ms-1" style="font-size:0.6rem;">New</span></a>
            <a href="cart.php?gid=wordpress">WordPress</a>
            <a href="clientarea.php?action=services">Services</a>
            <a href="knowledgebase.php">Resources</a>
        </nav>
        <div class="header-actions">
            <a href="cart.php" class="text-dark"><i class="bi bi-cart2"></i></a>
            <a href="clientarea.php" class="text-dark"><i class="bi bi-person-circle"></i></a>
        </div>
    </header>

    <!-- HERO SECTION -->
    <section class="hero-section">
        <div class="container position-relative">
            <div class="hero-content">
                <h1 class="hero-title">Find your domain.<br>Make it yours.</h1>
                <p class="hero-subtitle">Whether you're starting fresh or scaling up, the right domain helps people find you, trust you, and remember you.</p>
                
                <form action="domainchecker.php" method="post" class="domain-search-box shadow-lg">
                    <input type="text" name="domain" placeholder="Search for your domain now" required>
                    <button type="submit">Search</button>
                </form>

                <div class="tld-badges">
                    <div class="tld-badge">
                        <span style="color: #2563eb; font-weight: 800; font-size: 1.1rem;">.com</span>
                        <div style="line-height: 1.1;">
                            <div style="font-size: 0.7rem; color: var(--text-muted);">Free / 1st year</div>
                            <div style="font-size: 0.6rem; color: var(--text-muted);">With 1yr plan</div>
                        </div>
                    </div>
                    <div class="tld-badge">
                        <span style="color: #0f172a; font-weight: 800; font-size: 1.1rem;">.net</span>
                        <div style="line-height: 1.1;">
                            <div style="font-size: 0.7rem; color: var(--text-muted);">Free / 1st year</div>
                            <div style="font-size: 0.6rem; color: var(--text-muted);">With 1yr plan</div>
                        </div>
                    </div>
                    <div class="tld-badge">
                        <span style="color: #ea580c; font-weight: 800; font-size: 1.1rem;">.org</span>
                        <div style="line-height: 1.1;">
                            <div style="font-size: 0.7rem; color: var(--text-muted);">$9.99</div>
                            <div style="font-size: 0.6rem; color: var(--text-muted);">For the 1st year</div>
                        </div>
                    </div>
                </div>

                <ul class="hero-features">
                    <li><i class="bi bi-check-circle-fill"></i> Get a free .com domain for a year with annual shared hosting plans.</li>
                    <li><i class="bi bi-check-circle-fill"></i> Keep your personal info private on eligible domains.</li>
                    <li><i class="bi bi-check-circle-fill"></i> Control your DNS settings with zero added cost.</li>
                    <li><i class="bi bi-check-circle-fill"></i> 24/7 support.</li>
                    <li><i class="bi bi-check-circle-fill"></i> Join the 700,000+ who rely on {$companyname}.</li>
                </ul>
            </div>

            <div class="hero-images">
                <img src="https://images.unsplash.com/photo-1522071820081-009f0129c71c?auto=format&fit=crop&w=800&q=80" alt="User working" class="hero-img-main">
                <div class="hero-floating-card">
                    <div class="d-flex align-items-center gap-3">
                        <div style="background: rgba(34, 197, 94, 0.2); padding: 0.8rem; border-radius: 8px;">
                            <i class="bi bi-shield-check text-success fs-4"></i>
                        </div>
                        <div>
                            <h5 class="m-0 fw-bold">Domain theft protection</h5>
                            <small class="text-muted">Included standard</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- TLD GRID SECTION -->
    <section class="section-padding">
        <div class="container">
            <div class="section-header">
                <h2>Pick your perfect match</h2>
                <p>Hundreds of domain extensions, ready to claim. Go classic with a .com or get creative with something that stands out.</p>
            </div>

            <div class="tld-grid">
                <div class="tld-card">
                    <div class="tld-ext blue">.com</div>
                    <div class="text-muted fw-medium">.com</div>
                    <div class="tld-price">Free for 1 year*</div>
                    <a href="domainchecker.php" class="btn-light-green">Check availability</a>
                </div>
                <div class="tld-card">
                    <div class="tld-ext orange">.org</div>
                    <div class="text-muted fw-medium">.org</div>
                    <div class="tld-price">$22.99</div>
                    <a href="domainchecker.php" class="btn-light-green">Check availability</a>
                </div>
                <div class="tld-card">
                    <div class="tld-ext dark">.net</div>
                    <div class="text-muted fw-medium">.net</div>
                    <div class="tld-price">$24.99</div>
                    <a href="domainchecker.php" class="btn-light-green">Check availability</a>
                </div>
                <div class="tld-card">
                    <div class="tld-ext blue" style="font-size: 3.5rem;">.info</div>
                    <div class="text-muted fw-medium">.info</div>
                    <div class="tld-price">$5.99 for 1 year</div>
                    <a href="domainchecker.php" class="btn-light-green">Check availability</a>
                </div>
                <div class="tld-card">
                    <div class="tld-ext dark" style="font-size: 3.5rem;">.us</div>
                    <div class="text-muted fw-medium">.us</div>
                    <div class="tld-price">$6.99 for 1 year</div>
                    <a href="domainchecker.php" class="btn-light-green">Check availability</a>
                </div>
                <div class="tld-card">
                    <div class="tld-ext orange" style="font-size: 3.5rem;">.co</div>
                    <div class="text-muted fw-medium">.co</div>
                    <div class="tld-price">$21.99</div>
                    <a href="domainchecker.php" class="btn-light-green">Check availability</a>
                </div>
            </div>
        </div>
    </section>

    <!-- FEATURES SLIDER SECTION -->
    <section class="section-padding bg-light-section">
        <div class="container">
            <div class="d-flex justify-content-between align-items-end mb-5">
                <div style="max-width: 500px;">
                    <h2 class="fw-bold mb-3">Domain features that work for you</h2>
                    <p class="text-muted m-0">Every domain comes packed with features that make getting online quick, secure, and flexible.</p>
                </div>
                <div class="d-none d-md-flex gap-2">
                    <button class="btn btn-outline-dark rounded-circle p-2"><i class="bi bi-arrow-left"></i></button>
                    <button class="btn btn-outline-dark rounded-circle p-2"><i class="bi bi-arrow-right"></i></button>
                </div>
            </div>

            <div class="features-slider">
                <div class="feature-card">
                    <div class="feature-icon"><i class="bi bi-sliders"></i></div>
                    <h4>Free DNS management with easy-to-use controls</h4>
                    <p>Take full control of your domain's DNS settings through a clean, intuitive interface. No hidden fees or complex setups.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon"><i class="bi bi-shield-lock"></i></div>
                    <h4>WHOIS privacy (on eligible domains)</h4>
                    <p>Keep your personal details private with WHOIS protection. It helps block spammers and data scrapers from accessing your information.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon"><i class="bi bi-puzzle"></i></div>
                    <h4>Works with all our products</h4>
                    <p>Your domain integrates seamlessly with {$companyname} products, whether you're using shared hosting or VPS, we've got you covered.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon"><i class="bi bi-lightning"></i></div>
                    <h4>Simple domain setup</h4>
                    <p>Registering your domain is quick, easy, and beginner-friendly. Just type, click, and you're done. No tech skills required.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- PROMO SPLIT SECTION -->
    <section class="section-padding">
        <div class="container">
            <div class="promo-split">
                <div class="promo-image">
                    <img src="https://images.unsplash.com/photo-1573164713988-8665fc963095?auto=format&fit=crop&w=800&q=80" alt="Happy customer">
                    <div class="promo-floating-badge">
                        <i class="bi bi-check-circle-fill text-success fs-4"></i>
                        <span class="fw-bold">Domain transfer successful</span>
                    </div>
                </div>
                <div class="promo-text">
                    <h2>Buy a domain: register popular gTLDs & ccTLD</h2>
                    <p>Buy a domain quickly and easily. Choose from the most popular top level domain (TLD) options.</p>
                    <a href="domainchecker.php" class="btn-light-green px-4 py-2">Buy a domain</a>
                </div>
            </div>
        </div>
    </section>

    <!-- WHY CHOOSE US SLIDER -->
    <section class="section-padding bg-light-section">
        <div class="container">
            <div class="d-flex justify-content-between align-items-end mb-5">
                <div style="max-width: 500px;">
                    <h2 class="fw-bold mb-3">Why people choose {$companyname}</h2>
                    <p class="text-muted m-0">We're more than a registrar. We're your long-term tech partner with the infrastructure and support to keep your domain, and your site, going strong.</p>
                </div>
                <div class="d-none d-md-flex gap-2">
                    <button class="btn btn-outline-dark rounded-circle p-2"><i class="bi bi-arrow-left"></i></button>
                    <button class="btn btn-outline-dark rounded-circle p-2"><i class="bi bi-arrow-right"></i></button>
                </div>
            </div>

            <div class="features-slider">
                <div class="feature-card" style="background: transparent; border: none; padding: 1rem;">
                    <div class="feature-icon"><i class="bi bi-headset"></i></div>
                    <h4>24/7/365 support</h4>
                </div>
                <div class="feature-card" style="background: transparent; border: none; padding: 1rem;">
                    <div class="feature-icon"><i class="bi bi-cash-coin"></i></div>
                    <h4>No hidden fees or confusing fine print</h4>
                </div>
                <div class="feature-card" style="background: transparent; border: none; padding: 1rem;">
                    <div class="feature-icon"><i class="bi bi-server"></i></div>
                    <h4>Great infrastructure (AMD EPYC, NVMe, Anycast DNS)</h4>
                </div>
                <div class="feature-card" style="background: transparent; border: none; padding: 1rem;">
                    <div class="feature-icon"><i class="bi bi-people"></i></div>
                    <h4>Trusted by 3 million+ websites</h4>
                </div>
            </div>
        </div>
    </section>

    <!-- ADDONS SECTION (DARK) -->
    <section class="section-padding bg-dark-section">
        <div class="container">
            <div class="d-flex justify-content-between align-items-end mb-5">
                <div>
                    <h2 class="fw-bold mb-2">Need more than a domain?</h2>
                    <p class="m-0">Your domain is just the start. Take your setup further with these add-ons:</p>
                </div>
                <div class="d-none d-md-flex gap-2">
                    <button class="btn btn-outline-light rounded-circle p-2"><i class="bi bi-arrow-left"></i></button>
                    <button class="btn btn-outline-light rounded-circle p-2"><i class="bi bi-arrow-right"></i></button>
                </div>
            </div>

            <div class="row g-4">
                <div class="col-md-6">
                    <div class="addon-card">
                        <h3>Email hosting</h3>
                        <p>Use your domain for professional email like (hello@yourbusiness.com). With {$companyname}, you get reliable delivery, advanced spam protection, and easy access across all your devices.</p>
                        <div>
                            <a href="cart.php" class="btn-light-green">See plans</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="addon-card">
                        <h3>SSL certificates</h3>
                        <p>Keep your visitors safe and boost your site's trust. All {$companyname} shared hosting plans include free SSL to keep things simple, secure, and trusted - no extra plans required.</p>
                        <div>
                            <a href="cart.php" class="btn-light-green">See options</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- TESTIMONIALS SECTION (DARK) -->
    <section class="section-padding bg-dark-section" style="border-top: 1px solid rgba(255,255,255,0.05);">
        <div class="container">
            <div class="text-center mb-5">
                <div class="mb-3"><i class="bi bi-star-fill text-success fs-4"></i> <span class="fw-bold fs-5 ms-2">Trustpilot</span></div>
                <h2 class="fw-bold">What people are saying</h2>
            </div>

            <div class="row g-4">
                <div class="col-md-4">
                    <div class="testimonial-card">
                        <div class="stars">★★★★★</div>
                        <h5 class="fw-bold mb-3">Tech support is the #1</h5>
                        <p class="small opacity-75 mb-4">The reply to my question was swift and to the point. It seems that when moving a domain, there is always one more step. The Guru pointed out the missing step, and the problem was quickly remedied. Many thanks.</p>
                        <div class="fw-bold small">Jean M</div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="testimonial-card">
                        <div class="stars">★★★★★</div>
                        <h5 class="fw-bold mb-3">{$companyname} as an alternative to Hostgator</h5>
                        <p class="small opacity-75 mb-4">I had tons of troubles with Hostgator and decided to move 6 months earlier. {$companyname} was a price match but I was also looking for cPanel migration and a few other features. I am super happy with the speed of my websites.</p>
                        <div class="fw-bold small">Customer</div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="testimonial-card">
                        <div class="stars">★★★★★</div>
                        <h5 class="fw-bold mb-3">You have gone beyond the call of duty</h5>
                        <p class="small opacity-75 mb-4">You have gone beyond the call of duty. You have been pleasant, professional, and very helpful as we ask many questions regarding our website.</p>
                        <div class="fw-bold small">Client</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- FAQ SECTION -->
    <section class="section-padding">
        <div class="container faq-container">
            <div class="faq-title">
                <h2>Frequently asked questions</h2>
            </div>
            <div class="faq-list">
                <div class="accordion" id="faqAccordion">
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq1">
                                What is a domain name?
                            </button>
                        </h2>
                        <div id="faq1" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                A domain name is the address of your website that people type in the browser URL bar to visit your website. In simple terms, if your website was a house, then your domain name will be its address.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2">
                                How do I register a domain?
                            </button>
                        </h2>
                        <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                Use our search tool above to check if your desired name is available. If it is, simply add it to your cart and complete the checkout process to register it in your name.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq3">
                                Can I transfer my domain to {$companyname}?
                            </button>
                        </h2>
                        <div id="faq3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                Yes, you can easily transfer your existing domain to us. You'll need an EPP code from your current registrar and ensure the domain is unlocked.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq4">
                                What is the difference between a domain name and web hosting?
                            </button>
                        </h2>
                        <div id="faq4" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                A domain name is the address of your website, while web hosting is the space where your website files are stored. You need both to have a functioning website.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq5">
                                What domain extensions (TLDs) are available?
                            </button>
                        </h2>
                        <div id="faq5" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                We offer hundreds of TLDs, from classic .com, .net, and .org to modern extensions like .io, .ai, .tech, and country-specific codes.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq6">
                                How long does a domain registration last?
                            </button>
                        </h2>
                        <div id="faq6" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body">
                                Domains are typically registered in 1-year increments, up to a maximum of 10 years at a time. You must renew your domain before it expires to keep it.
                            </div>
                        </div>
                    </div>
                </div>
                <a href="knowledgebase.php" class="d-inline-block mt-4 text-success fw-semibold text-decoration-none">Show more questions</a>
            </div>
        </div>
    </section>

    <!-- CUSTOM FOOTER -->
    <footer class="custom-footer">
        <div class="footer-grid">
            <div class="footer-col">
                <h5>Hosting</h5>
                <ul>
                    <li><a href="cart.php">Hosting</a></li>
                    <li><a href="cart.php">Reseller Hosting</a></li>
                    <li><a href="cart.php">VPS Hosting</a></li>
                    <li><a href="cart.php">Dedicated Servers</a></li>
                    <li><a href="cart.php">VDS Hosting</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h5>WordPress</h5>
                <ul>
                    <li><a href="cart.php?gid=wordpress">Hosting for WordPress</a></li>
                    <li><a href="cart.php">WooCommerce Hosting</a></li>
                    <li><a href="cart.php">WP Rocket</a></li>
                    <li><a href="cart.php">Speed & Performance</a></li>
                    <li><a href="cart.php">Security & Protection</a></li>
                    <li><a href="cart.php">Ease of Use</a></li>
                    <li><a href="cart.php">Free Website Migration</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h5>Services</h5>
                <ul>
                    <li><a href="domainchecker.php" class="text-white fw-bold">Buy a domain</a></li>
                    <li><a href="domainchecker.php">Domain pricing</a></li>
                    <li><a href="cart.php?a=add&domain=transfer">Domain Transfer</a></li>
                    <li><a href="cart.php">SSL Certificates</a></li>
                    <li><a href="index.php?m=aitools&action=sitebuilder">Sitebuilder</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h5>Solutions</h5>
                <ul>
                    <li><a href="cart.php">Agency</a></li>
                    <li><a href="cart.php">cPanel Hosting</a></li>
                    <li><a href="cart.php">Joomla Hosting</a></li>
                    <li><a href="cart.php">Drupal Hosting</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h5>Support</h5>
                <ul>
                    <li><a href="clientarea.php">Customer Login</a></li>
                    <li><a href="register.php">Create New Account</a></li>
                    <li><a href="submitticket.php">Open Support Ticket</a></li>
                    <li><a href="contact.php">Report Abuse</a></li>
                    <li><a href="serverstatus.php">Service Status <span class="text-success">●</span></a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h5>Resources</h5>
                <ul>
                    <li><a href="about.php">About</a></li>
                    <li><a href="contact.php">Contact</a></li>
                    <li><a href="knowledgebase.php">Blog</a></li>
                    <li><a href="knowledgebase.php">Knowledge Base</a></li>
                    <li><a href="affiliates.php">Affiliate Program</a></li>
                    <li><a href="affiliates.php">Refer a Friend</a></li>
                </ul>
            </div>
        </div>

        <div class="footer-bottom">
            <div>
                <div class="footer-brand mb-3">
                    <i class="bi bi-hexagon-fill" style="color: var(--primary-green);"></i> {$companyname}
                </div>
                <div class="d-flex gap-4 mb-3">
                    <div>
                        <div class="small text-muted mb-1">Support</div>
                        <div class="fw-bold">support@{$domain}</div>
                    </div>
                    <div>
                        <div class="small text-muted mb-1">Call us on</div>
                        <div class="fw-bold">+1 (555) 123-4567</div>
                    </div>
                </div>
                <div class="footer-social">
                    <a href="#"><i class="bi bi-facebook"></i></a>
                    <a href="#"><i class="bi bi-linkedin"></i></a>
                    <a href="#"><i class="bi bi-instagram"></i></a>
                    <a href="#"><i class="bi bi-tiktok"></i></a>
                </div>
            </div>
            
            <div class="text-md-end mt-4 mt-md-0">
                <div class="mb-3">
                    <span class="text-muted small">Excellent</span>
                    <span class="text-success mx-2">★★★★★</span>
                    <span class="text-muted small">5,493 reviews on Trustpilot</span>
                </div>
                <div class="footer-legal">
                    &copy; {$date_year} {$companyname}. All rights reserved.
                    <a href="#">Privacy Policy</a> | 
                    <a href="#">Accessibility Statement</a> | 
                    <a href="#">Policies</a>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

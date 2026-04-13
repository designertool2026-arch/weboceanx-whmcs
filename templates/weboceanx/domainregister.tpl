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
            color: #ffffff;
            background-color: #011d1a !important; /* WebOceanX Dark Background */
            overflow-x: hidden;
        }

        /* ---------- WEBOCEANX THEME UTILITIES ---------- */
        .text-neon { color: #b4f53c !important; }
        .bg-neon { background-color: #b4f53c !important; color: #011d1a !important; }
        .text-muted-custom { color: #8ea19e !important; }
        
        .bg-dark-card { 
            background: #052a26; 
            border: 1px solid rgba(255,255,255,0.05); 
            border-radius: 1.5rem; 
        }
        
        .bg-darker { background: #021b18; }

        /* ---------- NAVIGATION ---------- */
        .custom-nav {
            padding: 1.5rem 0;
            border-bottom: 1px solid rgba(255,255,255,0.05);
            background: rgba(1, 29, 26, 0.9);
            backdrop-filter: blur(10px);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .nav-link-custom {
            color: #ffffff;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s;
            padding: 0.5rem 1rem;
        }
        .nav-link-custom:hover {
            color: #b4f53c;
        }
        .brand-logo {
            font-size: 1.5rem;
            font-weight: 800;
            background: linear-gradient(135deg, #b4f53c, #59e38c);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            text-decoration: none;
        }

        /* ---------- HERO SEARCH ---------- */
        .hero-section {
            padding: 8rem 0 6rem;
            text-align: center;
            position: relative;
        }
        .hero-section::before {
            content: '';
            position: absolute;
            top: -50%; left: 50%;
            transform: translateX(-50%);
            width: 800px; height: 800px;
            background: radial-gradient(circle, rgba(180,245,60,0.1) 0%, rgba(1,29,26,0) 70%);
            z-index: -1;
        }
        .search-wrapper {
            background: #021b18;
            border: 2px solid rgba(180,245,60,0.3);
            border-radius: 100px;
            padding: 0.5rem;
            display: flex;
            max-width: 800px;
            margin: 0 auto;
            transition: all 0.3s;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }
        .search-wrapper:focus-within {
            border-color: #b4f53c;
            box-shadow: 0 0 25px rgba(180,245,60,0.15);
        }
        .search-input {
            background: transparent;
            border: none;
            color: #ffffff;
            padding: 1rem 2rem;
            width: 100%;
            outline: none;
            font-size: 1.2rem;
        }
        .search-input::placeholder {
            color: #8ea19e;
        }
        .search-btn {
            background: #b4f53c;
            color: #011d1a;
            border: none;
            border-radius: 100px;
            padding: 0 3rem;
            font-weight: 700;
            font-size: 1.1rem;
            transition: all 0.2s;
        }
        .search-btn:hover {
            background: #9be026;
            transform: scale(1.02);
        }

        /* ---------- TLD GRID ---------- */
        .tld-card {
            padding: 2.5rem 2rem;
            text-align: center;
            transition: all 0.3s;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .tld-card:hover {
            transform: translateY(-5px);
            border-color: #b4f53c;
            background: #07332e;
            box-shadow: 0 10px 30px rgba(0,0,0,0.4);
        }
        .tld-name {
            font-size: 3.5rem;
            font-weight: 800;
            letter-spacing: -2px;
            margin-bottom: 0.5rem;
            color: #ffffff;
        }
        .tld-price {
            font-size: 1.5rem;
            font-weight: 700;
            color: #b4f53c;
            margin: 1rem 0;
        }
        .btn-outline-neon {
            border: 1px solid #b4f53c;
            color: #b4f53c;
            background: transparent;
            border-radius: 100px;
            padding: 0.6rem 1.5rem;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.2s;
        }
        .btn-outline-neon:hover {
            background: #b4f53c;
            color: #011d1a;
        }

        /* ---------- FEATURES ---------- */
        .feature-icon-box {
            width: 64px;
            height: 64px;
            border-radius: 1rem;
            background: rgba(180,245,60,0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            color: #b4f53c;
            margin-bottom: 1.5rem;
        }

        /* ---------- FOOTER ---------- */
        .site-footer {
            background: #011714;
            padding: 4rem 0 2rem;
            border-top: 1px solid rgba(255,255,255,0.05);
            margin-top: 6rem;
        }
    </style>
</head>
<body>

    <!-- NAVIGATION -->
    <nav class="custom-nav">
        <div class="container d-flex justify-content-between align-items-center">
            <a href="index.php" class="brand-logo">
                <i class="bi bi-hexagon-fill text-neon"></i> WebOceanX
            </a>
            <div class="d-none d-md-flex gap-2">
                <a href="cart.php" class="nav-link-custom">Hosting</a>
                <a href="domainchecker.php" class="nav-link-custom" style="color: #b4f53c;">Domains</a>
                <a href="index.php?m=aitools" class="nav-link-custom">AI Studio</a>
            </div>
            <div>
                <a href="clientarea.php" class="btn btn-outline-neon btn-sm px-4 py-2">Client Area</a>
            </div>
        </div>
    </nav>

    <!-- HERO SECTION -->
    <section class="hero-section container">
        <div class="badge bg-darker border border-secondary rounded-pill px-3 py-2 mb-4 text-neon">
            <i class="bi bi-stars"></i> Secure your digital identity today
        </div>
        <h1 class="display-3 fw-bold mb-4">Find your perfect <span class="text-neon">domain</span>.</h1>
        <p class="fs-5 text-muted-custom mb-5 mx-auto" style="max-width: 600px;">
            Whether you're starting fresh or scaling up, the right domain helps people find you, trust you, and remember you.
        </p>
        
        <form action="domainchecker.php" method="post" class="search-wrapper">
            <input type="text" name="domain" class="search-input" placeholder="Enter your ideal domain name..." required>
            <button type="submit" class="search-btn">Search</button>
        </form>

        <div class="d-flex justify-content-center gap-4 mt-5 flex-wrap">
            <div class="d-flex align-items-center gap-2 text-muted-custom fw-medium">
                <i class="bi bi-check-circle-fill text-neon"></i> Free WHOIS Privacy
            </div>
            <div class="d-flex align-items-center gap-2 text-muted-custom fw-medium">
                <i class="bi bi-check-circle-fill text-neon"></i> Full DNS Control
            </div>
            <div class="d-flex align-items-center gap-2 text-muted-custom fw-medium">
                <i class="bi bi-check-circle-fill text-neon"></i> 24/7 Support
            </div>
        </div>
    </section>

    <!-- POPULAR TLDS GRID -->
    <section class="container mt-5 pt-5">
        <div class="text-center mb-5">
            <h2 class="fw-bold mb-3">Pick your perfect match</h2>
            <p class="text-muted-custom">Hundreds of domain extensions, ready to claim.</p>
        </div>

        <div class="row g-4">
            <!-- .COM -->
            <div class="col-md-4 col-sm-6">
                <div class="bg-dark-card tld-card">
                    <div>
                        <div class="tld-name">.com</div>
                        <p class="text-muted-custom mb-0">The world's most popular extension.</p>
                    </div>
                    <div>
                        <div class="tld-price">$12.99 <span class="fs-6 text-muted-custom fw-normal">/yr</span></div>
                        <a href="domainchecker.php" class="btn-outline-neon d-block w-100">Check Availability</a>
                    </div>
                </div>
            </div>
            <!-- .NET -->
            <div class="col-md-4 col-sm-6">
                <div class="bg-dark-card tld-card">
                    <div>
                        <div class="tld-name">.net</div>
                        <p class="text-muted-custom mb-0">Perfect for tech and networking.</p>
                    </div>
                    <div>
                        <div class="tld-price">$14.99 <span class="fs-6 text-muted-custom fw-normal">/yr</span></div>
                        <a href="domainchecker.php" class="btn-outline-neon d-block w-100">Check Availability</a>
                    </div>
                </div>
            </div>
            <!-- .ORG -->
            <div class="col-md-4 col-sm-6">
                <div class="bg-dark-card tld-card">
                    <div>
                        <div class="tld-name">.org</div>
                        <p class="text-muted-custom mb-0">Build trust for your organization.</p>
                    </div>
                    <div>
                        <div class="tld-price">$13.99 <span class="fs-6 text-muted-custom fw-normal">/yr</span></div>
                        <a href="domainchecker.php" class="btn-outline-neon d-block w-100">Check Availability</a>
                    </div>
                </div>
            </div>
            <!-- .AI -->
            <div class="col-md-4 col-sm-6">
                <div class="bg-dark-card tld-card" style="border-color: rgba(180,245,60,0.3);">
                    <div>
                        <div class="badge bg-neon mb-2">Trending</div>
                        <div class="tld-name">.ai</div>
                        <p class="text-muted-custom mb-0">The future of tech and startups.</p>
                    </div>
                    <div>
                        <div class="tld-price">$69.99 <span class="fs-6 text-muted-custom fw-normal">/yr</span></div>
                        <a href="domainchecker.php" class="btn-outline-neon d-block w-100" style="background: #b4f53c; color: #011d1a;">Check Availability</a>
                    </div>
                </div>
            </div>
            <!-- .IO -->
            <div class="col-md-4 col-sm-6">
                <div class="bg-dark-card tld-card">
                    <div>
                        <div class="tld-name">.io</div>
                        <p class="text-muted-custom mb-0">Loved by developers and SaaS.</p>
                    </div>
                    <div>
                        <div class="tld-price">$39.99 <span class="fs-6 text-muted-custom fw-normal">/yr</span></div>
                        <a href="domainchecker.php" class="btn-outline-neon d-block w-100">Check Availability</a>
                    </div>
                </div>
            </div>
            <!-- .CO -->
            <div class="col-md-4 col-sm-6">
                <div class="bg-dark-card tld-card">
                    <div>
                        <div class="tld-name">.co</div>
                        <p class="text-muted-custom mb-0">Short, memorable, and global.</p>
                    </div>
                    <div>
                        <div class="tld-price">$24.99 <span class="fs-6 text-muted-custom fw-normal">/yr</span></div>
                        <a href="domainchecker.php" class="btn-outline-neon d-block w-100">Check Availability</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- FEATURES SECTION -->
    <section class="container mt-5 pt-5">
        <div class="bg-dark-card p-5">
            <div class="row g-5">
                <div class="col-lg-4">
                    <div class="feature-icon-box">
                        <i class="bi bi-shield-lock"></i>
                    </div>
                    <h4 class="fw-bold mb-3">Free WHOIS Privacy</h4>
                    <p class="text-muted-custom">Keep your personal details private. We include WHOIS protection for free on all eligible domains to block spammers.</p>
                </div>
                <div class="col-lg-4">
                    <div class="feature-icon-box">
                        <i class="bi bi-sliders"></i>
                    </div>
                    <h4 class="fw-bold mb-3">Easy DNS Management</h4>
                    <p class="text-muted-custom">Take full control of your domain's DNS settings through our clean, intuitive client dashboard. No hidden fees.</p>
                </div>
                <div class="col-lg-4">
                    <div class="feature-icon-box">
                        <i class="bi bi-lightning-charge"></i>
                    </div>
                    <h4 class="fw-bold mb-3">Instant Setup</h4>
                    <p class="text-muted-custom">Registering your domain is quick and easy. Once purchased, your domain is instantly active and ready to connect.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- FOOTER -->
    <footer class="site-footer">
        <div class="container text-center">
            <h2 class="fw-bold mb-4">Ready to claim your name?</h2>
            <a href="domainchecker.php" class="btn btn-lg px-5 py-3 rounded-pill fw-bold" style="background: #b4f53c; color: #011d1a;">Search Domains Now</a>
            
            <div class="mt-5 pt-5 border-top" style="border-color: rgba(255,255,255,0.05) !important;">
                <p class="text-muted-custom small m-0">&copy; {$date_year} {$companyname}. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

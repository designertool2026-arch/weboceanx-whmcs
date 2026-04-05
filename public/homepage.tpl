{* homepage.tpl for WHMCS theme "weboceanx" - Redesigned & Enhanced *}

<!-- Hero Section -->
<div class="hero-section text-white py-5 py-lg-0">
    <div class="container">
        <!-- Hero Content -->
        <div class="row align-items-center mt-lg-4">
            <div class="col-lg-6 text-center text-lg-start">
                <div class="mb-3">
                    <span class="badge bg-light text-dark me-2">WEB OCEANX HOSTING</span>
                    <span class="text-warning">★★★★★</span> <small class="ms-1">4.7/5 Based on reviews</small>
                </div>
                <h1 class="display-4 fw-bold mb-4">Launch your website.<br>We'll run it safely.</h1>
                <p class="lead mb-4 opacity-75">From idea to production in minutes, deploy secure, globally distributed sites with the infrastructure, protection, and reliability your users depend on.</p>
                <a href="cart.php" class="btn btn-neon btn-lg px-4 py-3 rounded-pill mb-4">Start building</a>
                
                <!-- Social Share -->
                <div class="social-share mt-2 justify-content-center justify-content-lg-start">
                    <span class="me-3 small opacity-75 fw-bold">Share:</span>
                    <a href="https://facebook.com/sharer/sharer.php?u=#" target="_blank" title="Share on Facebook"><i class="bi bi-facebook"></i></a>
                    <a href="https://twitter.com/intent/tweet?url=#&text=Check%20out%20Web%20Oceanx" target="_blank" title="Share on Twitter"><i class="bi bi-twitter-x"></i></a>
                    <a href="https://www.linkedin.com/shareArticle?mini=true&url=#" target="_blank" title="Share on LinkedIn"><i class="bi bi-linkedin"></i></a>
                </div>
            </div>
            <div class="col-lg-6 d-none d-lg-block text-center">
                <!-- Placeholder for Hero Graphic -->
                <img src="https://picsum.photos/seed/dashboard/600/400" alt="Dashboard Preview" class="img-fluid rounded-3 shadow-lg" style="transform: perspective(1000px) rotateY(-10deg); border: 5px solid rgba(255,255,255,0.1);">
            </div>
        </div>
    </div>
    
    <!-- Animated Background Waves -->
    <svg class="hero-waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
        <defs>
            <path id="gentle-wave" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
        </defs>
        <g class="parallax">
            <use xlink:href="#gentle-wave" x="48" y="0" fill="rgba(255,255,255,0.05)" />
            <use xlink:href="#gentle-wave" x="48" y="3" fill="rgba(255,255,255,0.1)" />
            <use xlink:href="#gentle-wave" x="48" y="5" fill="rgba(255,255,255,0.15)" />
            <use xlink:href="#gentle-wave" x="48" y="7" fill="#f8f9fa" />
        </g>
    </svg>
</div>

<!-- Service Status Section -->
<section class="py-3 bg-white border-bottom position-relative" style="z-index: 3;">
    <div class="container">
        <div class="d-flex flex-wrap justify-content-center align-items-center gap-4">
            <div class="fw-bold text-muted me-2">System Status:</div>
            <div class="d-flex align-items-center gap-2">
                <span class="d-inline-block rounded-circle bg-success" style="width: 10px; height: 10px; box-shadow: 0 0 5px #198754;"></span>
                <span class="fw-medium small">Web Hosting</span>
            </div>
            <div class="d-flex align-items-center gap-2">
                <span class="d-inline-block rounded-circle bg-success" style="width: 10px; height: 10px; box-shadow: 0 0 5px #198754;"></span>
                <span class="fw-medium small">Email Services</span>
            </div>
            <div class="d-flex align-items-center gap-2">
                <span class="d-inline-block rounded-circle bg-success" style="width: 10px; height: 10px; box-shadow: 0 0 5px #198754;"></span>
                <span class="fw-medium small">Domain Registration</span>
            </div>
            <div class="ms-md-auto mt-2 mt-md-0">
                <a href="{$WEB_ROOT}/serverstatus.php" class="text-decoration-none text-success small fw-bold">View full status <i class="bi bi-arrow-right"></i></a>
            </div>
        </div>
    </div>
</section>

<!-- Quick Links Section -->
<section class="py-5 bg-light position-relative" style="z-index: 3;">
    <div class="container">
        <div class="row g-4 justify-content-center text-center">
            <div class="col-6 col-md-3">
                <a href="{$WEB_ROOT}/store/hosting" class="text-decoration-none text-dark">
                    <div class="card border-0 shadow-sm h-100 py-4 hover-lift">
                        <i class="bi bi-hdd-network fs-1 text-success mb-3"></i>
                        <h5 class="mb-0 fw-bold">Shared Hosting</h5>
                    </div>
                </a>
            </div>
            <div class="col-6 col-md-3">
                <a href="{$WEB_ROOT}/store/vps" class="text-decoration-none text-dark">
                    <div class="card border-0 shadow-sm h-100 py-4 hover-lift">
                        <i class="bi bi-server fs-1 text-success mb-3"></i>
                        <h5 class="mb-0 fw-bold">VPS Hosting</h5>
                    </div>
                </a>
            </div>
            <div class="col-6 col-md-3">
                <a href="{$WEB_ROOT}/store/wordpress" class="text-decoration-none text-dark">
                    <div class="card border-0 shadow-sm h-100 py-4 hover-lift">
                        <i class="bi bi-wordpress fs-1 text-success mb-3"></i>
                        <h5 class="mb-0 fw-bold">WordPress</h5>
                    </div>
                </a>
            </div>
            <div class="col-6 col-md-3">
                <a href="{$WEB_ROOT}/store/dedicated" class="text-decoration-none text-dark">
                    <div class="card border-0 shadow-sm h-100 py-4 hover-lift">
                        <i class="bi bi-cpu fs-1 text-success mb-3"></i>
                        <h5 class="mb-0 fw-bold">Dedicated</h5>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>

<!-- Hosting Types Cards (Overlapping Hero) -->
<div id="hosting" class="container hosting-cards-row mb-5 mt-n5 mt-lg-0">
    <div class="row g-4">
        <div class="col-md-6 col-lg-3">
            <div class="hosting-card bg-dark-green shadow-lg h-100">
                <h5 class="fw-bold mb-4">Fast Shared Hosting</h5>
                <p class="small opacity-75 mb-1">Starting at</p>
                <h2 class="display-6 fw-bold mb-4">$3.99</h2>
                <a href="cart.php?gid=1" class="text-neon text-decoration-none fw-bold mt-auto d-block">Find out more <i class="bi bi-arrow-right"></i></a>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="hosting-card bg-primary-green shadow-lg position-relative h-100">
                <div class="position-absolute top-0 start-50 translate-middle badge rounded-pill bg-warning text-dark px-3 py-2 fw-bold shadow-sm" style="font-size: 0.75rem; z-index: 2;">
                    <i class="bi bi-star-fill me-1"></i> Most Popular
                </div>
                <h5 class="fw-bold mb-4 mt-2">Managed cPanel VPS</h5>
                <p class="small opacity-75 mb-1">Starting at</p>
                <h2 class="display-6 fw-bold mb-4">$28.75</h2>
                <a href="cart.php?gid=2" class="text-neon text-decoration-none fw-bold mt-auto d-block">Find out more <i class="bi bi-arrow-right"></i></a>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="hosting-card bg-light-green shadow-lg h-100">
                <h5 class="fw-bold mb-4">Reseller Accounts</h5>
                <p class="small text-muted mb-1">Starting at</p>
                <h2 class="display-6 fw-bold mb-4">$20.42</h2>
                <a href="cart.php?gid=3" class="text-success text-decoration-none fw-bold mt-auto d-block">Find out more <i class="bi bi-arrow-right"></i></a>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="hosting-card bg-white shadow-lg h-100">
                <h5 class="fw-bold mb-4">Hosting for WordPress</h5>
                <p class="small text-muted mb-1">Starting at</p>
                <h2 class="display-6 fw-bold mb-4">$1.00</h2>
                <a href="cart.php?gid=4" class="text-success text-decoration-none fw-bold mt-auto d-block">Find out more <i class="bi bi-arrow-right"></i></a>
            </div>
        </div>
    </div>
</div>

<!-- Trusted By -->
<div class="container py-5 text-center">
    <h3 class="fw-bold mb-5">Trusted by the world's top enterprises</h3>
    <div class="d-flex justify-content-center align-items-center flex-wrap gap-5 opacity-50">
        <h4 class="m-0 fw-bold">IHG</h4>
        <h4 class="m-0 fw-bold">Telstra</h4>
        <h4 class="m-0 fw-bold">AMNESTY</h4>
        <h4 class="m-0 fw-bold">ELEVEN</h4>
        <h4 class="m-0 fw-bold">BBC</h4>
    </div>
    <p class="text-muted mt-5">We power experiences for some of the biggest brands in the world.</p>
</div>

<!-- Built for Success -->
<div class="container py-5">
    <div class="row mb-5">
        <div class="col-lg-6">
            <h2 class="display-5 fw-bold mb-3">Website hosting<br>built for success</h2>
            <p class="text-muted lead">The premium hosting services you need to build a fast and successful website. Get started with web hosting in just minutes.</p>
        </div>
    </div>
    <div class="row g-4">
        <!-- Card 1 -->
        <div class="col-md-6 col-lg-3">
            <div class="card h-100 border-0 shadow-sm rounded-4 overflow-hidden">
                <img src="https://picsum.photos/seed/vps/400/200" class="card-img-top" alt="VPS">
                <div class="card-body p-4">
                    <h4 class="fw-bold mb-3">VPS Hosting</h4>
                    <p class="text-muted mb-4">Need more power and flexibility? VPS Hosting gives you dedicated resources, root access and the freedom to handle high-traffic sites.</p>
                    <a href="cart.php?gid=2" class="btn btn-neon rounded-pill px-4">Read more</a>
                </div>
            </div>
        </div>
        <!-- Card 2 -->
        <div class="col-md-6 col-lg-3">
            <div class="card h-100 border-0 shadow-sm rounded-4 overflow-hidden">
                <img src="https://picsum.photos/seed/managed/400/200" class="card-img-top" alt="Managed">
                <div class="card-body p-4">
                    <h4 class="fw-bold mb-3">Managed VPS</h4>
                    <p class="text-muted mb-4">Need more power but don't want to manage everything yourself? Managed VPS hosting gives you dedicated resources and flexibility.</p>
                    <a href="cart.php?gid=2" class="btn btn-neon rounded-pill px-4">Read more</a>
                </div>
            </div>
        </div>
        <!-- Card 3 -->
        <div class="col-md-6 col-lg-3">
            <div class="card h-100 border-0 shadow-sm rounded-4 overflow-hidden">
                <img src="https://picsum.photos/seed/wp/400/200" class="card-img-top" alt="WordPress">
                <div class="card-body p-4">
                    <h4 class="fw-bold mb-3">Managed WP</h4>
                    <p class="text-muted mb-4">Get all the benefits of our optimized WordPress hosting, plus more hands-on management tools.</p>
                    <a href="cart.php?gid=4" class="btn btn-neon rounded-pill px-4 mt-auto">Read more</a>
                </div>
            </div>
        </div>
        <!-- Card 4 -->
        <div class="col-md-6 col-lg-3">
            <div class="card h-100 border-0 shadow-sm rounded-4 overflow-hidden">
                <img src="https://picsum.photos/seed/hosting/400/200" class="card-img-top" alt="Hosting">
                <div class="card-body p-4">
                    <h4 class="fw-bold mb-3">Hosting for WP</h4>
                    <p class="text-muted mb-4">We built our WordPress hosting on high-performance infrastructure to deliver exactly that. It's speed you can feel.</p>
                    <a href="cart.php?gid=4" class="btn btn-neon rounded-pill px-4">Read more</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Stats Section -->
<div class="container">
    <div class="stats-section p-5 shadow-lg">
        <h2 class="fw-bold mb-5">The stats speak for themselves.</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <h2 class="display-4 fw-bold text-neon mb-2">3 million</h2>
                <h5 class="fw-bold">websites hosted.</h5>
                <p class="opacity-75">Trusted by millions for fast, secure, always-online hosting.</p>
            </div>
            <div class="col-md-4">
                <h2 class="display-4 fw-bold text-neon mb-2">10</h2>
                <h5 class="fw-bold">locations around the world.</h5>
                <p class="opacity-75">Global network ensures peak performance wherever your visitors are.</p>
            </div>
            <div class="col-md-4">
                <h2 class="display-4 fw-bold text-neon mb-2">700,000+</h2>
                <h5 class="fw-bold">valued customers.</h5>
                <p class="opacity-75">Supporting businesses with reliable hosting and real human support.</p>
            </div>
        </div>
    </div>
</div>

<!-- Features Section -->
<div id="features" class="container py-5">
    <h2 class="display-6 fw-bold mb-5">Features built for better<br>hosting, with Web Oceanx</h2>
    <div class="row g-4">
        <div class="col-md-6 col-lg-3">
            <div class="card h-100 border-0 shadow-sm rounded-4 p-4">
                <div class="feature-icon-box" data-bs-toggle="tooltip" data-bs-placement="top" title="Powered by LiteSpeed Web Server and NVMe SSDs">
                    <i class="bi bi-lightning-charge-fill"></i>
                </div>
                <h5 class="fw-bold mb-3" data-bs-toggle="tooltip" data-bs-placement="top" title="Experience up to 20x faster page loads">Faster performance</h5>
                <p class="text-muted mb-0">Our platform is tuned for speed with LiteSpeed caching and smart resource management, ensuring your site runs smoothly.</p>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="card h-100 border-0 shadow-sm rounded-4 p-4">
                <div class="feature-icon-box" data-bs-toggle="tooltip" data-bs-placement="top" title="Certified hosting experts available around the clock">
                    <i class="bi bi-headset"></i>
                </div>
                <h5 class="fw-bold mb-3" data-bs-toggle="tooltip" data-bs-placement="top" title="Get help anytime via live chat, ticket, or phone">Guru crew support</h5>
                <p class="text-muted mb-0">Our in-house team is available 24/7/365. Real people ready to help, whether it's 3 p.m. or 3 a.m.</p>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="card h-100 border-0 shadow-sm rounded-4 p-4">
                <div class="feature-icon-box" data-bs-toggle="tooltip" data-bs-placement="top" title="Enterprise-grade security rules and WAF">
                    <i class="bi bi-shield-check"></i>
                </div>
                <h5 class="fw-bold mb-3" data-bs-toggle="tooltip" data-bs-placement="top" title="Proactive defense against modern cyber threats">Security built in, not bolted on</h5>
                <p class="text-muted mb-0">Every plan includes free SSL certificates, DDoS protection, brute force defense, and malware scanning.</p>
            </div>
        </div>
        <div class="col-md-6 col-lg-3">
            <div class="card h-100 border-0 shadow-sm rounded-4 p-4">
                <div class="feature-icon-box" data-bs-toggle="tooltip" data-bs-placement="top" title="Seamless migration process by our specialists">
                    <i class="bi bi-arrow-left-right"></i>
                </div>
                <h5 class="fw-bold mb-3" data-bs-toggle="tooltip" data-bs-placement="top" title="Zero downtime during your website transfer">We move your site for free</h5>
                <p class="text-muted mb-0">Switching hosts? We'll handle the migration of your site, databases, files, and emails. Minimal downtime, no drama.</p>
            </div>
        </div>
    </div>
</div>

<!-- Testimonials Section (Carousel) -->
<div id="testimonials" class="bg-dark-green py-5 mt-5">
    <div class="container py-5">
        <div class="text-center mb-5">
            <div class="text-neon fs-4 mb-3">★ Trustpilot</div>
            <h2 class="display-6 fw-bold text-white">What our customers have to say</h2>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div id="testimonialCarousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="testimonial-card text-center mx-auto" style="max-width: 600px;">
                                <div class="text-neon mb-3 fs-4">★★★★★</div>
                                <h4 class="fw-bold mb-3">I love Web Oceanx</h4>
                                <p class="opacity-75 lead mb-4">"Best internet support I have had since 1993 when internet first went public. I have been through several hosts with my media company and school and Web Oceanx support staff are knowledgeable, thorough, pleasant and treat clients with respect."</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="testimonial-card text-center mx-auto" style="max-width: 600px;">
                                <div class="text-neon mb-3 fs-4">★★★★★</div>
                                <h4 class="fw-bold mb-3">Web Oceanx as an alternative</h4>
                                <p class="opacity-75 lead mb-4">"I had tons of troubles with my previous host and decided to move 6 months earlier. Web Oceanx was a price match but I was also looking for cPanel and cPanel migration and a few other features. I am super happy with the speed of my websites."</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="testimonial-card text-center mx-auto" style="max-width: 600px;">
                                <div class="text-neon mb-3 fs-4">★★★★★</div>
                                <h4 class="fw-bold mb-3">This is my second Reseller</h4>
                                <p class="opacity-75 lead mb-4">"This is my second Reseller program, along with maintaining a few individual sites for friends, and I'm again glad I've gone with Web Oceanx. I've had a few hiccups on my end but the important thing, your people have been incredibly helpful."</p>
                            </div>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="prev" style="width: 5%;">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="next" style="width: 5%;">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                    <div class="carousel-indicators position-relative mt-4">
                        <button type="button" data-bs-target="#testimonialCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#testimonialCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#testimonialCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Announcements Section -->
{if $announcements}
<section class="py-5 bg-light">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="fw-bold m-0">Latest News & Announcements</h3>
            <a href="{$WEB_ROOT}/announcements" class="text-success text-decoration-none fw-bold">View all <i class="bi bi-arrow-right"></i></a>
        </div>
        <div class="row g-4">
            {foreach $announcements as $announcement}
                {if $announcement@iteration <= 3}
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm h-100 rounded-4 hover-lift">
                        <div class="card-body p-4">
                            <div class="text-muted small mb-2"><i class="bi bi-calendar3 me-1"></i> {$announcement.date}</div>
                            <h5 class="fw-bold mb-3">{$announcement.title}</h5>
                            <p class="text-muted small mb-4">{$announcement.text|strip_tags|truncate:100:"..."}</p>
                            <a href="{if $seofriendlyurls}{$WEB_ROOT}/announcements/{$announcement.id}/{$announcement.urlfriendlytitle}.html{else}{$WEB_ROOT}/announcements.php?id={$announcement.id}{/if}" class="text-success text-decoration-none fw-bold stretched-link">Read more</a>
                        </div>
                    </div>
                </div>
                {/if}
            {/foreach}
        </div>
    </div>
</section>
{/if}

<!-- FAQ Section -->
<section class="py-5 bg-white">
    <div class="container">
        <div class="text-center mb-5">
            <h2 class="fw-bold">Frequently Asked Questions</h2>
            <p class="text-muted">Everything you need to know about our hosting services.</p>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="accordion" id="faqAccordion">
                    <div class="accordion-item border-0 shadow-sm mb-3 rounded">
                        <h2 class="accordion-header">
                            <button class="accordion-button fw-bold rounded" type="button" data-bs-toggle="collapse" data-bs-target="#faq1">
                                What is shared hosting?
                            </button>
                        </h2>
                        <div id="faq1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                            <div class="accordion-body text-muted">
                                Shared hosting is a type of web hosting where multiple websites share a single physical server and its resources. It's the most cost-effective way to get your site online.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item border-0 shadow-sm mb-3 rounded">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed fw-bold rounded" type="button" data-bs-toggle="collapse" data-bs-target="#faq2">
                                Do you offer free website migration?
                            </button>
                        </h2>
                        <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body text-muted">
                                Yes! Our migration experts will move your website from your previous host to Web Oceanx completely free of charge, with zero downtime.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item border-0 shadow-sm mb-3 rounded">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed fw-bold rounded" type="button" data-bs-toggle="collapse" data-bs-target="#faq3">
                                What kind of support do you provide?
                            </button>
                        </h2>
                        <div id="faq3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body text-muted">
                                We offer 24/7/365 support via live chat, support tickets, and phone. Our expert team is always ready to help you with any technical issues.
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item border-0 shadow-sm mb-3 rounded">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed fw-bold rounded" type="button" data-bs-toggle="collapse" data-bs-target="#faq4">
                                Can I upgrade my plan later?
                            </button>
                        </h2>
                        <div id="faq4" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                            <div class="accordion-body text-muted">
                                Absolutely. You can easily upgrade or downgrade your hosting plan at any time directly from your client area, and the resources will be scaled instantly.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Support CTA -->
<div id="support" class="container py-5 my-5">
    <div class="support-section row align-items-center shadow-sm">
        <div class="col-lg-6 p-5">
            <h2 class="display-6 fw-bold mb-4">Tech support? We're always here.</h2>
            <p class="text-muted lead mb-5">Our expert hosting engineers are available 24/7, bringing deep technical knowledge to help you choose the right plan, configure it for peak performance, and keep your site running flawlessly.</p>
            <a href="contact.php" class="btn btn-neon rounded-pill px-5 py-3">Let's talk</a>
        </div>
        <div class="col-lg-6 p-0">
            <img src="https://picsum.photos/seed/support/800/600" alt="Support" class="img-fluid h-100 w-100 object-fit-cover" style="min-height: 400px;">
        </div>
    </div>
</div>

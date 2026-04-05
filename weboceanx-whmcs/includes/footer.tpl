<!-- footer.tpl (includes) -->
<footer class="text-white">
    <div class="container">
        <div class="row g-5">
            <div class="col-lg-4">
                <div class="navbar-brand text-neon fw-bold mb-4 fs-3">
                    <i class="bi bi-cloud-haze2-fill"></i>
                    WEB OCEANX
                </div>
                <p class="text-muted mb-4 opacity-75">Web Oceanx is a leading provider of web hosting, VPS, and dedicated server solutions. We're committed to delivering high-performance, secure, and reliable hosting for businesses of all sizes.</p>
                <div class="d-flex gap-3">
                    <a href="#" class="text-white opacity-50 hover-opacity-100 fs-4"><i class="bi bi-facebook"></i></a>
                    <a href="#" class="text-white opacity-50 hover-opacity-100 fs-4"><i class="bi bi-twitter-x"></i></a>
                    <a href="#" class="text-white opacity-50 hover-opacity-100 fs-4"><i class="bi bi-linkedin"></i></a>
                    <a href="#" class="text-white opacity-50 hover-opacity-100 fs-4"><i class="bi bi-instagram"></i></a>
                </div>
            </div>
            <div class="col-md-4 col-lg-2">
                <h6 class="fw-bold mb-4 text-uppercase tracking-wider">Hosting</h6>
                <ul class="list-unstyled d-flex flex-column gap-2">
                    <li><a href="{$WEB_ROOT}/cart.php?gid=1" class="text-muted text-decoration-none hover-text-neon">Shared Hosting</a></li>
                    <li><a href="{$WEB_ROOT}/cart.php?gid=2" class="text-muted text-decoration-none hover-text-neon">VPS Hosting</a></li>
                    <li><a href="{$WEB_ROOT}/cart.php?gid=3" class="text-muted text-decoration-none hover-text-neon">Dedicated Servers</a></li>
                    <li><a href="{$WEB_ROOT}/cart.php?gid=4" class="text-muted text-decoration-none hover-text-neon">WordPress Hosting</a></li>
                </ul>
            </div>
            <div class="col-md-4 col-lg-2">
                <h6 class="fw-bold mb-4 text-uppercase tracking-wider">Company</h6>
                <ul class="list-unstyled d-flex flex-column gap-2">
                    <li><a href="{$WEB_ROOT}/about.php" class="text-muted text-decoration-none hover-text-neon">About Us</a></li>
                    <li><a href="{$WEB_ROOT}/contact.php" class="text-muted text-decoration-none hover-text-neon">Contact Us</a></li>
                    <li><a href="{$WEB_ROOT}/announcements.php" class="text-muted text-decoration-none hover-text-neon">News</a></li>
                    <li><a href="{$WEB_ROOT}/serverstatus.php" class="text-muted text-decoration-none hover-text-neon">Service Status</a></li>
                </ul>
            </div>
            <div class="col-md-4 col-lg-2">
                <h6 class="fw-bold mb-4 text-uppercase tracking-wider">Support</h6>
                <ul class="list-unstyled d-flex flex-column gap-2">
                    <li><a href="{$WEB_ROOT}/submitticket.php" class="text-muted text-decoration-none hover-text-neon">Open Ticket</a></li>
                    <li><a href="{$WEB_ROOT}/knowledgebase.php" class="text-muted text-decoration-none hover-text-neon">Knowledgebase</a></li>
                    <li><a href="{$WEB_ROOT}/announcements.php" class="text-muted text-decoration-none hover-text-neon">Announcements</a></li>
                    <li><a href="{$WEB_ROOT}/contact.php" class="text-muted text-decoration-none hover-text-neon">Contact Us</a></li>
                </ul>
            </div>
            <div class="col-md-4 col-lg-4">
                <h6 class="fw-bold mb-4 text-uppercase tracking-wider">Newsletter</h6>
                <p class="text-muted small mb-4">Subscribe to our newsletter to receive the latest updates and special offers directly in your inbox.</p>
                <div class="input-group mb-3">
                    <input type="email" class="form-control bg-dark border-0 rounded-start-pill px-4" placeholder="Email Address">
                    <button class="btn btn-neon rounded-end-pill px-4" type="button">Join</button>
                </div>
            </div>
        </div>
        <hr class="my-5 bg-secondary opacity-25">
        <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-start">
                <p class="text-muted small mb-0">© 2026 {$companyname}. All rights reserved.</p>
            </div>
            <div class="col-md-6 text-center text-md-end mt-3 mt-md-0">
                <div class="d-flex justify-content-center justify-content-md-end gap-4">
                    <a href="#" class="text-muted text-decoration-none small hover-text-neon">Terms of Service</a>
                    <a href="#" class="text-muted text-decoration-none small hover-text-neon">Privacy Policy</a>
                    <a href="#" class="text-muted text-decoration-none small hover-text-neon">Sitemap</a>
                    <a href="{$WEB_ROOT}/contact.php" class="text-muted text-decoration-none small hover-text-neon">Contact Us</a>
                </div>
            </div>
        </div>
    </div>
</footer>

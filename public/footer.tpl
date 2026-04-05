{if $templatefile != 'homepage' && $templatefile != 'login' && $templatefile != 'register'}
            <!-- Main Content Ends Here -->
        </div>
    </div>
</section>
{/if}

{if $templatefile != 'login' && $templatefile != 'register'}
<footer class="bg-dark-green py-5 mt-5 text-white">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-4">
                <a class="navbar-brand text-white fw-bold fs-4 d-flex align-items-center gap-2 mb-4" href="{$WEB_ROOT}/index.php">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M12 2L2 7L12 12L22 7L12 2Z" fill="#00ff66"/>
                        <path d="M2 17L12 22L22 17" stroke="#00ff66" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                        <path d="M2 12L17L22 12" stroke="#00ff66" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                    Web Oceanx
                </a>
                <p class="opacity-75 mb-4">Web Oceanx is a leading provider of high-performance hosting solutions, dedicated to helping businesses grow with secure, scalable, and reliable infrastructure.</p>
                <div class="social-links d-flex gap-3">
                    <a href="#" class="text-white opacity-75 hover-neon"><i class="bi bi-facebook fs-5"></i></a>
                    <a href="#" class="text-white opacity-75 hover-neon"><i class="bi bi-twitter-x fs-5"></i></a>
                    <a href="#" class="text-white opacity-75 hover-neon"><i class="bi bi-linkedin fs-5"></i></a>
                    <a href="#" class="text-white opacity-75 hover-neon"><i class="bi bi-instagram fs-5"></i></a>
                </div>
            </div>
            <div class="col-6 col-lg-2">
                <h6 class="fw-bold mb-4 text-neon">Hosting</h6>
                <ul class="list-unstyled opacity-75">
                    <li class="mb-2"><a href="{$WEB_ROOT}/store/hosting" class="text-white text-decoration-none">Shared Hosting</a></li>
                    <li class="mb-2"><a href="{$WEB_ROOT}/store/vps" class="text-white text-decoration-none">VPS Hosting</a></li>
                    <li class="mb-2"><a href="{$WEB_ROOT}/domainservices.php" class="text-white text-decoration-none">Managed Domains</a></li>
                    <li class="mb-2"><a href="{$WEB_ROOT}/store/dedicated" class="text-white text-decoration-none">Dedicated Servers</a></li>
                </ul>
            </div>
            <div class="col-6 col-lg-2">
                <h6 class="fw-bold mb-4 text-neon">Company</h6>
                <ul class="list-unstyled opacity-75">
                    <li class="mb-2"><a href="{$WEB_ROOT}/about" class="text-white text-decoration-none">About Us</a></li>
                    <li class="mb-2"><a href="{$WEB_ROOT}/contact.php" class="text-white text-decoration-none">Contact Us</a></li>
                    <li class="mb-2"><a href="{$WEB_ROOT}/announcements" class="text-white text-decoration-none">News</a></li>
                    <li class="mb-2"><a href="{$WEB_ROOT}/serverstatus.php" class="text-white text-decoration-none">Service Status</a></li>
                </ul>
            </div>
            <div class="col-lg-4">
                <h6 class="fw-bold mb-4 text-neon">Newsletter</h6>
                <p class="opacity-75 mb-4">Subscribe to our newsletter for the latest updates and exclusive offers.</p>
                <form class="d-flex gap-2">
                    <input type="email" class="form-control bg-primary-green border-0 text-white placeholder-white opacity-75" placeholder="Email Address">
                    <button type="submit" class="btn btn-neon px-4">Join</button>
                </form>
            </div>
        </div>
        <hr class="my-5 opacity-25">
        <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-start">
                <p class="mb-0 opacity-75">&copy; {$date_year} {$companyname}. All Rights Reserved.</p>
            </div>
            <div class="col-md-6 text-center text-md-end mt-3 mt-md-0">
                <a href="#" class="text-white text-decoration-none opacity-75 me-3">Terms of Service</a>
                <a href="#" class="text-white text-decoration-none opacity-75">Privacy Policy</a>
            </div>
        </div>
    </div>
</footer>

{$footeroutput}

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="{$WEB_ROOT}/templates/{$template}/script.js"></script>

</body>
</html>

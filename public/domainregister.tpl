{include file="$template/header.tpl"}

<div class="container-fluid px-lg-5 py-5">
    <div class="row justify-content-center mb-5">
        <div class="col-lg-8 text-center">
            <h1 class="display-4 fw-bold mb-3">Register Your <span class="text-success">New Domain</span></h1>
            <p class="text-muted lead">Secure your unique identity on the web with WebOceanX. Fast, reliable, and secure domain registration.</p>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="card border-0 shadow-lg rounded-4 p-4 p-md-5 bg-white">
                <form method="post" action="domainchecker.php?search=register" class="row g-4">
                    <div class="col-md-12">
                        <label class="form-label fw-bold fs-5">Search for a New Domain</label>
                        <div class="input-group input-group-lg shadow-sm rounded-pill overflow-hidden">
                            <span class="input-group-text bg-light border-0 ps-4 pe-3">
                                <i class="bi bi-plus-circle text-success"></i>
                            </span>
                            <input type="text" name="domain" class="form-control bg-light border-0 py-3 pe-4" placeholder="Enter your desired domain name" value="{$domain}" required autofocus>
                            <button type="submit" class="btn btn-neon px-5 fw-bold">Check Availability</button>
                        </div>
                    </div>
                    
                    <div class="col-md-12 mt-5">
                        <h4 class="fw-bold mb-4">Why Register with <span class="text-success">WebOceanX?</span></h4>
                        <div class="row g-4">
                            <div class="col-md-4">
                                <div class="d-flex align-items-start gap-3">
                                    <div class="bg-success-subtle text-success rounded-circle p-3">
                                        <i class="bi bi-shield-check fs-4"></i>
                                    </div>
                                    <div>
                                        <h6 class="fw-bold m-0">WHOIS Privacy</h6>
                                        <p class="small text-muted mb-0">Keep your personal information private and secure from spammers.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="d-flex align-items-start gap-3">
                                    <div class="bg-success-subtle text-success rounded-circle p-3">
                                        <i class="bi bi-lightning-charge fs-4"></i>
                                    </div>
                                    <div>
                                        <h6 class="fw-bold m-0">Instant Setup</h6>
                                        <p class="small text-muted mb-0">Your domain is registered instantly as soon as payment is confirmed.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="d-flex align-items-start gap-3">
                                    <div class="bg-success-subtle text-success rounded-circle p-3">
                                        <i class="bi bi-gear fs-4"></i>
                                    </div>
                                    <div>
                                        <h6 class="fw-bold m-0">Full DNS Control</h6>
                                        <p class="small text-muted mb-0">Manage your DNS records easily with our intuitive control panel.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<style>
    .btn-neon { background-color: #00ff66; color: #0a251c; border: none; transition: all 0.3s ease; }
    .btn-neon:hover { background-color: #00e65c; }
    .bg-success-subtle { background-color: rgba(0, 255, 102, 0.1); }
</style>

{include file="$template/footer.tpl"}

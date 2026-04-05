{* aitools.tpl - AI Tools Dashboard for WHMCS Addon *}

<div class="container-fluid px-lg-5 py-5">
    <!-- Header Section -->
    <div class="row mb-5 align-items-center">
        <div class="col-lg-8">
            <h1 class="display-5 fw-bold mb-2">AI <span class="text-success">Tools</span> Dashboard</h1>
            <p class="text-muted lead mb-0">Unleash your creativity with our suite of AI-powered design and branding tools.</p>
        </div>
        <div class="col-lg-4 text-lg-end mt-4 mt-lg-0">
            <div class="d-inline-flex align-items-center bg-dark-green text-white rounded-pill px-4 py-2 gap-3 shadow-sm">
                <div class="d-flex flex-column text-start">
                    <span class="text-neon x-small fw-bold text-uppercase">Available Credits</span>
                    <span class="fw-bold h4 mb-0" id="aiCreditsDisplay">{$ai_credits|default:'0'}</span>
                </div>
                <div class="vr opacity-25"></div>
                <a href="cart.php?a=add&pid=AI_CREDITS_PID" class="btn btn-sm btn-neon rounded-pill px-3 fw-bold text-dark">Buy More</a>
            </div>
        </div>
    </div>

    <!-- Tools Grid -->
    <div class="row g-4">
        <!-- AI Logo Generator -->
        <div class="col-md-6 col-lg-4">
            <div class="card border-0 shadow-sm rounded-4 overflow-hidden h-100 hover-lift">
                <div class="position-relative">
                    <img src="https://picsum.photos/seed/logo/600/300" class="card-img-top" alt="Logo Generator">
                    <div class="position-absolute top-0 end-0 m-3">
                        <span class="badge bg-dark-green text-neon rounded-pill px-3 py-2 fw-bold shadow-sm">10 Credits</span>
                    </div>
                </div>
                <div class="card-body p-4">
                    <div class="d-flex align-items-center gap-2 mb-3">
                        <div class="bg-primary-green bg-opacity-10 text-success rounded-circle p-2">
                            <i class="bi bi-palette fs-5"></i>
                        </div>
                        <h5 class="fw-bold m-0">AI Logo Generator</h5>
                    </div>
                    <p class="text-muted small mb-4">Generate professional, high-quality logos for your brand in seconds. Choose from multiple styles and layouts.</p>
                    <a href="index.php?m=aitools&action=logo" class="btn btn-outline-success w-100 rounded-pill py-2 fw-bold">Launch Tool</a>
                </div>
            </div>
        </div>

        <!-- Business Name Generator -->
        <div class="col-md-6 col-lg-4">
            <div class="card border-0 shadow-sm rounded-4 overflow-hidden h-100 hover-lift">
                <div class="position-relative">
                    <img src="https://picsum.photos/seed/name/600/300" class="card-img-top" alt="Name Generator">
                    <div class="position-absolute top-0 end-0 m-3">
                        <span class="badge bg-dark-green text-neon rounded-pill px-3 py-2 fw-bold shadow-sm">5 Credits</span>
                    </div>
                </div>
                <div class="card-body p-4">
                    <div class="d-flex align-items-center gap-2 mb-3">
                        <div class="bg-primary-green bg-opacity-10 text-success rounded-circle p-2">
                            <i class="bi bi-tag fs-5"></i>
                        </div>
                        <h5 class="fw-bold m-0">Business Name Generator</h5>
                    </div>
                    <p class="text-muted small mb-4">Find the perfect name for your next big idea. Includes domain availability checks and brandability scores.</p>
                    <a href="index.php?m=aitools&action=name" class="btn btn-outline-success w-100 rounded-pill py-2 fw-bold">Launch Tool</a>
                </div>
            </div>
        </div>

        <!-- Branding Generator -->
        <div class="col-md-6 col-lg-4">
            <div class="card border-0 shadow-sm rounded-4 overflow-hidden h-100 hover-lift">
                <div class="position-relative">
                    <img src="https://picsum.photos/seed/brand/600/300" class="card-img-top" alt="Branding Generator">
                    <div class="position-absolute top-0 end-0 m-3">
                        <span class="badge bg-dark-green text-neon rounded-pill px-3 py-2 fw-bold shadow-sm">25 Credits</span>
                    </div>
                </div>
                <div class="card-body p-4">
                    <div class="d-flex align-items-center gap-2 mb-3">
                        <div class="bg-primary-green bg-opacity-10 text-success rounded-circle p-2">
                            <i class="bi bi-briefcase fs-5"></i>
                        </div>
                        <h5 class="fw-bold m-0">AI Branding Generator</h5>
                    </div>
                    <p class="text-muted small mb-4">Create a complete brand identity including color palettes, typography, and brand voice guidelines.</p>
                    <a href="index.php?m=aitools&action=branding" class="btn btn-outline-success w-100 rounded-pill py-2 fw-bold">Launch Tool</a>
                </div>
            </div>
        </div>

        <!-- AI Site Builder -->
        <div class="col-md-6 col-lg-4">
            <div class="card border-0 shadow-sm rounded-4 overflow-hidden h-100 hover-lift">
                <div class="position-relative">
                    <img src="https://picsum.photos/seed/site/600/300" class="card-img-top" alt="Site Builder">
                    <div class="position-absolute top-0 end-0 m-3">
                        <span class="badge bg-dark-green text-neon rounded-pill px-3 py-2 fw-bold shadow-sm">50 Credits</span>
                    </div>
                </div>
                <div class="card-body p-4">
                    <div class="d-flex align-items-center gap-2 mb-3">
                        <div class="bg-primary-green bg-opacity-10 text-success rounded-circle p-2">
                            <i class="bi bi-window-sidebar fs-5"></i>
                        </div>
                        <h5 class="fw-bold m-0">AI Site Builder</h5>
                    </div>
                    <p class="text-muted small mb-4">Build and deploy a fully functional website in minutes. Just describe your business and let AI do the rest.</p>
                    <a href="index.php?m=aitools&action=site" class="btn btn-outline-success w-100 rounded-pill py-2 fw-bold">Launch Tool</a>
                </div>
            </div>
        </div>

        <!-- AI Image Generator -->
        <div class="col-md-6 col-lg-4">
            <div class="card border-0 shadow-sm rounded-4 overflow-hidden h-100 hover-lift">
                <div class="position-relative">
                    <img src="https://picsum.photos/seed/image/600/300" class="card-img-top" alt="Image Generator">
                    <div class="position-absolute top-0 end-0 m-3">
                        <span class="badge bg-dark-green text-neon rounded-pill px-3 py-2 fw-bold shadow-sm">8 Credits</span>
                    </div>
                </div>
                <div class="card-body p-4">
                    <div class="d-flex align-items-center gap-2 mb-3">
                        <div class="bg-primary-green bg-opacity-10 text-success rounded-circle p-2">
                            <i class="bi bi-image fs-5"></i>
                        </div>
                        <h5 class="fw-bold m-0">AI Image Generator</h5>
                    </div>
                    <p class="text-muted small mb-4">Turn your text prompts into stunning visual art. Perfect for website content, social media, and more.</p>
                    <a href="index.php?m=aitools&action=image" class="btn btn-outline-success w-100 rounded-pill py-2 fw-bold">Launch Tool</a>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .hover-lift { transition: transform 0.2s ease; }
    .hover-lift:hover { transform: translateY(-5px); }
    .x-small { font-size: 0.75rem; }
</style>

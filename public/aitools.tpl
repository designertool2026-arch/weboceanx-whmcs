{include file="$template/header.tpl"}

<div class="container py-5">
    <div class="row justify-content-center mb-5">
        <div class="col-lg-10 text-center">
            <h1 class="display-4 fw-bold mb-3">AI <span class="text-success">Tools Dashboard</span></h1>
            <p class="text-muted lead">Empower your brand with our suite of AI-powered business tools. Generate names, logos, and entire websites in seconds.</p>
            
            <div class="d-inline-flex align-items-center bg-light rounded-pill px-4 py-2 mt-3 shadow-sm">
                <i class="bi bi-coin text-warning me-2 fs-5"></i>
                <span class="fw-bold me-2">Your Credits:</span>
                <span id="userCreditsDisplay" class="text-success fw-bold">Loading...</span>
                <a href="clientarea.php?action=addfunds" class="ms-3 text-decoration-none small fw-bold text-primary">Top Up <i class="bi bi-plus-circle"></i></a>
            </div>
        </div>
    </div>

    <div class="row g-4">
        <!-- Business Name Generator -->
        <div class="col-md-6 col-lg-4">
            <div class="card border-0 shadow-sm rounded-5 p-4 h-100 hover-lift glass-card">
                <div class="icon-box bg-success-subtle text-success rounded-4 p-3 mb-4 h-fit w-fit">
                    <i class="bi bi-lightbulb fs-3"></i>
                </div>
                <h5 class="fw-bold mb-2">Business Name Generator</h5>
                <p class="text-muted small mb-4">Find the perfect name for your next venture with AI-driven suggestions and domain checks.</p>
                <div class="d-flex justify-content-between align-items-center mt-auto">
                    <span class="badge bg-light text-dark rounded-pill px-3 py-2"><i class="bi bi-coin text-warning me-1"></i> 5 Credits</span>
                    <a href="businessnamegenerator.php" class="btn btn-neon rounded-pill px-4 fw-bold shadow-sm">Launch Tool</a>
                </div>
            </div>
        </div>

        <!-- AI Logo Generator -->
        <div class="col-md-6 col-lg-4">
            <div class="card border-0 shadow-sm rounded-5 p-4 h-100 hover-lift glass-card">
                <div class="icon-box bg-primary-subtle text-primary rounded-4 p-3 mb-4 h-fit w-fit">
                    <i class="bi bi-brush fs-3"></i>
                </div>
                <h5 class="fw-bold mb-2">AI Logo Generator</h5>
                <p class="text-muted small mb-4">Create professional, high-quality logos for your brand instantly using advanced AI models.</p>
                <div class="d-flex justify-content-between align-items-center mt-auto">
                    <span class="badge bg-light text-dark rounded-pill px-3 py-2"><i class="bi bi-coin text-warning me-1"></i> 10 Credits</span>
                    <a href="ailogogenerator.php" class="btn btn-neon rounded-pill px-4 fw-bold shadow-sm">Launch Tool</a>
                </div>
            </div>
        </div>

        <!-- Branding Generator -->
        <div class="col-md-6 col-lg-4">
            <div class="card border-0 shadow-sm rounded-5 p-4 h-100 hover-lift glass-card">
                <div class="icon-box bg-warning-subtle text-warning rounded-4 p-3 mb-4 h-fit w-fit">
                    <i class="bi bi-palette fs-3"></i>
                </div>
                <h5 class="fw-bold mb-2">Branding Generator</h5>
                <p class="text-muted small mb-4">Generate a complete brand kit including colors, typography, and voice guidelines.</p>
                <div class="d-flex justify-content-between align-items-center mt-auto">
                    <span class="badge bg-light text-dark rounded-pill px-3 py-2"><i class="bi bi-coin text-warning me-1"></i> 25 Credits</span>
                    <a href="brandinggenerator.php" class="btn btn-neon rounded-pill px-4 fw-bold shadow-sm">Launch Tool</a>
                </div>
            </div>
        </div>

        <!-- AI Site Builder -->
        <div class="col-md-6 col-lg-4">
            <div class="card border-0 shadow-sm rounded-5 p-4 h-100 hover-lift glass-card">
                <div class="icon-box bg-info-subtle text-info rounded-4 p-3 mb-4 h-fit w-fit">
                    <i class="bi bi-window-sidebar fs-3"></i>
                </div>
                <h5 class="fw-bold mb-2">AI Site Builder</h5>
                <p class="text-muted small mb-4">Build and deploy a fully functional website with AI-generated content and templates.</p>
                <div class="d-flex justify-content-between align-items-center mt-auto">
                    <span class="badge bg-light text-dark rounded-pill px-3 py-2"><i class="bi bi-coin text-warning me-1"></i> 50 Credits</span>
                    <a href="aisitebuilder.php" class="btn btn-neon rounded-pill px-4 fw-bold shadow-sm">Launch Tool</a>
                </div>
            </div>
        </div>

        <!-- AI Image Generator -->
        <div class="col-md-6 col-lg-4">
            <div class="card border-0 shadow-sm rounded-5 p-4 h-100 hover-lift glass-card">
                <div class="icon-box bg-danger-subtle text-danger rounded-4 p-3 mb-4 h-fit w-fit">
                    <i class="bi bi-image fs-3"></i>
                </div>
                <h5 class="fw-bold mb-2">AI Image Generator</h5>
                <p class="text-muted small mb-4">Generate stunning visuals from text prompts for your website and marketing materials.</p>
                <div class="d-flex justify-content-between align-items-center mt-auto">
                    <span class="badge bg-light text-dark rounded-pill px-3 py-2"><i class="bi bi-coin text-warning me-1"></i> 8 Credits</span>
                    <a href="aiimagegenerator.php" class="btn btn-neon rounded-pill px-4 fw-bold shadow-sm">Launch Tool</a>
                </div>
            </div>
        </div>

        <!-- Website Request Builder -->
        <div class="col-md-6 col-lg-4">
            <div class="card border-0 shadow-sm rounded-5 p-4 h-100 hover-lift glass-card">
                <div class="icon-box bg-secondary-subtle text-secondary rounded-4 p-3 mb-4 h-fit w-fit">
                    <i class="bi bi-file-earmark-text fs-3"></i>
                </div>
                <h5 class="fw-bold mb-2">Website Request Builder</h5>
                <p class="text-muted small mb-4">Generate a professional project brief for custom website development requests.</p>
                <div class="d-flex justify-content-between align-items-center mt-auto">
                    <span class="badge bg-light text-dark rounded-pill px-3 py-2"><i class="bi bi-coin text-warning me-1"></i> 10 Credits</span>
                    <a href="submitticket.php?step=2&deptid=1" class="btn btn-neon rounded-pill px-4 fw-bold shadow-sm">Launch Tool</a>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}

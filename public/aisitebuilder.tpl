{include file="$template/header.tpl"}

<div class="container py-5">
    <div class="row justify-content-center mb-5">
        <div class="col-lg-8 text-center">
            <h1 class="display-4 fw-bold mb-3">AI <span class="text-success">Site Builder</span></h1>
            <p class="text-muted lead">Build and deploy a fully functional website with AI-generated content and templates. Perfect for landing pages, portfolios, and small business sites.</p>
            
            <div class="d-inline-flex align-items-center bg-light rounded-pill px-4 py-2 mt-3 shadow-sm">
                <i class="bi bi-coin text-warning me-2 fs-5"></i>
                <span class="fw-bold me-2">Your Credits:</span>
                <span id="userCreditsDisplay" class="text-success fw-bold">Loading...</span>
            </div>
        </div>
    </div>

    <div class="row g-5">
        <!-- Configuration Sidebar -->
        <div class="col-lg-4">
            <div class="card border-0 shadow-lg rounded-5 p-4 glass-card sticky-top" style="top: 100px;">
                <h5 class="fw-bold mb-4">Configure Website</h5>
                
                <form id="siteBuilderForm">
                    <!-- Website Type -->
                    <div class="mb-4">
                        <label for="siteType" class="form-label fw-bold small">Website Type</label>
                        <select id="siteType" class="form-select rounded-pill border-0 bg-light px-4 py-2" required>
                            <option value="Landing Page">Landing Page</option>
                            <option value="Portfolio">Portfolio</option>
                            <option value="Small Business">Small Business</option>
                            <option value="Blog">Blog</option>
                            <option value="E-commerce">E-commerce</option>
                        </select>
                    </div>

                    <!-- Template Selection -->
                    <div class="mb-4">
                        <label for="template" class="form-label fw-bold small">Template Selection</label>
                        <select id="template" class="form-select rounded-pill border-0 bg-light px-4 py-2">
                            <option value="Modern & Clean">Modern & Clean</option>
                            <option value="Dark & Bold">Dark & Bold</option>
                            <option value="Minimalist">Minimalist</option>
                            <option value="Vibrant & Creative">Vibrant & Creative</option>
                        </select>
                    </div>

                    <!-- Business Description -->
                    <div class="mb-4">
                        <label for="businessDesc" class="form-label fw-bold small">Business Description</label>
                        <textarea id="businessDesc" class="form-control rounded-4 border-0 bg-light px-4 py-3" rows="4" placeholder="Describe your business and goals..." required></textarea>
                    </div>

                    <button type="submit" id="generateSiteBtn" class="btn btn-neon w-100 rounded-pill py-3 fw-bold shadow-lg mt-3">
                        <i class="bi bi-window-sidebar me-2"></i> Build Website (50 Credits)
                    </button>
                </form>
            </div>
        </div>

        <!-- Results Area -->
        <div class="col-lg-8">
            <div id="siteBuilderResultContainer" class="card border-0 shadow-lg rounded-5 p-5 glass-card h-100 min-vh-50">
                <div id="emptyState" class="text-center py-5">
                    <div class="icon-box bg-light rounded-circle p-4 mb-4 mx-auto w-fit">
                        <i class="bi bi-window-sidebar fs-1 text-muted"></i>
                    </div>
                    <h4 class="fw-bold">Your Website Preview Will Appear Here</h4>
                    <p class="text-muted">Fill out the form and click generate to see a complete website preview.</p>
                </div>

                <div id="loadingState" class="text-center d-none py-5">
                    <div class="spinner-border text-success mb-4" role="status" style="width: 3rem; height: 3rem;">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                    <h4 class="fw-bold">Building Your Site...</h4>
                    <p class="text-muted">Our AI is generating content, creating pages, and setting up your hosting environment.</p>
                </div>

                <div id="resultState" class="d-none">
                    <div class="d-flex justify-content-between align-items-center mb-5">
                        <h4 class="fw-bold m-0">Website Preview</h4>
                        <div class="d-flex gap-2">
                            <button id="deployBtn" class="btn btn-neon rounded-pill px-4 fw-bold shadow-sm">
                                <i class="bi bi-rocket-takeoff me-2"></i> Deploy to Hosting
                            </button>
                            <button id="connectDomainBtn" class="btn btn-outline-dark rounded-pill px-4 fw-bold">
                                <i class="bi bi-globe me-2"></i> Connect Domain
                            </button>
                        </div>
                    </div>
                    
                    <div class="browser-mockup border rounded-4 overflow-hidden shadow-lg bg-white">
                        <div class="browser-header bg-light p-2 d-flex align-items-center gap-2 border-bottom">
                            <div class="d-flex gap-1">
                                <span class="bg-danger rounded-circle" style="width: 10px; height: 10px;"></span>
                                <span class="bg-warning rounded-circle" style="width: 10px; height: 10px;"></span>
                                <span class="bg-success rounded-circle" style="width: 10px; height: 10px;"></span>
                            </div>
                            <div class="bg-white rounded-pill px-3 py-1 small text-muted flex-grow-1 mx-5 text-center border">
                                https://your-new-site.weboceanx.com
                            </div>
                        </div>
                        <div id="sitePreviewContent" class="p-4 overflow-auto" style="max-height: 500px;">
                            <!-- Site content will be injected here -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}

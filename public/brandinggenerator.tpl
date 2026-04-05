{include file="$template/header.tpl"}

<div class="container py-5">
    <div class="row justify-content-center mb-5">
        <div class="col-lg-8 text-center">
            <h1 class="display-4 fw-bold mb-3">AI <span class="text-success">Branding Generator</span></h1>
            <p class="text-muted lead">Generate a complete brand kit including colors, typography, and voice guidelines. Perfect for new startups and rebranding projects.</p>
            
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
                <h5 class="fw-bold mb-4">Configure Brand Kit</h5>
                
                <form id="brandingForm">
                    <!-- Brand Name -->
                    <div class="mb-4">
                        <label for="brandName" class="form-label fw-bold small">Brand Name</label>
                        <input type="text" id="brandName" class="form-control rounded-pill border-0 bg-light px-4 py-2" placeholder="e.g. WebOceanX" required>
                    </div>

                    <!-- Brand Personality -->
                    <div class="mb-4">
                        <label for="brandPersonality" class="form-label fw-bold small">Brand Personality</label>
                        <select id="brandPersonality" class="form-select rounded-pill border-0 bg-light px-4 py-2">
                            <option value="Innovative & Bold">Innovative & Bold</option>
                            <option value="Trustworthy & Stable">Trustworthy & Stable</option>
                            <option value="Friendly & Approachable">Friendly & Approachable</option>
                            <option value="Luxury & Elegant">Luxury & Elegant</option>
                            <option value="Minimalist & Clean">Minimalist & Clean</option>
                        </select>
                    </div>

                    <!-- Brand Voice -->
                    <div class="mb-4">
                        <label for="brandVoice" class="form-label fw-bold small">Brand Voice</label>
                        <select id="brandVoice" class="form-select rounded-pill border-0 bg-light px-4 py-2">
                            <option value="Professional">Professional</option>
                            <option value="Witty">Witty</option>
                            <option value="Inspirational">Inspirational</option>
                            <option value="Direct">Direct</option>
                            <option value="Empathetic">Empathetic</option>
                        </select>
                    </div>

                    <button type="submit" id="generateBrandingBtn" class="btn btn-neon w-100 rounded-pill py-3 fw-bold shadow-lg mt-3">
                        <i class="bi bi-palette me-2"></i> Generate Brand Kit (25 Credits)
                    </button>
                </form>
            </div>
        </div>

        <!-- Results Area -->
        <div class="col-lg-8">
            <div id="brandingResultContainer" class="card border-0 shadow-lg rounded-5 p-5 glass-card h-100 min-vh-50">
                <div id="emptyState" class="text-center py-5">
                    <div class="icon-box bg-light rounded-circle p-4 mb-4 mx-auto w-fit">
                        <i class="bi bi-book fs-1 text-muted"></i>
                    </div>
                    <h4 class="fw-bold">Your Brand Kit Will Appear Here</h4>
                    <p class="text-muted">Fill out the form and click generate to see a complete brand identity.</p>
                </div>

                <div id="loadingState" class="text-center d-none py-5">
                    <div class="spinner-border text-success mb-4" role="status" style="width: 3rem; height: 3rem;">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                    <h4 class="fw-bold">Crafting Your Identity...</h4>
                    <p class="text-muted">Our AI is designing your brand colors, typography, and voice guidelines.</p>
                </div>

                <div id="resultState" class="d-none">
                    <div class="d-flex justify-content-between align-items-center mb-5">
                        <h4 class="fw-bold m-0">Brand Identity Kit</h4>
                        <button id="downloadPdfBtn" class="btn btn-neon rounded-pill px-4 fw-bold shadow-sm">
                            <i class="bi bi-file-earmark-pdf me-2"></i> Download Brand Guidelines (PDF)
                        </button>
                    </div>
                    
                    <div class="row g-4">
                        <!-- Brand Colors -->
                        <div class="col-md-6">
                            <h6 class="fw-bold mb-3">Brand Colors</h6>
                            <div id="colorPalette" class="d-flex gap-2 mb-4">
                                <!-- Colors will be injected here -->
                            </div>
                        </div>
                        
                        <!-- Typography -->
                        <div class="col-md-6">
                            <h6 class="fw-bold mb-3">Typography Suggestions</h6>
                            <div id="typographyList" class="mb-4">
                                <!-- Typography will be injected here -->
                            </div>
                        </div>

                        <!-- Brand Voice & Personality -->
                        <div class="col-12">
                            <div class="p-4 rounded-4 bg-light">
                                <h6 class="fw-bold mb-3">Brand Voice & Personality</h6>
                                <p id="brandVoiceDesc" class="text-muted mb-0"></p>
                            </div>
                        </div>

                        <!-- Logo Style Direction -->
                        <div class="col-12">
                            <div class="p-4 rounded-4 bg-light">
                                <h6 class="fw-bold mb-3">Logo Style Direction</h6>
                                <p id="logoStyleDesc" class="text-muted mb-0"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{include file="$template/footer.tpl"}

<style>
    .wo-config-wrapper {
        display: flex;
        min-height: 100vh;
        font-family: 'Inter', sans-serif;
        background: #fff;
    }

    /* Left Sidebar */
    .wo-config-sidebar {
        width: 35%;
        background-color: #f0fdf4; /* Light green */
        padding: 3rem;
        display: flex;
        flex-direction: column;
        position: relative;
    }

    .wo-config-logo {
        display: flex;
        align-items: center;
        font-size: 1.5rem;
        font-weight: 700;
        color: #111827;
        text-decoration: none;
        margin-bottom: 4rem;
    }

    .wo-config-logo svg {
        color: #111827;
    }

    .wo-product-title {
        font-size: 2.5rem;
        font-weight: 400;
        color: #111827;
        margin-bottom: 0.5rem;
    }

    .wo-product-price {
        color: #4b5563;
        font-size: 1rem;
        margin-bottom: 2rem;
    }

    .wo-product-features {
        list-style: none;
        padding: 0;
        margin: 0 0 3rem 0;
        color: #4b5563;
        font-size: 0.95rem;
        line-height: 1.8;
    }

    .wo-product-features li::before {
        content: "•";
        color: #9ca3af;
        margin-right: 0.5rem;
    }

    .wo-summary-box {
        margin-top: auto;
    }

    .wo-summary-title {
        font-weight: 600;
        color: #111827;
        margin-bottom: 1.5rem;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .wo-summary-item {
        display: flex;
        justify-content: space-between;
        margin-bottom: 0.75rem;
        font-size: 0.9rem;
        color: #4b5563;
    }

    .wo-summary-item span:last-child {
        color: #111827;
        font-weight: 500;
    }

    .wo-total-box {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 3rem;
        padding-top: 2rem;
        border-top: 1px solid rgba(0,0,0,0.05);
    }

    .wo-total-label {
        font-size: 1.25rem;
        font-weight: 600;
        color: #111827;
    }

    .wo-total-price {
        font-size: 1.75rem;
        font-weight: 700;
        color: #111827;
    }

    /* Right Content Area */
    .wo-config-content {
        width: 65%;
        padding: 3rem 4rem;
        overflow-y: auto;
        position: relative;
    }

    .wo-section-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 2rem;
        padding-bottom: 1rem;
        border-bottom: 1px solid #f3f4f6;
    }

    .wo-section-title {
        font-size: 1.1rem;
        font-weight: 600;
        color: #111827;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .wo-config-group {
        margin-bottom: 3rem;
    }

    .wo-config-label {
        font-size: 0.9rem;
        font-weight: 600;
        color: #374151;
        margin-bottom: 1rem;
        display: block;
    }

    .wo-config-label span {
        color: #ef4444;
    }

    /* Grid Options */
    .wo-options-grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 1rem;
    }

    .wo-option-card {
        border: 1px solid #e5e7eb;
        border-radius: 8px;
        padding: 1.5rem;
        cursor: pointer;
        transition: all 0.2s;
        position: relative;
    }

    .wo-option-card:hover {
        border-color: #d1d5db;
    }

    .wo-option-card.active {
        border-color: #4ade80;
        background-color: #f0fdf4;
    }

    .wo-option-radio {
        position: absolute;
        top: 1.5rem;
        left: 1.5rem;
        accent-color: #22c55e;
    }

    .wo-option-content {
        padding-left: 2rem;
    }

    .wo-option-title {
        font-weight: 600;
        color: #111827;
        margin-bottom: 0.5rem;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .wo-badge {
        background: #e0e7ff;
        color: #4f46e5;
        font-size: 0.7rem;
        padding: 0.1rem 0.5rem;
        border-radius: 12px;
        font-weight: 600;
    }

    .wo-option-price {
        font-size: 1.5rem;
        font-weight: 700;
        color: #111827;
    }

    .wo-option-subprice {
        font-size: 0.8rem;
        color: #6b7280;
        margin-top: 0.25rem;
    }

    /* Small Grid (Locations) */
    .wo-small-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 0.75rem;
    }

    .wo-small-card {
        border: 1px solid #e5e7eb;
        border-radius: 6px;
        padding: 1rem;
        cursor: pointer;
        display: flex;
        align-items: center;
        gap: 0.75rem;
        font-size: 0.9rem;
        color: #374151;
    }

    .wo-small-card.active {
        border-color: #4ade80;
        background-color: #f0fdf4;
    }

    /* Domain Options */
    .wo-domain-options {
        display: flex;
        flex-direction: column;
        gap: 0.5rem;
    }

    .wo-domain-card {
        border: 1px solid #e5e7eb;
        border-radius: 6px;
        padding: 1rem;
    }

    .wo-domain-card.active {
        border-color: #4ade80;
        background-color: #f0fdf4;
    }

    .wo-domain-input-wrap {
        margin-top: 1rem;
        padding-left: 1.5rem;
    }

    .wo-domain-input {
        width: 100%;
        padding: 0.75rem;
        border: 1px solid #d1d5db;
        border-radius: 6px;
        font-size: 0.9rem;
    }

    /* Bottom Actions */
    .wo-actions {
        margin-top: 3rem;
        display: flex;
        justify-content: flex-end;
    }

    .wo-btn-add {
        background: linear-gradient(135deg, #4ade80 0%, #22c55e 100%);
        color: #000;
        border: none;
        padding: 1rem 3rem;
        font-size: 1rem;
        font-weight: 600;
        border-radius: 8px;
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
        cursor: pointer;
        transition: transform 0.2s, box-shadow 0.2s;
        width: 100%;
        justify-content: center;
    }

    .wo-btn-add:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(74, 222, 128, 0.3);
    }

    /* Footer Tools */
    .wo-footer-tools {
        position: absolute;
        bottom: 2rem;
        right: 4rem;
        display: flex;
        gap: 1rem;
    }

    .wo-tool-select {
        padding: 0.5rem 1rem;
        border: 1px solid #e5e7eb;
        border-radius: 6px;
        background: #fff;
        font-size: 0.85rem;
        color: #4b5563;
        display: flex;
        align-items: center;
        gap: 0.5rem;
        cursor: pointer;
    }

    @media (max-width: 992px) {
        .wo-config-wrapper {
            flex-direction: column;
        }
        .wo-config-sidebar, .wo-config-content {
            width: 100%;
        }
        .wo-options-grid, .wo-small-grid {
            grid-template-columns: 1fr;
        }
        .wo-footer-tools {
            position: relative;
            bottom: 0;
            right: 0;
            margin-top: 2rem;
            justify-content: flex-end;
        }
    }
</style>

<div class="wo-config-wrapper">
    <!-- Left Sidebar -->
    <div class="wo-config-sidebar">
        <a href="{$WEB_ROOT}/index.php" class="wo-config-logo">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="me-2">
                <path d="M12 2L2 7L12 12L22 7L12 2Z" fill="currentColor"/>
                <path d="M2 17L12 22L22 17" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M2 12L12 17L22 12" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            Web Oceanx
        </a>

        <h1 class="wo-product-title">{$productinfo.name|default:'Starter'}</h1>
        <div class="wo-product-price">From $3.99 a month <span class="text-decoration-line-through text-muted">Was $11.99</span></div>

        <ul class="wo-product-features">
            <li>1 website</li>
            <li>15GB web space</li>
            <li>Unlimited page views</li>
            <li>Includes FREE .com/.org/.net domain name in the first year.</li>
        </ul>
        <a href="#" class="text-muted text-decoration-underline" style="font-size: 0.85rem;">Show less</a>

        <div class="wo-summary-box">
            <div class="wo-summary-title">
                <i class="bi bi-bag"></i> Configuration summary
            </div>
            <div class="wo-summary-item">
                <span>Shared Hosting</span>
                <span>{$productinfo.name|default:'Starter'}</span>
            </div>
            <div class="wo-summary-item">
                <span>Server Location</span>
                <span>Dallas, TX</span>
            </div>
            <div class="wo-summary-item">
                <span>Billing cycle</span>
                <span>1-year</span>
            </div>
        </div>

        <div class="wo-total-box">
            <span class="wo-total-label">Total</span>
            <span class="wo-total-price">$47.88</span>
        </div>
    </div>

    <!-- Right Content -->
    <div class="wo-config-content">
        <div class="wo-section-header">
            <div class="wo-section-title">
                <i class="bi bi-sliders"></i> Product configuration
            </div>
            <a href="#" class="text-muted text-decoration-none" style="font-size: 0.9rem;"><i class="bi bi-share"></i> Share</a>
        </div>

        <form method="post" action="cart.php?a=add&pid={$productinfo.pid}&viewcart=1">
            
            <!-- Billing Term -->
            <div class="wo-config-group">
                <label class="wo-config-label">Billing Term <span>*</span></label>
                <div class="wo-options-grid">
                    <label class="wo-option-card">
                        <input type="radio" name="billingcycle" value="monthly" class="wo-option-radio">
                        <div class="wo-option-content">
                            <div class="wo-option-title">1-month term</div>
                            <div class="wo-option-price">$13.99</div>
                        </div>
                    </label>
                    <label class="wo-option-card active">
                        <input type="radio" name="billingcycle" value="annually" class="wo-option-radio" checked>
                        <div class="wo-option-content">
                            <div class="wo-option-title">1-year term <span class="wo-badge">Save 67%</span></div>
                            <div class="text-muted text-decoration-line-through" style="font-size: 0.8rem;">$11.99</div>
                            <div class="wo-option-price">$3.99 <span style="font-size: 0.9rem; font-weight: 400;">/ mo</span></div>
                            <div class="wo-option-subprice">Pay $47.88 today.</div>
                        </div>
                    </label>
                    <label class="wo-option-card">
                        <input type="radio" name="billingcycle" value="biennially" class="wo-option-radio">
                        <div class="wo-option-content">
                            <div class="wo-option-title">2-year term <span class="wo-badge">Save 30%</span></div>
                            <div class="text-muted text-decoration-line-through" style="font-size: 0.8rem;">$11.99</div>
                            <div class="wo-option-price">$8.39 <span style="font-size: 0.9rem; font-weight: 400;">/ mo</span></div>
                            <div class="wo-option-subprice">Pay $201.43 today.</div>
                        </div>
                    </label>
                    <label class="wo-option-card">
                        <input type="radio" name="billingcycle" value="triennially" class="wo-option-radio">
                        <div class="wo-option-content">
                            <div class="wo-option-title">3-year term <span class="wo-badge">Save 30%</span></div>
                            <div class="text-muted text-decoration-line-through" style="font-size: 0.8rem;">$11.99</div>
                            <div class="wo-option-price">$8.39 <span style="font-size: 0.9rem; font-weight: 400;">/ mo</span></div>
                            <div class="wo-option-subprice">Pay $302.15 today.</div>
                        </div>
                    </label>
                </div>
            </div>

            <!-- Server Location -->
            <div class="wo-config-group">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <label class="wo-config-label mb-0">Server Location</label>
                    <span class="text-muted" style="font-size: 0.8rem;">Optional</span>
                </div>
                <div class="wo-small-grid">
                    <label class="wo-small-card active">
                        <input type="radio" name="configoption[1]" value="1" class="wo-option-radio" style="position:static" checked>
                        Dallas, TX
                    </label>
                    <label class="wo-small-card">
                        <input type="radio" name="configoption[1]" value="2" class="wo-option-radio" style="position:static">
                        Toronto, CA
                    </label>
                    <label class="wo-small-card">
                        <input type="radio" name="configoption[1]" value="3" class="wo-option-radio" style="position:static">
                        London, UK
                    </label>
                    <label class="wo-small-card">
                        <input type="radio" name="configoption[1]" value="4" class="wo-option-radio" style="position:static">
                        Singapore, SG
                    </label>
                    <label class="wo-small-card">
                        <input type="radio" name="configoption[1]" value="5" class="wo-option-radio" style="position:static">
                        Sydney, AU
                    </label>
                    <label class="wo-small-card">
                        <input type="radio" name="configoption[1]" value="6" class="wo-option-radio" style="position:static">
                        Mexico, MX
                    </label>
                </div>
            </div>

            <!-- Domain Name -->
            <div class="wo-config-group">
                <label class="wo-config-label">Account Domain Name <span>*</span></label>
                <div class="wo-domain-options">
                    <div class="wo-domain-card active">
                        <label class="d-flex align-items-center gap-2 mb-0 cursor-pointer">
                            <input type="radio" name="domainoption" value="register" checked>
                            Register new domain
                        </label>
                        <div class="wo-domain-input-wrap">
                            <input type="text" class="wo-domain-input" placeholder="Search for a domain...">
                        </div>
                    </div>
                    <div class="wo-domain-card">
                        <label class="d-flex align-items-center gap-2 mb-0 cursor-pointer">
                            <input type="radio" name="domainoption" value="transfer">
                            Transfer domain
                        </label>
                    </div>
                    <div class="wo-domain-card">
                        <label class="d-flex align-items-center gap-2 mb-0 cursor-pointer">
                            <input type="radio" name="domainoption" value="owndomain">
                            Use existing domain
                        </label>
                    </div>
                </div>
            </div>

            <div class="wo-actions">
                <button type="submit" class="wo-btn-add">
                    <i class="bi bi-bag"></i> Add to basket
                </button>
            </div>
        </form>

        <!-- Footer Tools -->
        <div class="wo-footer-tools">
            <div class="dropdown">
                <button class="wo-tool-select dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-translate"></i> English (US)
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">English (US)</a></li>
                </ul>
            </div>
            <div class="dropdown">
                <button class="wo-tool-select dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    <img src="https://flagcdn.com/w20/us.png" width="16" alt="USD"> USD
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">USD</a></li>
                    <li><a class="dropdown-item" href="#">EUR</a></li>
                    <li><a class="dropdown-item" href="#">GBP</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<script>
    // Simple script to handle active states for the preview
    document.querySelectorAll('input[type="radio"]').forEach(radio => {
        radio.addEventListener('change', function() {
            const name = this.getAttribute('name');
            document.querySelectorAll(`input[name="${name}"]`).forEach(r => {
                const card = r.closest('.wo-option-card, .wo-small-card, .wo-domain-card');
                if (card) card.classList.remove('active');
            });
            const activeCard = this.closest('.wo-option-card, .wo-small-card, .wo-domain-card');
            if (activeCard) activeCard.classList.add('active');
        });
    });
</script>

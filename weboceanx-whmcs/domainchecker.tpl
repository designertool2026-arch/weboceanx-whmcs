{* domainchecker.tpl *}
<div class="card border-0 shadow-lg rounded-4 overflow-hidden mb-5 bg-dark-green text-white">
    <div class="card-body p-5 text-center">
        <h1 class="display-5 fw-bold mb-4">Find your perfect domain</h1>
        <p class="lead mb-5 opacity-75">Search for a domain name and check its availability instantly.</p>
        
        <form method="post" action="domainchecker.php" class="mx-auto" style="max-width: 800px;">
            <input type="hidden" name="token" value="{$token}" />
            <div class="input-group input-group-lg shadow-lg rounded-pill overflow-hidden border-0 position-relative">
                <input type="text" name="domain" id="domainSearchInput" class="form-control border-0 px-4 py-4 fs-5" placeholder="Enter your domain name (e.g. example.com)" required autocomplete="off">
                <button class="btn btn-gradient px-5 fw-bold" type="submit">Search</button>
                <div id="domainSuggestions" class="position-absolute top-100 start-0 w-100 bg-white shadow-lg rounded-4 mt-2 p-2 d-none" style="z-index: 1000; text-align: left;">
                    <!-- Suggestions will appear here -->
                </div>
            </div>
        </form>

        <div id="liveFeedback" class="mt-3 small fw-bold text-neon d-none">
            <i class="bi bi-search me-1"></i> Checking availability...
        </div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const input = document.getElementById('domainSearchInput');
    const suggestions = document.getElementById('domainSuggestions');
    const feedback = document.getElementById('liveFeedback');
    const extensions = ['.com', '.net', '.org', '.io', '.co', '.info', '.me', '.biz'];
    
    input.addEventListener('input', function() {
        const val = this.value.trim();
        if (val.length > 2) {
            feedback.classList.remove('d-none');
            suggestions.classList.remove('d-none');
            
            let html = '';
            const domainName = val.split('.')[0];
            extensions.forEach((ext, index) => {
                const isPremium = index % 3 === 0; // Mock premium status
                html += `<div class="p-2 hover-bg-light rounded cursor-pointer suggestion-item d-flex justify-content-between align-items-center" data-domain="${domainName}${ext}">
                            <div>
                                <i class="bi bi-plus-circle me-2 text-success"></i> ${domainName}<span class="text-success fw-bold">${ext}</span>
                            </div>
                            ${isPremium ? '<span class="badge bg-warning text-dark small" style="font-size: 0.6rem;">Premium</span>' : ''}
                         </div>`;
            });
            suggestions.innerHTML = html;
            
            document.querySelectorAll('.suggestion-item').forEach(item => {
                item.addEventListener('click', function() {
                    input.value = this.getAttribute('data-domain');
                    suggestions.classList.add('d-none');
                    feedback.classList.add('d-none');
                });
            });
        } else {
            suggestions.classList.add('d-none');
            feedback.classList.add('d-none');
        }
    });

    document.addEventListener('click', function(e) {
        if (!input.contains(e.target) && !suggestions.contains(e.target)) {
            suggestions.classList.add('d-none');
        }
    });
});
</script>

<style>
    .hover-bg-light:hover { background-color: #f8fafc; }
    .cursor-pointer { cursor: pointer; }
</style>

        <div class="mt-5 d-flex flex-wrap justify-content-center gap-4">
            <div class="d-flex align-items-center gap-2">
                <span class="badge bg-white text-dark rounded-pill px-3 py-2">.com</span>
                <span class="fw-bold text-neon">$12.99</span>
            </div>
            <div class="d-flex align-items-center gap-2">
                <span class="badge bg-white text-dark rounded-pill px-3 py-2">.net</span>
                <span class="fw-bold text-neon">$14.99</span>
            </div>
            <div class="d-flex align-items-center gap-2">
                <span class="badge bg-white text-dark rounded-pill px-3 py-2">.org</span>
                <span class="fw-bold text-neon">$15.99</span>
            </div>
            <div class="d-flex align-items-center gap-2">
                <span class="badge bg-white text-dark rounded-pill px-3 py-2">.io</span>
                <span class="fw-bold text-neon">$39.99</span>
            </div>
        </div>
    </div>
</div>

<div class="row justify-content-center mb-5">
    <div class="col-lg-8">
        <div class="card border-0 shadow-sm rounded-4 p-4 hover-lift">
            <div class="d-flex align-items-center gap-3 mb-4">
                <div class="bg-light rounded-circle d-flex align-items-center justify-content-center" style="width: 50px; height: 50px;">
                    <i class="bi bi-info-circle fs-4 text-success"></i>
                </div>
                <div>
                    <h5 class="fw-bold mb-1">WHOIS Lookup</h5>
                    <p class="text-muted small mb-0">Find out who owns a domain name and check its registration details.</p>
                </div>
            </div>
            <form method="post" action="whois.php">
                <input type="hidden" name="token" value="{$token}" />
                <div class="input-group shadow-sm rounded-pill overflow-hidden border">
                    <input type="text" name="domain" class="form-control border-0 px-4 py-3" placeholder="Enter domain for WHOIS (e.g. example.com)" required>
                    <button class="btn btn-dark px-4 fw-bold" type="submit">Lookup</button>
                </div>
            </form>
        </div>
    </div>
</div>

{if $lookup}
    <div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-5">
        <div class="card-header bg-white border-0 p-4">
            <h5 class="m-0 fw-bold text-dark">Search Results</h5>
        </div>
        <div class="card-body p-4 text-dark">
            <div class="d-flex align-items-center justify-content-between p-4 bg-light rounded-4 mb-4">
                <div>
                    <h4 class="fw-bold mb-1">{$domain}</h4>
                    {if $available}
                        <span class="text-success fw-bold"><i class="bi bi-check-circle-fill me-1"></i> Congratulations! Your domain is available.</span>
                    {else}
                        <span class="text-danger fw-bold"><i class="bi bi-x-circle-fill me-1"></i> Sorry, this domain is already taken.</span>
                    {/if}
                </div>
                {if $available}
                    <div class="text-end">
                        <h3 class="fw-bold text-success mb-2">{$price}</h3>
                        <a href="cart.php?a=add&domain=register&query={$domain}" class="btn btn-gradient rounded-pill px-4">Add to Cart</a>
                    </div>
                {else}
                    <div class="text-end">
                        <a href="whois.php?domain={$domain}" class="btn btn-outline-dark rounded-pill px-4 mb-3">WHOIS</a>
                        <div class="mt-2">
                            <h6 class="fw-bold text-dark small text-uppercase mb-2">Try these instead:</h6>
                            <div class="d-flex flex-wrap gap-2 justify-content-end">
                                <a href="cart.php?a=add&domain=register&query={$domain|replace:'.com':'.net'}" class="btn btn-sm btn-light rounded-pill px-3">{$domain|replace:'.com':'.net'}</a>
                                <a href="cart.php?a=add&domain=register&query={$domain|replace:'.com':'.org'}" class="btn btn-sm btn-light rounded-pill px-3">{$domain|replace:'.com':'.org'}</a>
                                <a href="cart.php?a=add&domain=register&query={$domain|replace:'.com':'.io'}" class="btn btn-sm btn-light rounded-pill px-3">{$domain|replace:'.com':'.io'}</a>
                            </div>
                        </div>
                    </div>
                {/if}
            </div>
        </div>
    </div>
{/if}

<div class="mt-5">
    <h3 class="fw-bold mb-4 text-center">Popular TLD Pricing</h3>
    <div class="tld-pricing-grid">
        <div class="tld-card">
            <div class="tld-name">.com</div>
            <div class="tld-price-row"><span>Register:</span> <span class="fw-bold text-neon">$12.99</span></div>
            <div class="tld-price-row"><span>Transfer:</span> <span class="fw-bold text-neon">$12.99</span></div>
            <div class="tld-price-row"><span>Renewal:</span> <span class="fw-bold text-neon">$14.99</span></div>
        </div>
        <div class="tld-card">
            <div class="tld-name">.net</div>
            <div class="tld-price-row"><span>Register:</span> <span class="fw-bold text-neon">$14.99</span></div>
            <div class="tld-price-row"><span>Transfer:</span> <span class="fw-bold text-neon">$14.99</span></div>
            <div class="tld-price-row"><span>Renewal:</span> <span class="fw-bold text-neon">$16.99</span></div>
        </div>
        <div class="tld-card">
            <div class="tld-name">.org</div>
            <div class="tld-price-row"><span>Register:</span> <span class="fw-bold text-neon">$15.99</span></div>
            <div class="tld-price-row"><span>Transfer:</span> <span class="fw-bold text-neon">$15.99</span></div>
            <div class="tld-price-row"><span>Renewal:</span> <span class="fw-bold text-neon">$17.99</span></div>
        </div>
        <div class="tld-card">
            <div class="tld-name">.io</div>
            <div class="tld-price-row"><span>Register:</span> <span class="fw-bold text-neon">$39.99</span></div>
            <div class="tld-price-row"><span>Transfer:</span> <span class="fw-bold text-neon">$39.99</span></div>
            <div class="tld-price-row"><span>Renewal:</span> <span class="fw-bold text-neon">$44.99</span></div>
        </div>
        <div class="tld-card">
            <div class="tld-name">.co</div>
            <div class="tld-price-row"><span>Register:</span> <span class="fw-bold text-neon">$24.99</span></div>
            <div class="tld-price-row"><span>Transfer:</span> <span class="fw-bold text-neon">$24.99</span></div>
            <div class="tld-price-row"><span>Renewal:</span> <span class="fw-bold text-neon">$29.99</span></div>
        </div>
        <div class="tld-card">
            <div class="tld-name">.info</div>
            <div class="tld-price-row"><span>Register:</span> <span class="fw-bold text-neon">$11.99</span></div>
            <div class="tld-price-row"><span>Transfer:</span> <span class="fw-bold text-neon">$11.99</span></div>
            <div class="tld-price-row"><span>Renewal:</span> <span class="fw-bold text-neon">$13.99</span></div>
        </div>
    </div>
</div>

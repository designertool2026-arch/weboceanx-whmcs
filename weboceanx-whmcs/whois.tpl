{* whois.tpl *}

<style>
    .bg-dark-green { background-color: #0a251c !important; }
    .text-neon { color: #00ff66 !important; }
    .hover-lift { 
        transition: transform 0.3s ease, box-shadow 0.3s ease; 
    }
    .hover-lift:hover { 
        transform: translateY(-5px); 
        box-shadow: 0 15px 30px rgba(0,0,0,0.1) !important; 
    }
    .whois-pre { 
        max-height: 500px; 
        overflow-y: auto; 
        background-color: #f8f9fa; 
        border: 1px solid #e9ecef; 
        border-radius: 0.5rem; 
        padding: 1.5rem; 
        font-size: 0.875rem; 
        color: #333; 
        white-space: pre-wrap;
        word-wrap: break-word;
    }
    .search-container { max-width: 800px; margin: 0 auto; }
    .search-input { 
        height: 60px; 
        font-size: 1.1rem; 
        border: 2px solid #e9ecef; 
        border-radius: 50px 0 0 50px; 
        padding-left: 1.5rem; 
    }
    .search-input:focus { 
        border-color: #00ff66; 
        box-shadow: 0 0 0 0.25rem rgba(0, 255, 102, 0.25); 
    }
    .search-btn { 
        border-radius: 0 50px 50px 0; 
        padding: 0 2.5rem; 
    }
    @media (max-width: 768px) {
        .search-input { border-radius: 50px; margin-bottom: 1rem; }
        .search-btn { border-radius: 50px; width: 100%; height: 60px; }
    }
</style>

<div class="card border-0 shadow-lg rounded-4 overflow-hidden mb-5 bg-dark-green text-white">
    <div class="card-body p-5 text-center">
        <h1 class="display-5 fw-bold mb-4">WHOIS Domain Lookup</h1>
        <p class="lead mb-5 opacity-75">Find out who owns a domain name and check its registration details.</p>

        <div class="search-container mx-auto" style="max-width: 800px;">
            <form method="post" action="whois.php" id="whoisForm">
                <input type="hidden" name="token" value="{$token}" />
                <div class="input-group input-group-lg shadow-lg rounded-pill overflow-hidden border-0">
                    <input type="text" name="domain" value="{$domain}" class="form-control border-0 px-4 py-4 fs-5" placeholder="Enter domain name (e.g. example.com)" required>
                    <button type="submit" class="btn btn-gradient px-5 fw-bold" id="whoisSubmitBtn">
                        <span class="submit-text"><i class="bi bi-search me-2"></i>Search</span>
                        <span class="spinner-border spinner-border-sm d-none me-2" role="status" aria-hidden="true" id="whoisSpinner"></span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="row justify-content-center mb-5 pb-5">
    {if $domain}
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="card border-0 shadow-sm rounded-4 hover-lift">
                    <div class="card-header bg-white border-bottom-0 pt-4 pb-3 px-4 d-flex justify-content-between align-items-center flex-wrap gap-3">
                        <h3 class="fw-bold mb-0 fs-4"><i class="bi bi-info-circle text-neon me-2"></i>WHOIS Results for <span class="text-dark">{$domain}</span></h3>
                        <a href="cart.php?a=add&domain=register&query={$domain}" class="btn btn-gradient rounded-pill px-4 py-2">
                            <i class="bi bi-cart-plus me-2"></i>Register this domain
                        </a>
                    </div>
                    <div class="card-body px-4 pb-4 pt-0">
                        {if $whois}
                            <pre class="whois-pre mb-0 shadow-sm">{$whois}</pre>
                        {else}
                            <div class="text-center py-5 bg-light rounded-4 border">
                                <i class="bi bi-exclamation-circle text-muted fs-1 mb-3 d-block"></i>
                                <h5 class="text-muted fw-bold">No WHOIS information available</h5>
                                <p class="text-muted small mb-0">We couldn't retrieve the WHOIS data for this domain. It might be invalid or not supported.</p>
                            </div>
                        {/if}
                    </div>
                </div>
            </div>
        </div>
    {/if}
</div>

<script>
    document.getElementById('whoisForm').addEventListener('submit', function() {
        var btn = document.getElementById('whoisSubmitBtn');
        var spinner = document.getElementById('whoisSpinner');
        var text = btn.querySelector('.submit-text');
        
        spinner.classList.remove('d-none');
        text.innerHTML = 'Searching...';
        btn.classList.add('disabled');
    });
</script>



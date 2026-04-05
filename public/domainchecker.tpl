{include file="$template/header.tpl"}

<div class="container-fluid px-lg-5 py-5">
    <!-- Hero Section -->
    <div class="row justify-content-center mb-5">
        <div class="col-lg-8 text-center">
            <h1 class="display-4 fw-bold mb-3">Find Your Perfect <span class="text-success">Domain Name</span></h1>
            <p class="text-muted lead">Search for your new domain and start your online journey today with WebOceanX.</p>
        </div>
    </div>

    <!-- Domain Search Form -->
    <div class="row justify-content-center mb-5">
        <div class="col-lg-10">
            <div class="card border-0 shadow-lg rounded-4 p-4 p-md-5 bg-dark-green text-white overflow-hidden position-relative">
                <div class="position-relative z-index-2">
                    <form method="post" action="domainchecker.php" class="row g-3">
                        <div class="col-md-9">
                            <div class="input-group input-group-lg">
                                <span class="input-group-text bg-white border-0 rounded-start-pill ps-4 pe-3">
                                    <i class="bi bi-search text-muted"></i>
                                </span>
                                <input type="text" name="domain" class="form-control border-0 rounded-end-pill py-3 pe-4" placeholder="Enter your domain name (e.g. example.com)" value="{$domain}" required autofocus>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <button type="submit" class="btn btn-neon btn-lg w-100 rounded-pill py-3 fw-bold shadow-lg">
                                Search Domain
                            </button>
                        </div>
                    </form>
                </div>
                <i class="bi bi-globe position-absolute bottom-0 end-0 opacity-10 display-1 mb-n3 me-n3"></i>
            </div>
        </div>
    </div>

    <!-- Results Section -->
    {if $lookupterm}
    <div class="row justify-content-center mb-5">
        <div class="col-lg-10">
            <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                <div class="card-header bg-white border-0 p-4">
                    <h5 class="m-0 fw-bold">Search Results for <span class="text-success">"{$lookupterm}"</span></h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="bg-light">
                                <tr>
                                    <th class="ps-4">Domain Name</th>
                                    <th>Status</th>
                                    <th>Pricing</th>
                                    <th class="pe-4"></th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $results as $result}
                                <tr>
                                    <td class="ps-4">
                                        <div class="fw-bold fs-5">{$result.domain}</div>
                                    </td>
                                    <td>
                                        {if $result.status == 'available'}
                                            <span class="badge bg-success-subtle text-success rounded-pill px-3 py-2">
                                                <i class="bi bi-check-circle-fill me-1"></i> Available
                                            </span>
                                        {elseif $result.status == 'unavailable'}
                                            <span class="badge bg-danger-subtle text-danger rounded-pill px-3 py-2">
                                                <i class="bi bi-x-circle-fill me-1"></i> Taken
                                            </span>
                                        {else}
                                            <span class="badge bg-warning-subtle text-warning rounded-pill px-3 py-2">
                                                <i class="bi bi-question-circle-fill me-1"></i> Unknown
                                            </span>
                                        {/if}
                                    </td>
                                    <td>
                                        {if $result.status == 'available'}
                                            <div class="fw-bold text-success fs-5">{$result.register}</div>
                                            <div class="small text-muted">Renew: {$result.renew}</div>
                                        {else}
                                            <span class="text-muted">N/A</span>
                                        {/if}
                                    </td>
                                    <td class="pe-4 text-end">
                                        {if $result.status == 'available'}
                                            <a href="cart.php?a=add&domain=register&query={$result.domain}" class="btn btn-neon rounded-pill px-4 fw-bold">
                                                Add to Cart
                                            </a>
                                        {elseif $result.status == 'unavailable'}
                                            <a href="http://{$result.domain}" target="_blank" class="btn btn-outline-secondary rounded-pill px-4 fw-bold">
                                                WHOIS
                                            </a>
                                        {/if}
                                    </td>
                                </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {/if}

    <!-- TLD Pricing Section -->
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="text-center mb-4">
                <h3 class="fw-bold">Popular <span class="text-success">TLD Pricing</span></h3>
                <p class="text-muted">Check out our competitive rates for the most popular extensions.</p>
            </div>
            <div class="row g-4">
                {foreach $tldpricelist as $tld}
                <div class="col-md-6 col-lg-3">
                    <div class="card border-0 shadow-sm rounded-4 p-4 text-center hover-lift">
                        <div class="display-6 fw-bold text-success mb-2">.{$tld.extension}</div>
                        <div class="fs-4 fw-bold mb-1">{$tld.register}</div>
                        <div class="small text-muted mb-3">Registration Fee</div>
                        <hr class="my-3 opacity-10">
                        <div class="d-flex justify-content-between small text-muted">
                            <span>Transfer:</span>
                            <span class="fw-bold text-dark">{$tld.transfer}</span>
                        </div>
                        <div class="d-flex justify-content-between small text-muted mt-1">
                            <span>Renewal:</span>
                            <span class="fw-bold text-dark">{$tld.renew}</span>
                        </div>
                    </div>
                </div>
                {/foreach}
            </div>
        </div>
    </div>
</div>

<style>
    .bg-dark-green { background-color: #0a251c; }
    .text-neon { color: #00ff66; }
    .btn-neon { background-color: #00ff66; color: #0a251c; border: none; transition: all 0.3s ease; }
    .btn-neon:hover { background-color: #00e65c; transform: translateY(-2px); box-shadow: 0 8px 15px rgba(0, 255, 102, 0.3); }
    .hover-lift { transition: transform 0.2s ease; }
    .hover-lift:hover { transform: translateY(-10px); }
    .z-index-2 { z-index: 2; }
</style>

{include file="$template/footer.tpl"}

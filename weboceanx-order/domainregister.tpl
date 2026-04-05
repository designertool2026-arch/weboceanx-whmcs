<!-- domainregister.tpl -->
<link rel="stylesheet" href="templates/orderforms/weboceanx-order/style.css">

<div class="weboceanx-order-body py-5">
    <div class="container">
        <!-- Steps -->
        <div class="order-steps">
            <div class="step-item active">
                <span class="step-number">1</span>
                <span>Choose Domain</span>
            </div>
            <div class="step-item">
                <span class="step-number">2</span>
                <span>Configure</span>
            </div>
            <div class="step-item">
                <span class="step-number">3</span>
                <span>Checkout</span>
            </div>
        </div>

        <div class="card border-0 shadow-lg rounded-4 overflow-hidden mb-5 bg-dark-green text-white">
            <div class="card-body p-5 text-center">
                <h1 class="display-5 fw-bold mb-4">Find your perfect domain</h1>
                <p class="lead mb-5 opacity-75">Search for a domain name and check its availability instantly.</p>
                
                <form method="post" action="cart.php?a=add&domain=register" class="mx-auto" style="max-width: 800px;">
                    <div class="input-group input-group-lg shadow-lg rounded-pill overflow-hidden border-0">
                        <input type="text" name="sld" class="form-control border-0 px-4 py-4 fs-5" placeholder="Enter your domain name (e.g. example)" required>
                        <select name="tld" class="form-select border-0 px-4 py-4 fs-5" style="max-width: 150px;">
                            <option value=".com">.com</option>
                            <option value=".net">.net</option>
                            <option value=".org">.org</option>
                            <option value=".io">.io</option>
                        </select>
                        <button class="btn btn-neon px-5 fw-bold" type="submit">Search</button>
                    </div>
                </form>

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
                                <a href="cart.php?a=add&domain=register&query={$domain}" class="btn btn-neon rounded-pill px-4">Add to Cart</a>
                            </div>
                        {else}
                            <a href="whois.php?domain={$domain}" class="btn btn-outline-dark rounded-pill px-4">WHOIS</a>
                        {/if}
                    </div>
                </div>
            </div>
        {/if}
    </div>
</div>

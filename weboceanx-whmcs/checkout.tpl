<style>
    :root {
        --wo-light-green: #f0fdf4;
        --wo-neon-green: #00ff66;
        --wo-dark: #111827;
        --wo-muted: #6b7280;
    }
    body {
        background-color: #ffffff;
    }
    .split-layout {
        display: flex;
        min-height: 100vh;
        font-family: 'Inter', system-ui, sans-serif;
    }
    .split-left {
        width: 35%;
        background-color: var(--wo-light-green);
        padding: 4rem;
        display: flex;
        flex-direction: column;
    }
    .split-right {
        width: 65%;
        background-color: #ffffff;
        padding: 4rem;
        display: flex;
        flex-direction: column;
    }
    .btn-gradient {
        background: linear-gradient(90deg, #86efac, #bef264);
        color: var(--wo-dark);
        font-weight: 600;
        border: none;
        transition: all 0.3s ease;
    }
    .btn-gradient:hover {
        background: linear-gradient(90deg, #6ee7b7, #a3e635);
        color: var(--wo-dark);
        transform: translateY(-1px);
        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
    }
    .basket-summary-box {
        margin-top: auto;
        border-top: 1px solid #d1d5db;
        padding-top: 2rem;
    }
    .form-control {
        border: 1px solid #d1d5db;
        padding: 0.75rem 1rem;
    }
    .form-control:focus {
        border-color: #86efac;
        box-shadow: 0 0 0 0.25rem rgba(134, 239, 172, 0.25);
    }
    .nav-top-right {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 1.5rem;
        margin-bottom: 4rem;
    }
    .cart-badge {
        display: flex;
        align-items: center;
        gap: 0.5rem;
        font-weight: 500;
        color: var(--wo-dark);
        text-decoration: none;
    }
    .btn-outline-dark {
        border: 1px solid #e5e7eb;
        color: var(--wo-dark);
        background: transparent;
    }
    .btn-outline-dark:hover {
        background-color: #f9fafb;
        border-color: #d1d5db;
    }
    .text-dark { color: var(--wo-dark) !important; }
    .text-muted { color: var(--wo-muted) !important; }
    
    .radio-card {
        border: 1px solid #e5e7eb;
        border-radius: 0.5rem;
        padding: 1rem;
        cursor: pointer;
        transition: all 0.2s;
    }
    .radio-card:hover {
        border-color: #86efac;
    }
    .radio-card.selected {
        border-color: #86efac;
        background-color: #f0fdf4;
    }
    
    @media (max-width: 991px) {
        .split-layout {
            flex-direction: column;
        }
        .split-left, .split-right {
            width: 100%;
            padding: 2rem;
        }
        .split-left {
            min-height: auto;
        }
    }
</style>

<div class="split-layout">
    <!-- Left Sidebar -->
    <div class="split-left">
        <div class="logo mb-5">
            <a href="index.php" class="text-decoration-none text-dark fw-bold fs-4 d-flex align-items-center gap-2">
                <i class="bi bi-cloud-fill" style="color: var(--wo-neon-green);"></i> WebOceanX
            </a>
        </div>
        
        {if !$loggedin}
            <h1 class="display-5 fw-bold mb-3 text-dark">Create account</h1>
            <p class="text-muted mb-5">Already have an account? <a href="login.php" class="text-dark fw-bold text-decoration-underline">Log in here</a></p>
        {else}
            <h1 class="display-5 fw-bold mb-3 text-dark">Checkout</h1>
            <p class="text-muted mb-5">Complete your order details below.</p>
        {/if}
        
        <div class="basket-summary-box">
            <h6 class="fw-bold mb-4 d-flex align-items-center gap-2 text-dark">
                <i class="bi bi-bag"></i> Basket summary
            </h6>
            
            {foreach $cartitems as $item}
                <div class="d-flex justify-content-between mb-2 text-muted small">
                    <span>{$item.product}</span>
                    <span>{$item.amount}</span>
                </div>
            {/foreach}
            
            <div class="border-top my-3"></div>
            
            <div class="d-flex justify-content-between mb-2 text-muted">
                <span>Subtotal</span>
                <span>{$subtotal}</span>
            </div>
            {if $discount}
            <div class="d-flex justify-content-between mb-2 text-muted">
                <span>Discount</span>
                <span>-{$discount}</span>
            </div>
            {/if}
            {if $taxrate}
            <div class="d-flex justify-content-between mb-2 text-muted">
                <span>{$taxname} @ {$taxrate}%</span>
                <span>{$tax}</span>
            </div>
            {/if}
            
            <div class="d-flex justify-content-between align-items-center mt-4 pt-4 border-top">
                <h5 class="fw-bold m-0 text-dark">Basket total</h5>
                <h3 class="fw-bold m-0 text-dark">{$total}</h3>
            </div>
        </div>
    </div>
    
    <!-- Right Content -->
    <div class="split-right">
        <div class="nav-top-right">
            <a href="cart.php?a=view" class="cart-badge">
                <i class="bi bi-bag"></i> {$cartitems|count} item
            </a>
        </div>
        
        <div class="content-area mx-auto w-100" style="max-width: 600px;">
            
            <form method="post" action="cart.php?a=checkout" id="frmCheckout">
                <input type="hidden" name="token" value="{$token}" />
                
                {if !$loggedin}
                    <h6 class="fw-bold mb-4 d-flex align-items-center gap-2 text-dark border-bottom pb-3">
                        <i class="bi bi-person"></i> Register
                    </h6>
                    
                    <div class="row g-3 mb-5">
                        <div class="col-12">
                            <label class="form-label text-dark fw-bold small">First name <span class="text-danger">*</span></label>
                            <input type="text" name="firstname" class="form-control rounded-3 py-2" value="{$clientsdetails.firstname}" placeholder="Jay, Jane, John,..." required>
                        </div>
                        <div class="col-12">
                            <label class="form-label text-dark fw-bold small">Last name <span class="text-danger">*</span></label>
                            <input type="text" name="lastname" class="form-control rounded-3 py-2" value="{$clientsdetails.lastname}" placeholder="Doe, Smith, ..." required>
                        </div>
                        <div class="col-12">
                            <label class="form-label text-dark fw-bold small">Your username or email address <span class="text-danger">*</span></label>
                            <input type="email" name="email" class="form-control rounded-3 py-2" value="{$clientsdetails.email}" placeholder="name@email.com" required>
                        </div>
                        <div class="col-12">
                            <label class="form-label text-dark fw-bold small">Password <span class="text-danger">*</span></label>
                            <div class="input-group">
                                <input type="password" name="password" class="form-control rounded-start-3 py-2" placeholder="Password or passphrase" required>
                                <span class="input-group-text bg-white rounded-end-3 border-start-0 text-muted"><i class="bi bi-eye"></i></span>
                            </div>
                        </div>
                        <div class="col-12 mt-4">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="marketingOptIn">
                                <label class="form-check-label fw-bold text-dark small" for="marketingOptIn">
                                    Please tick this box if you are happy for us to personalize your marketing
                                </label>
                            </div>
                        </div>
                    </div>
                {else}
                    <h6 class="fw-bold mb-4 d-flex align-items-center gap-2 text-dark border-bottom pb-3">
                        <i class="bi bi-person-check"></i> Your Details
                    </h6>
                    <div class="card border border-light bg-light rounded-4 mb-5 p-4 shadow-sm">
                        <p class="m-0 text-dark fw-bold fs-5">{$clientsdetails.firstname} {$clientsdetails.lastname}</p>
                        <p class="m-0 text-muted mt-1">{$clientsdetails.email}</p>
                        {if $clientsdetails.companyname}<p class="m-0 text-muted">{$clientsdetails.companyname}</p>{/if}
                    </div>
                {/if}
                
                <h6 class="fw-bold mb-4 d-flex align-items-center gap-2 text-dark border-bottom pb-3">
                    <i class="bi bi-credit-card"></i> Payment Method
                </h6>
                
                <div class="row g-3 mb-5">
                    {foreach $gateways as $gateway}
                        <div class="col-12">
                            <label class="radio-card d-flex align-items-center gap-3 w-100 {if $gateway.sysname eq $selectedgateway}selected{/if}">
                                <input type="radio" name="paymentmethod" value="{$gateway.sysname}" class="form-check-input m-0" {if $gateway.sysname eq $selectedgateway}checked{/if}>
                                <span class="fw-bold text-dark">{$gateway.name}</span>
                            </label>
                        </div>
                    {/foreach}
                </div>
                
                {if $accepttos}
                    <div class="form-check mb-4">
                        <input type="checkbox" name="accepttos" id="accepttos" class="form-check-input" required>
                        <label class="form-check-label text-muted small" for="accepttos">
                            By clicking 'Continue', I agree to the <a href="{$tosurl}" target="_blank" class="text-dark fw-bold">Terms and Conditions</a> of WebOceanX.
                        </label>
                    </div>
                {else}
                    <p class="text-muted small mb-4">By clicking 'Continue', I agree to the Terms and Conditions of WebOceanX.</p>
                {/if}
                
                <button type="submit" id="btnCompleteOrder" class="btn btn-gradient rounded-pill w-100 py-3 fs-6 fw-bold text-dark">
                    Continue
                </button>
                
                <p class="text-muted small mt-4">
                    This form is protected by reCAPTCHA and Google's <a href="#" class="text-muted text-decoration-underline">Privacy policy</a> and <a href="#" class="text-muted text-decoration-underline">Terms of service</a> apply.
                </p>
                
            </form>
        </div>
        
        <div class="mt-auto pt-5 d-flex justify-content-between align-items-center text-muted small">
            <div>&copy; {$date_year} WebOceanX. All rights reserved.</div>
            <div class="d-flex gap-3">
                <div class="border rounded px-3 py-1 bg-light"><i class="bi bi-translate"></i> English (US)</div>
                <div class="border rounded px-3 py-1 bg-light">USD</div>
            </div>
        </div>
    </div>
</div>

<script>
    document.querySelectorAll('input[name="paymentmethod"]').forEach(radio => {
        radio.addEventListener('change', function() {
            document.querySelectorAll('.radio-card').forEach(card => card.classList.remove('selected'));
            if(this.checked) {
                this.closest('.radio-card').classList.add('selected');
            }
        });
    });
</script>

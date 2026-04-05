{include file="orderforms/weboceanx-cart/header.tpl"}

<div class="row mb-5">
    <div class="col-lg-8">
        <h2 class="display-6 fw-bold mb-3">Complete Your <span class="text-success">Order</span></h2>
        <p class="text-muted lead">Provide your billing information and choose a payment method to finalize your purchase.</p>
    </div>
</div>

<form method="post" action="cart.php?a=checkout" class="row g-4">
    <div class="col-lg-8">
        <!-- Billing Information -->
        <div class="card border-0 shadow-sm rounded-4 p-4 p-xl-5 mb-4">
            <h5 class="fw-bold mb-4">Billing Information</h5>
            
            {if $errormessage}
            <div class="alert alert-danger rounded-4 border-0 small mb-4">
                {$errormessage}
            </div>
            {/if}

            <div class="row g-4">
                <div class="col-md-6">
                    <label class="form-label fw-bold">First Name</label>
                    <input type="text" name="firstname" class="form-control bg-light border-0 rounded-pill px-4 py-2" placeholder="First Name" value="{$clientsdetails.firstname}" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label fw-bold">Last Name</label>
                    <input type="text" name="lastname" class="form-control bg-light border-0 rounded-pill px-4 py-2" placeholder="Last Name" value="{$clientsdetails.lastname}" required>
                </div>
                <div class="col-md-12">
                    <label class="form-label fw-bold">Email Address</label>
                    <input type="email" name="email" class="form-control bg-light border-0 rounded-pill px-4 py-2" placeholder="Email Address" value="{$clientsdetails.email}" required>
                </div>
                <div class="col-md-12">
                    <label class="form-label fw-bold">Address</label>
                    <input type="text" name="address1" class="form-control bg-light border-0 rounded-pill px-4 py-2 mb-3" placeholder="Address 1" value="{$clientsdetails.address1}" required>
                    <input type="text" name="address2" class="form-control bg-light border-0 rounded-pill px-4 py-2" placeholder="Address 2 (Optional)" value="{$clientsdetails.address2}">
                </div>
                <div class="col-md-4">
                    <label class="form-label fw-bold">City</label>
                    <input type="text" name="city" class="form-control bg-light border-0 rounded-pill px-4 py-2" placeholder="City" value="{$clientsdetails.city}" required>
                </div>
                <div class="col-md-4">
                    <label class="form-label fw-bold">State</label>
                    <input type="text" name="state" class="form-control bg-light border-0 rounded-pill px-4 py-2" placeholder="State" value="{$clientsdetails.state}" required>
                </div>
                <div class="col-md-4">
                    <label class="form-label fw-bold">Postcode</label>
                    <input type="text" name="postcode" class="form-control bg-light border-0 rounded-pill px-4 py-2" placeholder="Postcode" value="{$clientsdetails.postcode}" required>
                </div>
            </div>
        </div>

        <!-- Payment Method -->
        <div class="card border-0 shadow-sm rounded-4 p-4 p-xl-5 mb-4">
            <h5 class="fw-bold mb-4">Payment Method</h5>
            <div class="row g-3">
                {foreach $gateways as $gateway}
                <div class="col-md-6">
                    <div class="form-check card border-0 bg-light p-3 rounded-4 h-100 hover-lift">
                        <input class="form-check-input ms-0 me-3" type="radio" name="paymentmethod" id="gateway_{$gateway.sysname}" value="{$gateway.sysname}" {if $selectedgateway == $gateway.sysname}checked{/if}>
                        <label class="form-check-label fw-bold stretched-link" for="gateway_{$gateway.sysname}">
                            {$gateway.name}
                        </label>
                    </div>
                </div>
                {/foreach}
            </div>
        </div>

        <!-- Additional Notes -->
        <div class="card border-0 shadow-sm rounded-4 p-4 p-xl-5 mb-4">
            <h5 class="fw-bold mb-4">Additional Notes</h5>
            <textarea name="notes" class="form-control bg-light border-0 rounded-4 p-4" rows="3" placeholder="Any special instructions for your order?">{$notes}</textarea>
        </div>
    </div>

    <div class="col-lg-4">
        <!-- Final Summary -->
        <div class="card border-0 shadow-sm rounded-4 p-4 p-xl-5 bg-dark-green text-white sticky-top" style="top: 100px;">
            <h5 class="fw-bold mb-4 text-neon">Final Summary</h5>
            
            <div class="d-flex justify-content-between align-items-center mb-3 opacity-75">
                <span>Subtotal</span>
                <span class="fw-bold">{$subtotal}</span>
            </div>
            
            {if $taxname}
            <div class="d-flex justify-content-between align-items-center mb-3 opacity-75">
                <span>{$taxname}</span>
                <span class="fw-bold">{$tax}</span>
            </div>
            {/if}

            {if $discount}
            <div class="d-flex justify-content-between align-items-center mb-3 text-neon">
                <span>Discount</span>
                <span class="fw-bold">-{$discount}</span>
            </div>
            {/if}

            <hr class="my-4 opacity-10">

            <div class="d-flex justify-content-between align-items-center mb-5">
                <span class="fs-5 fw-bold">Total Due Today</span>
                <span class="fs-4 fw-bold text-neon">{$total}</span>
            </div>

            <div class="form-check mb-4 opacity-75">
                <input class="form-check-input" type="checkbox" id="accepttos" name="accepttos" required>
                <label class="form-check-label small" for="accepttos">
                    I have read and agree to the <a href="#" class="text-neon text-decoration-none fw-bold">Terms of Service</a>.
                </label>
            </div>

            <button type="submit" class="btn btn-neon w-100 rounded-pill py-3 fw-bold shadow-lg">
                Complete Order <i class="bi bi-check2-circle ms-2"></i>
            </button>
            
            <div class="text-center mt-4 small opacity-50">
                <i class="bi bi-shield-lock me-1"></i> Secure 256-bit SSL Checkout
            </div>
        </div>
    </div>
</form>

<style>
    .bg-dark-green { background-color: #0a251c; }
    .text-neon { color: #00ff66; }
    .btn-neon { background-color: #00ff66; color: #0a251c; border: none; }
    .btn-neon:hover { background-color: #00e65c; color: #0a251c; }
    .hover-lift { transition: transform 0.2s ease; }
    .hover-lift:hover { transform: translateY(-5px); }
</style>

{include file="orderforms/weboceanx-cart/footer.tpl"}

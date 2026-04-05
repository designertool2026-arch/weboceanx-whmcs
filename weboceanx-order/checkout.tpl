<!-- checkout.tpl -->
<link rel="stylesheet" href="templates/orderforms/weboceanx-order/style.css">

<div class="weboceanx-order-body py-5">
    <div class="container">
        <!-- Steps -->
        <div class="order-steps">
            <div class="step-item">
                <span class="step-number">1</span>
                <span>Choose</span>
            </div>
            <div class="step-item">
                <span class="step-number">2</span>
                <span>Configure</span>
            </div>
            <div class="step-item active">
                <span class="step-number">3</span>
                <span>Checkout</span>
            </div>
        </div>

        <div class="row g-5">
            <div class="col-lg-8">
                <div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-5">
                    <div class="card-header bg-white border-0 p-4">
                        <h5 class="m-0 fw-bold text-dark">Checkout Details</h5>
                    </div>
                    <div class="card-body p-4 text-dark">
                        <form method="post" action="cart.php?a=checkout">
                            <h5 class="fw-bold mb-4">Personal Information</h5>
                            <div class="row g-3 mb-5">
                                <div class="col-md-6">
                                    <label class="form-label fw-bold small text-uppercase text-muted">First Name</label>
                                    <input type="text" name="firstname" class="form-control rounded-3 p-3" value="{$clientfirstname}" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-bold small text-uppercase text-muted">Last Name</label>
                                    <input type="text" name="lastname" class="form-control rounded-3 p-3" value="{$clientlastname}" required>
                                </div>
                                <div class="col-md-12">
                                    <label class="form-label fw-bold small text-uppercase text-muted">Email Address</label>
                                    <input type="email" name="email" class="form-control rounded-3 p-3" value="{$clientemail}" required>
                                </div>
                            </div>

                            <h5 class="fw-bold mb-4">Payment Method</h5>
                            <div class="row g-3 mb-5">
                                {foreach $gateways as $gateway}
                                    <div class="col-md-6">
                                        <div class="form-check p-4 bg-light rounded-4 border border-secondary transition-all hover-border-neon cursor-pointer">
                                            <input class="form-check-input ms-0 me-3" type="radio" name="paymentmethod" value="{$gateway.sysname}" id="gw{$gateway.sysname}" {if $paymentmethod == $gateway.sysname}checked{/if}>
                                            <label class="form-check-label w-100" for="gw{$gateway.sysname}">
                                                <div class="fw-bold fs-5">{$gateway.name}</div>
                                            </label>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>

                            <div class="form-check mb-5">
                                <input class="form-check-input" type="checkbox" name="accepttos" id="accepttos" required>
                                <label class="form-check-label small text-muted" for="accepttos">
                                    I have read and agree to the <a href="terms.php" target="_blank" class="text-neon">Terms of Service</a>
                                </label>
                            </div>

                            <button type="submit" class="btn btn-order w-100 py-3 rounded-pill fs-5">Complete Order</button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="cart-summary shadow-lg">
                    <h4 class="fw-bold mb-4 text-neon">Order Summary</h4>
                    <div class="d-flex justify-content-between mb-3">
                        <div class="text-muted">Subtotal</div>
                        <div class="fw-bold">{$subtotal}</div>
                    </div>
                    {if $tax}
                        <div class="d-flex justify-content-between mb-3">
                            <div class="text-muted">Tax</div>
                            <div class="fw-bold">{$tax}</div>
                        </div>
                    {/if}
                    <div class="d-flex justify-content-between align-items-center pt-3 border-top border-secondary mt-3">
                        <h4 class="fw-bold m-0 text-white">Total Due</h4>
                        <h3 class="fw-bold m-0 text-neon">{$total}</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

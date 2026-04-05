<!-- configureproduct.tpl -->
<link rel="stylesheet" href="templates/orderforms/weboceanx-order/style.css">

<div class="weboceanx-order-body py-5">
    <div class="container">
        <!-- Steps -->
        <div class="order-steps">
            <div class="step-item">
                <span class="step-number">1</span>
                <span>Choose Product</span>
            </div>
            <div class="step-item active">
                <span class="step-number">2</span>
                <span>Configure</span>
            </div>
            <div class="step-item">
                <span class="step-number">3</span>
                <span>Checkout</span>
            </div>
        </div>

        <div class="row g-5">
            <div class="col-lg-8">
                <div class="card bg-dark-green text-white p-5 rounded-4 border-0 shadow-lg mb-5">
                    <h1 class="display-5 fw-bold mb-3">{$productname}</h1>
                    <p class="lead opacity-75 mb-0">{$productdescription}</p>
                </div>

                <form method="post" action="cart.php?a=add&pid={$pid}">
                    <input type="hidden" name="configure" value="true">
                    
                    <div class="mb-5">
                        <h4 class="fw-bold mb-4 text-neon">Choose Billing Cycle</h4>
                        <div class="row g-3">
                            {foreach $pricing.billingcycles as $cycle}
                                <div class="col-md-6">
                                    <div class="form-check p-4 bg-darker rounded-4 border border-secondary transition-all hover-border-neon cursor-pointer">
                                        <input class="form-check-input ms-0 me-3" type="radio" name="billingcycle" value="{$cycle.id}" id="cycle{$cycle.id}" {if $billingcycle == $cycle.id}checked{/if}>
                                        <label class="form-check-label w-100" for="cycle{$cycle.id}">
                                            <div class="fw-bold fs-5">{$cycle.name}</div>
                                            <div class="text-neon fw-bold">{$cycle.price}</div>
                                        </label>
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    </div>

                    {if $configurableoptions}
                        <div class="mb-5">
                            <h4 class="fw-bold mb-4 text-neon">Configurable Options</h4>
                            <div class="row g-4">
                                {foreach $configurableoptions as $option}
                                    <div class="col-md-6">
                                        <div class="mb-4">
                                            <label class="form-label fw-bold small text-uppercase text-muted">{$option.optionname}</label>
                                            {if $option.optiontype == 1}
                                                <select name="configoption[{$option.id}]" class="form-select rounded-3 p-3">
                                                    {foreach $option.options as $suboption}
                                                        <option value="{$suboption.id}">{$suboption.name}</option>
                                                    {/foreach}
                                                </select>
                                            {elseif $option.optiontype == 2}
                                                {foreach $option.options as $suboption}
                                                    <div class="form-check mb-2">
                                                        <input class="form-check-input" type="radio" name="configoption[{$option.id}]" value="{$suboption.id}" id="opt{$suboption.id}" {if $suboption.selected}checked{/if}>
                                                        <label class="form-check-label" for="opt{$suboption.id}">{$suboption.name}</label>
                                                    </div>
                                                {/foreach}
                                            {/if}
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    {/if}

                    <div class="mt-5 d-flex justify-content-between align-items-center border-top border-secondary pt-4">
                        <a href="cart.php" class="btn btn-order-outline rounded-pill px-5 py-3">Back</a>
                        <button type="submit" class="btn btn-order rounded-pill px-5 py-3">Continue to Checkout</button>
                    </div>
                </form>
            </div>

            <div class="col-lg-4">
                <div class="cart-summary shadow-lg">
                    <h4 class="fw-bold mb-4 text-neon">Order Summary</h4>
                    <div class="d-flex justify-content-between mb-3 pb-3 border-bottom border-secondary">
                        <div class="fw-bold">{$productname}</div>
                        <div class="text-neon">{$pricing.minprice.price}</div>
                    </div>
                    <div class="d-flex justify-content-between mb-4">
                        <div class="text-muted">Billing Cycle</div>
                        <div class="fw-bold">{$pricing.minprice.cycle}</div>
                    </div>
                    <div class="d-flex justify-content-between align-items-center pt-3 border-top border-secondary">
                        <h4 class="fw-bold m-0">Total</h4>
                        <h3 class="fw-bold m-0 text-neon">{$pricing.minprice.price}</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

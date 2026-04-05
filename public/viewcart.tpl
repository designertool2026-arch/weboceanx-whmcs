{include file="orderforms/weboceanx-cart/header.tpl"}

<div class="row mb-5">
    <div class="col-lg-8">
        <h2 class="display-6 fw-bold mb-3">Review Your <span class="text-success">Order</span></h2>
        <p class="text-muted lead">Check your items and apply any promo codes before proceeding to checkout.</p>
    </div>
</div>

<div class="row g-4">
    <div class="col-lg-8">
        <!-- Cart Items -->
        <div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-4">
            <div class="card-header bg-white border-0 p-4 d-flex justify-content-between align-items-center">
                <h5 class="m-0 fw-bold">Shopping Cart</h5>
                <a href="cart.php" class="btn btn-sm btn-light rounded-pill px-3">Add More</a>
            </div>
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-light">
                        <tr>
                            <th class="ps-4">Product/Service</th>
                            <th>Pricing</th>
                            <th class="pe-4"></th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $cartitems as $num => $item}
                        <tr>
                            <td class="ps-4">
                                <div class="fw-bold">{$item.productname}</div>
                                <div class="small text-muted">{$item.domain}</div>
                                {foreach $item.configoptions as $configoption}
                                <div class="small text-muted">{$configoption.name}: {$configoption.optionname}</div>
                                {/foreach}
                            </td>
                            <td class="fw-bold">{$item.amount}</td>
                            <td class="pe-4 text-end">
                                <a href="cart.php?a=remove&i={$num}" class="text-danger text-decoration-none small fw-bold"><i class="bi bi-trash me-1"></i> Remove</a>
                            </td>
                        </tr>
                        {foreachelse}
                        <tr>
                            <td colspan="3" class="text-center py-5 text-muted">
                                <i class="bi bi-cart-x display-6 opacity-25 d-block mb-2"></i>
                                Your cart is empty.
                            </td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Promo Code -->
        <div class="card border-0 shadow-sm rounded-4 p-4 mb-4">
            <h6 class="fw-bold mb-3">Promo Code</h6>
            <form method="post" action="cart.php?a=view" class="d-flex gap-2">
                <input type="text" name="promocode" class="form-control rounded-pill px-4" placeholder="Enter promo code" value="{$promocode}">
                <button type="submit" class="btn btn-outline-success rounded-pill px-4 fw-bold">Apply</button>
            </form>
            {if $errormessage}
            <div class="alert alert-danger rounded-4 border-0 small mt-3 mb-0">
                {$errormessage}
            </div>
            {/if}
            {if $promosuccess}
            <div class="alert alert-success rounded-4 border-0 small mt-3 mb-0">
                Promo code applied successfully!
            </div>
            {/if}
        </div>
    </div>

    <div class="col-lg-4">
        <!-- Order Summary -->
        <div class="card border-0 shadow-sm rounded-4 p-4 p-xl-5 bg-dark-green text-white sticky-top" style="top: 100px;">
            <h5 class="fw-bold mb-4 text-neon">Order Summary</h5>
            
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

            <a href="cart.php?a=checkout" class="btn btn-neon w-100 rounded-pill py-3 fw-bold shadow-lg">
                Proceed to Checkout <i class="bi bi-arrow-right ms-2"></i>
            </a>
            
            <div class="text-center mt-4 small opacity-50">
                <i class="bi bi-shield-lock me-1"></i> Secure 256-bit SSL Checkout
            </div>
        </div>
    </div>
</div>

<style>
    .bg-dark-green { background-color: #0a251c; }
    .text-neon { color: #00ff66; }
    .btn-neon { background-color: #00ff66; color: #0a251c; border: none; }
    .btn-neon:hover { background-color: #00e65c; color: #0a251c; }
</style>

{include file="orderforms/weboceanx-cart/footer.tpl"}

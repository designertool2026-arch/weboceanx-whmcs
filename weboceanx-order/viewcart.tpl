<!-- viewcart.tpl -->
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
                        <h5 class="m-0 fw-bold text-dark">Your Shopping Cart</h5>
                    </div>
                    <div class="card-body p-4 text-dark">
                        {if $cartitems}
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
                                        {foreach $cartitems as $item}
                                        <tr>
                                            <td class="ps-4">
                                                <div class="fw-bold">{$item.product}</div>
                                                <div class="small text-muted">{$item.domain}</div>
                                            </td>
                                            <td class="fw-bold">{$item.amount} <span class="small text-muted">/{$item.billingcycle}</span></td>
                                            <td class="pe-4 text-end">
                                                <a href="cart.php?a=remove&id={$item.id}" class="btn btn-sm btn-outline-danger rounded-pill px-3"><i class="bi bi-trash"></i></a>
                                            </td>
                                        </tr>
                                        {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        {else}
                            <div class="text-center py-5">
                                <i class="bi bi-cart-x fs-1 text-muted mb-3"></i>
                                <h4 class="fw-bold text-dark">Your cart is empty</h4>
                                <p class="text-muted mb-4">Looks like you haven't added anything to your cart yet.</p>
                                <a href="cart.php" class="btn btn-neon rounded-pill px-5 py-2">Start Shopping</a>
                            </div>
                        {/if}
                    </div>
                </div>

                {if $cartitems}
                    <div class="card border-0 shadow-sm rounded-4 p-4 mb-5 bg-white text-dark">
                        <h5 class="fw-bold mb-4">Promo Code</h5>
                        <form method="post" action="cart.php?a=view">
                            <div class="input-group">
                                <input type="text" name="promocode" class="form-control rounded-start-pill px-4" placeholder="Enter promo code">
                                <button class="btn btn-neon rounded-end-pill px-4" type="submit">Apply</button>
                            </div>
                        </form>
                    </div>
                {/if}
            </div>

            <div class="col-lg-4">
                {if $cartitems}
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
                        <a href="cart.php?a=checkout" class="btn btn-order w-100 py-3 mt-4 rounded-pill">Checkout</a>
                        <a href="cart.php" class="btn btn-order-outline w-100 py-3 mt-3 rounded-pill">Continue Shopping</a>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>

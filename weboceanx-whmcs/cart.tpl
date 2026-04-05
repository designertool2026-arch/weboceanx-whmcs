<!-- cart.tpl -->
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
            <div class="mt-4 d-flex justify-content-between align-items-center">
                <h4 class="fw-bold m-0">Total: <span class="text-success">{$total}</span></h4>
                <a href="cart.php?a=checkout" class="btn btn-neon rounded-pill px-5 py-2">Checkout</a>
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

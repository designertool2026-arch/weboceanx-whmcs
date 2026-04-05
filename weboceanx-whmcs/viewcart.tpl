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
        
        {if !$cartitems}
            <h1 class="display-5 fw-bold mb-3 text-dark">Your basket</h1>
            <p class="text-muted mb-5">Your basket is currently empty.</p>
        {else}
            <h1 class="display-5 fw-bold mb-3 text-dark">Your basket</h1>
            <p class="text-muted mb-5">You have {$cartitems|count} item(s) in your basket, totalling {$total}.</p>
            <a href="cart.php" class="text-decoration-underline text-muted mb-5 d-inline-block">Continue shopping</a>
        {/if}
        
        <div class="basket-summary-box">
            <h6 class="fw-bold mb-4 d-flex align-items-center gap-2 text-dark">
                <i class="bi bi-bag"></i> Basket summary
            </h6>
            
            {if $cartitems}
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
            {/if}
            
            <div class="d-flex justify-content-between align-items-center mt-4 pt-4 border-top">
                <h5 class="fw-bold m-0 text-dark">Basket total</h5>
                <h3 class="fw-bold m-0 text-dark">{if $cartitems}{$total}{else}{$currency.prefix}0.00{$currency.suffix}{/if}</h3>
            </div>
        </div>
    </div>
    
    <!-- Right Content -->
    <div class="split-right">
        <div class="nav-top-right">
            <a href="cart.php?a=view" class="cart-badge">
                <i class="bi bi-bag"></i> {if $cartitems}{$cartitems|count}{else}0{/if} item
            </a>
            {if $loggedin}
                <a href="clientarea.php" class="btn btn-outline-dark rounded-pill px-4 py-2 fw-bold"><i class="bi bi-person"></i> Account</a>
            {else}
                <a href="login.php" class="btn btn-outline-dark rounded-pill px-4 py-2 fw-bold"><i class="bi bi-person"></i> Log in</a>
            {/if}
        </div>
        
        <div class="content-area mx-auto w-100" style="max-width: 700px;">
            {if !$cartitems}
                <div class="text-center py-5 my-5">
                    <div class="mb-4">
                        <i class="bi bi-basket" style="font-size: 5rem; color: #34d399;"></i>
                    </div>
                    <h2 class="fw-bold text-dark mb-3">Your basket is empty</h2>
                    <p class="text-muted mb-5">Looks like you haven't added anything to your basket yet.</p>
                    <a href="cart.php" class="btn btn-gradient rounded-pill px-5 py-3 fs-6">Continue shopping <i class="bi bi-arrow-right ms-2"></i></a>
                </div>
            {else}
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h6 class="fw-bold m-0 d-flex align-items-center gap-2 text-dark">
                        <i class="bi bi-list-ul"></i> Basket items
                    </h6>
                    <a href="#" class="text-muted small text-decoration-underline">Expand all details</a>
                </div>
                
                <div class="card border rounded-4 mb-5 shadow-sm">
                    <div class="card-body p-0">
                        {foreach $cartitems as $item}
                        <div class="p-4 border-bottom">
                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <div>
                                    <div class="text-muted small mb-1">{$item.domain}</div>
                                    <h6 class="fw-bold text-dark mb-1">{$item.product}</h6>
                                    {if $item.domain}
                                        <span class="badge bg-light text-dark border">{$item.domain}</span>
                                    {/if}
                                </div>
                                <a href="cart.php?a=remove&id={$item.id}" class="text-muted hover-danger"><i class="bi bi-trash fs-5"></i></a>
                            </div>
                            <div class="d-flex justify-content-between align-items-end mt-3">
                                <div class="text-muted small">
                                    Renews every {$item.billingcycle}.<br>
                                    Price excludes taxes.
                                </div>
                                <div class="text-end">
                                    <div class="text-muted text-decoration-line-through small">{$item.pricing.baseprice}</div>
                                    <h5 class="fw-bold text-dark m-0">{$item.amount}</h5>
                                </div>
                            </div>
                        </div>
                        {/foreach}
                    </div>
                </div>
                
                <h6 class="fw-bold mb-4 d-flex align-items-center gap-2 text-dark">
                    <i class="bi bi-journal-text"></i> Additional details
                </h6>
                
                <div class="mb-5">
                    <label class="form-label text-muted d-flex justify-content-between small fw-bold">
                        <span>Order Notes</span>
                        <span class="fw-normal">Optional</span>
                    </label>
                    <textarea name="notes" class="form-control rounded-3" rows="3"></textarea>
                </div>
                
                <div class="d-flex flex-column gap-3">
                    <a href="cart.php?a=checkout" class="btn btn-gradient rounded-pill w-100 py-3 fs-6 fw-bold text-center text-decoration-none">Proceed to checkout <i class="bi bi-arrow-right ms-2"></i></a>
                    <a href="cart.php" class="btn btn-outline-dark rounded-pill w-100 py-3 fs-6 fw-bold text-center text-decoration-none">Continue Shopping</a>
                </div>
            {/if}
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

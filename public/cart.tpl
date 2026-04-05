{include file="orderforms/weboceanx-cart/header.tpl"}

<div class="row mb-5">
    <div class="col-lg-8">
        <h2 class="display-6 fw-bold mb-3">Choose Your <span class="text-success">Hosting Plan</span></h2>
        <p class="text-muted lead">Select the perfect hosting solution for your business. All plans include 24/7 support and 99.9% uptime guarantee.</p>
    </div>
</div>

<div class="row g-4">
    {foreach $products as $product}
    <div class="col-md-6 col-lg-4">
        <div class="card border-0 shadow-sm h-100 rounded-4 hover-lift overflow-hidden {if $product.isFeatured}border-neon border-2{/if}">
            {if $product.isFeatured}
                <div class="bg-neon text-dark text-center py-1 fw-bold small">MOST POPULAR</div>
            {/if}
            <div class="card-body p-4 p-xl-5">
                <h4 class="fw-bold mb-2">{$product.name}</h4>
                <div class="mb-4">
                    <span class="display-5 fw-bold">{$product.pricing.minprice.price}</span>
                    <span class="text-muted">/{$product.pricing.minprice.cycle}</span>
                </div>
                
                <div class="mb-4 small text-muted">
                    {$product.description}
                </div>

                <ul class="list-unstyled mb-5">
                    {foreach $product.features as $feature => $value}
                    <li class="mb-2 d-flex align-items-center">
                        <i class="bi bi-check-circle-fill text-success me-2"></i>
                        <span>{$value} {$feature}</span>
                    </li>
                    {/foreach}
                </ul>

                <a href="{$smarty.server.PHP_SELF}?a=add&{if $product.bid}bid={$product.bid}{else}pid={$product.pid}{/if}" class="btn {if $product.isFeatured}btn-neon{else}btn-outline-success{/if} w-100 rounded-pill py-3 fw-bold">
                    Order Now
                </a>
            </div>
        </div>
    </div>
    {/foreach}
</div>

<style>
    .border-neon { border-color: #00ff66 !important; }
    .btn-neon { background-color: #00ff66; color: #0a251c; border: none; }
    .btn-neon:hover { background-color: #00e65c; color: #0a251c; }
    .hover-lift { transition: transform 0.2s ease; }
    .hover-lift:hover { transform: translateY(-10px); }
</style>

{include file="orderforms/weboceanx-cart/footer.tpl"}

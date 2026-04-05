<!-- products.tpl -->
<link rel="stylesheet" href="templates/orderforms/weboceanx-order/style.css">

<div class="weboceanx-order-body py-5">
    <div class="container">
        <!-- Steps -->
        <div class="order-steps">
            <div class="step-item active">
                <span class="step-number">1</span>
                <span>Choose Product</span>
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

        <div class="text-center mb-5">
            <h1 class="display-4 fw-bold mb-3">{$groupname}</h1>
            <p class="lead opacity-75">{$groupdescription}</p>
        </div>

        <div class="row g-4 justify-content-center">
            {foreach $products as $product}
                <div class="col-md-6 col-lg-4">
                    <div class="product-card">
                        <div class="card-header">
                            <h3 class="fw-bold mb-0">{$product.name}</h3>
                            <div class="price">
                                {if $product.bid}
                                    {$product.pricing.minprice.price}
                                {else}
                                    {if $product.pricing.hasconfigoptions}
                                        From {$product.pricing.minprice.price}
                                    {else}
                                        {$product.pricing.minprice.price}
                                    {/if}
                                {/if}
                            </div>
                            <p class="small text-muted mb-0">{$product.pricing.minprice.cycle}</p>
                        </div>
                        <div class="features">
                            {$product.description}
                        </div>
                        <div class="card-footer">
                            <a href="cart.php?a=add&pid={$product.pid}" class="btn btn-order w-100 py-3">Order Now</a>
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>

        {if $groups}
            <div class="mt-5 pt-5 text-center">
                <h5 class="fw-bold mb-4 opacity-50">Other Categories</h5>
                <div class="d-flex flex-wrap justify-content-center gap-3">
                    {foreach $groups as $group}
                        <a href="cart.php?gid={$group.gid}" class="btn btn-order-outline rounded-pill px-4">{$group.name}</a>
                    {/foreach}
                </div>
            </div>
        {/if}
    </div>
</div>

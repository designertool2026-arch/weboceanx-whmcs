{* clientareaproducts.tpl *}
<div class="d-flex justify-content-between align-items-center mb-4">
    <h2 class="fw-bold text-dark m-0">My Products & Services</h2>
    <a href="cart.php" class="btn btn-gradient rounded-pill px-4 fw-bold">Order New</a>
</div>

<div class="row g-4">
    {foreach $services as $service}
    <div class="col-md-6 col-lg-4">
        <div class="card border-0 shadow-sm rounded-4 h-100 hover-lift">
            <div class="card-body p-4 d-flex flex-column">
                <div class="d-flex justify-content-between align-items-start mb-3">
                    <div>
                        <h5 class="fw-bold text-dark mb-1">{$service.product}</h5>
                        <div class="small text-muted">{$service.domain}</div>
                    </div>
                    <span class="badge rounded-pill {if $service.status == 'Active'}bg-success{elseif $service.status == 'Pending'}bg-warning{else}bg-secondary{/if}">
                        {$service.status}
                    </span>
                </div>
                
                <div class="mt-auto pt-4 border-top">
                    <div class="d-flex justify-content-between align-items-end mb-3">
                        <div>
                            <div class="small text-muted mb-1">Pricing</div>
                            <div class="fw-bold text-dark">{$service.amount} <span class="small text-muted fw-normal">/{$service.billingcycle}</span></div>
                        </div>
                        <div class="text-end">
                            <div class="small text-muted mb-1">Next Due</div>
                            <div class="fw-bold text-dark">{$service.nextduedate}</div>
                        </div>
                    </div>
                    <a href="clientarea.php?action=productdetails&id={$service.id}" class="btn btn-outline-dark rounded-pill w-100 fw-bold">Manage Service</a>
                </div>
            </div>
        </div>
    </div>
    {foreachelse}
    <div class="col-12">
        <div class="card border-0 shadow-sm rounded-4 p-5 text-center">
            <i class="bi bi-box-seam text-muted display-1 mb-3"></i>
            <h4 class="fw-bold text-dark">No services found</h4>
            <p class="text-muted mb-4">You don't have any active products or services with us yet.</p>
            <a href="cart.php" class="btn btn-gradient rounded-pill px-4 fw-bold">Browse Products</a>
        </div>
    </div>
    {/foreach}
</div>

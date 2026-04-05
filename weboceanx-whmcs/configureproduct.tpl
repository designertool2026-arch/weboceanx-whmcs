<!-- configureproduct.tpl -->
<div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-5">
    <div class="card-header bg-white border-0 p-4">
        <h5 class="m-0 fw-bold text-dark">Configure Product</h5>
    </div>
    <div class="card-body p-4 text-dark">
        <h4 class="fw-bold mb-4">{$productname}</h4>
        <p class="text-muted mb-5">{$productdescription}</p>
        
        <form method="post" action="cart.php?a=add&pid={$pid}">
            <input type="hidden" name="token" value="{$token}" />
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="mb-4">
                        <label class="form-label fw-bold small text-uppercase text-muted">Billing Cycle</label>
                        <select name="billingcycle" class="form-select rounded-3 p-3">
                            {foreach $billingcycles as $cycle}
                                <option value="{$cycle.id}">{$cycle.name} - {$cycle.price}</option>
                            {/foreach}
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="mb-4">
                        <label class="form-label fw-bold small text-uppercase text-muted">Domain</label>
                        <input type="text" name="domain" class="form-control rounded-3 p-3" placeholder="Enter your domain name">
                    </div>
                </div>
            </div>

            {if $configurableoptions}
                <h5 class="fw-bold mb-4 mt-4">Configurable Options</h5>
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
                                            <input class="form-check-input" type="radio" name="configoption[{$option.id}]" value="{$suboption.id}" id="opt{$suboption.id}">
                                            <label class="form-check-label" for="opt{$suboption.id}">{$suboption.name}</label>
                                        </div>
                                    {/foreach}
                                {/if}
                            </div>
                        </div>
                    {/foreach}
                </div>
            {/if}

            <div class="mt-5 d-flex justify-content-between align-items-center border-top pt-4">
                <h4 class="fw-bold m-0">Total: <span class="text-success">{$total}</span></h4>
                <button type="submit" class="btn btn-neon rounded-pill px-5 py-2">Continue</button>
            </div>
        </form>
    </div>
</div>

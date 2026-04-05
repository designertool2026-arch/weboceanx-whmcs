{include file="$template/header.tpl"}

<div class="container-fluid px-lg-5 py-5">
    <div class="row justify-content-center mb-5">
        <div class="col-lg-8 text-center">
            <h1 class="display-4 fw-bold mb-3">Transfer Your <span class="text-success">Domain to Us</span></h1>
            <p class="text-muted lead">Move your domain to WebOceanX and enjoy better support, lower prices, and a more intuitive management experience.</p>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="card border-0 shadow-lg rounded-4 p-4 p-md-5 bg-white">
                <form method="post" action="cart.php?a=add&domain=transfer" class="row g-4">
                    <div class="col-md-12">
                        <label class="form-label fw-bold fs-5">Transfer a Domain</label>
                        <div class="input-group input-group-lg shadow-sm rounded-pill overflow-hidden">
                            <span class="input-group-text bg-light border-0 ps-4 pe-3">
                                <i class="bi bi-arrow-left-right text-success"></i>
                            </span>
                            <input type="text" name="domain" class="form-control bg-light border-0 py-3 pe-4" placeholder="Enter the domain you want to transfer" value="{$domain}" required autofocus>
                            <button type="submit" class="btn btn-neon px-5 fw-bold">Transfer Domain</button>
                        </div>
                    </div>
                    
                    <div class="col-md-12 mt-5">
                        <h4 class="fw-bold mb-4">Transfer <span class="text-success">Process</span></h4>
                        <div class="row g-4">
                            <div class="col-md-4">
                                <div class="d-flex align-items-start gap-3">
                                    <div class="bg-success-subtle text-success rounded-circle p-3 fw-bold fs-4" style="width: 56px; height: 56px; min-width: 56px; display: flex; align-items: center; justify-content: center;">
                                        1
                                    </div>
                                    <div>
                                        <h6 class="fw-bold m-0">Unlock Domain</h6>
                                        <p class="small text-muted mb-0">Ensure your domain is unlocked and you have the EPP/Auth code from your current registrar.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="d-flex align-items-start gap-3">
                                    <div class="bg-success-subtle text-success rounded-circle p-3 fw-bold fs-4" style="width: 56px; height: 56px; min-width: 56px; display: flex; align-items: center; justify-content: center;">
                                        2
                                    </div>
                                    <div>
                                        <h6 class="fw-bold m-0">Submit Transfer</h6>
                                        <p class="small text-muted mb-0">Enter your domain above and provide the EPP code during the checkout process.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="d-flex align-items-start gap-3">
                                    <div class="bg-success-subtle text-success rounded-circle p-3 fw-bold fs-4" style="width: 56px; height: 56px; min-width: 56px; display: flex; align-items: center; justify-content: center;">
                                        3
                                    </div>
                                    <div>
                                        <h6 class="fw-bold m-0">Confirm Email</h6>
                                        <p class="small text-muted mb-0">Approve the transfer request sent to your administrative email address.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<style>
    .btn-neon { background-color: #00ff66; color: #0a251c; border: none; transition: all 0.3s ease; }
    .btn-neon:hover { background-color: #00e65c; }
    .bg-success-subtle { background-color: rgba(0, 255, 102, 0.1); }
</style>

{include file="$template/footer.tpl"}

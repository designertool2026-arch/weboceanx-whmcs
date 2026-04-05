<!-- orderconfirmation.tpl -->
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm rounded-4 text-center p-5">
                <div class="mb-4">
                    <i class="bi bi-check-circle-fill text-success" style="font-size: 4rem;"></i>
                </div>
                <h2 class="fw-bold text-dark mb-3">Order Confirmed!</h2>
                <p class="text-muted mb-4">Thank you for your purchase. Your order has been successfully processed.</p>
                
                <div class="bg-light rounded-4 p-4 mb-4 text-start">
                    <h5 class="fw-bold text-dark mb-3">Order Details</h5>
                    <div class="d-flex justify-content-between mb-2">
                        <span class="text-muted">Order Number</span>
                        <span class="fw-bold text-dark">#{$ordernumber}</span>
                    </div>
                    <div class="d-flex justify-content-between mb-2">
                        <span class="text-muted">Total Amount</span>
                        <span class="fw-bold text-dark">{$total}</span>
                    </div>
                    <div class="d-flex justify-content-between">
                        <span class="text-muted">Payment Method</span>
                        <span class="fw-bold text-dark">{$paymentmethod}</span>
                    </div>
                </div>
                
                <h5 class="fw-bold text-dark mb-3">What's Next?</h5>
                <ul class="list-unstyled text-muted mb-4">
                    <li class="mb-2"><i class="bi bi-envelope-check text-success me-2"></i> Check your email for the order confirmation.</li>
                    <li class="mb-2"><i class="bi bi-gear-fill text-success me-2"></i> Your services will be activated shortly.</li>
                    <li><i class="bi bi-person-badge-fill text-success me-2"></i> Access your account dashboard to manage your services.</li>
                </ul>
                
                <a href="clientarea.php" class="btn btn-dark rounded-pill px-5 py-2 fw-bold">Go to Client Area</a>
            </div>
        </div>
    </div>
</div>

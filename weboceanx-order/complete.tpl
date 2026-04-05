<!-- complete.tpl -->
<link rel="stylesheet" href="templates/orderforms/weboceanx-order/style.css">

<div class="weboceanx-order-body py-5">
    <div class="container">
        <div class="card border-0 shadow-lg rounded-4 overflow-hidden mb-5 text-center p-5">
            <div class="card-body p-5 text-dark">
                <div class="icon-box bg-success bg-opacity-10 p-4 rounded-circle d-inline-flex align-items-center justify-content-center mb-4" style="width: 100px; height: 100px;">
                    <i class="bi bi-check-circle-fill fs-1 text-success"></i>
                </div>
                <h1 class="display-5 fw-bold mb-3">Order Complete!</h1>
                <p class="lead mb-5 text-muted">Thank you for your order. Your order number is <strong>#{$ordernumber}</strong>.</p>
                
                <div class="card bg-light border-0 rounded-4 p-4 mb-5 mx-auto" style="max-width: 600px;">
                    <div class="row g-4 text-start">
                        <div class="col-sm-6">
                            <h6 class="text-muted text-uppercase fw-bold mb-1">Order Number:</h6>
                            <h5 class="fw-bold">#{$ordernumber}</h5>
                        </div>
                        <div class="col-sm-6">
                            <h6 class="text-muted text-uppercase fw-bold mb-1">Order Date:</h6>
                            <h5 class="fw-bold">{$orderdate}</h5>
                        </div>
                        <div class="col-sm-6">
                            <h6 class="text-muted text-uppercase fw-bold mb-1">Total Amount:</h6>
                            <h5 class="fw-bold text-success">{$total}</h5>
                        </div>
                        <div class="col-sm-6">
                            <h6 class="text-muted text-uppercase fw-bold mb-1">Payment Method:</h6>
                            <h5 class="fw-bold">{$paymentmethod}</h5>
                        </div>
                    </div>
                </div>

                <div class="d-flex flex-wrap justify-content-center gap-3">
                    <a href="clientarea.php" class="btn btn-order rounded-pill px-5 py-3">Go to Dashboard</a>
                    <a href="clientarea.php?action=services" class="btn btn-order-outline rounded-pill px-5 py-3">Manage Services</a>
                </div>
            </div>
        </div>
    </div>
</div>

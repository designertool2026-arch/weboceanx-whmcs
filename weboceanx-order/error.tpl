<!-- error.tpl -->
<link rel="stylesheet" href="templates/orderforms/weboceanx-order/style.css">

<div class="weboceanx-order-body py-5">
    <div class="container">
        <div class="card border-0 shadow-lg rounded-4 overflow-hidden mb-5 text-center p-5">
            <div class="card-body p-5 text-dark">
                <div class="icon-box bg-danger bg-opacity-10 p-4 rounded-circle d-inline-flex align-items-center justify-content-center mb-4" style="width: 100px; height: 100px;">
                    <i class="bi bi-exclamation-octagon-fill fs-1 text-danger"></i>
                </div>
                <h1 class="display-5 fw-bold mb-3">Oops! Something went wrong.</h1>
                <p class="lead mb-5 text-muted">{$errormessage}</p>
                
                <div class="d-flex flex-wrap justify-content-center gap-3">
                    <a href="javascript:history.go(-1)" class="btn btn-order-outline rounded-pill px-5 py-3"><i class="bi bi-arrow-left me-2"></i> Go Back</a>
                    <a href="index.php" class="btn btn-order rounded-pill px-5 py-3">Return Home</a>
                </div>
            </div>
        </div>
    </div>
</div>

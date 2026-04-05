{include file="$template/header.tpl"}

<div class="container-fluid px-lg-5 py-5">
    <div class="row justify-content-center align-items-center min-vh-50">
        <div class="col-lg-6 text-center">
            <div class="mb-5">
                <i class="bi bi-exclamation-triangle display-1 text-danger opacity-50 mb-4 d-block"></i>
                <h1 class="display-4 fw-bold mb-3">Oops! <span class="text-danger">Something Went Wrong</span></h1>
                <p class="text-muted lead mb-5">We encountered an error while processing your request. Please check the details below or return to the homepage.</p>
            </div>

            <div class="card border-0 shadow-sm rounded-4 p-4 p-md-5 mb-5 bg-light">
                <h5 class="fw-bold mb-4 text-danger">Error Details</h5>
                <div class="alert alert-danger border-0 rounded-4 p-4 text-start small">
                    <i class="bi bi-info-circle-fill me-2"></i> {$errormessage}
                </div>
                {if $errordetails}
                <div class="text-start mt-4">
                    <h6 class="fw-bold small text-muted mb-2">Technical Information:</h6>
                    <code class="d-block bg-white p-3 rounded-4 border small">{$errordetails}</code>
                </div>
                {/if}
            </div>

            <div class="d-flex flex-wrap justify-content-center gap-3">
                <a href="index.php" class="btn btn-dark-green btn-lg rounded-pill px-5 fw-bold shadow-lg">
                    <i class="bi bi-house-door me-2"></i> Return Home
                </a>
                <a href="submitticket.php" class="btn btn-outline-danger btn-lg rounded-pill px-5 fw-bold">
                    <i class="bi bi-headset me-2"></i> Contact Support
                </a>
            </div>
        </div>
    </div>
</div>

<style>
    .min-vh-50 { min-height: 50vh; }
    .bg-dark-green { background-color: #0a251c; color: white; border: none; transition: all 0.3s ease; }
    .bg-dark-green:hover { background-color: #0d3125; color: white; transform: translateY(-2px); box-shadow: 0 8px 15px rgba(10, 37, 28, 0.3); }
</style>

{include file="$template/footer.tpl"}

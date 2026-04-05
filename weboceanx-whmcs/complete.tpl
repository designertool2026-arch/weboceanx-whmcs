<style>
    :root {
        --wo-light-green: #f0fdf4;
        --wo-neon-green: #00ff66;
        --wo-dark: #111827;
        --wo-muted: #6b7280;
    }
    body {
        background-color: #f9fafb;
    }
    .complete-container {
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
        font-family: 'Inter', system-ui, sans-serif;
        padding: 2rem;
    }
    .complete-card {
        background-color: #ffffff;
        border-radius: 1rem;
        box-shadow: 0 10px 25px rgba(0,0,0,0.05);
        padding: 4rem;
        text-align: center;
        max-width: 600px;
        width: 100%;
    }
    .icon-wrapper {
        margin: 0 auto 2rem;
        display: flex;
        align-items: center;
        justify-content: center;
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
    .text-dark { color: var(--wo-dark) !important; }
    .text-muted { color: var(--wo-muted) !important; }
</style>

<div class="complete-container">
    <div class="complete-card">
        <div class="icon-wrapper">
            <i class="bi bi-rocket-takeoff" style="font-size: 5rem; color: #34d399;"></i>
        </div>
        
        <h1 class="display-6 fw-bold mb-3 text-dark">Something exciting is around the corner</h1>
        <p class="text-muted mb-5">Almost there! Getting things ready for you.</p>
        
        <div class="bg-light rounded-4 p-4 mb-5 text-start border">
            <div class="row g-4">
                <div class="col-sm-6">
                    <div class="text-muted small fw-bold mb-1">Order Number</div>
                    <div class="fw-bold text-dark fs-5">#{$ordernumber}</div>
                </div>
                <div class="col-sm-6">
                    <div class="text-muted small fw-bold mb-1">Total Amount</div>
                    <div class="fw-bold text-dark fs-5">{$total}</div>
                </div>
                <div class="col-sm-6">
                    <div class="text-muted small fw-bold mb-1">Order Date</div>
                    <div class="fw-bold text-dark">{$orderdate}</div>
                </div>
                <div class="col-sm-6">
                    <div class="text-muted small fw-bold mb-1">Payment Method</div>
                    <div class="fw-bold text-dark">{$paymentmethod}</div>
                </div>
            </div>
        </div>
        
        <a href="clientarea.php" class="btn btn-gradient rounded-pill px-5 py-3 fs-6 fw-bold text-dark w-100">Go to Dashboard <i class="bi bi-arrow-right ms-2"></i></a>
    </div>
</div>

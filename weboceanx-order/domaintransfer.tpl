<!-- domaintransfer.tpl -->
<link rel="stylesheet" href="templates/orderforms/weboceanx-order/style.css">

<div class="weboceanx-order-body py-5">
    <div class="container">
        <!-- Steps -->
        <div class="order-steps">
            <div class="step-item active">
                <span class="step-number">1</span>
                <span>Transfer Domain</span>
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

        <div class="card border-0 shadow-lg rounded-4 overflow-hidden mb-5 bg-dark-green text-white">
            <div class="card-body p-5 text-center">
                <h1 class="display-5 fw-bold mb-4">Transfer your domain</h1>
                <p class="lead mb-5 opacity-75">Transfer your existing domain to Web Oceanx and save on renewal fees.</p>
                
                <form method="post" action="cart.php?a=add&domain=transfer" class="mx-auto" style="max-width: 800px;">
                    <div class="input-group input-group-lg shadow-lg rounded-pill overflow-hidden border-0">
                        <input type="text" name="sld" class="form-control border-0 px-4 py-4 fs-5" placeholder="Enter your domain name (e.g. example)" required>
                        <select name="tld" class="form-select border-0 px-4 py-4 fs-5" style="max-width: 150px;">
                            <option value=".com">.com</option>
                            <option value=".net">.net</option>
                            <option value=".org">.org</option>
                            <option value=".io">.io</option>
                        </select>
                        <button class="btn btn-neon px-5 fw-bold" type="submit">Transfer</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

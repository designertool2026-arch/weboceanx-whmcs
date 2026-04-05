<!-- domainregister.tpl -->
<div class="card border-0 shadow-lg rounded-4 overflow-hidden mb-5 bg-dark-green text-white">
    <div class="card-body p-5 text-center">
        <h1 class="display-5 fw-bold mb-4">Register a new domain</h1>
        <p class="lead mb-5 opacity-75">Find the perfect domain name for your business today.</p>
        
        <form method="post" action="domainchecker.php" class="mx-auto" style="max-width: 800px;">
            <input type="hidden" name="token" value="{$token}" />
            <div class="input-group input-group-lg shadow-lg rounded-pill overflow-hidden border-0">
                <input type="text" name="domain" class="form-control border-0 px-4 py-4 fs-5" placeholder="Enter your domain name (e.g. example.com)" required>
                <button class="btn btn-gradient px-5 fw-bold" type="submit">Search</button>
            </div>
        </form>
    </div>
</div>

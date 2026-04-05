<!-- alerts.tpl -->
{if $errormessage}
    <div class="alert alert-danger rounded-4 border-0 shadow-sm p-4 mb-4 d-flex align-items-center gap-3">
        <i class="bi bi-exclamation-triangle-fill fs-3"></i>
        <div>
            <h6 class="fw-bold mb-1">Error Occurred</h6>
            <p class="m-0 small opacity-75">{$errormessage}</p>
        </div>
    </div>
{/if}

{if $successmessage}
    <div class="alert alert-success rounded-4 border-0 shadow-sm p-4 mb-4 d-flex align-items-center gap-3">
        <i class="bi bi-check-circle-fill fs-3"></i>
        <div>
            <h6 class="fw-bold mb-1">Success!</h6>
            <p class="m-0 small opacity-75">{$successmessage}</p>
        </div>
    </div>
{/if}

{if $infomessage}
    <div class="alert alert-info rounded-4 border-0 shadow-sm p-4 mb-4 d-flex align-items-center gap-3">
        <i class="bi bi-info-circle-fill fs-3"></i>
        <div>
            <h6 class="fw-bold mb-1">Information</h6>
            <p class="m-0 small opacity-75">{$infomessage}</p>
        </div>
    </div>
{/if}

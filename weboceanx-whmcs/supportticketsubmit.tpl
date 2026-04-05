<!-- supportticketsubmit.tpl -->
<div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-5">
    <div class="card-header bg-white border-0 p-4">
        <h5 class="m-0 fw-bold text-dark">Open New Support Ticket</h5>
    </div>
    <div class="card-body p-4 text-dark">
        <form method="post" action="submitticket.php?step=3" enctype="multipart/form-data" class="needs-validation" novalidate>
            <input type="hidden" name="token" value="{$token}" />
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="mb-4">
                        <label class="form-label fw-bold small text-uppercase text-muted">Name</label>
                        <input type="text" name="name" class="form-control rounded-3 p-3" value="{$clientname}" readonly>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="mb-4">
                        <label class="form-label fw-bold small text-uppercase text-muted">Email Address</label>
                        <input type="email" name="email" class="form-control rounded-3 p-3" value="{$clientemail}" readonly>
                    </div>
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label fw-bold small text-uppercase text-muted">Subject</label>
                <input type="text" name="subject" class="form-control rounded-3 p-3" placeholder="Enter ticket subject" required>
                <div class="invalid-feedback">Please enter a subject for your ticket.</div>
            </div>

            <div class="row g-4">
                <div class="col-md-6">
                    <div class="mb-4">
                        <label class="form-label fw-bold small text-uppercase text-muted">Department</label>
                        <select name="deptid" class="form-select rounded-3 p-3" required>
                            <option value="" disabled selected>Select Department</option>
                            {foreach $departments as $dept}
                                <option value="{$dept.id}">{$dept.name}</option>
                            {/foreach}
                        </select>
                        <div class="invalid-feedback">Please select a department.</div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="mb-4">
                        <label class="form-label fw-bold small text-uppercase text-muted">Priority</label>
                        <select name="urgency" class="form-select rounded-3 p-3" required>
                            <option value="High">High</option>
                            <option value="Medium" selected>Medium</option>
                            <option value="Low">Low</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label fw-bold small text-uppercase text-muted">Message</label>
                <textarea name="message" class="form-control rounded-3 p-3" rows="8" placeholder="Describe your issue in detail..." required minlength="10"></textarea>
                <div class="invalid-feedback">Please provide more details (at least 10 characters).</div>
            </div>

            <div class="mb-4">
                <label class="form-label fw-bold small text-uppercase text-muted">Attachments</label>
                <input type="file" name="attachments[]" class="form-control rounded-3 p-3" multiple>
                <p class="small text-muted mt-2">Allowed File Extensions: .jpg, .gif, .jpeg, .png, .pdf, .zip (Max file size: 2MB)</p>
            </div>

            <div class="mt-5 d-flex justify-content-end border-top pt-4">
                <button type="submit" class="btn btn-neon rounded-pill px-5 py-2">Submit Ticket</button>
            </div>
        </form>
    </div>

<script>
(function () {
  'use strict'
  var forms = document.querySelectorAll('.needs-validation')
  Array.prototype.slice.call(forms)
    .forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }
        form.classList.add('was-validated')
      }, false)
    })
})()
</script>
</div>

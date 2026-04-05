{* contact.tpl *}
<div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-5">
    <div class="row g-0">
        <div class="col-lg-6 bg-dark-green text-white p-5 d-flex flex-column justify-content-center">
            <h2 class="display-6 fw-bold mb-4">Get in touch</h2>
            <p class="lead opacity-75 mb-5">Have questions about our hosting services? Our team is here to help you 24/7.</p>
            
            <div class="d-flex align-items-center gap-3 mb-4">
                <div class="bg-white bg-opacity-10 rounded-circle p-3">
                    <i class="bi bi-geo-alt fs-4"></i>
                </div>
                <div>
                    <h6 class="fw-bold mb-0">Our Location</h6>
                    <p class="small opacity-75 mb-0">123 Hosting St, Tech City, TC 12345</p>
                </div>
            </div>
            
            <div class="d-flex align-items-center gap-3 mb-4">
                <div class="bg-white bg-opacity-10 rounded-circle p-3">
                    <i class="bi bi-telephone fs-4"></i>
                </div>
                <div>
                    <h6 class="fw-bold mb-0">Phone Number</h6>
                    <p class="small opacity-75 mb-0">+233 50 859 8832</p>
                </div>
            </div>
            
            <div class="d-flex align-items-center gap-3">
                <div class="bg-white bg-opacity-10 rounded-circle p-3">
                    <i class="bi bi-envelope fs-4"></i>
                </div>
                <div>
                    <h6 class="fw-bold mb-0">Email Address</h6>
                    <p class="small opacity-75 mb-0">support@weboceanx.com</p>
                </div>
            </div>
        </div>
        <div class="col-lg-6 p-5">
            {if $sent}
                <div class="alert alert-success rounded-4 p-4 mb-0">
                    <h5 class="alert-heading fw-bold"><i class="bi bi-check-circle-fill me-2"></i> Message Sent!</h5>
                    <p class="mb-0">Thank you for contacting us. We will get back to you as soon as possible.</p>
                </div>
            {else}
                <h3 class="fw-bold mb-4">Send us a message</h3>
                <form method="post" action="contact.php?action=send" class="needs-validation" novalidate id="contactForm">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="name" class="form-label small fw-bold">Your Name</label>
                            <input type="text" name="name" id="name" value="{$name}" class="form-control" required>
                            <div class="invalid-feedback">Please enter your name.</div>
                        </div>
                        <div class="col-md-6">
                            <label for="email" class="form-label small fw-bold">Email Address</label>
                            <input type="email" name="email" id="email" value="{$email}" class="form-control" required>
                            <div class="invalid-feedback">Please enter a valid email address.</div>
                        </div>
                        <div class="col-12">
                            <label for="subject" class="form-label small fw-bold">Subject</label>
                            <input type="text" name="subject" id="subject" value="{$subject}" class="form-control" required>
                            <div class="invalid-feedback">Please enter a subject.</div>
                        </div>
                        <div class="col-12">
                            <label for="message" class="form-label small fw-bold">Message</label>
                            <textarea name="message" id="message" rows="5" class="form-control" required minlength="10"></textarea>
                            <div class="invalid-feedback">Please enter your message (at least 10 characters).</div>
                        </div>
                        {if $captcha}
                            <div class="col-12">
                                <div class="card bg-light border-0 p-3">
                                    {$captcha}
                                </div>
                            </div>
                        {/if}
                        <div class="col-12 mt-4">
                            <button type="submit" class="btn btn-neon rounded-pill px-5 py-3 fw-bold w-100">Send Message</button>
                        </div>
                    </div>
                </form>
            {/if}
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('contactForm');
    if (form) {
        form.addEventListener('submit', function(event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
    }
});
</script>

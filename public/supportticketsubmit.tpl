{include file="$template/header.tpl"}

<div class="container-fluid px-lg-5 py-5">
    <!-- Page Header -->
    <div class="row justify-content-center mb-5">
        <div class="col-lg-8 text-center">
            <h1 class="display-5 fw-bold mb-3">Open a <span class="text-success">New Ticket</span></h1>
            <p class="text-muted lead">Our support team is here to help you 24/7. Please provide as much detail as possible.</p>
        </div>
    </div>

    <!-- Ticket Form -->
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="card border-0 shadow-lg rounded-4 p-4 p-md-5 bg-white">
                <form method="post" action="submitticket.php?step=3" enctype="multipart/form-data" class="row g-4">
                    <div class="col-md-6">
                        <label class="form-label fw-bold">Your Name</label>
                        <input type="text" name="name" class="form-control bg-light border-0 rounded-pill px-4 py-3" value="{$clientname}" readonly>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label fw-bold">Email Address</label>
                        <input type="email" name="email" class="form-control bg-light border-0 rounded-pill px-4 py-3" value="{$clientemail}" readonly>
                    </div>
                    <div class="col-md-8">
                        <label class="form-label fw-bold">Subject</label>
                        <input type="text" name="subject" class="form-control bg-light border-0 rounded-pill px-4 py-3" placeholder="Briefly describe your issue" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label fw-bold">Priority</label>
                        <select name="urgency" class="form-select bg-light border-0 rounded-pill px-4 py-3" required>
                            <option value="Low">Low</option>
                            <option value="Medium" selected>Medium</option>
                            <option value="High">High</option>
                        </select>
                    </div>
                    <div class="col-md-12">
                        <label class="form-label fw-bold">Department</label>
                        <div class="row g-3">
                            {foreach $departments as $dept}
                            <div class="col-md-4">
                                <div class="form-check card border-0 bg-light p-3 rounded-4 h-100 hover-lift">
                                    <input class="form-check-input ms-0 me-3" type="radio" name="deptid" id="dept_{$dept.id}" value="{$dept.id}" {if $dept.id == $deptid}checked{/if} required>
                                    <label class="form-check-label fw-bold stretched-link" for="dept_{$dept.id}">
                                        {$dept.name}
                                        <div class="small text-muted fw-normal">{$dept.description}</div>
                                    </label>
                                </div>
                            </div>
                            {/foreach}
                        </div>
                    </div>
                    <div class="col-md-12 mt-4">
                        <label class="form-label fw-bold">Message</label>
                        <textarea name="message" class="form-control bg-light border-0 rounded-4 p-4" rows="8" placeholder="Describe your issue in detail..." required>{$message}</textarea>
                    </div>
                    <div class="col-md-12">
                        <label class="form-label fw-bold">Attachments (Optional)</label>
                        <div class="input-group">
                            <input type="file" name="attachments[]" class="form-control bg-light border-0 rounded-pill px-4 py-3" id="ticketAttachments" multiple>
                        </div>
                        <div class="small text-muted mt-2 ps-3">Allowed File Extensions: .jpg, .gif, .jpeg, .png, .pdf, .zip (Max 5MB)</div>
                    </div>
                    
                    <div class="col-md-12 mt-5 text-center">
                        <button type="submit" class="btn btn-neon btn-lg rounded-pill px-5 py-3 fw-bold shadow-lg">
                            Submit Support Ticket <i class="bi bi-send ms-2"></i>
                        </button>
                        <div class="mt-3">
                            <a href="supporttickets.php" class="text-muted text-decoration-none small fw-bold">Cancel and return to list</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<style>
    .btn-neon { background-color: #00ff66; color: #0a251c; border: none; transition: all 0.3s ease; }
    .btn-neon:hover { background-color: #00e65c; transform: translateY(-2px); box-shadow: 0 8px 15px rgba(0, 255, 102, 0.3); }
    .hover-lift { transition: transform 0.2s ease; }
    .hover-lift:hover { transform: translateY(-5px); }
</style>

{include file="$template/footer.tpl"}

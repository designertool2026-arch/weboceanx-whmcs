{include file="$template/header.tpl"}

<div class="container-fluid px-lg-5 py-5">
    <!-- Ticket Header -->
    <div class="row justify-content-center mb-5">
        <div class="col-lg-10">
            <div class="card border-0 shadow-sm rounded-4 p-4 p-md-5 bg-dark-green text-white position-relative overflow-hidden">
                <div class="position-relative z-index-2 d-md-flex align-items-center justify-content-between">
                    <div>
                        <div class="d-flex align-items-center gap-3 mb-3">
                            <span class="badge bg-neon text-dark rounded-pill px-3 py-2 fw-bold">#{$tid}</span>
                            {if $status == 'Open'}
                                <span class="badge bg-success text-white rounded-pill px-3 py-2">Open</span>
                            {elseif $status == 'Answered'}
                                <span class="badge bg-info text-white rounded-pill px-3 py-2">Answered</span>
                            {elseif $status == 'Customer-Reply'}
                                <span class="badge bg-warning text-dark rounded-pill px-3 py-2">Customer Reply</span>
                            {elseif $status == 'Closed'}
                                <span class="badge bg-secondary text-white rounded-pill px-3 py-2">Closed</span>
                            {else}
                                <span class="badge bg-light text-dark rounded-pill px-3 py-2">{$status}</span>
                            {/if}
                        </div>
                        <h1 class="display-6 fw-bold mb-2">{$subject}</h1>
                        <p class="opacity-75 mb-0">Department: <span class="text-neon">{$department}</span> | Priority: <span class="text-neon">{$urgency}</span></p>
                    </div>
                    <div class="mt-4 mt-md-0">
                        <a href="supporttickets.php" class="btn btn-outline-light rounded-pill px-4 fw-bold">
                            <i class="bi bi-arrow-left me-2"></i> Back to List
                        </a>
                    </div>
                </div>
                <i class="bi bi-ticket-perforated position-absolute bottom-0 end-0 opacity-10 display-1 mb-n3 me-n3"></i>
            </div>
        </div>
    </div>

    <!-- Ticket Conversation -->
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="conversation-container mb-5">
                {foreach $replies as $reply}
                <div class="card border-0 shadow-sm rounded-4 mb-4 overflow-hidden {if $reply.admin}admin-reply border-start border-neon border-5{/if}">
                    <div class="card-header bg-white border-0 p-4 d-flex justify-content-between align-items-center">
                        <div class="d-flex align-items-center gap-3">
                            <div class="avatar {if $reply.admin}bg-neon text-dark{else}bg-light text-muted{/if} rounded-circle d-flex align-items-center justify-content-center fw-bold" style="width: 40px; height: 40px;">
                                {$reply.name|substr:0:1}
                            </div>
                            <div>
                                <h6 class="m-0 fw-bold">{$reply.name}</h6>
                                <span class="small text-muted">{$reply.date}</span>
                            </div>
                        </div>
                        {if $reply.admin}
                            <span class="badge bg-neon text-dark rounded-pill px-3 py-2 fw-bold">Support Staff</span>
                        {else}
                            <span class="badge bg-light text-muted rounded-pill px-3 py-2 fw-bold">Client</span>
                        {/if}
                    </div>
                    <div class="card-body p-4 p-md-5">
                        <div class="ticket-message">
                            {$reply.message}
                        </div>
                        {if $reply.attachments}
                        <div class="mt-4 pt-4 border-top">
                            <h6 class="small fw-bold text-muted mb-3">Attachments:</h6>
                            <div class="d-flex flex-wrap gap-2">
                                {foreach $reply.attachments as $attachment}
                                <a href="{$attachment.link}" class="btn btn-sm btn-light rounded-pill px-3 py-2 border">
                                    <i class="bi bi-paperclip me-1"></i> {$attachment.name}
                                </a>
                                {/foreach}
                            </div>
                        </div>
                        {/if}
                    </div>
                </div>
                {/foreach}
            </div>

            <!-- Reply Form -->
            {if $status != 'Closed'}
            <div class="card border-0 shadow-lg rounded-4 p-4 p-md-5 bg-white">
                <h4 class="fw-bold mb-4">Post a <span class="text-success">Reply</span></h4>
                <form method="post" action="viewticket.php?tid={$tid}&amp;c={$c}&amp;postreply=true" enctype="multipart/form-data">
                    <div class="mb-4">
                        <label class="form-label fw-bold">Your Message</label>
                        <textarea name="replymessage" class="form-control bg-light border-0 rounded-4 p-4" rows="6" placeholder="Type your reply here..." required>{$replymessage}</textarea>
                    </div>
                    <div class="mb-4">
                        <label class="form-label fw-bold">Attachments (Optional)</label>
                        <input type="file" name="attachments[]" class="form-control bg-light border-0 rounded-pill px-4 py-3" multiple>
                    </div>
                    <div class="text-end mt-5">
                        <button type="submit" class="btn btn-neon btn-lg rounded-pill px-5 py-3 fw-bold shadow-lg">
                            Post Reply <i class="bi bi-reply-fill ms-2"></i>
                        </button>
                    </div>
                </form>
            </div>
            {else}
            <div class="alert alert-secondary rounded-4 border-0 p-4 text-center">
                <i class="bi bi-lock-fill fs-4 d-block mb-2"></i>
                <h6 class="fw-bold m-0">This ticket is closed.</h6>
                <p class="small text-muted mb-0">If you need further assistance, please open a new ticket.</p>
            </div>
            {/if}
        </div>
    </div>
</div>

<style>
    .bg-dark-green { background-color: #0a251c; }
    .text-neon { color: #00ff66; }
    .bg-neon { background-color: #00ff66; }
    .btn-neon { background-color: #00ff66; color: #0a251c; border: none; transition: all 0.3s ease; }
    .btn-neon:hover { background-color: #00e65c; transform: translateY(-2px); box-shadow: 0 8px 15px rgba(0, 255, 102, 0.3); }
    .border-neon { border-color: #00ff66 !important; }
    .z-index-2 { z-index: 2; }
    .ticket-message { line-height: 1.8; color: #444; }
    .admin-reply { background-color: #f8fffb; }
</style>

{include file="$template/footer.tpl"}

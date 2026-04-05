<!-- supportticketview.tpl -->
<div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-5">
    <div class="card-header bg-dark-green text-white p-4 d-flex justify-content-between align-items-center">
        <div>
            <h5 class="m-0 fw-bold text-neon">#{$tid} - {$subject}</h5>
            <p class="m-0 small opacity-75 mt-1">Last Updated: {$lastreply}</p>
        </div>
        <div class="badge rounded-pill {if $status == 'Open'}bg-success{elseif $status == 'Answered'}bg-primary{else}bg-secondary{/if} fs-6 px-4 py-2">
            {$status}
        </div>
    </div>
    <div class="card-body p-4 text-dark">
        {foreach $replies as $reply}
            <div class="card border-0 shadow-sm rounded-4 mb-4 {if $reply.admin}bg-light border-start border-success border-5{/if}">
                <div class="card-header bg-transparent border-0 p-4 d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center gap-3">
                        <div class="avatar bg-dark-green text-neon rounded-circle p-2 d-flex align-items-center justify-content-center" style="width: 40px; height: 40px;">
                            <i class="bi bi-person-fill"></i>
                        </div>
                        <div>
                            <h6 class="m-0 fw-bold">{$reply.name}</h6>
                            <p class="m-0 small text-muted">{$reply.date}</p>
                        </div>
                    </div>
                    {if $reply.admin}
                        <span class="badge bg-success rounded-pill px-3 py-2">Staff Reply</span>
                    {/if}
                </div>
                <div class="card-body p-4 pt-0">
                    <p class="m-0 lh-lg">{$reply.message}</p>
                    {if $reply.attachments}
                        <div class="mt-4 pt-4 border-top">
                            <h6 class="fw-bold small text-uppercase text-muted mb-3">Attachments</h6>
                            <div class="d-flex flex-wrap gap-2">
                                {foreach $reply.attachments as $attachment}
                                    <a href="dl.php?type=a&amp;id={$attachment.id}" class="btn btn-sm btn-outline-dark rounded-pill px-3"><i class="bi bi-paperclip me-1"></i> {$attachment.filename}</a>
                                {/foreach}
                            </div>
                        </div>
                    {/if}
                </div>
            </div>
        {/foreach}

        {if $status != 'Closed'}
            <div class="card border-0 shadow-sm rounded-4 mt-5">
                <div class="card-header bg-white border-0 p-4">
                    <h5 class="m-0 fw-bold text-dark">Reply to Ticket</h5>
                </div>
                <div class="card-body p-4 pt-0">
                    <form method="post" action="viewticket.php?tid={$tid}&amp;c={$c}&amp;postreply=true" enctype="multipart/form-data">
                        <input type="hidden" name="token" value="{$token}" />
                        <div class="mb-4">
                            <label class="form-label fw-bold small text-uppercase text-muted">Message</label>
                            <textarea name="replymessage" class="form-control rounded-3 p-3" rows="6" placeholder="Type your reply here..." required></textarea>
                        </div>
                        <div class="mb-4">
                            <label class="form-label fw-bold small text-uppercase text-muted">Attachments</label>
                            <input type="file" name="attachments[]" class="form-control rounded-3 p-3" multiple>
                        </div>
                        <div class="d-flex justify-content-end">
                            <button type="submit" class="btn btn-neon rounded-pill px-5 py-2">Post Reply</button>
                        </div>
                    </form>
                </div>
            </div>
        {/if}
    </div>
</div>

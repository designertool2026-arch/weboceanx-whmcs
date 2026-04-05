{* supportticketslist.tpl *}
<div class="card border-0 shadow-sm rounded-4 overflow-hidden">
    <div class="card-header bg-white border-0 p-4 d-flex justify-content-between align-items-center">
        <h5 class="m-0 fw-bold text-dark">My Support Tickets</h5>
        <div class="d-flex gap-2">
            <a href="submitticket.php" class="btn btn-sm btn-gradient rounded-pill px-3">Open New Ticket</a>
        </div>
    </div>
    <div class="table-responsive">
        <table class="table table-hover align-middle mb-0 text-dark">
            <thead class="bg-light">
                <tr>
                    <th class="ps-4">Ticket #</th>
                    <th>Subject</th>
                    <th>Last Updated</th>
                    <th>Status</th>
                    <th class="pe-4"></th>
                </tr>
            </thead>
            <tbody>
                {foreach $tickets as $ticket}
                <tr>
                    <td class="ps-4 fw-bold">#{$ticket.tid}</td>
                    <td>{$ticket.subject}</td>
                    <td>{$ticket.lastreply}</td>
                    <td>
                        <span class="badge rounded-pill {if $ticket.status == 'Open'}bg-success{elseif $ticket.status == 'Answered'}bg-primary{else}bg-secondary{/if}">
                            {$ticket.status}
                        </span>
                    </td>
                    <td class="pe-4 text-end">
                        <a href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}" class="btn btn-sm btn-light rounded-pill px-3">View</a>
                    </td>
                </tr>
                {foreachelse}
                <tr>
                    <td colspan="5" class="text-center py-5 text-muted">No tickets found.</td>
                </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
</div>

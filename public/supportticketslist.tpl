{include file="$template/header.tpl"}

<div class="container-fluid px-lg-5 py-5">
    <!-- Page Header -->
    <div class="d-md-flex justify-content-between align-items-center mb-5">
        <div>
            <h1 class="display-5 fw-bold mb-2">Support <span class="text-success">Tickets</span></h1>
            <p class="text-muted lead mb-0">View and manage your support requests with our expert team.</p>
        </div>
        <div class="mt-4 mt-md-0">
            <a href="submitticket.php" class="btn btn-neon btn-lg rounded-pill px-5 fw-bold shadow-lg">
                <i class="bi bi-plus-lg me-2"></i> Open New Ticket
            </a>
        </div>
    </div>

    <!-- Tickets Table -->
    <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
        <div class="card-header bg-white border-0 p-4 d-flex justify-content-between align-items-center">
            <h5 class="m-0 fw-bold">My Tickets</h5>
            <div class="badge bg-light text-dark rounded-pill px-3 py-2">Total: {$numtickets}</div>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-light">
                        <tr>
                            <th class="ps-4">Ticket ID</th>
                            <th>Subject</th>
                            <th>Department</th>
                            <th>Last Updated</th>
                            <th>Status</th>
                            <th class="pe-4 text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $tickets as $ticket}
                        <tr>
                            <td class="ps-4">
                                <span class="fw-bold text-muted">#{$ticket.tid}</span>
                            </td>
                            <td>
                                <a href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}" class="text-dark text-decoration-none fw-bold hover-success">
                                    {$ticket.subject}
                                </a>
                            </td>
                            <td>
                                <span class="small">{$ticket.department}</span>
                            </td>
                            <td>
                                <span class="small text-muted">{$ticket.lastreply}</span>
                            </td>
                            <td>
                                {if $ticket.status == 'Open'}
                                    <span class="badge bg-success-subtle text-success rounded-pill px-3 py-2">Open</span>
                                {elseif $ticket.status == 'Answered'}
                                    <span class="badge bg-info-subtle text-info rounded-pill px-3 py-2">Answered</span>
                                {elseif $ticket.status == 'Customer-Reply'}
                                    <span class="badge bg-warning-subtle text-warning rounded-pill px-3 py-2">Customer Reply</span>
                                {elseif $ticket.status == 'Closed'}
                                    <span class="badge bg-secondary-subtle text-secondary rounded-pill px-3 py-2">Closed</span>
                                {else}
                                    <span class="badge bg-light text-dark rounded-pill px-3 py-2">{$ticket.status}</span>
                                {/if}
                            </td>
                            <td class="pe-4 text-end">
                                <a href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}" class="btn btn-sm btn-outline-success rounded-pill px-3 fw-bold">
                                    View Ticket
                                </a>
                            </td>
                        </tr>
                        {foreachelse}
                        <tr>
                            <td colspan="6" class="text-center py-5 text-muted">
                                <div class="py-4">
                                    <i class="bi bi-ticket-perforated display-4 opacity-25 d-block mb-3"></i>
                                    <p class="fs-5 mb-0">No support tickets found.</p>
                                    <a href="submitticket.php" class="text-success fw-bold text-decoration-none">Open your first ticket now</a>
                                </div>
                            </td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<style>
    .btn-neon { background-color: #00ff66; color: #0a251c; border: none; transition: all 0.3s ease; }
    .btn-neon:hover { background-color: #00e65c; transform: translateY(-2px); box-shadow: 0 8px 15px rgba(0, 255, 102, 0.3); }
    .hover-success:hover { color: #00ff66 !important; }
    .bg-success-subtle { background-color: rgba(0, 255, 102, 0.1); }
    .bg-info-subtle { background-color: rgba(13, 202, 240, 0.1); }
    .bg-warning-subtle { background-color: rgba(255, 193, 7, 0.1); }
    .bg-secondary-subtle { background-color: rgba(108, 117, 125, 0.1); }
</style>

{include file="$template/footer.tpl"}

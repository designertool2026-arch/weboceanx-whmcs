{* clientareadomains.tpl *}
<div class="card border-0 shadow-sm rounded-4 overflow-hidden">
    <div class="card-header bg-white border-0 p-4 d-flex justify-content-between align-items-center">
        <h5 class="m-0 fw-bold text-dark">My Domains</h5>
        <div class="d-flex gap-2">
            <a href="domainchecker.php" class="btn btn-sm btn-gradient rounded-pill px-3">Register New</a>
        </div>
    </div>
    <div class="table-responsive">
        <table class="table table-hover align-middle mb-0 text-dark">
            <thead class="bg-light">
                <tr>
                    <th class="ps-4">Domain</th>
                    <th>Registration Date</th>
                    <th>Next Due Date</th>
                    <th>Status</th>
                    <th class="pe-4"></th>
                </tr>
            </thead>
            <tbody>
                {foreach $domains as $domain}
                <tr>
                    <td class="ps-4 fw-bold">{$domain.domain}</td>
                    <td>{$domain.registrationdate}</td>
                    <td>{$domain.nextduedate}</td>
                    <td>
                        <span class="badge rounded-pill {if $domain.status == 'Active'}bg-success{elseif $domain.status == 'Pending'}bg-warning{else}bg-secondary{/if}">
                            {$domain.status}
                        </span>
                    </td>
                    <td class="pe-4 text-end">
                        <a href="clientarea.php?action=domaindetails&id={$domain.id}" class="btn btn-sm btn-light rounded-pill px-3">Manage</a>
                    </td>
                </tr>
                {foreachelse}
                <tr>
                    <td colspan="5" class="text-center py-5 text-muted">No domains found.</td>
                </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
</div>

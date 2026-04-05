{include file="$template/header.tpl"}

<div class="container-fluid px-lg-5 py-5">
    <!-- Page Header -->
    <div class="row justify-content-center mb-5">
        <div class="col-lg-8 text-center">
            <h1 class="display-5 fw-bold mb-3">Latest <span class="text-success">Announcements</span></h1>
            <p class="text-muted lead">Stay updated with the latest news, updates, and maintenance alerts from WebOceanX.</p>
        </div>
    </div>

    <!-- Announcements List -->
    <div class="row justify-content-center">
        <div class="col-lg-10">
            {foreach $announcements as $announcement}
            <div class="card border-0 shadow-sm rounded-4 p-4 p-md-5 mb-4 hover-lift">
                <div class="d-md-flex justify-content-between align-items-center mb-3">
                    <h3 class="fw-bold m-0">
                        <a href="{if $seofriendlyurls}announcements/{$announcement.id}/{$announcement.urlfriendlytitle}.html{else}announcements.php?id={$announcement.id}{/if}" class="text-dark text-decoration-none hover-success">
                            {$announcement.title}
                        </a>
                    </h3>
                    <span class="badge bg-light text-muted rounded-pill px-3 py-2 mt-2 mt-md-0">
                        <i class="bi bi-calendar3 me-1"></i> {$announcement.date}
                    </span>
                </div>
                <div class="text-muted mb-4 announcement-text">
                    {$announcement.text|truncate:300}
                </div>
                <div class="d-flex align-items-center justify-content-between">
                    <a href="{if $seofriendlyurls}announcements/{$announcement.id}/{$announcement.urlfriendlytitle}.html{else}announcements.php?id={$announcement.id}{/if}" class="btn btn-outline-success rounded-pill px-4 fw-bold">
                        Read Full Story <i class="bi bi-arrow-right ms-2"></i>
                    </a>
                    {if $announcement.editlink}
                    <a href="{$announcement.editlink}" class="btn btn-sm btn-light rounded-pill px-3">
                        <i class="bi bi-pencil me-1"></i> Edit
                    </a>
                    {/if}
                </div>
            </div>
            {foreachelse}
            <div class="card border-0 shadow-sm rounded-4 p-5 text-center">
                <i class="bi bi-megaphone display-4 opacity-25 d-block mb-3"></i>
                <p class="fs-5 text-muted mb-0">No announcements found at this time.</p>
            </div>
            {/foreach}

            <!-- Pagination -->
            {if $prevpage || $nextpage}
            <nav class="mt-5">
                <ul class="pagination justify-content-center">
                    {if $prevpage}
                    <li class="page-item">
                        <a class="page-link border-0 rounded-pill px-4 py-2 me-2 bg-light text-dark fw-bold" href="announcements.php?page={$prevpage}">
                            <i class="bi bi-chevron-left me-1"></i> Previous
                        </a>
                    </li>
                    {/if}
                    {if $nextpage}
                    <li class="page-item">
                        <a class="page-link border-0 rounded-pill px-4 py-2 bg-light text-dark fw-bold" href="announcements.php?page={$nextpage}">
                            Next <i class="bi bi-chevron-right ms-1"></i>
                        </a>
                    </li>
                    {/if}
                </ul>
            </nav>
            {/if}
        </div>
    </div>
</div>

<style>
    .hover-success:hover { color: #00ff66 !important; }
    .announcement-text { line-height: 1.8; }
    .hover-lift { transition: transform 0.2s ease; }
    .hover-lift:hover { transform: translateY(-5px); }
</style>

{include file="$template/footer.tpl"}

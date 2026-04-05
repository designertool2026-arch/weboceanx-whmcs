{include file="$template/header.tpl"}

<div class="container-fluid px-lg-5 py-5">
    <!-- Page Header -->
    <div class="row justify-content-center mb-5">
        <div class="col-lg-8 text-center">
            <h1 class="display-5 fw-bold mb-3">Resource <span class="text-success">Downloads</span></h1>
            <p class="text-muted lead">Access our library of software, tools, and documentation to help you succeed.</p>
        </div>
    </div>

    <!-- Categories Grid -->
    <div class="row justify-content-center mb-5">
        <div class="col-lg-10">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3 class="fw-bold m-0">Browse <span class="text-success">Categories</span></h3>
                <span class="badge bg-light text-dark rounded-pill px-3 py-2">Total: {$numcategories}</span>
            </div>
            <div class="row g-4">
                {foreach $categories as $category}
                <div class="col-md-6 col-lg-4">
                    <div class="card border-0 shadow-sm rounded-4 p-4 h-100 hover-lift">
                        <div class="d-flex align-items-center gap-3 mb-3">
                            <div class="bg-info-subtle text-info rounded-circle p-3">
                                <i class="bi bi-cloud-download fs-4"></i>
                            </div>
                            <div>
                                <h5 class="fw-bold m-0">
                                    <a href="{if $seofriendlyurls}downloads/{$category.id}/{$category.urlfriendlyname}{else}downloads.php?action=displaycat&amp;catid={$category.id}{/if}" class="text-dark text-decoration-none hover-success">
                                        {$category.name}
                                    </a>
                                </h5>
                                <span class="small text-muted">{$category.numarticles} Downloads</span>
                            </div>
                        </div>
                        <p class="small text-muted mb-0">{$category.description|truncate:100}</p>
                        <a href="{if $seofriendlyurls}downloads/{$category.id}/{$category.urlfriendlyname}{else}downloads.php?action=displaycat&amp;catid={$category.id}{/if}" class="stretched-link"></a>
                    </div>
                </div>
                {foreachelse}
                <div class="col-12 text-center py-5">
                    <p class="text-muted">No categories found.</p>
                </div>
                {/foreach}
            </div>
        </div>
    </div>

    <!-- Popular Downloads -->
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <h3 class="fw-bold mb-4">Popular <span class="text-success">Downloads</span></h3>
            <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                <div class="list-group list-group-flush">
                    {foreach $mostdownloads as $download}
                    <div class="list-group-item border-0 p-4 d-md-flex align-items-center justify-content-between hover-success-bg">
                        <div class="d-flex align-items-center gap-3 mb-3 mb-md-0">
                            <i class="bi bi-file-earmark-arrow-down text-success fs-5"></i>
                            <div>
                                <h6 class="fw-bold m-0">{$download.title}</h6>
                                <p class="small text-muted mb-0">{$download.description|truncate:100|strip_tags}</p>
                                <div class="small text-muted mt-1">
                                    <span class="me-3"><i class="bi bi-hdd me-1"></i> {$download.filesize}</span>
                                    <span><i class="bi bi-download me-1"></i> {$download.downloads} Downloads</span>
                                </div>
                            </div>
                        </div>
                        <a href="{$download.link}" class="btn btn-neon rounded-pill px-4 fw-bold">
                            Download Now <i class="bi bi-download ms-2"></i>
                        </a>
                    </div>
                    {foreachelse}
                    <div class="p-4 text-center text-muted">No popular downloads found.</div>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .btn-neon { background-color: #00ff66; color: #0a251c; border: none; transition: all 0.3s ease; }
    .btn-neon:hover { background-color: #00e65c; transform: translateY(-2px); box-shadow: 0 8px 15px rgba(0, 255, 102, 0.3); }
    .hover-success:hover { color: #00ff66 !important; }
    .hover-success-bg:hover { background-color: #f8fffb; }
    .bg-info-subtle { background-color: rgba(13, 202, 240, 0.1); }
    .hover-lift { transition: transform 0.2s ease; }
    .hover-lift:hover { transform: translateY(-5px); }
</style>

{include file="$template/footer.tpl"}

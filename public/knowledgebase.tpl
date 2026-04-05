{include file="$template/header.tpl"}

<div class="container-fluid px-lg-5 py-5">
    <!-- Hero Section with Search -->
    <div class="row justify-content-center mb-5">
        <div class="col-lg-8 text-center">
            <h1 class="display-4 fw-bold mb-3">How Can We <span class="text-success">Help?</span></h1>
            <p class="text-muted lead mb-5">Search our knowledgebase for answers to common questions and technical guides.</p>
            
            <div class="card border-0 shadow-lg rounded-pill p-2 bg-white overflow-hidden">
                <form method="post" action="knowledgebase.php?action=search" class="d-flex align-items-center">
                    <div class="input-group input-group-lg">
                        <span class="input-group-text bg-white border-0 ps-4 pe-3">
                            <i class="bi bi-search text-muted"></i>
                        </span>
                        <input type="text" name="search" class="form-control border-0 py-3 pe-4" placeholder="Search for articles, guides, and more..." value="{$searchterm}" required>
                        <button type="submit" class="btn btn-neon px-5 fw-bold rounded-pill me-1">Search</button>
                    </div>
                </form>
            </div>
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
                            <div class="bg-success-subtle text-success rounded-circle p-3">
                                <i class="bi bi-folder2-open fs-4"></i>
                            </div>
                            <div>
                                <h5 class="fw-bold m-0">
                                    <a href="{if $seofriendlyurls}knowledgebase/{$category.id}/{$category.urlfriendlyname}{else}knowledgebase.php?action=displaycat&amp;catid={$category.id}{/if}" class="text-dark text-decoration-none hover-success">
                                        {$category.name}
                                    </a>
                                </h5>
                                <span class="small text-muted">{$category.numarticles} Articles</span>
                            </div>
                        </div>
                        <p class="small text-muted mb-0">{$category.description|truncate:100}</p>
                        <a href="{if $seofriendlyurls}knowledgebase/{$category.id}/{$category.urlfriendlyname}{else}knowledgebase.php?action=displaycat&amp;catid={$category.id}{/if}" class="stretched-link"></a>
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

    <!-- Popular Articles -->
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <h3 class="fw-bold mb-4">Popular <span class="text-success">Articles</span></h3>
            <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                <div class="list-group list-group-flush">
                    {foreach $kbmostviews as $kbarticle}
                    <a href="{if $seofriendlyurls}knowledgebase/{$kbarticle.id}/{$kbarticle.urlfriendlytitle}.html{else}knowledgebase.php?action=displayarticle&amp;id={$kbarticle.id}{/if}" class="list-group-item list-group-item-action border-0 p-4 d-flex align-items-center justify-content-between hover-success-bg">
                        <div class="d-flex align-items-center gap-3">
                            <i class="bi bi-file-earmark-text text-success fs-5"></i>
                            <div>
                                <h6 class="fw-bold m-0">{$kbarticle.title}</h6>
                                <p class="small text-muted mb-0">{$kbarticle.article|truncate:100|strip_tags}</p>
                            </div>
                        </div>
                        <i class="bi bi-chevron-right text-muted"></i>
                    </a>
                    {foreachelse}
                    <div class="p-4 text-center text-muted">No popular articles found.</div>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .btn-neon { background-color: #00ff66; color: #0a251c; border: none; transition: all 0.3s ease; }
    .btn-neon:hover { background-color: #00e65c; }
    .hover-success:hover { color: #00ff66 !important; }
    .hover-success-bg:hover { background-color: #f8fffb; }
    .bg-success-subtle { background-color: rgba(0, 255, 102, 0.1); }
    .hover-lift { transition: transform 0.2s ease; }
    .hover-lift:hover { transform: translateY(-5px); }
</style>

{include file="$template/footer.tpl"}

<!-- knowledgebase.tpl -->
<div class="card border-0 shadow-lg rounded-4 overflow-hidden mb-5 bg-dark-green text-white">
    <div class="card-body p-5 text-center">
        <h1 class="display-5 fw-bold mb-4">Knowledgebase</h1>
        <p class="lead mb-5 opacity-75">Search for answers to your questions and learn more about our services.</p>
        
        <form method="post" action="knowledgebase.php?action=search" class="mx-auto" style="max-width: 800px;">
            <input type="hidden" name="token" value="{$token}" />
            <div class="input-group input-group-lg shadow-lg rounded-pill overflow-hidden border-0">
                <input type="text" name="search" class="form-control border-0 px-4 py-4 fs-5" placeholder="Search for articles..." required>
                <button class="btn btn-gradient px-5 fw-bold" type="submit">Search</button>
            </div>
        </form>
    </div>
</div>

<div class="row g-4 mb-5">
    {foreach $categories as $category}
        <div class="col-md-4">
            <a href="knowledgebase.php?action=displaycat&amp;catid={$category.id}" class="text-decoration-none text-dark">
                <div class="card border-0 shadow-sm rounded-4 p-4 h-100 hover-lift">
                    <div class="icon-box bg-light p-3 rounded-3 text-success mb-3 d-inline-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                        <i class="bi bi-folder2-open fs-3"></i>
                    </div>
                    <h5 class="fw-bold mb-2">{$category.name}</h5>
                    <p class="text-muted small mb-0">{$category.description}</p>
                    <div class="mt-4 pt-4 border-top d-flex justify-content-between align-items-center">
                        <span class="badge rounded-pill bg-light text-dark px-3 py-2">{$category.numarticles} Articles</span>
                        <i class="bi bi-arrow-right text-success"></i>
                    </div>
                </div>
            </a>
        </div>
    {foreachelse}
        <div class="col-12 text-center py-5 text-muted">No categories found.</div>
    {/foreach}
</div>

<div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-5">
    <div class="card-header bg-white border-0 p-4">
        <h5 class="m-0 fw-bold text-dark">Most Popular Articles</h5>
    </div>
    <div class="card-body p-4 text-dark">
        <div class="row g-4">
            {foreach $kbmostviews as $kbarticle}
                <div class="col-md-6">
                    <a href="knowledgebase.php?action=displayarticle&amp;id={$kbarticle.id}" class="text-decoration-none text-dark">
                        <div class="d-flex align-items-center gap-3 p-3 bg-light rounded-4 hover-bg-white hover-shadow-sm transition-all">
                            <i class="bi bi-file-text fs-4 text-success opacity-50"></i>
                            <div class="fw-bold">{$kbarticle.title}</div>
                            <i class="bi bi-chevron-right ms-auto text-muted small"></i>
                        </div>
                    </a>
                </div>
            {foreachelse}
                <div class="col-12 text-center py-5 text-muted">No articles found.</div>
            {/foreach}
        </div>
    </div>
</div>

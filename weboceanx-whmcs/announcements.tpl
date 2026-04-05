<!-- announcements.tpl -->
<div class="card border-0 shadow-sm rounded-4 overflow-hidden mb-5">
    <div class="card-header bg-white border-0 p-4">
        <h5 class="m-0 fw-bold text-dark">Latest Announcements</h5>
    </div>
    <div class="card-body p-4 text-dark">
        {foreach $announcements as $announcement}
            <div class="card border-0 shadow-sm rounded-4 mb-4 overflow-hidden">
                <div class="card-header bg-light border-0 p-4 d-flex justify-content-between align-items-center">
                    <h5 class="m-0 fw-bold text-dark">{$announcement.title}</h5>
                    <span class="badge rounded-pill bg-white text-dark border px-3 py-2">{$announcement.date}</span>
                </div>
                <div class="card-body p-4">
                    <div class="lh-lg mb-4">{$announcement.text}</div>
                    <div class="d-flex justify-content-between align-items-center border-top pt-4">
                        <div class="d-flex gap-3">
                            <a href="#" class="text-muted text-decoration-none small hover-text-neon"><i class="bi bi-facebook me-1"></i> Share</a>
                            <a href="#" class="text-muted text-decoration-none small hover-text-neon"><i class="bi bi-twitter-x me-1"></i> Tweet</a>
                        </div>
                        <a href="announcements.php?id={$announcement.id}" class="btn btn-sm btn-outline-success rounded-pill px-4">Read More</a>
                    </div>
                </div>
            </div>
        {foreachelse}
            <div class="text-center py-5 text-muted">No announcements found.</div>
        {/foreach}
    </div>
</div>

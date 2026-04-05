<!-- navbar.tpl -->
<nav class="navbar navbar-expand-lg wo-navbar sticky-top">
    <div class="container">
        <a class="navbar-brand" href="{$WEB_ROOT}/index.php">
            <i class="bi bi-cloud-haze2-fill"></i>
            WEB OCEANX
        </a>
        <button class="navbar-toggler border-0 text-white" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <i class="bi bi-list fs-1"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item">
                    <a class="nav-link {if $templatefile == 'homepage'}active{/if}" href="{$WEB_ROOT}/index.php">Home</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle d-flex align-items-center justify-content-between" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Hosting
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark border-0 shadow-lg animate slideIn">
                        <li><a class="dropdown-item" href="{$WEB_ROOT}/cart.php?gid=1">Shared Hosting</a></li>
                        <li><a class="dropdown-item" href="{$WEB_ROOT}/cart.php?gid=2">VPS Hosting</a></li>
                        <li><a class="dropdown-item" href="{$WEB_ROOT}/cart.php?gid=3">Dedicated Servers</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle d-flex align-items-center justify-content-between" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Domains
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark border-0 shadow-lg animate slideIn">
                        <li><a class="dropdown-item" href="{$WEB_ROOT}/domainchecker.php">Register New Domain</a></li>
                        <li><a class="dropdown-item" href="{$WEB_ROOT}/cart.php?a=add&domain=transfer">Transfer Domain</a></li>
                        <li><a class="dropdown-item" href="{$WEB_ROOT}/whois.php">WHOIS Lookup</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{$WEB_ROOT}/announcements.php">Announcements</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{$WEB_ROOT}/knowledgebase.php">Knowledgebase</a>
                </li>
            </ul>
            <div class="d-flex align-items-center gap-3">
                {if $loggedin}
                    <div class="dropdown">
                        <a class="btn btn-outline-neon dropdown-toggle d-flex align-items-center gap-2" href="#" role="button" data-bs-toggle="dropdown">
                            <i class="bi bi-person-circle"></i>
                            {$clientsdetails.firstname}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-dark dropdown-menu-end border-0 shadow-lg">
                            <li><a class="dropdown-item" href="{$WEB_ROOT}/clientarea.php">Dashboard</a></li>
                            <li><a class="dropdown-item" href="{$WEB_ROOT}/clientarea.php?action=details">My Details</a></li>
                            <li><hr class="dropdown-divider bg-secondary"></li>
                            <li><a class="dropdown-item text-danger" href="{$WEB_ROOT}/logout.php">Logout</a></li>
                        </ul>
                    </div>
                {else}
                    <a href="{$WEB_ROOT}/login.php" class="nav-link">Login</a>
                    <a href="{$WEB_ROOT}/register.php" class="btn btn-neon">Sign Up</a>
                {/if}
            </div>
        </div>
    </div>
</nav>

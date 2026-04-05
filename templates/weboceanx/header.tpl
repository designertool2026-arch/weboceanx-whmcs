{* header.tpl *}
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <title>{if isset($kbarticle.title)}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    {$headoutput}
    <link href="{$WEB_ROOT}/templates/weboceanx/assets/css/style.css" rel="stylesheet">
</head>
<body data-phone-cc-input="{$phoneNumberInputStyle}">

{$headeroutput}

<nav class="navbar navbar-expand-lg wo-navbar sticky-top">
    <div class="container">
        <a class="navbar-brand" href="{$WEB_ROOT}/index.php">Web Oceanx</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar">
            <i class="bi bi-list"></i>
        </button>
        <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title">Menu</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="{$WEB_ROOT}/index.php">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="{$WEB_ROOT}/cart.php">Order</a></li>
                    <li class="nav-item"><a class="nav-link" href="{$WEB_ROOT}/clientarea.php">Client Area</a></li>
                    <li class="nav-item"><a class="nav-link" href="{$WEB_ROOT}/supporttickets.php">Support</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>

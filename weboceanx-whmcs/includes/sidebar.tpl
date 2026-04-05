<!-- sidebar.tpl -->
{foreach $sidebar as $item}
    <div class="card border-0 shadow-sm rounded-4 mb-4 overflow-hidden">
        <div class="card-header bg-dark-green text-white p-3 d-flex align-items-center gap-2">
            {if $item->getIcon()}<i class="{$item->getIcon()} text-neon"></i>{/if}
            <h6 class="m-0 fw-bold">{$item->getLabel()}</h6>
            {if $item->hasBadge()}
                <span class="badge rounded-pill bg-neon text-dark ms-auto">{$item->getBadge()}</span>
            {/if}
        </div>
        {if $item->hasChildren()}
            <div class="list-group list-group-flush">
                {foreach $item->getChildren() as $childItem}
                    <a href="{$childItem->getUri()}" class="list-group-item list-group-item-action bg-transparent text-white border-0 p-3 d-flex align-items-center gap-2 {if $childItem->isCurrent()}active text-neon{/if}" {if $childItem->getAttribute('target')}target="{$childItem->getAttribute('target')}"{/if}>
                        {if $childItem->getIcon()}<i class="{$childItem->getIcon()} opacity-50"></i>{/if}
                        <span class="small fw-medium">{$childItem->getLabel()}</span>
                        {if $childItem->hasBadge()}
                            <span class="badge rounded-pill bg-secondary ms-auto">{$childItem->getBadge()}</span>
                        {/if}
                    </a>
                {/foreach}
            </div>
        {/if}
        {if $item->hasFooterHtml()}
            <div class="card-footer bg-transparent border-0 p-3 pt-0">
                {$item->getFooterHtml()}
            </div>
        {/if}
    </div>
{/foreach}

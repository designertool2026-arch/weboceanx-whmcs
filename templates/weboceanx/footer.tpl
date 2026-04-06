{* footer.tpl *}
{if $templatefile != 'homepage'}
    </div> {* Close container *}
</section> {* Close main-body *}
{/if}

{if $templatefile != 'clientareahome'}
<footer class="footer bg-dark text-white py-5">
    <div class="container text-center">
        <p>&copy; {$date_year} {$companyname}. All Rights Reserved.</p>
    </div>
</footer>
{/if}

{$footeroutput}
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" defer></script>
</body>
</html>

{include file="$template/header.tpl"}

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card border-0 shadow-lg rounded-4 overflow-hidden">
                <div class="card-header bg-dark-green text-white p-4">
                    <h4 class="m-0 fw-bold"><i class="bi bi-palette me-2 text-neon"></i> Theme Customizer</h4>
                    <p class="mb-0 opacity-75 small">Personalize your WebOceanX experience</p>
                </div>
                <div class="card-body p-4 p-md-5">
                    <form id="themeCustomizerForm">
                        <!-- Colors Section -->
                        <div class="mb-5">
                            <h5 class="fw-bold mb-4 border-bottom pb-2">Color Palette</h5>
                            <div class="row g-4">
                                <div class="col-md-4">
                                    <label class="form-label fw-bold small text-uppercase opacity-75">Primary Color</label>
                                    <input type="color" class="form-control form-control-color w-100 border-0 shadow-sm" id="colorPrimary" value="#114232" title="Choose primary color">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label fw-bold small text-uppercase opacity-75">Secondary (Neon)</label>
                                    <input type="color" class="form-control form-control-color w-100 border-0 shadow-sm" id="colorSecondary" value="#00ff66" title="Choose secondary color">
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label fw-bold small text-uppercase opacity-75">Dark Background</label>
                                    <input type="color" class="form-control form-control-color w-100 border-0 shadow-sm" id="colorDark" value="#0a251c" title="Choose dark background color">
                                </div>
                            </div>
                        </div>

                        <!-- Typography Section -->
                        <div class="mb-5">
                            <h5 class="fw-bold mb-4 border-bottom pb-2">Typography</h5>
                            <div class="mb-4">
                                <label class="form-label fw-bold small text-uppercase opacity-75">Primary Font (Google Fonts)</label>
                                <select class="form-select border-0 shadow-sm bg-light" id="fontPrimary">
                                    <option value="'Inter', sans-serif">Inter (Default)</option>
                                    <option value="'Roboto', sans-serif">Roboto</option>
                                    <option value="'Poppins', sans-serif">Poppins</option>
                                    <option value="'Montserrat', sans-serif">Montserrat</option>
                                    <option value="'Open Sans', sans-serif">Open Sans</option>
                                    <option value="'Space Grotesk', sans-serif">Space Grotesk</option>
                                    <option value="'Outfit', sans-serif">Outfit</option>
                                </select>
                            </div>
                        </div>

                        <!-- Preview Section -->
                        <div class="mb-5">
                            <h5 class="fw-bold mb-4 border-bottom pb-2">Live Preview</h5>
                            <div class="p-4 rounded-4 border border-2 border-dashed text-center" id="themePreview">
                                <h3 class="preview-heading mb-3">Sample Heading</h3>
                                <p class="preview-text mb-4">This is how your text and colors will look across the theme.</p>
                                <button type="button" class="btn btn-neon px-4 py-2 rounded-pill fw-bold">Sample Button</button>
                            </div>
                        </div>

                        <div class="d-flex gap-3">
                            <button type="submit" class="btn btn-neon px-5 py-3 rounded-pill fw-bold flex-grow-1">Save Changes</button>
                            <button type="button" id="resetTheme" class="btn btn-outline-secondary px-4 py-3 rounded-pill fw-bold">Reset</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('themeCustomizerForm');
    const resetBtn = document.getElementById('resetTheme');
    const preview = document.getElementById('themePreview');
    
    // Load current settings
    const settings = JSON.parse(localStorage.getItem('themeSettings')) || {
        primary: '#114232',
        secondary: '#00ff66',
        dark: '#0a251c',
        font: "'Inter', sans-serif"
    };

    // Set initial values
    document.getElementById('colorPrimary').value = settings.primary;
    document.getElementById('colorSecondary').value = settings.secondary;
    document.getElementById('colorDark').value = settings.dark;
    document.getElementById('fontPrimary').value = settings.font;

    function updatePreview() {
        const primary = document.getElementById('colorPrimary').value;
        const secondary = document.getElementById('colorSecondary').value;
        const dark = document.getElementById('colorDark').value;
        const font = document.getElementById('fontPrimary').value;

        preview.style.backgroundColor = dark;
        preview.style.color = '#ffffff';
        preview.querySelector('.preview-heading').style.color = secondary;
        preview.querySelector('.preview-heading').style.fontFamily = font;
        preview.querySelector('.preview-text').style.fontFamily = font;
        
        const btn = preview.querySelector('.btn-neon');
        btn.style.backgroundColor = secondary;
        btn.style.color = dark;
        btn.style.fontFamily = font;
    }

    // Event listeners for live preview
    form.querySelectorAll('input, select').forEach(el => {
        el.addEventListener('input', updatePreview);
    });

    updatePreview();

    form.addEventListener('submit', (e) => {
        e.preventDefault();
        const newSettings = {
            primary: document.getElementById('colorPrimary').value,
            secondary: document.getElementById('colorSecondary').value,
            dark: document.getElementById('colorDark').value,
            font: document.getElementById('fontPrimary').value
        };
        localStorage.setItem('themeSettings', JSON.stringify(newSettings));
        alert('Theme settings saved! The page will now reload to apply changes.');
        window.location.reload();
    });

    resetBtn.addEventListener('click', () => {
        if(confirm('Are you sure you want to reset to default theme settings?')) {
            localStorage.removeItem('themeSettings');
            window.location.reload();
        }
    });
});
</script>

{include file="$template/footer.tpl"}

{* ailogogenerator.tpl - AI Logo Generator for WHMCS Addon *}

<div class="container py-5">
    <div class="row justify-content-center mb-5">
        <div class="col-lg-8 text-center">
            <h1 class="display-4 fw-bold mb-3">AI <span class="text-success">Logo Generator</span></h1>
            <p class="text-muted lead">Generate professional logos for your brand with advanced AI models. Select your style, colors, and layout to get started.</p>
            
            <div class="d-inline-flex align-items-center bg-light rounded-pill px-4 py-2 mt-3 shadow-sm">
                <i class="bi bi-coin text-warning me-2 fs-5"></i>
                <span class="fw-bold me-2">Your Credits:</span>
                <span id="userCreditsDisplay" class="text-success fw-bold">{$ai_credits|default:'0'}</span>
            </div>
        </div>
    </div>

    <div class="row g-5">
        <!-- Configuration Sidebar -->
        <div class="col-lg-4">
            <div class="card border-0 shadow-lg rounded-5 p-4 glass-card sticky-top" style="top: 100px;">
                <h5 class="fw-bold mb-4">Configure Logo</h5>
                
                <form id="logoGeneratorForm">
                    <!-- Brand Name -->
                    <div class="mb-4">
                        <label for="brandName" class="form-label fw-bold small">Brand Name</label>
                        <input type="text" id="brandName" class="form-control rounded-pill border-0 bg-light px-4 py-2" placeholder="e.g. WebOceanX" required>
                    </div>

                    <!-- Logo Style -->
                    <div class="mb-4">
                        <label class="form-label fw-bold small">Logo Style</label>
                        <div class="d-grid gap-2">
                            <div class="form-check custom-radio-card p-0">
                                <input class="form-check-input d-none" type="radio" name="logoStyle" id="styleMinimalist" value="Minimalist" checked>
                                <label class="form-check-label w-100 p-3 rounded-4 border text-center cursor-pointer transition-all" for="styleMinimalist">
                                    <i class="bi bi-circle-half d-block mb-1 fs-4"></i>
                                    <span class="small fw-bold">Minimalist</span>
                                </label>
                            </div>
                            <div class="form-check custom-radio-card p-0">
                                <input class="form-check-input d-none" type="radio" name="logoStyle" id="styleModern" value="Modern">
                                <label class="form-check-label w-100 p-3 rounded-4 border text-center cursor-pointer transition-all" for="styleModern">
                                    <i class="bi bi-lightning-charge d-block mb-1 fs-4"></i>
                                    <span class="small fw-bold">Modern</span>
                                </label>
                            </div>
                            <div class="form-check custom-radio-card p-0">
                                <input class="form-check-input d-none" type="radio" name="logoStyle" id="styleVintage" value="Vintage">
                                <label class="form-check-label w-100 p-3 rounded-4 border text-center cursor-pointer transition-all" for="styleVintage">
                                    <i class="bi bi-award d-block mb-1 fs-4"></i>
                                    <span class="small fw-bold">Vintage</span>
                                </label>
                            </div>
                            <div class="form-check custom-radio-card p-0">
                                <input class="form-check-input d-none" type="radio" name="logoStyle" id="styleAbstract" value="Abstract">
                                <label class="form-check-label w-100 p-3 rounded-4 border text-center cursor-pointer transition-all" for="styleAbstract">
                                    <i class="bi bi-hexagon d-block mb-1 fs-4"></i>
                                    <span class="small fw-bold">Abstract</span>
                                </label>
                            </div>
                        </div>
                    </div>

                    <!-- Color Palette -->
                    <div class="mb-4">
                        <label for="colorPalette" class="form-label fw-bold small">Color Palette</label>
                        <select id="colorPalette" class="form-select rounded-pill border-0 bg-light px-4 py-2">
                            <option value="Neon Green & Dark">Neon Green & Dark (Default)</option>
                            <option value="Ocean Blue & White">Ocean Blue & White</option>
                            <option value="Sunset Orange & Purple">Sunset Orange & Purple</option>
                            <option value="Monochrome Gray">Monochrome Gray</option>
                            <option value="Vibrant Multi-color">Vibrant Multi-color</option>
                        </select>
                    </div>

                    <!-- Layout Variation -->
                    <div class="mb-4">
                        <label class="form-label fw-bold small">Layout Variation</label>
                        <select id="layoutVariation" class="form-select rounded-pill border-0 bg-light px-4 py-2">
                            <option value="Icon Left">Icon Left</option>
                            <option value="Icon Right">Icon Right</option>
                            <option value="Icon Top">Icon Top</option>
                            <option value="Text Only">Text Only</option>
                        </select>
                    </div>

                    <button type="submit" id="generateLogoBtn" class="btn btn-neon w-100 rounded-pill py-3 fw-bold shadow-lg mt-3">
                        <i class="bi bi-magic me-2"></i> Generate Logo (10 Credits)
                    </button>
                </form>
            </div>
        </div>

        <!-- Preview Area -->
        <div class="col-lg-8">
            <div id="logoPreviewContainer" class="card border-0 shadow-lg rounded-5 p-5 glass-card h-100 d-flex align-items-center justify-content-center min-vh-50">
                <div id="emptyState" class="text-center py-5">
                    <div class="icon-box bg-light rounded-circle p-4 mb-4 mx-auto w-fit">
                        <i class="bi bi-image fs-1 text-muted"></i>
                    </div>
                    <h4 class="fw-bold">Your Logo Will Appear Here</h4>
                    <p class="text-muted">Configure your brand details and click generate to see the magic happen.</p>
                </div>

                <div id="loadingState" class="text-center d-none">
                    <div class="spinner-border text-success mb-4" role="status" style="width: 3rem; height: 3rem;">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                    <h4 class="fw-bold">Generating Your Logo...</h4>
                    <p class="text-muted">Our AI is crafting your unique brand identity. This may take a few seconds.</p>
                </div>

                <div id="resultState" class="text-center d-none w-100">
                    <div id="generatedLogoWrapper" class="bg-white rounded-5 p-5 shadow-inner mb-4 mx-auto" style="max-width: 400px; min-height: 400px; display: flex; align-items: center; justify-content: center;">
                        <img id="generatedLogoImg" src="" alt="Generated Logo" class="img-fluid">
                    </div>
                    
                    <div class="d-flex justify-content-center gap-3">
                        <button id="downloadPngBtn" class="btn btn-outline-dark rounded-pill px-4 fw-bold">
                            <i class="bi bi-download me-2"></i> Download PNG
                        </button>
                        <button id="exportSvgBtn" class="btn btn-outline-success rounded-pill px-4 fw-bold">
                            <i class="bi bi-filetype-svg me-2"></i> Export as Vector (SVG)
                        </button>
                    </div>
                    <p class="small text-muted mt-3"><i class="bi bi-info-circle me-1"></i> Transparent background included in all exports.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="importmap">
  {
    "imports": {
      "@google/genai": "https://esm.run/@google/genai"
    }
  }
</script>

<script type="module">
import { GoogleGenAI } from "@google/genai";

const apiKey = "{$gemini_api_key}";
if (!apiKey) {
    alert("Gemini API Key is missing. Please set GEMINI_API_KEY in your environment variables.");
}
const ai = new GoogleGenAI({ apiKey });

document.getElementById('logoGeneratorForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    
    const brandName = document.getElementById('brandName').value;
    const logoStyle = document.querySelector('input[name="logoStyle"]:checked').value;
    const colorPalette = document.getElementById('colorPalette').value;
    const layoutVariation = document.getElementById('layoutVariation').value;
    
    // UI States
    const emptyState = document.getElementById('emptyState');
    const loadingState = document.getElementById('loadingState');
    const resultState = document.getElementById('resultState');
    const generatedLogoImg = document.getElementById('generatedLogoImg');
    
    emptyState.classList.add('d-none');
    loadingState.classList.remove('d-none');
    resultState.classList.add('d-none');
    
    try {
        // Deduct credits first
        const response = await fetch('index.php?m=aitools&action=deduct', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'amount=10'
        });
        const creditResult = await response.json();
        
        if (creditResult.status !== 'success') {
            alert(creditResult.message);
            loadingState.classList.add('d-none');
            emptyState.classList.remove('d-none');
            return;
        }
        
        // Update credits display
        document.getElementById('userCreditsDisplay').innerText = creditResult.remaining;

        // Generate Logo using Gemini
        const prompt = `Generate a professional logo for a brand named "${brandName}". 
        Style: ${logoStyle}. 
        Color Palette: ${colorPalette}. 
        Layout: ${layoutVariation}. 
        The logo should be modern, clean, and suitable for high-end branding. 
        Provide the logo as a high-quality image.`;

        const result = await ai.models.generateContent({
            model: "gemini-2.5-flash-image",
            contents: { parts: [{ text: prompt }] },
            config: {
                imageConfig: {
                    aspectRatio: "1:1"
                }
            }
        });

        let imageUrl = "";
        for (const part of result.candidates[0].content.parts) {
            if (part.inlineData) {
                imageUrl = `data:image/png;base64,${part.inlineData.data}`;
                break;
            }
        }

        if (imageUrl) {
            generatedLogoImg.src = imageUrl;
            loadingState.classList.add('d-none');
            resultState.classList.remove('d-none');
        } else {
            throw new Error("No image generated");
        }

    } catch (error) {
        console.error("Logo Generation Error:", error);
        alert("An error occurred during logo generation. Please try again.");
        loadingState.classList.add('d-none');
        emptyState.classList.remove('d-none');
    }
});

// Download PNG
document.getElementById('downloadPngBtn').addEventListener('click', () => {
    const img = document.getElementById('generatedLogoImg');
    const link = document.createElement('a');
    link.href = img.src;
    link.download = `${document.getElementById('brandName').value}_logo.png`;
    link.click();
});

// Export SVG (Mock for now, as Gemini generates raster)
document.getElementById('exportSvgBtn').addEventListener('click', () => {
    alert("Vector export (SVG) is currently in beta. Your PNG download includes high-resolution transparency.");
});
</script>

{* aiimagegenerator.tpl - AI Image Generator for WHMCS Addon *}

<div class="container py-5">
    <div class="row justify-content-center mb-5">
        <div class="col-lg-8 text-center">
            <h1 class="display-4 fw-bold mb-3">AI <span class="text-success">Image Generator</span></h1>
            <p class="text-muted lead">Generate stunning visuals from text prompts for your website and marketing materials. Control styles, aspect ratios, and create variations.</p>
            
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
                <h5 class="fw-bold mb-4">Configure Image</h5>
                
                <form id="imageGeneratorForm">
                    <!-- Text Prompt -->
                    <div class="mb-4">
                        <label for="imagePrompt" class="form-label fw-bold small">Text Prompt</label>
                        <textarea id="imagePrompt" class="form-control rounded-4 border-0 bg-light px-4 py-3" rows="4" placeholder="Describe the image you want to generate..." required></textarea>
                    </div>

                    <!-- Image Style -->
                    <div class="mb-4">
                        <label for="imageStyle" class="form-label fw-bold small">Image Style</label>
                        <select id="imageStyle" class="form-select rounded-pill border-0 bg-light px-4 py-2">
                            <option value="Photorealistic">Photorealistic</option>
                            <option value="Digital Art">Digital Art</option>
                            <option value="Oil Painting">Oil Painting</option>
                            <option value="Cinematic">Cinematic</option>
                            <option value="Anime">Anime</option>
                            <option value="3D Render">3D Render</option>
                        </select>
                    </div>

                    <!-- Aspect Ratio -->
                    <div class="mb-4">
                        <label for="aspectRatio" class="form-label fw-bold small">Aspect Ratio</label>
                        <select id="aspectRatio" class="form-select rounded-pill border-0 bg-light px-4 py-2">
                            <option value="1:1">1:1 (Square)</option>
                            <option value="16:9">16:9 (Landscape)</option>
                            <option value="9:16">9:16 (Portrait)</option>
                            <option value="4:3">4:3 (Classic)</option>
                        </select>
                    </div>

                    <button type="submit" id="generateImageBtn" class="btn btn-neon w-100 rounded-pill py-3 fw-bold shadow-lg mt-3">
                        <i class="bi bi-image me-2"></i> Generate Image (8 Credits)
                    </button>
                </form>
            </div>
        </div>

        <!-- Preview Area -->
        <div class="col-lg-8">
            <div id="imagePreviewContainer" class="card border-0 shadow-lg rounded-5 p-5 glass-card h-100 min-vh-50 d-flex align-items-center justify-content-center">
                <div id="emptyState" class="text-center py-5">
                    <div class="icon-box bg-light rounded-circle p-4 mb-4 mx-auto w-fit">
                        <i class="bi bi-image fs-1 text-muted"></i>
                    </div>
                    <h4 class="fw-bold">Your Image Will Appear Here</h4>
                    <p class="text-muted">Fill out the form and click generate to see your visual ideas come to life.</p>
                </div>

                <div id="loadingState" class="text-center d-none py-5">
                    <div class="spinner-border text-success mb-4" role="status" style="width: 3rem; height: 3rem;">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                    <h4 class="fw-bold">Generating Your Visual...</h4>
                    <p class="text-muted">Our AI is rendering your unique image based on your prompt.</p>
                </div>

                <div id="resultState" class="d-none w-100 text-center">
                    <div id="generatedImageWrapper" class="rounded-5 overflow-hidden shadow-lg mb-4 mx-auto" style="max-width: 600px;">
                        <img id="generatedImageImg" src="" alt="Generated Image" class="img-fluid">
                    </div>
                    
                    <div class="d-flex justify-content-center gap-3">
                        <button id="downloadImageBtn" class="btn btn-neon rounded-pill px-4 fw-bold shadow-sm">
                            <i class="bi bi-download me-2"></i> Download Image
                        </button>
                        <button id="createVariationBtn" class="btn btn-outline-dark rounded-pill px-4 fw-bold">
                            <i class="bi bi-layers me-2"></i> Create Variation
                        </button>
                    </div>
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
import { GoogleGenAI, Type } from "@google/genai";

const apiKey = "{$gemini_api_key}";
if (!apiKey) {
    alert("Gemini API Key is missing. Please set GEMINI_API_KEY in your environment variables.");
}
const ai = new GoogleGenAI({ apiKey });

document.getElementById('imageGeneratorForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    
    const prompt = document.getElementById('imagePrompt').value;
    const style = document.getElementById('imageStyle').value;
    const aspectRatio = document.getElementById('aspectRatio').value;
    
    // UI States
    const emptyState = document.getElementById('emptyState');
    const loadingState = document.getElementById('loadingState');
    const resultState = document.getElementById('resultState');
    const generatedImageImg = document.getElementById('generatedImageImg');
    
    emptyState.classList.add('d-none');
    loadingState.classList.remove('d-none');
    resultState.classList.add('d-none');
    
    try {
        // Deduct credits
        const response = await fetch('index.php?m=aitools&action=deduct', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'amount=8'
        });
        const creditResult = await response.json();
        
        if (creditResult.status !== 'success') {
            alert(creditResult.message);
            loadingState.classList.add('d-none');
            emptyState.classList.remove('d-none');
            return;
        }
        
        document.getElementById('userCreditsDisplay').innerText = creditResult.remaining;

        // Generate Image using Gemini
        const fullPrompt = `Generate a high-quality image.
        Subject: ${prompt}
        Style: ${style}
        The image should be visually stunning and professional.`;

        const result = await ai.models.generateContent({
            model: "gemini-2.5-flash-image",
            contents: { parts: [{ text: fullPrompt }] },
            config: {
                imageConfig: {
                    aspectRatio: aspectRatio
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
            generatedImageImg.src = imageUrl;
            loadingState.classList.add('d-none');
            resultState.classList.remove('d-none');
        } else {
            throw new Error("No image generated");
        }

    } catch (error) {
        console.error("Image Generation Error:", error);
        alert("An error occurred. Please try again.");
        loadingState.classList.add('d-none');
        emptyState.classList.remove('d-none');
    }
});

// Download Image
document.getElementById('downloadImageBtn').addEventListener('click', () => {
    const img = document.getElementById('generatedImageImg');
    const link = document.createElement('a');
    link.href = img.src;
    link.download = `generated_image.png`;
    link.click();
});
</script>

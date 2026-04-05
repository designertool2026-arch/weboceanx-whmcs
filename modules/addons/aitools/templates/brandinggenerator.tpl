{* brandinggenerator.tpl - AI Branding Generator for WHMCS Addon *}

<div class="container py-5">
    <div class="row justify-content-center mb-5">
        <div class="col-lg-8 text-center">
            <h1 class="display-4 fw-bold mb-3">AI <span class="text-success">Branding Generator</span></h1>
            <p class="text-muted lead">Generate a complete brand kit including colors, typography, and voice guidelines. Perfect for new startups and rebranding projects.</p>
            
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
                <h5 class="fw-bold mb-4">Configure Brand Kit</h5>
                
                <form id="brandingForm">
                    <!-- Brand Name -->
                    <div class="mb-4">
                        <label for="brandName" class="form-label fw-bold small">Brand Name</label>
                        <input type="text" id="brandName" class="form-control rounded-pill border-0 bg-light px-4 py-2" placeholder="e.g. WebOceanX" required>
                    </div>

                    <!-- Brand Personality -->
                    <div class="mb-4">
                        <label for="brandPersonality" class="form-label fw-bold small">Brand Personality</label>
                        <select id="brandPersonality" class="form-select rounded-pill border-0 bg-light px-4 py-2">
                            <option value="Innovative & Bold">Innovative & Bold</option>
                            <option value="Trustworthy & Stable">Trustworthy & Stable</option>
                            <option value="Friendly & Approachable">Friendly & Approachable</option>
                            <option value="Luxury & Elegant">Luxury & Elegant</option>
                            <option value="Minimalist & Clean">Minimalist & Clean</option>
                        </select>
                    </div>

                    <!-- Brand Voice -->
                    <div class="mb-4">
                        <label for="brandVoice" class="form-label fw-bold small">Brand Voice</label>
                        <select id="brandVoice" class="form-select rounded-pill border-0 bg-light px-4 py-2">
                            <option value="Professional">Professional</option>
                            <option value="Witty">Witty</option>
                            <option value="Inspirational">Inspirational</option>
                            <option value="Direct">Direct</option>
                            <option value="Empathetic">Empathetic</option>
                        </select>
                    </div>

                    <button type="submit" id="generateBrandingBtn" class="btn btn-neon w-100 rounded-pill py-3 fw-bold shadow-lg mt-3">
                        <i class="bi bi-palette me-2"></i> Generate Brand Kit (25 Credits)
                    </button>
                </form>
            </div>
        </div>

        <!-- Results Area -->
        <div class="col-lg-8">
            <div id="brandingResultContainer" class="card border-0 shadow-lg rounded-5 p-5 glass-card h-100 min-vh-50">
                <div id="emptyState" class="text-center py-5">
                    <div class="icon-box bg-light rounded-circle p-4 mb-4 mx-auto w-fit">
                        <i class="bi bi-book fs-1 text-muted"></i>
                    </div>
                    <h4 class="fw-bold">Your Brand Kit Will Appear Here</h4>
                    <p class="text-muted">Fill out the form and click generate to see a complete brand identity.</p>
                </div>

                <div id="loadingState" class="text-center d-none py-5">
                    <div class="spinner-border text-success mb-4" role="status" style="width: 3rem; height: 3rem;">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                    <h4 class="fw-bold">Crafting Your Identity...</h4>
                    <p class="text-muted">Our AI is designing your brand colors, typography, and voice guidelines.</p>
                </div>

                <div id="resultState" class="d-none">
                    <div class="d-flex justify-content-between align-items-center mb-5">
                        <h4 class="fw-bold m-0">Brand Identity Kit</h4>
                        <button id="downloadPdfBtn" class="btn btn-neon rounded-pill px-4 fw-bold shadow-sm">
                            <i class="bi bi-file-earmark-pdf me-2"></i> Download Brand Guidelines (PDF)
                        </button>
                    </div>
                    
                    <div class="row g-4">
                        <!-- Brand Colors -->
                        <div class="col-md-6">
                            <h6 class="fw-bold mb-3">Brand Colors</h6>
                            <div id="colorPalette" class="d-flex gap-2 mb-4">
                                <!-- Colors will be injected here -->
                            </div>
                        </div>
                        
                        <!-- Typography -->
                        <div class="col-md-6">
                            <h6 class="fw-bold mb-3">Typography Suggestions</h6>
                            <div id="typographyList" class="mb-4">
                                <!-- Typography will be injected here -->
                            </div>
                        </div>

                        <!-- Brand Voice & Personality -->
                        <div class="col-12">
                            <div class="p-4 rounded-4 bg-light">
                                <h6 class="fw-bold mb-3">Brand Voice & Personality</h6>
                                <p id="brandVoiceDesc" class="text-muted mb-0"></p>
                            </div>
                        </div>

                        <!-- Logo Style Direction -->
                        <div class="col-12">
                            <div class="p-4 rounded-4 bg-light">
                                <h6 class="fw-bold mb-3">Logo Style Direction</h6>
                                <p id="logoStyleDesc" class="text-muted mb-0"></p>
                            </div>
                        </div>
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

document.getElementById('brandingForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    
    const brandName = document.getElementById('brandName').value;
    const brandPersonality = document.getElementById('brandPersonality').value;
    const brandVoice = document.getElementById('brandVoice').value;
    
    // UI States
    const emptyState = document.getElementById('emptyState');
    const loadingState = document.getElementById('loadingState');
    const resultState = document.getElementById('resultState');
    
    emptyState.classList.add('d-none');
    loadingState.classList.remove('d-none');
    resultState.classList.add('d-none');
    
    try {
        // Deduct credits
        const response = await fetch('index.php?m=aitools&action=deduct', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'amount=25'
        });
        const creditResult = await response.json();
        
        if (creditResult.status !== 'success') {
            alert(creditResult.message);
            loadingState.classList.add('d-none');
            emptyState.classList.remove('d-none');
            return;
        }
        
        document.getElementById('userCreditsDisplay').innerText = creditResult.remaining;

        // Generate Branding using Gemini
        const prompt = `Generate a complete brand kit for "${brandName}".
        Personality: ${brandPersonality}
        Voice: ${brandVoice}
        Include:
        1. A color palette (5 colors with hex codes and names).
        2. Typography suggestions (Heading and Body fonts).
        3. A detailed brand voice and personality description.
        4. A logo style direction.`;

        const result = await ai.models.generateContent({
            model: "gemini-3-flash-preview",
            contents: { parts: [{ text: prompt }] },
            config: {
                responseMimeType: "application/json",
                responseSchema: {
                    type: Type.OBJECT,
                    properties: {
                        colors: {
                            type: Type.ARRAY,
                            items: {
                                type: Type.OBJECT,
                                properties: {
                                    name: { type: Type.STRING },
                                    hex: { type: Type.STRING }
                                },
                                required: ["name", "hex"]
                            }
                        },
                        typography: {
                            type: Type.OBJECT,
                            properties: {
                                heading: { type: Type.STRING },
                                body: { type: Type.STRING }
                            },
                            required: ["heading", "body"]
                        },
                        voiceDescription: { type: Type.STRING },
                        logoDirection: { type: Type.STRING }
                    },
                    required: ["colors", "typography", "voiceDescription", "logoDirection"]
                }
            }
        });

        const branding = JSON.parse(result.text);

        // Inject Colors
        const colorPalette = document.getElementById('colorPalette');
        colorPalette.innerHTML = '';
        branding.colors.forEach(color => {
            const div = document.createElement('div');
            div.className = 'flex-grow-1 rounded-3 p-3 text-center small fw-bold';
            div.style.backgroundColor = color.hex;
            div.style.color = getContrastYIQ(color.hex);
            div.innerHTML = `${color.name}<br>${color.hex}`;
            colorPalette.appendChild(div);
        });

        // Inject Typography
        const typographyList = document.getElementById('typographyList');
        typographyList.innerHTML = `
            <div class="mb-3">
                <span class="small text-muted d-block mb-1">Heading Font</span>
                <h5 class="fw-bold m-0" style="font-family: ${branding.typography.heading}">${branding.typography.heading}</h5>
            </div>
            <div>
                <span class="small text-muted d-block mb-1">Body Font</span>
                <p class="m-0" style="font-family: ${branding.typography.body}">${branding.typography.body}</p>
            </div>
        `;

        // Inject Descriptions
        document.getElementById('brandVoiceDesc').innerText = branding.voiceDescription;
        document.getElementById('logoStyleDesc').innerText = branding.logoDirection;

        loadingState.classList.add('d-none');
        resultState.classList.remove('d-none');

    } catch (error) {
        console.error("Branding Generation Error:", error);
        alert("An error occurred. Please try again.");
        loadingState.classList.add('d-none');
        emptyState.classList.remove('d-none');
    }
});

// Helper to get contrast color
function getContrastYIQ(hexcolor){
    hexcolor = hexcolor.replace("#", "");
    var r = parseInt(hexcolor.substr(0,2),16);
    var g = parseInt(hexcolor.substr(2,2),16);
    var b = parseInt(hexcolor.substr(4,2),16);
    var yiq = ((r*299)+(g*587)+(b*114))/1000;
    return (yiq >= 128) ? 'black' : 'white';
}
</script>

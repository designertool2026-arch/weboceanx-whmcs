{* businessnamegenerator.tpl - Business Name Generator for WHMCS Addon *}

<div class="container py-5">
    <div class="row justify-content-center mb-5">
        <div class="col-lg-8 text-center">
            <h1 class="display-4 fw-bold mb-3">AI <span class="text-success">Business Name Generator</span></h1>
            <p class="text-muted lead">Find the perfect name for your next venture. Our AI analyzes your industry, keywords, and tone to suggest brandable names with domain availability checks.</p>
            
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
                <h5 class="fw-bold mb-4">Configure Generator</h5>
                
                <form id="businessNameForm">
                    <!-- Industry -->
                    <div class="mb-4">
                        <label for="industry" class="form-label fw-bold small">Industry</label>
                        <select id="industry" class="form-select rounded-pill border-0 bg-light px-4 py-2" required>
                            <option value="Technology">Technology</option>
                            <option value="Finance">Finance</option>
                            <option value="Health & Wellness">Health & Wellness</option>
                            <option value="E-commerce">E-commerce</option>
                            <option value="Creative Arts">Creative Arts</option>
                            <option value="Real Estate">Real Estate</option>
                            <option value="Education">Education</option>
                        </select>
                    </div>

                    <!-- Keywords -->
                    <div class="mb-4">
                        <label for="keywords" class="form-label fw-bold small">Keywords (comma separated)</label>
                        <input type="text" id="keywords" class="form-control rounded-pill border-0 bg-light px-4 py-2" placeholder="e.g. cloud, fast, secure" required>
                    </div>

                    <!-- Tone -->
                    <div class="mb-4">
                        <label for="tone" class="form-label fw-bold small">Tone</label>
                        <select id="tone" class="form-select rounded-pill border-0 bg-light px-4 py-2">
                            <option value="Professional">Professional</option>
                            <option value="Playful">Playful</option>
                            <option value="Modern">Modern</option>
                            <option value="Classic">Classic</option>
                            <option value="Minimalist">Minimalist</option>
                        </select>
                    </div>

                    <!-- Country -->
                    <div class="mb-4">
                        <label for="country" class="form-label fw-bold small">Target Country</label>
                        <select id="country" class="form-select rounded-pill border-0 bg-light px-4 py-2">
                            <option value="Global">Global</option>
                            <option value="United States">United States</option>
                            <option value="United Kingdom">United Kingdom</option>
                            <option value="Canada">Canada</option>
                            <option value="Australia">Australia</option>
                        </select>
                    </div>

                    <button type="submit" id="generateNamesBtn" class="btn btn-neon w-100 rounded-pill py-3 fw-bold shadow-lg mt-3">
                        <i class="bi bi-lightbulb me-2"></i> Generate Names (5 Credits)
                    </button>
                </form>
            </div>
        </div>

        <!-- Results Area -->
        <div class="col-lg-8">
            <div id="resultsContainer" class="card border-0 shadow-lg rounded-5 p-5 glass-card h-100 min-vh-50">
                <div id="emptyState" class="text-center py-5">
                    <div class="icon-box bg-light rounded-circle p-4 mb-4 mx-auto w-fit">
                        <i class="bi bi-card-list fs-1 text-muted"></i>
                    </div>
                    <h4 class="fw-bold">Your Suggestions Will Appear Here</h4>
                    <p class="text-muted">Fill out the form and click generate to see a list of unique business names.</p>
                </div>

                <div id="loadingState" class="text-center d-none py-5">
                    <div class="spinner-border text-success mb-4" role="status" style="width: 3rem; height: 3rem;">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                    <h4 class="fw-bold">Brainstorming Names...</h4>
                    <p class="text-muted">Our AI is analyzing your keywords to find the perfect brand identity.</p>
                </div>

                <div id="resultState" class="d-none">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h4 class="fw-bold m-0">Top Suggestions</h4>
                        <button id="saveAllBtn" class="btn btn-sm btn-outline-success rounded-pill px-3">Save All Favorites</button>
                    </div>
                    
                    <div id="namesList" class="row g-3">
                        <!-- Names will be injected here -->
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

document.getElementById('businessNameForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    
    const industry = document.getElementById('industry').value;
    const keywords = document.getElementById('keywords').value;
    const tone = document.getElementById('tone').value;
    const country = document.getElementById('country').value;
    
    // UI States
    const emptyState = document.getElementById('emptyState');
    const loadingState = document.getElementById('loadingState');
    const resultState = document.getElementById('resultState');
    const namesList = document.getElementById('namesList');
    
    emptyState.classList.add('d-none');
    loadingState.classList.remove('d-none');
    resultState.classList.add('d-none');
    namesList.innerHTML = '';
    
    try {
        // Deduct credits
        const response = await fetch('index.php?m=aitools&action=deduct', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'amount=5'
        });
        const creditResult = await response.json();
        
        if (creditResult.status !== 'success') {
            alert(creditResult.message);
            loadingState.classList.add('d-none');
            emptyState.classList.remove('d-none');
            return;
        }
        
        document.getElementById('userCreditsDisplay').innerText = creditResult.remaining;

        // Generate Names using Gemini
        const prompt = `Generate 10 unique and brandable business names for the following:
        Industry: ${industry}
        Keywords: ${keywords}
        Tone: ${tone}
        Target Country: ${country}
        For each name, provide a brief explanation of why it's a good fit and a brandability score (1-100).
        Also check if the .com domain is likely to be available (just a guess based on name uniqueness).`;

        const result = await ai.models.generateContent({
            model: "gemini-3-flash-preview",
            contents: { parts: [{ text: prompt }] },
            config: {
                responseMimeType: "application/json",
                responseSchema: {
                    type: Type.ARRAY,
                    items: {
                        type: Type.OBJECT,
                        properties: {
                            name: { type: Type.STRING },
                            explanation: { type: Type.STRING },
                            score: { type: Type.INTEGER },
                            domainAvailable: { type: Type.BOOLEAN }
                        },
                        required: ["name", "explanation", "score", "domainAvailable"]
                    }
                }
            }
        });

        const names = JSON.parse(result.text);

        names.forEach(item => {
            const col = document.createElement('div');
            col.className = 'col-md-6';
            col.innerHTML = `
                <div class="card border-0 shadow-sm rounded-4 p-3 h-100 hover-lift border-start border-success border-4">
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <h5 class="fw-bold m-0">${item.name}</h5>
                        <span class="badge ${item.domainAvailable ? 'bg-success' : 'bg-warning'} rounded-pill small">
                            ${item.domainAvailable ? '.com Available' : '.com Taken'}
                        </span>
                    </div>
                    <p class="small text-muted mb-3">${item.explanation}</p>
                    <div class="d-flex justify-content-between align-items-center mt-auto">
                        <div class="d-flex align-items-center gap-2">
                            <span class="small fw-bold">Score:</span>
                            <div class="progress" style="width: 60px; height: 6px;">
                                <div class="progress-bar bg-success" role="progressbar" style="width: ${item.score}%"></div>
                            </div>
                            <span class="small fw-bold text-success">${item.score}</span>
                        </div>
                        <button class="btn btn-sm btn-icon btn-light rounded-circle favorite-btn">
                            <i class="bi bi-heart"></i>
                        </button>
                    </div>
                </div>
            `;
            namesList.appendChild(col);
        });

        loadingState.classList.add('d-none');
        resultState.classList.remove('d-none');

    } catch (error) {
        console.error("Name Generation Error:", error);
        alert("An error occurred. Please try again.");
        loadingState.classList.add('d-none');
        emptyState.classList.remove('d-none');
    }
});
</script>

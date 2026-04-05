'use client';

import { useState, useEffect, useMemo } from 'react';
import { Check, Copy, Download, FileCode2, Eye, Layout, Monitor, Tablet, Smartphone, Maximize2, Minimize2, ExternalLink } from 'lucide-react';

export default function Home() {
  const [activeTab, setActiveTab] = useState('homepage.tpl');
  const [viewMode, setViewMode] = useState<'code' | 'preview'>('preview');
  const [deviceMode, setDeviceMode] = useState<'desktop' | 'tablet' | 'mobile'>('desktop');
  const [isFullScreen, setIsFullScreen] = useState(false);
  const [files, setFiles] = useState<Record<string, string>>({
    'header.tpl': '',
    'homepage.tpl': '',
    'footer.tpl': '',
    'cart.tpl': '',
    'domainchecker.tpl': '',
    'domainregister.tpl': '',
    'domaintransfer.tpl': '',
    'supportticketslist.tpl': '',
    'supportticketsubmit.tpl': '',
    'supportticketview.tpl': '',
    'clientareahome.tpl': '',
    'clientareaproducts.tpl': '',
    'clientareadomains.tpl': '',
    'clientareabilling.tpl': '',
    'clientarea.tpl': '',
    'announcements.tpl': '',
    'knowledgebase.tpl': '',
    'downloads.tpl': '',
    'error.tpl': '',
    'viewcart.tpl': '',
    'checkout.tpl': '',
    'configureproduct.tpl': '',
    'login.tpl': '',
    'register.tpl': '',
    'passwordreset.tpl': '',
    'products.tpl': '',
    'cartloading.tpl': '',
    'orderconfirmation.tpl': '',
    'domainservices.tpl': '',
    'aitools.tpl': '',
    'ailogogenerator.tpl': '',
    'businessnamegenerator.tpl': '',
    'brandinggenerator.tpl': '',
    'aisitebuilder.tpl': '',
    'aiimagegenerator.tpl': '',
    'style.css': '',
    'script.js': ''
  });
  const [copied, setCopied] = useState(false);

  useEffect(() => {
    const fileList = [
      'header.tpl', 'homepage.tpl', 'footer.tpl', 'cart.tpl', 
      'domainchecker.tpl', 'domainregister.tpl', 'domaintransfer.tpl',
      'supportticketslist.tpl', 'supportticketsubmit.tpl', 'supportticketview.tpl',
      'clientareahome.tpl', 'clientareaproducts.tpl', 'clientareadomains.tpl', 'clientareabilling.tpl',
      'clientarea.tpl', 'announcements.tpl', 'knowledgebase.tpl', 'downloads.tpl', 'error.tpl',
      'viewcart.tpl', 'checkout.tpl', 'configureproduct.tpl', 'login.tpl', 
      'register.tpl', 'passwordreset.tpl', 'products.tpl', 'cartloading.tpl', 
      'orderconfirmation.tpl', 'domainservices.tpl', 
      'aitools.tpl', 'ailogogenerator.tpl', 'businessnamegenerator.tpl', 
      'brandinggenerator.tpl', 'aisitebuilder.tpl', 'aiimagegenerator.tpl',
      'style.css', 'script.js'
    ];

    Promise.all(
      fileList.map(file => fetch(`/${file}`).then(res => res.text()))
    ).then((contents) => {
      const newFiles: Record<string, string> = {};
      fileList.forEach((file, index) => {
        newFiles[file] = contents[index];
      });
      setFiles(newFiles);
    });
  }, []);

  const previewContent = useMemo(() => {
    if (!files['header.tpl'] || !files['footer.tpl'] || !files[activeTab]) return '';

    let content = '';
    if (activeTab === 'header.tpl' || activeTab === 'footer.tpl') {
      content = files[activeTab];
    } else {
      content = files['header.tpl'] + files[activeTab] + files['footer.tpl'];
    }

    // Basic Smarty tag cleanup for preview
    return content
      .replace(/\{\$WEB_ROOT\}/g, '')
      .replace(/\{\$companyname\}/g, 'Web Oceanx')
      .replace(/\{\$pagetitle\}/g, activeTab.replace('.tpl', '').toUpperCase())
      .replace(/\{if \$kbarticle\.title\}\{\$kbarticle\.title\} - \{/g, '')
      .replace(/\{\/if\}/g, '')
      .replace(/\{if [^}]+\}/g, '')
      .replace(/\{else\}/g, '')
      .replace(/\{foreach [^}]+\}/g, '')
      .replace(/\{\/foreach\}/g, '')
      .replace(/\{\$headoutput\}/g, '')
      .replace(/\{\$headeroutput\}/g, '')
      .replace(/\{\$footeroutput\}/g, '')
      .replace(/\{\$template\}/g, 'web-oceanx')
      .replace(/\{\$assetLogoPath\}/g, 'https://picsum.photos/seed/logo/200/50')
      .replace(/\{\$LANG\.[^}]+\}/g, (match) => match.split('.')[1].replace('}', ''))
      .replace(/\{include file="[^"]+"[^}]*\}/g, '')
      .replace(/\{\$[^}]+\}/g, '') // Remove remaining variables
      .replace(/\{[^}]+\}/g, ''); // Remove remaining smarty tags
  }, [files, activeTab]);

  const handleCopy = () => {
    navigator.clipboard.writeText(files[activeTab]);
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  };

  const handleDownload = () => {
    const blob = new Blob([files[activeTab]], { type: 'text/plain' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = activeTab;
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
  };

  return (
    <div className="min-h-screen bg-slate-50 font-sans">
      {/* Sidebar Navigation */}
      <div className="flex h-screen overflow-hidden">
        <aside className="w-64 bg-slate-900 text-slate-300 flex flex-col border-r border-slate-800">
          <div className="p-6 border-b border-slate-800">
            <h1 className="text-xl font-bold text-white flex items-center gap-2">
              <Layout className="w-6 h-6 text-emerald-400" />
              WebOceanX
            </h1>
            <p className="text-xs text-slate-500 mt-1 uppercase tracking-wider font-semibold">WHMCS Theme Preview</p>
          </div>
          
          <nav className="flex-1 overflow-y-auto p-4 space-y-1">
            {Object.keys(files).filter(f => files[f]).map((fileName) => (
              <button
                key={fileName}
                onClick={() => setActiveTab(fileName)}
                className={`w-full flex items-center gap-3 px-4 py-2.5 text-sm font-medium rounded-lg transition-all ${
                  activeTab === fileName
                    ? 'bg-emerald-500/10 text-emerald-400 border border-emerald-500/20'
                    : 'hover:bg-slate-800 hover:text-white'
                }`}
              >
                <FileCode2 className={`w-4 h-4 ${activeTab === fileName ? 'text-emerald-400' : 'text-slate-500'}`} />
                {fileName}
              </button>
            ))}
          </nav>

          <div className="p-4 border-t border-slate-800 bg-slate-900/50">
            <button
              onClick={handleDownload}
              className="w-full flex items-center justify-center gap-2 px-4 py-2 text-sm font-semibold text-white bg-emerald-600 rounded-lg hover:bg-emerald-500 transition-colors shadow-lg shadow-emerald-900/20"
            >
              <Download className="w-4 h-4" />
              Download Theme
            </button>
          </div>
        </aside>

        {/* Main Content Area */}
        <main className={`flex-1 flex flex-col overflow-hidden bg-white transition-all duration-300 ${isFullScreen ? 'fixed inset-0 z-50' : ''}`}>
          <header className="h-16 border-b border-slate-200 flex items-center justify-between px-8 bg-white z-10 shrink-0">
            <div className="flex items-center gap-4">
              <h2 className="text-lg font-semibold text-slate-800">{activeTab}</h2>
              <div className="flex bg-slate-100 p-1 rounded-lg border border-slate-200">
                <button
                  onClick={() => setViewMode('preview')}
                  className={`flex items-center gap-2 px-4 py-1.5 text-sm font-medium rounded-md transition-all ${
                    viewMode === 'preview'
                      ? 'bg-white text-emerald-600 shadow-sm'
                      : 'text-slate-600 hover:text-slate-900'
                  }`}
                >
                  <Eye className="w-4 h-4" />
                  Preview
                </button>
                <button
                  onClick={() => setViewMode('code')}
                  className={`flex items-center gap-2 px-4 py-1.5 text-sm font-medium rounded-md transition-all ${
                    viewMode === 'code'
                      ? 'bg-white text-emerald-600 shadow-sm'
                      : 'text-slate-600 hover:text-slate-900'
                  }`}
                >
                  <FileCode2 className="w-4 h-4" />
                  Code
                </button>
              </div>

              {viewMode === 'preview' && (
                <div className="flex bg-slate-100 p-1 rounded-lg border border-slate-200 ml-4">
                  <button
                    onClick={() => setDeviceMode('desktop')}
                    className={`p-1.5 rounded-md transition-all ${deviceMode === 'desktop' ? 'bg-white text-emerald-600 shadow-sm' : 'text-slate-500 hover:text-slate-900'}`}
                    title="Desktop View"
                  >
                    <Monitor className="w-4 h-4" />
                  </button>
                  <button
                    onClick={() => setDeviceMode('tablet')}
                    className={`p-1.5 rounded-md transition-all ${deviceMode === 'tablet' ? 'bg-white text-emerald-600 shadow-sm' : 'text-slate-500 hover:text-slate-900'}`}
                    title="Tablet View"
                  >
                    <Tablet className="w-4 h-4" />
                  </button>
                  <button
                    onClick={() => setDeviceMode('mobile')}
                    className={`p-1.5 rounded-md transition-all ${deviceMode === 'mobile' ? 'bg-white text-emerald-600 shadow-sm' : 'text-slate-500 hover:text-slate-900'}`}
                    title="Mobile View"
                  >
                    <Smartphone className="w-4 h-4" />
                  </button>
                </div>
              )}
            </div>

            <div className="flex items-center gap-3">
              <button
                onClick={() => setIsFullScreen(!isFullScreen)}
                className="p-2 text-slate-500 hover:text-slate-900 hover:bg-slate-100 rounded-lg transition-all"
                title={isFullScreen ? "Exit Full Screen" : "Full Screen"}
              >
                {isFullScreen ? <Minimize2 className="w-5 h-5" /> : <Maximize2 className="w-5 h-5" />}
              </button>
              <button
                onClick={handleCopy}
                className="flex items-center gap-2 px-4 py-2 text-sm font-medium text-slate-700 bg-white border border-slate-200 rounded-lg hover:bg-slate-50 transition-all shadow-sm"
              >
                {copied ? <Check className="w-4 h-4 text-emerald-600" /> : <Copy className="w-4 h-4 text-slate-500" />}
                {copied ? 'Copied!' : 'Copy Code'}
              </button>
            </div>
          </header>

          <div className="flex-1 overflow-hidden relative bg-slate-100 flex justify-center p-4">
            {viewMode === 'preview' ? (
              <div 
                className={`bg-white shadow-2xl transition-all duration-500 overflow-hidden rounded-lg ${
                  deviceMode === 'desktop' ? 'w-full' : 
                  deviceMode === 'tablet' ? 'w-[768px]' : 'w-[375px]'
                } h-full`}
              >
                <iframe
                  srcDoc={previewContent}
                  className="w-full h-full border-none"
                  title="Design Preview"
                />
              </div>
            ) : (
              <div className="w-full h-full overflow-auto bg-slate-900 p-6 rounded-lg shadow-inner">
                <pre className="text-sm text-slate-300 font-mono leading-relaxed">
                  {files[activeTab] || 'Loading...'}
                </pre>
              </div>
            )}
          </div>
        </main>
      </div>
    </div>
  );
}

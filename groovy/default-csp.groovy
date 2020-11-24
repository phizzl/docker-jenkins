System.clearProperty("hudson.model.DirectoryBrowserSupport.CSP");
System.setProperty("hudson.model.DirectoryBrowserSupport.CSP", "sandbox allow-same-origin allow-scripts; default-src 'self'; script-src * 'unsafe-inline'; img-src *; style-src * 'unsafe-inline'; font-src * data:");

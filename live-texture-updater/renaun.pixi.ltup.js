var ltup_function = function() {
    var ltu_host = window.location.hostname;
    var fileref = document.createElement('script');
    fileref.setAttribute("type", "text/javascript");
    fileref.setAttribute("src", 'http://'+ltu_host+':9321/socket.io/socket.io.js');
    fileref.onload = function() {
        // Callback code here
        var socket = io.connect('http://'+ltu_host+':9321');
        socket.on('filechange', function (data) {
            // data.file is the filename
            if (PIXI.TextureCache &&
                PIXI.TextureCache[data.file] &&
                PIXI.TextureCache[data.file].baseTexture &&
                PIXI.TextureCache[data.file].baseTexture.source)
                PIXI.TextureCache[data.file].baseTexture.source.src = data.file;
        });
    };
    document.getElementsByTagName('body')[0].appendChild(fileref);
}
var oldonload = window.onload; 
if (typeof window.onload != 'function') { 
    window.onload = ltup_function; 
} else { 
    window.onload = function() { 
    if (oldonload) { 
        oldonload(); 
    } 
        ltup_function(); 
    } 
}
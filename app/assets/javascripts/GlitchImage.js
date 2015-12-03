var GlitchImage = window.GlitchImage = function(container, parameters, id, isFullSize) {

    this.container = container;
    this.parameters = parameters;
    this.imageData = null;
    this.context = null;
    this.id = id;
    this.isFullSize = isFullSize;
    this.freshness = container.dataset.freshness;

    // create a new canvas element for the image
    var canvas = document.createElement('canvas');
    canvas.id = "canvas" + id;
    container.insertBefore(canvas, container.firstChild);
    this.canvas = canvas;

    this.image = new Image();
    // crossOrigin attribute has to be set before setting src
    this.image.crossOrigin = 'anonymous';
    // call this.onLoad() when the new Image has loaded
    var cb = this;
    this.image.onload = function() { cb.onLoad() };

    // load last
    var imgSrc = container.dataset.imageSrc;
    this.image.src = imgSrc;
};

GlitchImage.prototype.onLoad = function() {

    // setup canvas based on image dimensions
    var maxWidth = window.innerWidth/2;
    var scale = this.image.naturalWidth / this.image.naturalHeight;

    if (this.image.naturalWidth < maxWidth || this.isFullSize) {
        this.canvas.width = this.image.naturalWidth;
        this.canvas.height = this.image.naturalHeight;
    }
    else {
        this.canvas.width = maxWidth;
        this.canvas.height = maxWidth / scale;
    }


    this.setupCanvas(this.canvas);

    // delayed glitch to avoid glitch callback issues
    var cb = this;
    // this.canvas.onclick = function(){cb.glitchImage();};
    setTimeout(function(){ cb.glitchImage(); }, 500 * this.id);
}

GlitchImage.prototype.drawGlitchedImageData = function(imageData) {
    this.context.putImageData(imageData, 0, 0);
}

// params : {}
//  - glitchExisting : bool
GlitchImage.prototype.glitchImage = function(options) {
    options = options || {};
    glitchExisting = options.glitchExisting || false;
    this.parameters.seed = randomInRange(0, 99);
    this.parameters.amount = randomInRange(0, 99);
    this.parameters.iterations = map(this.freshness, 1, 0, 0, 20);
    this.parameters.quality = map(this.freshness, 1, 0, 0, 30);

    //glitch text
    var title = this.container.getElementsByTagName("h1")[0].innerHTML;
    var glitchedTitle = "";
    var increment = Math.round(map(this.freshness, 1, 0, 4, 1));
    for (var i = 0; i < title.length; i++) {
        var char = title.substr(i, 1);
        if (Math.random() > this.freshness) {
            glitchedTitle += weirdos[randomInRange(0,weirdos.length,0)];
        }
        else {
            glitchedTitle += char;
        }
    };
    this.container.getElementsByTagName("h1")[0].innerHTML = glitchedTitle;

    if (!glitchExisting) {
        var image = this.image;
        var canvas = this.canvas;
        this.context = canvas.getContext('2d');
        this.drawImage({
            canvas: canvas,
            image: image,
            desw: canvas.clientWidth,
            desh: canvas.clientHeight
        });
        this.imageData = this.context.getImageData(0, 0, canvas.clientWidth * ratio, canvas.clientHeight * ratio);
    }
    // EUGH
    var cb = this;
    glitch(this.imageData, this.parameters, (function(image_data) {
        return function(image_data) {
            cb.drawGlitchedImageData(image_data);
        };
    })()
    );
}

GlitchImage.prototype.setupCanvas = function(canvas) {
    var context = canvas.getContext('2d');
    // finally query the various pixel ratios
    devicePixelRatio = window.devicePixelRatio || 1,
    backingStoreRatio = context.webkitBackingStorePixelRatio ||
        context.mozBackingStorePixelRatio ||
        context.msBackingStorePixelRatio ||
        context.oBackingStorePixelRatio ||
        context.backingStorePixelRatio || 1,
    ratio = devicePixelRatio / backingStoreRatio;
    // upscale the canvas if the two ratios don't match
    if (devicePixelRatio !== backingStoreRatio) {
        var oldWidth = canvas.width;
        var oldHeight = canvas.height;
        canvas.width = oldWidth * ratio;
        canvas.height = oldHeight * ratio;
        canvas.style.width = oldWidth + 'px';
        canvas.style.height = oldHeight + 'px';
        // now scale the context to counter
        // the fact that we've manually scaled
        // our canvas element
        context.scale(ratio, ratio);
    }
    this.context = context;
}

GlitchImage.prototype.drawImage = function(opts) {
    if (!opts.canvas) {
        throw ("A canvas is required");
    }
    if (!opts.image) {
        throw ("Image is required");
    }
    // get the canvas and context
    var canvas = opts.canvas,
        context = canvas.getContext('2d'),
        image = opts.image,
        // now default all the dimension info
        srcx = opts.srcx || 0,
        srcy = opts.srcy || 0,
        srcw = opts.srcw || image.naturalWidth,
        srch = opts.srch || image.naturalHeight,
        desx = opts.desx || srcx,
        desy = opts.desy || srcy,
        desw = opts.desw || srcw,
        desh = opts.desh || srch;
    context.drawImage(image, srcx, srcy, srcw, srch, desx, desy, desw, desh);
}
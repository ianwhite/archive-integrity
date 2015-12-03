///////////////////////////////////////////////////
// glitch params
///////////////////////////////////////////////////
// amount -> random?
// seed -> random?
// iterations -> integrity / freshness
// quality -> integrity / freshness
var parameters = {
    amount: 1,
    seed: 45,
    iterations: 8,
    quality: 30
};
var images = [];
var weirdos = ['∃','∧','∠','∨','∩','⊂','⊃','∪','⊥','∀','Ξ','Γ','ɐ','ə','ɘ','ε','β','ɟ','ɥ','ɯ','ɔ','и','๏','ɹ','ʁ','я','ʌ','ʍ','λ','ч','∞','Σ','Π'];

///////////////////////////////////////////////////
// vars
///////////////////////////////////////////////////

///////////////////////////////////////////////////
// methods
///////////////////////////////////////////////////

function onLoad(isFullSize) {
    //images.push(new GlitchImage());

    // gui
    // var gui = new dat.GUI();
    // gui.add(this.parameters, 'amount', 0, 99).step(1);
    // gui.add(this.parameters, 'seed', 0, 100).step(1);
    // var guiIterations = gui.add(this.parameters, 'iterations', 0, 99);
    // guiIterations.onChange(function(value) {
    //     updateImages();
    // });
    // gui.add(this.parameters, 'quality', 1, 99).step(1);
    // gui.add(this, 'updateImages');

    // for each image
    // use imagesloaded?
    var elements = document.getElementsByClassName("film");
    for (var i = 0; i < elements.length; i++) {
        images.push(new GlitchImage(elements[i], parameters, i, isFullSize));
    }
}

function updateImages(){
    for (var i = images.length - 1; i >= 0; i--) {
        images[i].parameters = parameters;
        images[i].glitchImage();
    };
}

function loadJson(url) {
    $.getJSON(url, {
        type: type
    })
        .done(function(data) {
            if (data.length > 0) {} else {}
        });
}


///////////////////////////////////////////////////
// listeners
///////////////////////////////////////////////////

function onMousePress(e) {}
function onKeyDown(e) {}
window.addEventListener('mousedown', onMousePress, false);
window.addEventListener('touchstart', onMousePress, false);
window.addEventListener('keypress', onKeyDown, false);
window.addEventListener("keydown", onKeyDown, false);


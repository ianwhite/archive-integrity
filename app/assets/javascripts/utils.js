///////////////////////////////////////////////////////////////////////////////
// helpers
/////////////////////////////////////////////////////////////////////////////
function randomInRange($min, $max, $precision) {
    if (typeof($precision) == 'undefined') {
        $precision = 2;
    }
    return parseFloat(Math.min($min + (Math.random() * ($max - $min)), $max).toFixed($precision));
}

function map(value, inputMin, inputMax, outputMin, outputMax) {
    var outVal = ((value - inputMin) / (inputMax - inputMin) * (outputMax - outputMin) + outputMin);
    return outVal;
}

function clamp(value, min, max) {
    if (value < min) value = min;
    else if (value > max) value = max;
    return value;
}

function lerp(start, stop, amt) {
    return start + (stop - start) * amt;
}

function clone(obj) {
    if (obj === null || typeof obj !== 'object') {
        return obj;
    }
    var temp = obj.constructor(); // give temp the original obj's constructor
    for (var key in obj) {
        temp[key] = clone(obj[key]);
    }
    return temp;
}

function getAngle(x, y, angle, h) {
    var radians = angle * (Math.PI / 180);
    return { x: x + h * Math.cos(radians), y: y + h * Math.sin(radians) };
}

function getRandom(min, max) {
    var random = Math.floor(Math.random() * (max - min + 1)) + min;
    return random;
}

function Vec2f(x, y){
    this.x = x; this.y = y;
}

function capitalize(s) {
    return s.replace(first_char, function(m) {
        return m.toUpperCase();
    });
}
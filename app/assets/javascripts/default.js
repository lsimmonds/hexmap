
function hexDefinition(edgeSize) {

    //http://www.gamedev.net/page/resources/_/technical/game-programming/coordinates-in-hexagon-based-tile-maps-r1800
    //and
    //http://www-cs-students.stanford.edu/~amitp/game-programming/grids/

    this.s = edgeSize;

    this.h = Math.sin(30 * Math.PI / 180) * edgeSize;

    this.r = Math.cos(30 * Math.PI / 180) * edgeSize;

    this.b = edgeSize + 2 * this.h;

    this.a = 2 * this.r;

    this.hexagon_narrow_width = this.s + this.h;
    this.hexagon_wide_width = this.b;
    this.hexagon_height = this.a;

    /* u - horizontal index of hex
       v - vertical index of hex */
    this.getPixelCoordinates = function(u, v) {

        var x = this.hexagon_narrow_width * u;
        //var y = this.hexagon_height * (u * 0.5 + v);
        var y = this.hexagon_height * ((u % 2) * 0.5 + v);

        return { x: x, y: y };
    };

    this.getReferencePoint = function(x, y) {

        var u = Math.round( x / this.hexagon_narrow_width );
        //var v = Math.round(y / this.hexagon_height - u * 0.5);
        var v = Math.round( (y / this.hexagon_height) - ((u % 2) * 0.5));

        return { u: u, v: v };
    }

}

function sendGet(url, callback) {
  $.get(url, callback);
}

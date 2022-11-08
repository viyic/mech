///place_meeting_3d(x, y, z, obj)
var xx  = argument0, yy  = argument1, zz  = argument2, obj = argument3;

var cw = width / 2;
var cl = length / 2;
var ch = height;

with (obj) {
    var minx, miny, minz;
    var maxx, maxy, maxz;
    
    var w = width * image_xscale, l = length * image_yscale, h = height;
    
    var xoff = sprite_xoffset / w;
    var yoff = sprite_yoffset / l;
    
    var minx = x - w / 2; //* lerp(0, 1, xoff);
    var maxx = x + w / 2; // * lerp(1, 0, xoff);
    
    var miny = y - l / 2; // * lerp(0, 1, yoff);
    var maxy = y + l / 2; // * lerp(1, 0, yoff);
    
    var minz = z;
    var maxz = z + h;
    
    if (xx > minx - cw + 1 &&
        xx < maxx + cw - 1 &&
        
        yy > miny - cl + 1 &&
        yy < maxy + cl - 1 &&
        
        zz > minz - ch + 1 &&
        zz < maxz) {
        return true;
    }
}

return false;

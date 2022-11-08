///point_meeting_3d(x, y, z, obj)
var xx  = argument0, yy  = argument1, zz  = argument2, obj = argument3;

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
    
    if (xx >= minx &&
        xx <= maxx &&
        
        yy >= miny &&
        yy <= maxy&&
        
        zz >= minz &&
        zz <= maxz) {
        return true;
    }
}

return false;

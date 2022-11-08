/// c3d_raycast(ox, oy, oz, dx, dy, dz, obj)
// returns an array containing:
// 0   instance hit
// 1-3 contact point
// 4-6 normal
// 7   time

var ox = argument0, oy = argument1, oz = argument2,
    dx = argument3, dy = argument4, dz = argument5,
    obj = argument6;


if (dx == 0) dx = 0.001;
if (dy == 0) dy = 0.001;
if (dz == 0) dz = 0.001;

var tfirst = undefined, idfirst = noone, tnormal;
tnormal[0] = 0;
tnormal[1] = 0;
tnormal[2] = 0;

with (obj) {
    var w = width * image_xscale, l = length * image_yscale;
    
    var xoff = sprite_xoffset / w;
    var yoff = sprite_yoffset / l;
    
    var minx = x - w / 2; // * lerp(0, 1, xoff);
    var maxx = x + w / 2; // * lerp(1, 0, xoff);
    
    var miny = y - l / 2; // * lerp(0, 1, yoff);
    var maxy = y + l / 2; // * lerp(1, 0, yoff);
    
    var minz = z;
    var maxz = z + height;
    
    var t1 = (minx - ox) / dx;
    var t2 = (maxx - ox) / dx;
    
    var t3 = (miny - oy) / dy;
    var t4 = (maxy - oy) / dy;
    
    var t5 = (minz - oz) / dz;
    var t6 = (maxz - oz) / dz;
    
    var tmin = max(
                   min(t1, t2),
                   min(t3, t4),
                   min(t5, t6)
                  );
    var tmax = min(
                   max(t1, t2),
                   max(t3, t4),
                   max(t5, t6)
                  );
    
    if (tmax < 0) continue;
    if (tmin > tmax) continue;
    
    // @WARNING might cause problem for entity objects?
    if (tmin < 0) {
        if (tfirst > tmax || tfirst == undefined) {
            tfirst = tmax;
            idfirst = id;
            
            tnormal[0] = 0;
            tnormal[1] = 0;
            tnormal[2] = 0;
            
            // x
            if (tfirst == t1) tnormal[0] = -1;
            if (tfirst == t2) tnormal[0] = 1;
            // y
            if (tfirst == t3) tnormal[1] = -1;
            if (tfirst == t4) tnormal[1] = 1;
            // z
            if (tfirst == t5) tnormal[2] = -1;
            if (tfirst == t6) tnormal[2] = 1;
        }
    } else {
        if (tfirst > tmin || tfirst == undefined) {
            tfirst = tmin;
            idfirst = id;
            
            tnormal[0] = 0;
            tnormal[1] = 0;
            tnormal[2] = 0;
            
            if (tfirst == t1) tnormal[0] = -1;
            if (tfirst == t2) tnormal[0] = 1;
            if (tfirst == t3) tnormal[1] = -1;
            if (tfirst == t4) tnormal[1] = 1;
            if (tfirst == t5) tnormal[2] = -1;
            if (tfirst == t6) tnormal[2] = 1;
        }
    }
}

var arr_return;

// Hit Instance
arr_return[0] = idfirst;

if (idfirst != noone) {
    // Contact point
    arr_return[1] = ox + dx * tfirst;
    arr_return[2] = oy + dy * tfirst;
    arr_return[3] = oz + dz * tfirst;
    
    // Normal
    arr_return[4] = tnormal[0];
    arr_return[5] = tnormal[1];
    arr_return[6] = tnormal[2];
    
    // Time
    arr_return[7] = tfirst;
} else {
    arr_return[1] = 0;
    arr_return[2] = 0;
    arr_return[3] = 0;
    arr_return[4] = 0;
    arr_return[5] = 0;
    arr_return[6] = 0;
    arr_return[7] = 0;
}

return arr_return;

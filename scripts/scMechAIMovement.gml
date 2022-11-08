var mechPlayer = getMechPlayer();
if mechPlayer == noone  exit;

var targetDir = point_direction(x, y, mechPlayer.x, mechPlayer.y);
var diff = angle_difference(direction, targetDir);
if abs(diff) > 90 eventT = 0;
direction += -diff / 8 * g.dt;
var pointDis = point_distance(x, y, mechPlayer.x, mechPlayer.y);
pitch = radtodeg(arctan2(z - mechPlayer.z, pointDis));
//point_direction(0, z + height / 2,
                        //pointDis, mechPlayer.z + mechPlayer.height / 2);
pitch = clamp(pitch, -45, 45);

var maxDis = 256;
var minDis = 32;
if eventT <= 0 {
    rl = choose(-1, 0, 1);
    var dis = point_distance(x, y, mechPlayer.x, mechPlayer.y);
    if dis > maxDis {
        fb = 1;
    } else if dis < minDis {
        fb = -1;
    } else {
        fb = choose(-1, 0, 1);
    }
    
    dash = choose(true, false);
    jump = choose(true, true, false);
    if mechPlayer.z - z > 96 {
        jump = true;
        dash = false;
    }
    
    eventT = SECOND;
} else {
    eventT -= g.dt;
}

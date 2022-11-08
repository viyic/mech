/// draw_shadow(x, y, radius)
var xx = argument0, yy = argument1, radius = argument2
draw_set_colour(c_black);
d3d_draw_cylinder(xx - radius,
                  yy - radius,
                  0,
                  xx + radius,
                  yy + radius,
                  0.1,
                  -1, 1, 1, true, 24);
draw_set_colour(c_white);

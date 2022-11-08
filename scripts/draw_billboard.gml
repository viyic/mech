/// draw_billboard(x, y, z, sprite, subimg, model[, full])
var xx = argument[0], yy = argument[1], zz = argument[2];
var sprite = argument[3], subimg = argument[4];
var model = argument[5];
var full = false;
if argument_count > 6  full = argument[6];

var shader = shBillboard;

shader_set(shader);
if full  shader_set_uniform_f(shader_get_uniform(shBillboard, 'uFull'), true);

shader_set_uniform_f(shader_get_uniform(shBillboard, 'uColour'), 1, 1, 1, 1);
d3d_submit_model(xx, yy, zz, sprite, subimg, model);

shader_reset();

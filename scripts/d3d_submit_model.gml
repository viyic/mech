/// d3d_submit_model(x, y, z, sprite, subimg, model)
var xx = argument[0], yy = argument[1], zz = argument[2];
var sprite = argument[3], subimg = argument[4];
var model = argument[5];
matrix_set(matrix_world, matrix_build(xx, yy, zz, 0, 0, 0, 1, 1, 1));
vertex_submit(g.model_dex[model], pr_trianglestrip, sprite_get_texture(sprite, subimg));
matrix_set(matrix_world, g.mat_identity);

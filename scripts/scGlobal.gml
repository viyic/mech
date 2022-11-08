g.debug = false;
g.grav = 0.1;

g.mat_identity = matrix_build(0, 0, 0, 0, 0, 0, 1, 1, 1);

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_color();
vertex_format_add_textcoord();
g.format = vertex_format_end();

g.model_dex[Model.x8] = d3d_vertex_floor(-4, -4, 0, 4, 4, 0, c_white);
g.model_dex[Model.x16] = d3d_vertex_floor(-8, -8, 0, 8, 8, 0, c_white);
g.model_dex[Model.x32] = d3d_vertex_floor(-16, -16, 0, 16, 16, 0, c_white);
g.model_dex[Model.x48] = d3d_vertex_floor(-24, -24, 0, 24, 24, 0, c_white);
var vbuff = vertex_create_buffer();
vertex_begin(vbuff, g.format);

vertex_position_3d(vbuff, -24, 0, 0);
vertex_colour(vbuff, c_white, 1);
vertex_texcoord(vbuff, 1, 1);
vertex_position_3d(vbuff, 24, 0, 0);
vertex_colour(vbuff, c_white, 1);
vertex_texcoord(vbuff, 0, 1);
vertex_position_3d(vbuff, 24, 0, 32);
vertex_colour(vbuff, c_white, 1);
vertex_texcoord(vbuff, 0, 0);

vertex_position_3d(vbuff, -24, 0, 0);
vertex_colour(vbuff, c_white, 1);
vertex_texcoord(vbuff, 1, 1);
vertex_position_3d(vbuff, -24, 0, 32);
vertex_colour(vbuff, c_white, 1);
vertex_texcoord(vbuff, 1, 0);
vertex_position_3d(vbuff, 24, 0, 32);
vertex_colour(vbuff, c_white, 1);
vertex_texcoord(vbuff, 0, 0);

vertex_position_3d(vbuff, 0, -24, 0);
vertex_colour(vbuff, c_white, 1);
vertex_texcoord(vbuff, 1, 1);
vertex_position_3d(vbuff, 0, 24, 0);
vertex_colour(vbuff, c_white, 1);
vertex_texcoord(vbuff, 0, 1);
vertex_position_3d(vbuff, 0, 24, 32);
vertex_colour(vbuff, c_white, 1);
vertex_texcoord(vbuff, 0, 0);

vertex_position_3d(vbuff, 0, -24, 0);
vertex_colour(vbuff, c_white, 1);
vertex_texcoord(vbuff, 1, 1);
vertex_position_3d(vbuff, 0, -24, 32);
vertex_colour(vbuff, c_white, 1);
vertex_texcoord(vbuff, 1, 0);
vertex_position_3d(vbuff, 0, 24, 32);
vertex_colour(vbuff, c_white, 1);
vertex_texcoord(vbuff, 0, 0);

vertex_end(vbuff);
g.model_dex[Model.Tree] = vbuff;


//g.model_dex[Model.Default] = d3d_vertex_floor(-16, -16, 0, 16, 16, 0, c_white);

enum Model {
    x8,
    x16,
    x32,
    x48,
    Tree,
}

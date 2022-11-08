/// d3d_vertex_floor(x1, y1, z1, x2, y2, z2, colour)
var x1 = argument0, y1 = argument1, z1 = argument2, x2 = argument3, y2 = argument4, z2 = argument5, colour = argument6;

var vbuff = vertex_create_buffer();
vertex_begin(vbuff, g.format);

vertex_position_3d(vbuff, x1, y1, z1);
vertex_colour(vbuff, colour, 1);
vertex_texcoord(vbuff, 0, 0);
vertex_position_3d(vbuff, x2, y1, lerp(z1, z2, 0.5));
vertex_colour(vbuff, colour, 1);
vertex_texcoord(vbuff, 1, 0);
vertex_position_3d(vbuff, x1, y2, lerp(z1, z2, 0.5));
vertex_colour(vbuff, colour, 1);
vertex_texcoord(vbuff, 0, 1);
vertex_position_3d(vbuff, x2, y2, z2);
vertex_colour(vbuff, colour, 1);
vertex_texcoord(vbuff, 1, 1);

vertex_end(vbuff);
vertex_freeze(vbuff);

return vbuff;

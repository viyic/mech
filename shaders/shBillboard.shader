attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform bool uFull;
uniform vec4 uColour;
uniform bool uFlash;

void main() {
    vec4 object_space_pos = vec4(in_Position, 1.0);
    mat4 world_view = gm_Matrices[MATRIX_WORLD_VIEW];
    world_view[0][0] = 1.0;
    world_view[0][1] = 0.0;
    world_view[0][2] = 0.0;
    
    if (uFull) {
        world_view[1][0] = 0.0;
        world_view[1][1] = -1.0;
        world_view[1][2] = 0.0;
    } else {
        world_view[1][0] = -world_view[2][0];
        world_view[1][1] = -world_view[2][1];
        world_view[1][2] = -world_view[2][2];
    }
    
    world_view[2][0] = 0.0;
    world_view[2][1] = 0.0;
    world_view[2][2] = 1.0;
    
    gl_Position = gm_Matrices[MATRIX_PROJECTION] * (world_view * object_space_pos);
    
    v_vColour = in_Colour * uColour;
    if (uFlash) v_vColour = v_vColour + vec4(10);
    v_vTexcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}


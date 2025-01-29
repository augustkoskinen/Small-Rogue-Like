//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = vec4(v_vColour.x,v_vColour.y,v_vColour.z,v_vColour.w) * texture2D( gm_BaseTexture, v_vTexcoord );//vec4(0.1,0.1,0.1,1.0)
}

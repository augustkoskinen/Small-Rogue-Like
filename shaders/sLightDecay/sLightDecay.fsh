//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec3 v_vPosition;
varying vec4 v_vColour;

uniform float u_px;
uniform float u_py;

void main()
{
	vec4 Color = vec4(0.8,0.75,0.75,1.0);
	float pixelation = 8.;
	float maxlight = 1.;
	float decayrate = 0.5;
	float midx = 400.;
	float midy = 400.;
	gl_FragColor = Color * v_vColour * texture2D( gm_BaseTexture, v_vTexcoord ) *
		vec4(min(
			1.-decayrate*sqrt(pow((floor(v_vPosition.x/pixelation)*pixelation-midx)/midx,2.)+pow((floor(v_vPosition.y/pixelation)*pixelation-midy)/midy,2.)),
			maxlight)
		);
}

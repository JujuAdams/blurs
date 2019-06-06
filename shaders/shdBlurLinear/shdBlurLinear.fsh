const float RADIUS = 9.0; //Edit this

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_vTexelStep;
uniform float u_fIntensity;

void main()
{
    vec4 colour = vec4(0.0);
    for( float i = -RADIUS; i <= RADIUS; i++) colour += texture2D(gm_BaseTexture, v_vTexcoord + i*u_vTexelStep);
    gl_FragColor = u_fIntensity*colour/(2.0*RADIUS + 1.0);
}
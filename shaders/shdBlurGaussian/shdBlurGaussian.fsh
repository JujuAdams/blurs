const float RADIUS      = 9.00; //Edit these
const float SIGMA       = 3.00; //

const float PI          = 3.14159265358979323846;
const float SQRT_TWO_PI = 2.506628274631000502415765284811;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_vTexelStep;
uniform float u_fIntensity;

void main()
{
    vec3 gauss = vec3(0.0);
    gauss.x = 1.0 / (SQRT_TWO_PI*SIGMA);
    gauss.y = exp(-0.5 / (SIGMA*SIGMA));
    gauss.z = gauss.y*gauss.y;
    
    vec4 colour = gauss.x*texture2D(gm_BaseTexture, v_vTexcoord);
    float divisor = gauss.x;
    gauss.xy *= gauss.yz;
    
    for(float i = 1.0; i <= RADIUS; i++)
    {
        colour += gauss.x*texture2D(gm_BaseTexture, v_vTexcoord - i*u_vTexelStep);         
        colour += gauss.x*texture2D(gm_BaseTexture, v_vTexcoord + i*u_vTexelStep);         
        divisor += 2.0*gauss.x;
        gauss.xy *= gauss.yz;
    }
    
    gl_FragColor = u_fIntensity*colour/divisor;
}
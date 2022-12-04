//
// Simple passthrough fragment shader
//
varying vec2 vTc;

const vec3 cgv = vec3(0.2125,0.7154,0.0721);

void main()
{
    vec4 irgba=texture2D(gm_BaseTexture,vTc);
    float luminance=dot(irgba.rgb, cgv);
    gl_FragColor=vec4(luminance,luminance,luminance,irgba.a);
}
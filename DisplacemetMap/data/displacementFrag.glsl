#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D displacementMap;

varying vec4 vertColor;
varying vec4 vertTexCoord;

void main(void)
{
   gl_FragColor = texture2D(displacementMap, vertTexCoord.st);
}
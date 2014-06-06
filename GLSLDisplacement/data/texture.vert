varying vec2 coord;

void main()
{
	gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
	coord = vec2(gl_MultiTexCoord0);
}

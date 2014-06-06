varying vec2      coord;
uniform sampler2D sampler;

void main()
{
	gl_FragColor = texture2D(sampler, coord);
}

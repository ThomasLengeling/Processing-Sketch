varying vec2 coord;
uniform sampler2D sampler;


//Displament color
uniform float magnitude;
uniform float dMag;

//Displament normal
uniform vec3 displaceVec;
uniform int displaceType;
uniform float mDisplace;
uniform float valZ;

void main()
{
	vec4 pixel;
	vec4 vertexDisplace;
	float df;

	coord = vec2(gl_MultiTexCoord0);
	
	// calculate height map from brightness of texture sample
	pixel = texture2D(sampler, coord);
	
	if(displaceType == 1){
		df = displaceVec.x*pixel.x + displaceVec.y*pixel.y + displaceVec.z*pixel.z;
		vertexDisplace = vec4(gl_Normal * df * mDisplace, 0) + gl_Vertex;
		gl_Position = gl_ModelViewProjectionMatrix * vertexDisplace;
	}else if(displaceType == 2){
		float dv = (pixel.r + pixel.g + pixel.b) / dMag;
		dv = dv * magnitude;
	
		// calculate height map from brightness of texture sample
		vec4 displace = vec4(normalize(gl_Normal) * dv, 0.0);
		gl_Position = gl_ModelViewProjectionMatrix * (gl_Vertex + displace);
	}
	

}

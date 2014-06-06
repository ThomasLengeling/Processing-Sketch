uniform sampler2D displacementMap;

uniform int displaceType;

//Displament color
uniform float magnitude;
uniform float dMag;


//Displament normal
uniform vec3 displaceVec;
uniform float mDisplace;

void main()
{
	vec4 newVertexPos;
	vec4 dv;
	float df;
	
	gl_TexCoord[0].xy = gl_MultiTexCoord0.xy;
	
	dv = texture2D( displacementMap, gl_MultiTexCoord0.xy );
	
	if( displaceType == 1){
		df = displaceVec.x*dv.x + displaceVec.y*dv.y + displaceVec.z*dv.z;
		
		newVertexPos = vec4(gl_Normal * df * mDisplace, 0.0) + gl_Vertex;
		
		gl_Position = gl_ModelViewProjectionMatrix * newVertexPos;
		
	}else if( displaceType == 2){
		float dv = (dv.r + dv.g + dv.b) / dMag;
		dv = dv * magnitude;
		vec4 displace = vec4(normalize(gl_Normal) * dv, 0.0) + gl_Vertex;
		gl_Position = gl_ModelViewProjectionMatrix * (displace);
	}
}
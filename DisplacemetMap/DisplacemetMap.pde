/**
 * DisplacementMap  
 * by Thomas Sanchez Lengeling 
 *
 */

PImage imgNebula;
PShader displacementMap;

SphereRender sphere;
int sphereDetail = 30;

void setup() {
  size(1024, 768, P3D);

  imgNebula       = loadImage("nebula02.jpg");
  textureMode(IMAGE);

  displacementMap = loadShader("displacementFrag.glsl", "displacementVert.glsl");
  displacementMap.set("displacementMap", imgNebula);
  displacementMap.set("dMag", 3);
  displacementMap.set("magnitude", 100);

  sphere = new  SphereRender(sphereDetail);
}


void draw() {
  background(0);

  pushMatrix();
  translate(width/2.0, height/2.0, 300);
  noStroke();
  sphere.texturedSphere(50, imgNebula);
  popMatrix();

  shader(displacementMap);
}


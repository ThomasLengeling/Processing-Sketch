import peasy.*;

PShader shader;
PeasyCam cam;

boolean activeNoise;

//Moise
float nValX;
float nValY;
float nValZ;

int displaceType =1;

//Displacment color Vals
float dMag =3;
float magnitude = 100;

//Displacment normal Vals
float DisplacementX;
float DisplacementY;
float DisplacementZ;
float mDisplace = 100;
float valZ =0;
float zoomZ = 1;

//SPHERE

float rotationX = 0;
float rotationY = 0;
float velocityX = 0;
float velocityY = 0;

ArrayList vertices;
ArrayList texCoords;
ArrayList normals;

int globeDetail = 720;                 // Sphere detail setting.
float globeRadius = 450;              // Sphere radius.
String globeMapName = "nebula02.jpg"; // Image of the earth.

PImage tex;

float distance = 30000; // Distance of camera from origin.
float sensitivity = 1.0;

void setup() {
  size(800, 600, P3D);

  //pgl = (PGraphicsOpenGL) g;
  //glpg = pgl.gl;
  bg = new BackManager();

  // one-shot shader load and initialise 
  //shader = new GLSLShader(this, "texture_displace.vert", "texture_displace.frag");
  shader = new GLSLShader(this, "passThru_vert.glsl", "brot_frag.glsl");

  // simple camera handling
  //cam = new PeasyCam(this, 100);

  torus = createTorus(40, 20, 100, 200, 0, 150, 255, "nebula.jpg");

  nValX = random(0.23, 0.32);
  nValY = random(0.23, 0.35);
  nValZ = random(0.23, 0.35);

  menuSetup();
  //SPHERE
  calculateEarthCoords();

  earth = new GLModel(this, vertices.size(), TRIANGLE_STRIP, GLModel.STATIC);

  // Sets the coordinates.
  earth.updateVertices(vertices);

  // Sets the texture map.
  tex = new GLTexture(this, globeMapName);
  earth.initTextures(1);
  earth.setTexture(0, tex);
  earth.updateTexCoords(0, texCoords);

  // Sets the normals.
  earth.initNormals();
  earth.updateNormals(normals);

  // Sets the colors of all the vertices to white.
  earth.initColors();
  earth.setColors(255);
}

void draw() {
  println(frameRate);
  GLGraphics renderer = (GLGraphics) g;
  GL gl = renderer.beginGL();
  background(0);

  translate(width/2, height/2, 0);

  pushMatrix();
  rotateX(radians(rotationX));
  rotateY(radians(270 - rotationY));

  scale(zoomZ);

  shader.start();

  renderer.model(earth);

  popMatrix();    

  if (activeNoise) {
    shader.setVecUniform("displaceVec", noise(nValX)*2 -1, noise(nValY), .13);
  }
  else {
    shader.setVecUniform("displaceVec", DisplacementX, DisplacementY, DisplacementZ);
  }
  shader.setIntUniform("displaceType", displaceType);
  shader.setFloatUniform("dMag", dMag);
  shader.setFloatUniform("magnitude", magnitude);
  shader.setFloatUniform("mDisplace", mDisplace);
  renderer.model(torus);

  // stop shader processing
  shader.stop();
  renderer.endGL();
  

  rotationX += velocityX;
  rotationY += velocityY;
  velocityX *= 0.95;
  velocityY *= 0.95;

  //Para la parte del mouse
  if (mousePressed)
  {
    velocityX += -(mouseY-pmouseY) * 0.01;
    velocityY -= (mouseX-pmouseX) * 0.01;
  }

  if (activeNoise) {
    nValX += 0.03;
    nValY += 0.026;
  }
  //nValZ += 0.028;
}


// this code from the GLGraphics library examples

GLModel createTorus(float Rad, int numc, int numt, int r, int g, int b, int a, String texName) {
  GLModel model;  
  GLTexture tex;
  
  ArrayList vertices = new ArrayList();
  ArrayList normals = new ArrayList();  
  ArrayList texcoords = new ArrayList();
  
  float x, y, z, s, t, u, v;
  float nx, ny, nz;
  float a1, a2;
  int idx = 0;
  for (int i = 0; i < numc; i++) {
    for (int j = 0; j <= numt; j++) {
      for (int k = 1; k >= 0; k--) {
         s = (i + k) % numc + 0.5;
         t = j % numt;
         u = s / numc;
         v = t / numt;
         a1 = s * TWO_PI / numc;
         a2 = t * TWO_PI / numt;
         
         x = Rad * sin(a1) * cos(a2);
         y = Rad * sin(a1) * sin(a2);
         z = Rad * cos(a1);
         
         nx = sin(a1) * cos(a2); 
         ny = sin(a1) * sin(a2);
         nz = cos(a1);
         
         vertices.add(new PVector(x, y, z));
         normals.add(new PVector(nx, ny, nz));         
         texcoords.add(new PVector(u, v));
      }
    }
  }
  
  model = new GLModel(this, vertices.size(), QUAD_STRIP, GLModel.STATIC);
  model.updateVertices(vertices);  
  
  if (texName != null && !texName.equals("")) {
    tex = new GLTexture(this, texName);
    model.initTextures(1);
    model.setTexture(0, tex);
    model.updateTexCoords(0, texcoords);
  }
  
  model.initNormals();
  model.updateNormals(normals);  

  model.initColors();
  model.setColors(r, g, b, a);

  return model;  
}

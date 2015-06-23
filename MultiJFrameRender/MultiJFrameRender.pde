import javax.swing.JFrame;
import java.awt.BorderLayout;

PGraphics pg;

PSketch pSketch;
PFrame  pFrame;

void setup() {
  size(500, 500, P3D);

  pg = createGraphics(500, 500, P3D);

  pFrame = new PFrame();
  pSketch = new PSketch(pFrame);
}


void draw() {

  offScreenRender();

  pFrame.updateTexture(pg.get());

  image(pg, 0, 0);
  
}


void offScreenRender() {
  pg.beginDraw();
  pg.background(0);
  pg.fill(255);
  pg.ellipse(pg.width/2, pg.height/2, 50, 50);
  pg.endDraw();
}


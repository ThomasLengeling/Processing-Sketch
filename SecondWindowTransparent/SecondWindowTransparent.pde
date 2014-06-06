import java.awt.Frame;
import javax.swing.JFrame;

PFrame controlWindowFrame;

float noiseVal = 0.3;

void setup() {
  size(600, 600);
  smooth(8);

  //SECOND WINDOW WITH OPACITY
  controlWindowFrame = new PFrame();
  controlWindowFrame.setOpacity(0.7f);
  // Display the window.
  controlWindowFrame.setVisible(true);
}


void draw() {
  noStroke();
  fill(0, 40);
  rect(0, 0, width, height);

  float n  = noise(noiseVal);
  
  noFill();
  strokeWeight(20);
  stroke(0, 250, 200);
  ellipse(width/2.0, height/2.0, 50 + n*50, 50 + n*50);

  
  noiseVal+=0.02;

}


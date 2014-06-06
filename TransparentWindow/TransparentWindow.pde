float nVal  = 0.3;

void setup() {
  size(500, 500);
  smooth(8);

  frame.removeNotify();
  frame.setUndecorated(true);
  frame.setLocation(200, 200);
  frame.addNotify();

  frame.setOpacity(0.7);
  frame.setVisible(true);

  fill(0, 0);
  rect(0, 0, width, height);
}


void draw() {
  background(0);
  //noStroke();
 // fill(0, 100);
 // rect(0, 0, width, height);

  float n  = noise(nVal);

  noFill();
  strokeWeight(20);
  stroke(0, 250, 200);
  ellipse(width/2.0, height/2.0, 50 + n*100, 50 + n*100);

  // nVal+=0.02;
}


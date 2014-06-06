
//creation Second Window
public class PFrame extends JFrame {

  secondApplet s;
  public PFrame() {
    setBounds(0, 0, 500, 500);
    s = new secondApplet();
    add(s);
    this.removeNotify();
    this.setUndecorated(true);
    this.setLocation(200, 200);
    this.addNotify(); 
    s.init();
    show();
  }
}

public class secondApplet extends PApplet {

  float noiseV = 0.3;

  public void setup() {
    background(0);
  }

  public void draw() {
    rectMode(RECT);
    noStroke();
    fill(0, 10);
    rect(0, 0, this.width, this.height);

    float n = noise(noiseVal);

    rectMode(CENTER);
    noFill();
    strokeWeight(20);
    stroke(0, 250, 200);
    rect(width/2.0, height/2.0, 50 + n*80, 50 + n*80);


    noiseVal+=0.02;
  }
}


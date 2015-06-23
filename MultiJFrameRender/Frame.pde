public class PSketch extends JFrame {

  PApplet sketch;

  public PSketch(PApplet p) {
    sketch = p;
    setVisible(true);

    setLayout(new BorderLayout());
    add(p, BorderLayout.CENTER);
    p.init();
    setSize(600, 600);
    p.setBounds(0, 0, 600, 600);
    p.show();

    setLocation(500, 200);
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
  }
}

public class PFrame extends PApplet {

  public PImage    img;

  public void setup() {
    size(600, 600, P3D);

    img = createImage(600, 600, ARGB);
  }


  public void updateTexture(PImage imgMain) {
    img = imgMain;
  }

  public void draw() {

    image(img, 0, 0);
  }
  
}


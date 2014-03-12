class GraphBang {

  int startPosX;
  int startPosY;

  int endPosX;
  int endPosY;

  int lengthX;
  int lengthY;

  String label;
  float labelPosX;
  float labelPosY;

  float currentInc;

  color fontColor = color(150);

  GraphBang(String  name, int drawPosX, int drawPosY, int lengthX, int lengthY) {
    this.startPosX = drawPosX;
    this.startPosY = drawPosY;
    this.lengthX  = lengthX;
    this.lengthY  = lengthY;

    this.endPosX = startPosX + lengthX;
    this.endPosY = startPosY - lengthY;

    label = name;
    this.currentInc  = 0.04;

    labelPosX = startPosX - 2;
    labelPosY = startPosY  + 15;
  }

  void setFontColor(color fontColor) {
    this.fontColor = fontColor;
  }


  void draw() {

    if (currentInc > 0.0)
      currentInc -= 0.06;
    else
      currentInc = 0.0;

    float incY = startPosY - currentInc*lengthY;
    noStroke();
    fill(0, 150, 170);
    beginShape(QUADS);
    vertex(startPosX, startPosY);
    vertex(endPosX, startPosY);
    vertex(endPosX, incY);
    vertex(startPosX, incY);
    endShape();

    stroke(fontColor);
    noFill();
    beginShape(QUADS);
    vertex(startPosX, startPosY);
    vertex(endPosX, startPosY);
    vertex(endPosX, endPosY);
    vertex(startPosX, endPosY);
    endShape();


    drawLabel();
  }

  void update() {
    currentInc = 1.0;
  }

  void drawLabel() {
    textFont(font, 17);
    fill(fontColor);
    text(label, labelPosX, labelPosY);
  }
}


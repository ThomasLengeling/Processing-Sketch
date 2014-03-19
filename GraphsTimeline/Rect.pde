class Rect {
  float x1;
  float y1;

  float x2;
  float y2;

  float x3;
  float y3;

  float lengthX;
  float lengthY;

  float midY;
  float midX;

  String labelMax = "";
  String labelMin = "";

  color fontColor = color(150);

  int alphaRect;

  Rect(float x, float y, float wX, float wY, float midY) {
    this.x1  = x;
    this.y1  = y;
    this.lengthX = wX;
    this.lengthY = wY;

    this.x2   = x1 + wX;
    this.y2   = y1 + wY;
    this.y3   = y1 - wY;

    this.midY   = y1 - midY;
    this.midX   = x1 + wX/2.0;

    alphaRect = 180;
  }

  Rect(float x, float y, float wX, float wY) {
    this.x1  = x;
    this.y1  = y;
    this.lengthX = wX;
    this.lengthY = wY;

    this.x2   = x1 + wX;
    this.y2   = y1 + wY;
    this.y3   = y1 - wY;

    alphaRect = 80;
  }

  void setFontColor(color fontColor) {
    this.fontColor = fontColor;
  }

  void setLabel(String labelMax, String labelMin) {
    this.labelMax  = labelMax;
    this.labelMin  = labelMin;
  }

  void setAlphaRect(int alphaV) {
    alphaRect = alphaV;
  }

  void drawRectAndLabel() {
    stroke(fontColor, alphaRect);
    line(x1, y3, x2, y3);
    line(x1, y1, x1, y3);
    line(x2, y1, x2, y3);
    stroke(fontColor, alphaRect/2.0);
    line(x1, midY, x2, midY);
    line(midX, y3, midX, y1);

    drawLabel();
  }

  void drawRect() {
    stroke(fontColor, alphaRect);
    line(x1, y3, x2, y3);
    line(x1, y1, x1, y3);
    line(x2, y1, x2, y3);
  }

  void drawFullRect() {
    stroke(fontColor, alphaRect);
    line(x1, y3, x2, y3);
    line(x1, y1, x1, y3);
    line(x2, y1, x2, y3); 
    //line(x2, y1, x1, y1);
  }

  void drawRectMid() {
    stroke(fontColor, alphaRect);
    line(x1, y3, x2, y3);
    line(x1, y1, x1, y3);
    line(x2, y1, x2, y3);
    line(x2, y1, x1, y1);
    stroke(fontColor, alphaRect/2.5);
    line(x1, y3, x2, y3);//top
    line(x1, midY, x2, midY);
    line(midX, y3, midX, y1);
  }

  void drawLabel() {
    fill(190);
    textFont(font, 10);
    text(labelMax, x2 + 3.0, y3 + 10);
    text(labelMin, x2 + 3.0, y1);
  }
}


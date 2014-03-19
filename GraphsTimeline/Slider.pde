class Slider {
  int x1;
  int y1;

  int x2;
  int y2;

  int y3;

  int lengthX;
  int lengthY;

  float value;
  float sliderVal;

  float rangeMin;
  float rangeMax;

  String labelValue;

  float midX;

  color fontColor = color(150);

  boolean activateSlider = false;

  Slider(int x, int y, int lengthX, int lengthY) {
    this.x1 = x;
    this.y1 = y;

    this.x2 = x + lengthX;
    this.y2 = y + lengthY;

    this.y3 = y - lengthY;

    this.lengthX =  lengthX;
    this.lengthY =  lengthY;

    this.midX =  x1 + lengthX/2.0;

    rangeMin = 0.0;
    rangeMax = 1.0;

    value = 1.0*lengthX;
    sliderVal = rangeMax;
  }

  void setRange(float min, float max) {
    rangeMin = min;
    rangeMax = max;
    sliderVal = sliderVal*(rangeMax - rangeMin) + rangeMin;
  }

  void setFontColor(color fontColor) {
    this.fontColor  = fontColor;
  }


  void draw() {
    if (activateSlider)
      fill(10, 210, 225);
    else
      fill(0, 140, 150);
    beginShape();
    vertex(x1, y1);
    vertex(x1 + value, y1);
    vertex(x1 + value, y3);
    vertex(x1, y3);
    endShape(CLOSE);

    stroke(fontColor);
    noFill();
    beginShape();
    vertex(x1, y1);
    vertex(x2, y1);
    vertex(x2, y3);
    vertex(x1, y3);
    endShape(CLOSE);

    stroke(fontColor);
    beginShape();
    vertex(midX, y1);
    vertex(midX, y1+4);
    endShape();

    drawLabel();
  }

  float getSliderValue() {
    println(sliderVal);
    return sliderVal;
  }

  void drawLabel() {
    fill(fontColor);
    textFont(font, 11);
    text(sliderVal, x2, y1- 2);
  }

  void setValue(float mx, float my) {
    if (mx >= x1 && mx <= x2 && my >= y3 && my < y1) {
      float v   = constrain(map(mx, x1, x2, 0, 1), 0, 1);
      value     = v * lengthX; 
      sliderVal = v*(rangeMax - rangeMin) + rangeMin;
      activateSlider = true;
    }
    else {
      activateSlider = false;
    }
  }

  void sliderOff() {
    activateSlider = false;
  }
}


class GraphBar {
  int startPosX;
  int startPosY;

  int lengthX;
  int lengthY;

  String label;
  float labelPosX;
  float labelPosY;

  float maxLengthY;
  float maxLengthX;
  float midLevel;

  Rect rect;

  Slider slider;

  CopyOnWriteArrayList queueValues;

  float threshold = 1.0;
  float dim = 6.5;
  int   stepX = 4;

  color fontColor = color(150);

  GraphBar(String  name, int drawPosX, int drawPosY, int lengthX, int lengthY) {
    queueValues = new CopyOnWriteArrayList<Float>();
    this.startPosX = drawPosX;
    this.startPosY = drawPosY;
    this.lengthX   = lengthX;
    this.lengthY   = lengthY;

    for (int i = 0; i <lengthX; i++) {
      queueValues.add(0.0);
    }

    label = name;

    maxLengthY = log(22000 + 1.0)*dim;
    midLevel   = log(100 + 1.0)*dim;
    labelPosX  = startPosX; 
    labelPosY  = startPosY - maxLengthY - 6;

    maxLengthX = lengthX*stepX - 3;

    rect = new Rect(startPosX, startPosY, maxLengthX, maxLengthY, midLevel);

    slider = new Slider(drawPosX, drawPosY + 20, int(lengthX*(stepX/2.0)), 12);
  }

  void setDim(float dim) {
    this.dim = dim;
  }

  void setStepX(int step) {
    stepX = step;
  }

  void draw() {
    noFill();
    stroke(0, 150, 200);
    beginShape();
    for (int i = 0; i < queueValues.size(); i++) {
      float yVal = (Float)queueValues.get(i)*threshold;
      vertex(i*stepX + startPosX, startPosY - yVal);
    }
    endShape();

    rect.drawRect();

    drawLabel();

    slider.draw();
  }
  
  void sliderOff(){
    slider.sliderOff();
  }

  void setSliderRange(float min, float max) {
    slider.setRange(min, max);
  }

  void setFontColor(color fontColor) {
    this.fontColor  = fontColor;
    slider.setFontColor(fontColor);
    rect.setFontColor(fontColor);
  }

  void updateLog(float inValue) {
    queueValues.remove(0);
    queueValues.add(constrain(log(inValue + 1.0)*dim, 0, maxLengthY));
  }

  void updateLinear(float inValue) {
    queueValues.remove(0);
    queueValues.add(constrain(map(inValue, 0, 1, 0, maxLengthY), 0, maxLengthY));
  }

  void setLabel(String labelMax, String labelMin) {
    rect.setLabel(labelMax, labelMin);
  }

  void drawLabel() {
    fill(fontColor);
    textFont(font, 17);
    text(label, labelPosX, labelPosY);
  }

  void setSliderValue(float mX, float mY) {
    slider.setValue(mX, mY);
    threshold =  slider.getSliderValue();
  }
}


class GraphBoolean {
  int startPosX;
  int startPosY;

  int lengthX;
  int lengthY;

  //Label
  String label;
  String labelVals;
  float labelPosX;
  float labelPosY;
  int fontLength;

  float maxLengthY;
  float maxLengthX;
  float midLevel;

  Rect rectSignal;
  Rect rectLabel;

  Slider slider;

  CopyOnWriteArrayList queueValues;

  float threshold = 1.0;
  float dim = 6.5;
  int   stepX = 4;
  int   stepDivision;

  color fontColor = color(150);

  GraphBoolean(String  name, int drawPosX, int drawPosY, int lengthX, int lengthY, int fontLength) {
    queueValues = new CopyOnWriteArrayList<Float>();
    this.startPosX = drawPosX;
    this.startPosY = drawPosY;
    this.lengthX   = lengthX;
    this.lengthY   = lengthY;
    
    stepDivision = ceil((float)lengthX / (float)stepX);

    for (int i = 0; i <= stepDivision; i++) {
      queueValues.add(0.0);
    }
    

    label = name;

    maxLengthY = log(22000 + 1.0)*dim;
    midLevel   = log(100 + 1.0)*dim;
    labelPosX  = startPosX; 
    labelPosY  = startPosY - maxLengthY - 6;

    maxLengthX = lengthX*stepX - 3;

    rectSignal = new Rect(startPosX, startPosY, lengthX, maxLengthY, midLevel);

    rectLabel  = new Rect(startPosX, startPosY - maxLengthY, lengthX, fontLength*2);
    rectLabel.setAlphaRect(220);

    slider = new Slider(drawPosX, drawPosY + 20, int(lengthX*(stepX/2.0)), 12);
  }

  void serFontLength(int a) {
    fontLength = a;
  }

  void setDim(float dim) {
    this.dim = dim;
  }

  void setStepX(int step) {
    stepX = step;
  }

  void draw() {

    rectSignal.drawRectMid();
    rectLabel.drawFullRect();

    noFill();
    stroke(0, 150, 200);
    beginShape();
    for (int i = 0; i < queueValues.size(); i++) {
      float yVal = (Float)queueValues.get(i)*threshold;
      vertex(i*stepX + startPosX, startPosY - yVal - 5);
    }
    endShape();

    drawLabel();

    // slider.draw();
  }

  void sliderOff() {
    slider.sliderOff();
  }

  void setSliderRange(float min, float max) {
    slider.setRange(min, max);
  }

  void setFontColor(color fontColor) {
    this.fontColor  = fontColor;
    slider.setFontColor(fontColor);
    rectSignal.setFontColor(fontColor);
  }

  void updateLog(float inValue) {
    queueValues.remove(0);
    queueValues.add(constrain(log(inValue + 1.0)*dim, 0, maxLengthY));
  }

  void updateLinear(float inValue) {
    queueValues.remove(0);
    queueValues.add(constrain(map(inValue, 0, 1, 0, maxLengthY), 0, maxLengthY));
  }

  void setLabel(String labelV) {
    labelVals = labelV;
  }

  void drawLabel() {
    fill(fontColor, 200);
    textFont(font, fontLength);
    text(label, labelPosX + 5, labelPosY);

    text(labelVals, labelPosX + 60, labelPosY);
  }

  void drawLabelRect() {
    line(startPosX, startPosY, startPosX, startPosY + fontLength);
  }

  void setSliderValue(float mX, float mY) {
    slider.setValue(mX, mY);
    threshold =  slider.getSliderValue();
  }
}


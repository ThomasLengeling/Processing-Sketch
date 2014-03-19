class Timeline {
  int startX;
  int startY;

  int lengthX;
  int lengthY;

  String label;

  float numDivisions;
  float stepTam;
  float stepMs;

  int fontSize;

  color timeColor;

  int x1;
  int y1;
  int x2;
  int y2;
  int x3;
  int y3;

  Timer time;
  int timeLapse;

  float vel;
  float timeLapseVel;

  float timeLinePosX;
  float timeLinePosY;

  boolean stop = false;

  Timeline(int startX, int startY, int lengthX, int lengthY, float step) {
    this.startX = startX;
    this.startY = startY;
    this.lengthX = lengthX;
    this.lengthY = lengthY;
    this.stepTam = step;

    timeLinePosX = startX;
    timeLinePosY = startY;

    timeLapse =  10000;
    float secTimeLapse = timeLapse/100.0;
    stepMs  = timeLapse/ 1000.0;

    numDivisions = (lengthX/(timeLapse*0.001)); //ceil( (float)lengthY / 1.0 );
    stepTam =  (numDivisions / secTimeLapse); // 100.0 -> 10000
    println("number of Divisions "+ numDivisions);
    println("step "+ stepTam);
    println("vel "+ vel);
    time =  new Timer(timeLapse);
    time.start();
  }

  void setFontSize(int fontS) {
    fontSize = fontS;
  }

  void setTimeColor(color timeColor) {
    this.timeColor = timeColor;
  }

  void update() {
    if (time.update()) {
      timeLinePosX = startX;
    }
    //   timeLinePosX += vel;
  }

  void draw() {

    drawDivisions();
    drawLabel();

    float timeMs = time.getCurrentTime();
    fill(255);
    textFont(font, fontSize*1.5);
    text(timeMs, startX, startY - fontSize*1.5);
    text(stepMs+" sec", startX + lengthX -fontSize*7, startY - fontSize*1.5);
    
    if (!stop) {
      update();
    }
    //nextSec();

    drawLabel();

    drawRect();
  }

  void drawLabel() {
    fill(255, 200);
    textFont(font, fontSize);
    text("Timeline", startX + 9, startY - 30);
  }

  void drawRect() {
    stroke(255, 200);
    line(startX - 3, startY+5, startX - 3, startY - 44);
    line(startX - 3, startY-44, startX + lengthX + 3, startY - 44); 
    line(startX + lengthX + 3, startY -44, startX + lengthX+ 3, startY + 5); 
    line(startX - 3, startY+5, startX + lengthX+ 3, startY + 5);
  }

  void activate() {
    stop = false;
  }

  void nextSec() {
    int timeMs = (int)time.getCurrentTime();
    if ( timeMs == 5) {
      stop = true;
    }
    else {
      stop = false;
    }
  }

  void drawDivisions() {
    stroke(255, 255, 0);
    beginShape(LINES);
    int j = 0;
    for (float i = 0; i < numDivisions; i+=stepTam, j++) {
      float jump = i * stepMs + startX;
      if (j % 10 == 0) {
        vertex(jump, startY + 2);
        vertex(jump, startY - 7);
      }
      else {
        vertex(jump, startY + 2);
        vertex(jump, startY - 2);
      }
    }
    endShape();

    float  timeMs = map(time.getCurrentTime(), 0, stepMs, 0, lengthX);
    stroke(255, 0, 150);
    line(timeLinePosX + timeMs, timeLinePosY - 11, timeLinePosX + timeMs, 472);
  }
}


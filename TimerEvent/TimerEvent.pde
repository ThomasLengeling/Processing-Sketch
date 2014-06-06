Timer time;


void setup() {
  size(600, 600);
  time = new Timer(1000);
}



void draw() {

  time.update();

  if (time.isDone()) {
    background(random(255));
   // time.reStart();
  }
}


Timer time;


void setup(){
  size(600, 600);
  time = new Timer(2000);
  
}



void draw(){
  
  time.update();
}

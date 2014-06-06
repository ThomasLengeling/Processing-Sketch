class Timer {
  float currentTime;
  float stepTime;

  boolean end;
  boolean restart;

  Timer(float stepTime) {
    this.stepTime = stepTime;
    end = false;
    restart = true;
  }

  void startTimer() {
    if (restart) {
      currentTime = millis(); //tiempo actual
      restart = false;
    }
  }
  
  void reStart(){
      restart = true;
  }

  void update() {
    if ( millis() - currentTime > stepTime) {
      end = true;
      restart = true;
      println("done");
    }
    else {
      end = false;
    }
    startTimer();
  }
  
  boolean isDone(){
    return end;
  }
  
}

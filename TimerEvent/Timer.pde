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

  void update() {
    if (currentTime - millis() > stepTime) {
      end = true;
      restart = true;
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

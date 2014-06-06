class managerWord{

  boolean printWord;
  Vector cVector;
  int index = 0;
  int maxVal = 20;
  float scaleZoom =6;

  managerWord(){
    cVector = new Vector(20);
    printWord = false;
  }

  void push(char cv){
    cVector.add(new cloth(cv));
    //((cloth)cVector.get(index)).start();
    index++;
    println(index);
  }

  void remove(){
    if( !cVector.isEmpty()){
      --index;
      ((cloth)cVector.get(index)).kill(index);
      cVector.remove(index);
      println(index);
    }

  }

  void moveWord(){
    println(index);
    for( int i =0; i < index; i++){
      ((cloth)cVector.get(i)).moveT();
    }
  }

  void moveAll(){
    println(index);
    for( int i = 0; i < index; i++){
      ((cloth)cVector.get(i)).moveA();
    }
  }

  void draw(){
    if(!cVector.isEmpty()){
      for( int i =0; i < index; i++){
        pushMatrix();
        translate(i*(gridSep)*6,0.0);
        ((cloth)cVector.get(i)).drawWords();
        popMatrix();
      }
    }
     focus();
  }

  void focus(){
    stroke(100);
    strokeWeight(7);
    pushMatrix();
    translate(index*gridSep *6.3, 0);
    if(frameCount % 25 == 0)
      line(0, gridSize, 0, gridSize*22);
    popMatrix();
  }

}








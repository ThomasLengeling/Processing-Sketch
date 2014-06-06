import java.util.Vector;
import java.util.Arrays;
import traer.physics.*;

ParticleSystem physics;
String[] dots;
int[][][] matrix;
char[] words;
managerWord nWords;
PFont fontCloth;
int numWords = 56;
int gridSize = 2; //8
Particle ptemp;
//FILO

int sizeT = 50;
int indX = 7;
int indY = 7;
int numLetters = numWords;// * gridSize - 1;
int centerX; 
int centerY; 

float SPRING_STRENGTH = 0.2;
float SPRING_DAMPING = 0.01;
cloth p;

int[] setence;
float gridSep =15;

managerWord mWords;

void setup(){
  size(1024, 400);
  smooth(8);

  physics = new ParticleSystem(0.1, 0.01);
  dots = loadStrings("words.txt");
  matrix = new int[numLetters][7][7];
  nWords = new managerWord();

  centerX = int(width/10.0);
  centerY = int(height/3.0);

  loadDots();

  physics.clear();
}



void draw(){
  background(0);
  physics.tick();
  
  noFill();
  stroke(255);
  strokeWeight(1);
  if (mousePressed){
    nWords.moveAll();
  }

  pushMatrix();
  translate(centerX, centerY);
  nWords.draw();
  popMatrix();
}

void keyTyped(){
  if(key != BACKSPACE)
    nWords.push(key);
  else
    nWords.remove();
}

void mouseReleased(){
  nWords.moveWord();
}

void loadDots(){
  int i =0, k =0;
  for( int index = 0; index < dots.length; index++){
    String[] pieces = split(dots[index], ' ');
    if(i == 8) i = 0;
    if(index % 8 == 0) k= index;
    if( pieces.length == 7){
      for( int j =0; j < 7; j++){
        matrix[k/8][i][j] = int( pieces[j]);
      }
    }
    i++;
  }
}






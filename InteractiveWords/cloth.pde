class cloth{
  int indX =8;
  int indY= 8;
  Particle[][] particles;
  char tyWord;

  cloth(char tyWord){
    particles = new Particle[8][8];
    this.tyWord = tyWord;
    create();
    start();
  }
  
  //creat a single box save memory
  void create(){
    for( int i = 0; i < indX; i++){
      for( int j = 0; j < indY; j++){
        particles[i][j] = physics.makeParticle(0.2, j *gridSep, i*gridSep, 0.0);
        if( j >0)
          physics.makeSpring(particles[i][j -1], particles[i][j], SPRING_STRENGTH, SPRING_DAMPING, gridSep);
      }
    }
    for( int i = 0; i < indY; i++)
      for( int j = 1; j < indX; j++)
        physics.makeSpring(particles[j-1][i], particles[j][i], SPRING_STRENGTH, SPRING_DAMPING, gridSep);

  }
  //box of nxm
  void squareCloth(int dimX, int dimY, int idSX,int idSY){
    //
    for (int i = idSX; i < dimX+1; i++){
      beginShape();
      curveVertex(particles[i][idSY].position().x(), particles[i][idSY].position().y());
      for (int j = idSY; j < dimY +1; j++)
        curveVertex(particles[i][j].position().x(), particles[i][j].position().y());
      curveVertex(particles[i][dimY - 1].position().x(), particles[i][dimY - 1].position().y());
      endShape();
    }

    for (int j = idSY; j < dimY +1; j++){
      beginShape();
      curveVertex(particles[idSX][j].position().x(), particles[idSX][j].position().y());
      for (int i = idSX; i < dimX+1; i++)
        curveVertex(particles[i][j].position().x(), particles[i][j].position().y());
      curveVertex(particles[dimX - 1][j].position().x(), particles[dimX - 1][j].position().y());
      endShape();
    }
  }

  void singleBox(int idSX, int idSY){
    squareCloth(idSX+1, idSY + 1,idSX, idSY);
  }

  void moveT(){
    particles[1][1].velocity().set( (mouseX - pmouseX), (mouseY - pmouseY), 0 );
  }

  void moveA(){
    particles[0][indX - 1].position().set(mouseX, mouseY, 0);
    particles[0][indX - 1].velocity().clear();
  }

  void start(){
    particles[0][0].makeFixed();
    particles[0][indY - 1].makeFixed(); 
  }

  void kill(int index){
    for( int i = index*8*8; i < physics.numberOfParticles(); i++){
      Particle p = physics.getParticle(i);
      Spring s =   physics.getSpring(i);
      physics.removeParticle(p);
      physics.removeSpring(s);
    }
  }
  
  void killSingleBoxs(int word){
     for( int i =0; i < 7; i++)
      for( int j =0; j < 7; j++)
        if( matrix[word][i][j] ==0){
          for( int k = word*8*8; k < physics.numberOfParticles(); k++){
            Particle p = physics.getParticle(k);
            
            physics.removeParticle(p);
 
        }
       }
  }

  void drawWord(int word){
    for( int i =0; i < 7; i++)
      for( int j =0; j < 7; j++)
        if( matrix[word][i][j] ==1)
          singleBox(i,j);
  }
  
   boolean figArea(char type){
      return false;
   }

  void drawWords(){
    switch(tyWord){
    case 'a': 
      drawWord(0);
      break;
    case 'b': 
      drawWord(1);
      break;
    case 'c': 
      drawWord(2);
      break;
    case 'd': 
      drawWord(3); 
      break;
    case 'e': 
      drawWord(4);
      break;
    case 'f': 
      drawWord(5); 
      break;
    case 'g': 
      drawWord(6);
      break;
    case 'h': 
      drawWord(7);
      break;
    case 'i': 
      drawWord(8);
      break;
    case 'j': 
      drawWord(9);
      break;
    case 'k': 
      drawWord(10);
      break;
    case 'l': 
      drawWord(11);
      break;
    case 'm': 
      drawWord(12);
      break;
    case 'n': 
      drawWord(13); 
      break;
    case 'o': 
      drawWord(14);
      break;
    case 'p': 
      drawWord(15);
      break;
    case 'q': 
      drawWord(16); 
      break;
    case 'r': 
      drawWord(17);
      break;
    case 's': 
      drawWord(18); 
      break;
    case 't': 
      drawWord(19); 
      break;
    case 'u': 
      drawWord(20);
      break;
    case 'v': 
      drawWord(21); 
      break;
    case 'w': 
      drawWord(22); 
      break;
    case 'x': 
      drawWord(23); 
      break;
    case 'y': 
      drawWord(24); 
      break;
    case 'z': 
      drawWord(25);
      break;
    case '~':
      drawWord(26);
      break;  
    case '1':
      drawWord(27);
      break;
    case '2':
      drawWord(28);
      break;
    case '3':
      drawWord(29);
      break;
    case '4':
      drawWord(30);
      break;
    case '5':
      drawWord(31);
      break;
    case '6':
      drawWord(32);
      break;
    case '7':
      drawWord(33);
      break;
    case '8':
      drawWord(34);
      break;
    case '9':
      drawWord(35);
      break;
    case '0':
      drawWord(36);
      break;
    case '!':
      drawWord(37);
      break;
    case '@':
      drawWord(38);
      break;
    case '#':
      drawWord(39);
      break;
    case '$':
      drawWord(40);
      break;
    case '%':
      drawWord(41);
      break;
    case '^':
      drawWord(42);
      break;
    case '&':
      drawWord(43);
      break;
    case '*':
      drawWord(44);
      break;
    case '(':
      drawWord(45);
      break;
    case ')':
      drawWord(46);
      break;
    case '-':
      drawWord(47);
      break;
    case '?':
      drawWord(48);
      break;
    case '.':
      drawWord(49);
      break;
    case ':':
      drawWord(50);
      break;
    case '=':
      drawWord(51);
      break;
    case ' ': //space
      drawWord(52);
      break;
    case '/':
      drawWord(53);
      break;
     case '>':
      drawWord(54);
      break;
        case '<':
      drawWord(55);
      break;
    default: 
      ;
    }
  }

  //cloth rows, colums, posx, posy
  //colums true pos y,  rows - posy = #rows colums - posy = posx

  void curveSquare(int itX, int itY){
    beginShape();
    curveVertex(particles[itX][itY].position().x(), particles[itX][itY].position().y() );
    curveVertex(particles[itX][itY].position().x(), particles[itX][itY].position().y() );
    curveVertex(particles[itX - 1][itY].position().x(), particles[itX - 1][itY].position().y() );
    curveVertex(particles[itX - 2][itY + 1].position().x(), particles[itX -2][itY + 1].position().y() );
    curveVertex(particles[itX -2][itY + 2].position().x(), particles[itX - 2][itY + 2].position().y() );
    curveVertex(particles[itX -2][itY + 2].position().x(), particles[itX - 2][itY + 2].position().y() );
    endShape();
    beginShape();
    curveVertex(particles[itX][itY].position().x(), particles[itX][itY].position().y() );
    curveVertex(particles[itX][itY].position().x(), particles[itX][itY].position().y() );
    curveVertex(particles[itX][itY + 1].position().x(), particles[itX][itY + 1].position().y());
    curveVertex(particles[itX - 1][itY + 2].position().x(), particles[itX  -1][itY +2].position().y());
    curveVertex(particles[itX - 2][itY +2].position().x(), particles[itX - 2][itY + 2].position().y() );
    curveVertex(particles[itX - 2][itY +2].position().x(), particles[itX - 2][itY + 2].position().y() );
    endShape();
  }

}



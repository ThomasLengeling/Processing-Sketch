import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim       minim;
AudioPlayer jingle;
FFT         fft;
 
int sampleRate= 44100;
 
//fft solo lee la mitad del sampleRate 
float [] max= new float [sampleRate/2];

//maxima amplitud
float maximum;

//frecuencia en hertz
float frequency;
 
void setup()
{
  size(400, 200);
 
  //instancia de la clase minim
  minim = new Minim(this);
  jingle = minim.loadFile("jingle.mp3", 1024);
  jingle.loop();
  fft = new FFT( jingle.bufferSize(), jingle.sampleRate() );
}
 
void draw(){
  background(0);
  textSize(50); 
  
  findNote();
  
  text (frequency-6+" hz", 50, 80);
}
 
void findNote() {
 
  fft.forward(in.left);
  for (float f = 0; f < sampleRate/2; f++) {
    max[f] = fft.getFreq(f);
  }
  
  //valor maximo
  maximum = max(max);
 
  //comparar cada frecuencia con el maximo
  for (int i=0; i<max.length; i++) {
    if (max[i] == maximum) {
      frequency= i;
    }
  }
  
}
 
void stop()
{
  //cerrar archivos cuando terminemos de usar
  in.close();
  minim.stop();
 
  super.stop();
}

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer jingle;
FFT         fft;

float freq;

void setup(){
  size(512, 200);

  minim = new Minim(this);
  
  jingle = minim.loadFile("jingle.mp3", 1024);

  jingle.loop();

  fft = new FFT( jingle.bufferSize(), jingle.sampleRate() );
}

void draw(){
  background(0);
  stroke(255);

  fft.forward( jingle.mix );

  for (int i = 0; i < fft.specSize(); i++){
  //  line( i, height, i, height - fft.getFreq(i)*8 );
    freq += fft.getFreq(i );
  }
  
  noStroke();

  freq /= fft.specSize();
  if ( freq < 1.0 ) {
    fill(255);
    ellipse(width/2.0, height/2.0, 50 + freq*90, 50 + freq*90);
  }
  else if (freq > 1.0) {
    fill(200, 0, 0);
    ellipse(width/2.0, height/2.0, 50 + freq*50, 50 + freq*50);
  }

  //println(fft.specSize());
}

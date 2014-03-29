import ddf.minim.*;
import ddf.minim.analysis.*;

Minim       minim;
AudioPlayer jingle;
FFT         fft;

int sampleRate= 44100;

float [] max= new float [sampleRate/2];
float maximum;
float frequency;

float midi;
int n;

void setup() {
  size(400, 400);

  minim = new Minim(this);
  jingle = minim.loadFile("jingle.mp3", 1024);
  jingle.loop();
  fft = new FFT( jingle.bufferSize(), jingle.sampleRate() );
}

void draw() {
  background(0);
  textSize(50); 

  findNote();

  text (frequency - 6 + " hz", 50, 80);
  text (n +" note", 50, 150);
}

void findNote() {

  fft.forward( jingle.mix );

  for (int f = 0; f < sampleRate/2; f++) { 
    max[f] = fft.getFreq(float(f));
  }
  maximum = max(max);

  for (int i = 0; i < max.length; i++) {
    if (max[i] == maximum) {
      frequency= i;
    }
  }

  midi = 69+12*(log((frequency-6)/440));
  n    = int (midi);

}

void stop() {
  jingle.close();
  minim.stop();
  super.stop();
}

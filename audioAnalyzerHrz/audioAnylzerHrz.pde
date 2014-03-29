import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim       minim;
AudioPlayer jingle;
FFT         fft;

String note;// name of the note
int n;//int value midi note
color c;//color
float hertz;//frequency in hertz
float midi;//float midi note
int noteNumber;//variable for the midi note
 
 
int sampleRate= 44100;//sapleRate of 44100
 
float [] max= new float [sampleRate/2];//array that contains the half of the sampleRate size, because FFT only reads the half of the sampleRate frequency. This array will be filled with amplitude values.
float maximum;//the maximum amplitude of the max array
float frequency;//the frequency in hertz
 
void setup()
{
  size(400, 200);
 
  minim = new Minim(this);
  jingle = minim.loadFile("jingle.mp3", 1024);
  jingle.loop();
  fft = new FFT( jingle.bufferSize(), jingle.sampleRate() );
}
 
void draw(){
  background(0);
  textSize(50); 
  text (frequency-6+" hz", 50, 80);
  
}
 
void findNote() {
 
  fft.forward(in.left);
  for (int f=0;f<sampleRate/2;f++) { //analyses the amplitude of each frequency analysed, between 0 and 22050 hertz
    max[f]=fft.getFreq(float(f)); //each index is correspondent to a frequency and contains the amplitude value 
  }
  maximum=max(max);//get the maximum value of the max array in order to find the peak of volume
 
  for (int i=0; i<max.length; i++) {// read each frequency in order to compare with the peak of volume
    if (max[i] == maximum) {//if the value is equal to the amplitude of the peak, get the index of the array, which corresponds to the frequency
      frequency= i;
    }
  }
 
 
  midi= 69+12*(log((frequency-6)/440));// formula that transform frequency to midi numbers
  n= int (midi);//cast to int
 
 
//the octave have 12 tones and semitones. So, if we get a modulo of 12, we get the note names independently of the frequency  
if (n%12==9)
  {
    note = ("a");
    c = color (255, 0, 0);
  }
 
  if (n%12==10)
  {
    note = ("a#");
    c = color (255, 0, 80);
  }
 
  if (n%12==11)
  {
    note = ("b");
    c = color (255, 0, 150);
  }
 
  if (n%12==0)
  {
    note = ("c");
    c = color (200, 0, 255);
  }
 
  if (n%12==1)
  {
    note = ("c#");
    c = color (100, 0, 255);
  }
 
  if (n%12==2)
  {
    note = ("d");
    c = color (0, 0, 255);
  }
 
  if (n%12==3)
  {
    note = ("d#");
    c = color (0, 50, 255);
  }
 
  if (n%12==4)
  {
    note = ("e");
    c = color (0, 150, 255);
  }
 
  if (n%12==5)
  {
    note = ("f");
    c = color (0, 255, 255);
  }
 
  if (n%12==6)
  {
    note = ("f#");
    c = color (0, 255, 0);
  }
 
  if (n%12==7)
  {
    note = ("g");
    c = color (255, 255, 0);
  }
 
  if (n%12==8)
  {
    note = ("g#");
    c = color (255, 150, 0);
  }
}
 
void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
 
  super.stop();
}

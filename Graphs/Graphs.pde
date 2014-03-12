/*
Graph 
by Thomas Sanchez Lengeling

show the incomming values from a FFT sound analyzer.
*/

import java.util.*;
import java.util.concurrent.*;

GraphBar   gpPitch;
GraphBar   gpAmp;
GraphBang  gpOnset;

PFont font;

color fontColor = color(200);

void setup() {
  size(540, 270);

  //OSC
  setupOSC();

  //FUENTE
  font = createFont("Monospaced.plain", 17);
  textFont(font);

  //GRAFICAS
  gpPitch   = new GraphBar("Pitch", 20, 100, 100, 200);
  gpPitch.setLabel("22000", "22");
  gpAmp     = new GraphBar("Amp", 20, 230, 100, 200);
  gpAmp.setLabel("1.0", "0.0");
  gpOnset   = new GraphBang("Onset", 470, 225, 35, 190);

  gpPitch.setFontColor(fontColor);
  gpAmp.setFontColor(fontColor);
  gpAmp.setSliderRange(0.5, 1.5);
  gpOnset.setFontColor(fontColor);
}


void draw() {
  background(35);

  gpPitch.draw();
  gpAmp.draw();
  gpOnset.draw();
}

void mouseDragged() {
  gpPitch.setSliderValue(mouseX, mouseY);
  gpAmp.setSliderValue(mouseX, mouseY);
}

void mousePressed() {
  gpPitch.setSliderValue(mouseX, mouseY);
  gpAmp.setSliderValue(mouseX, mouseY);
}


void mouseReleased() {
  gpPitch.sliderOff();
  gpPitch.sliderOff();
}


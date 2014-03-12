/*
Graph by Thomas Sanchez Lengeling
 
 show the incomming values from a FFT sound analyzer.
 */
import java.util.*;
import java.util.concurrent.*;

import processing.serial.*;

Serial port;

GraphBar   gpPitch;

PFont font;

color fontColor = color(200);

void setup() {
  size(540, 220);
  smooth(4);

  //USB PORT
  String portName = portName= Serial.list()[0];
  port = new Serial(this, portName, 9600);

  //FUENTE
  font = createFont("Monospaced.plain", 17);
  textFont(font);

  //GRAFICAS
  gpPitch   = new GraphBar("Pitch", 20, 100, 100, 200);
  gpPitch.setLabel("1023", "0");
  gpPitch.setFontColor(fontColor);
}


void draw() {
  background(35);

  gpPitch.draw();

  if ( port.available() > 0) {
    float val = port.read();
    gpPitch.updateLog(val);
  }
}

void mouseDragged() {
  gpPitch.setSliderValue(mouseX, mouseY);
}

void mousePressed() {
  gpPitch.setSliderValue(mouseX, mouseY);
}


void mouseReleased() {
  gpPitch.sliderOff();
}


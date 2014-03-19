/*
Graph 
 by Thomas Sanchez Lengeling
 
 show the incomming values from a FFT sound analyzer.
 */

import java.util.*;
import java.util.concurrent.*;


Timeline   timeline;
GraphBar   graphs[];
String     graphNames[] = {
  "Position X", "Activator", "Noise", "Color Inc", "Increment"
};

int number = 5;

PFont font;
int fontS = 9;

color fontColor = color(200);

void setup() {
  size(680, 500);
  smooth(4);
  //OSC
  setupOSC();

  //FUENTE
  font = createFont("Monospaced.plain", fontS, true);
  textFont(font);

  graphs   = new GraphBar[number];
  timeline = new Timeline(20, 52, 640, 120, 3.0);
  timeline.setFontSize(fontS);

  for (int i = 0; i < number; i++) { //87
    graphs[i] = new GraphBar(graphNames[i], 20, 140 + 83*i, 640, 100, fontS, i);

    if (i == 1)
      graphs[i].setLabel("Boolean True False");
    else if(i == 4)
      graphs[i].setLabel("Float 0.0 - 1.0");
    else if ( i == 2)
      graphs[i].setLabel("Float 0.0 - 1.0");
    else if (i == 3)
      graphs[i].setLabel("Interger 0 - 255");
    else
      graphs[i].setLabel("Interger 0 - 255");

    graphs[i].setFontColor(fontColor);
    graphs[i].serFontLength(fontS);
  }
}


void draw() {
  background(35);



  for (int i = 0; i < graphs.length; i++) {
    if (graphs[i].type == 3)
      graphs[i].drawGradient();
    else
      graphs[i].draw();
  }

  timeline.draw();
}

void keyPressed() {
  if (key == 'a') {
    timeline.activate();
  }
}

void mouseDragged() {
}

void mousePressed() {
}


void mouseReleased() {
}


/*
Be Careful with your speaker volume, you might produce a painful 
 feedback. We recommend to wear headphones for this example.
 
 */

import processing.sound.*;

AudioIn input;
Amplitude rms;

int scale=1;
int scaleFramePrec, deltaScale;
boolean volUp = false;
int [] marqueurs = {};
int chrono = 0;

void setup() {
  size(640, 360);
  background(255);

  //Create an Audio input and grab the 1st channel
  input = new AudioIn(this, 0);

  // start the Audio Input
  input.start();

  // create a new Amplitude analyzer
  rms = new Amplitude(this);

  // Patch the input to an volume analyzer
  rms.input(input);

  scale = 0;
  scaleFramePrec = 0;
}      


void draw() {
  background(125, 255, 125);

  // adjust the volume of the audio input
  input.amp(map(mouseY, 0, height, 0.0, 1.0));


  // rms.analyze() return a value between 0 and 1. To adjust
  // the scaling and mapping of an ellipse we scale from 0 to 0.5
  scale=int(map(rms.analyze(), 0, 1.0, 1, 350));
  noStroke();

  // écart entre les niveaux d’amplitude recensés
  deltaScale = scale - scaleFramePrec;
  //println(deltaScale);


  if (deltaScale > 50) { // detection volume soudainement plus fort
    volUp = true;
  }

  if ((volUp)&&(deltaScale < 0)) { // detection volume commence à faiblir
    //println("bang "+frameCount);
    if (chrono == 0) {
      chrono = millis(); // premier marqueur de temps
    } else if (chrono > 0) {
      marqueurs = append(marqueurs, millis()-chrono); //intervalle de temps
      chrono = millis(); // mise à jour chrono
    }
    volUp = false;
  }

  fill(255, 0, 150);
  // We draw an ellispe coupled to the audio analysis
  ellipse(width/2, height/2, 1*scale, 1*scale);

  // mise en mémoire amplitude pour prochaine comparaison
  scaleFramePrec = scale;
}

void mousePressed() {
  println(marqueurs);
  int sommePulses = 0;
  float PulseMoyen = 0;
  if (marqueurs.length > 2) {
    for (int i = 0; i < marqueurs.length; i++) {
      sommePulses += marqueurs[i];
    }
    println(sommePulses);
    println(marqueurs.length);
    PulseMoyen = sommePulses/float(marqueurs.length);
    println("PulseMoyen " + PulseMoyen);
  }
}
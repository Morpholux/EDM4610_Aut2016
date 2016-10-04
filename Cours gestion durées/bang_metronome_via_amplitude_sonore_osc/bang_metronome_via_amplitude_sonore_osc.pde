// Méthode pour produire des bangs au son d’un métronome
// La période moyenne des bangs est régulièrement envoyée à un autre sketch.

import processing.sound.*;
import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

AudioIn input;
Amplitude rms;

int scale, chrono, chronoPrecedent, dureeVisible = 100;
int moyenne = 0, compteur;
int freqEnvoi = 5;

float amplitude, treshold = 0.05, taille;
boolean audible = false;

IntList inventory;
int nombreEchantillons = 5;

void setup() {
  size(300, 300);
  background(255);
  noStroke();
  fill(255, 0, 150);

  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress("127.0.0.1", 12001);

  inventory = new IntList();

  //Create an Audio input and grab the 1st channel
  input = new AudioIn(this, 0);
  // start the Audio Input
  input.start();
  // create a new Amplitude analyzer
  rms = new Amplitude(this);
  // Patch the input to an volume analyzer
  rms.input(input);


  // première lecture du temps à la fin du setup()
  chronoPrecedent = millis();
}      


void draw() {
  background(125);

  // adjust the volume of the audio input
  input.amp(1);
  // Analyse de l’amplitude
  amplitude = rms.analyze();

  // Les conditions ci-dessous permettent de déclencher PONCTUELLEMENT les évenements
  if ((amplitude > treshold)&&(audible==false)) {
    // On est ici parce que le son passe au-dessus du seuil
    audible = true;
    bang(amplitude);
    println(amplitude);

    // voyons le temps qui s’est écoulé depuis le dernier pic sonore
    println(millis()-chronoPrecedent);
    if (inventory.size() < nombreEchantillons) {
      inventory.append(millis()-chronoPrecedent);
    } else {
      inventory.remove(0);
      inventory.append(millis()-chronoPrecedent);
    }
  } else if ((amplitude < treshold)&&(audible)) {
    // On est ici parce que le son descend sous le seuil
    audible = false;
    println();
  }

  afficher(millis());
}

void bang(float amp) {
  taille = map(amp, treshold, 1, 10, 400);

  chronoPrecedent = chrono;
  chrono = millis();

  // Un message de synchronisation est envoyé régulièrement
  if ((compteur%freqEnvoi)==0) {
    calculerMoyenne();
    envoiMessageOsc();
  }
  compteur++;
}

void afficher(int _t) {
  if ((_t - chrono) < dureeVisible) {
    ellipse(width/2, height/2, taille, taille);
  }
}


void mouseDragged() {
  treshold = map(mouseX, 0, width, 0.2, 0.01);
}

void keyPressed() {
  calculerMoyenne();
}

void calculerMoyenne() {
  int somme = 0;
  for (int i = 0; i < inventory.size(); i++) {
    println(inventory.get(i));
    somme += inventory.get(i);
  }
  println();
  moyenne = int(somme/float(inventory.size()));
  println("Moyenne des intervalles : "+moyenne);
  println();
}

void envoiMessageOsc() {
  OscMessage myMessage = new OscMessage("/test");
  myMessage.add(moyenne);
  oscP5.send(myMessage, myRemoteLocation);
}
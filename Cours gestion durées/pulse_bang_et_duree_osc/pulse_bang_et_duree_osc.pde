// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.2.1
// Août 2016

// Cet exemple reprend le cas d’un affichage qui est
// déterminé par une pulsation. Il fallait ajouter
// à la classe les modalités concernant la durée de l’affichage,
// sans quoi les temps sont trop courts pour voir les objets.
// Autrement dit, la nouvelle classe gère le déclenchement d’événements
// ponctuels et assure une certaine durée de visibilité qui, idéalement,
// est supérieure à la durée d’un cycle de draw().

import netP5.*;
import oscP5.*;

OscP5 oscP5;

Pulsation pulsation1, pulsation2;


void setup() {
  size(300, 300);
  background(0);
  noStroke();
  rectMode(CENTER);
  oscP5 = new OscP5(this, 12001);

  // Deux arguments : fréquence pulsation en secondes, duree en millisecondes
  pulsation1 = new Pulsation(500*0.001, 100);
}

void draw() {
  background(0);


  fill(150, 110, 20);
  // Important de faire l’appel de la méthode evaluerDuree()
  pulsation1.evaluerDuree();
  // Si le pulse est vrai, alors on affiche
  if (pulsation1.pulse) {
    rect(width/2, height/2, 100, 100);
  }
  // On peut examiner la variable Bang
  if ((pulsation1.pulse)&&(pulsation1.bang)) {
    //println(pulsation1.bang);
    // Puis on annule aussitôt le bang.
    // Il sera vrai sur un seul frame par cycle de pulsation
    pulsation1.bang = false;
  }
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  //print("### received an osc message.");
  //print(" addrpattern: "+theOscMessage.addrPattern());
  //println(" typetag: "+theOscMessage.typetag());
  if (theOscMessage.checkTypetag("i")) {
    int periodeMillis = theOscMessage.get(0).intValue();
    println(periodeMillis);
    pulsation1 = new Pulsation(periodeMillis*0.001, 100);
  }
}
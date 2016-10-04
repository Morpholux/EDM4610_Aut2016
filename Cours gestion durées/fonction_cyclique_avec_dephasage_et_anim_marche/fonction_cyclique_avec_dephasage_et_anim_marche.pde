// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0
// vendredi, 16 octobre 2015
// Crédits extrait animation du robot marcheur : Mark, C. Harris, 2003

// On tape sur la barre d’espace pour synchroniser l’animation avec le son

// 1. Fixer BPM
float bpm = 91*0.5; // Beats per Minute : inscrire la valeur de votre choix. Par exemple, (91*0.5) pour Kraftwerk
//float bpm = 125.98*0.5; //  (125.98*0.5) pour Minogue

// 2, Choisir pièce correspondante
String piece = "kraftwerk.mp3";
//String piece = "minogue.mp3";

// * * * * * * * * * *

float cyclesParSeconde = bpm/60.0, amplitude = 40, tailleCercle = amplitude, periode;
float ondulation, temps = 0, monHorloge, dephasagePonctuel = 0, dephasageInit = 0;

FloatList inventory;
PImage [] sequence = new PImage [32];

import processing.sound.*;
SoundFile soundfile;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
  noCursor();

  inventory = new FloatList();
  for ( int i =0; i<300; i++) {
    inventory.append(0);
  }
  periode = 1000/cyclesParSeconde; // en millisecondes
  println(periode);
  dephasageInit = map(0.75, 0, 1, 0, TWO_PI);
  dephasageInit = map(dephasageInit, 0, TWO_PI, 0, periode);

  // chargement des images
  for (int i = 1; i <= sequence.length; i++) {
    if (i < 10) {
      sequence[i-1] = loadImage("Walk Cycles Compilation 0"+i+".jpg");
    } else {
      sequence[i-1] = loadImage("Walk Cycles Compilation "+i+".jpg");
    }
  }

  //Load a soundfile
  soundfile = new SoundFile(this, piece);
  soundfile.play();
}

void draw() {
  background(0);

  temps = millis();

  // Travail sur le temps
  monHorloge = temps + dephasageInit - dephasagePonctuel;
  ondulation = fonctionSin(cyclesParSeconde, monHorloge);

  // Un autre léger décalage est nécessaire par harmoniser les frames d’animation,
  // afin que le pas au sol coïncide avec la pulsation : monHorloge+(periode*0.25)
  // Le reste de la fomule sert à mettre en adéquation le cycle périodique
  // avec le nombre d’images de l’animation dans le tableau "sequence" (ici, 32).
  image(sequence[constrain(floor(map((monHorloge+(periode*0.25))%periode, 0, periode, 0, 32)), 0, 31)], -20, 260);


  // Dessin lignes de repère
  pushStyle();
  noFill();
  stroke(0, 0, 150);
  line(width/2, 0, width/2, height);
  stroke(60, 0, 0);
  line(0, 150-amplitude, width, 150-amplitude);
  line(0, 150, width, 150);
  line(0, 150+amplitude, width, 150+amplitude);
  popStyle();

  // Point à taille variable
  ellipse(width/2, height/2, tailleCercle+ondulation, tailleCercle+ondulation);

  // Portion pour afficher l’onde
  inventory.remove(0);
  inventory.append(ondulation);
  for ( int i =inventory.size()-1; i>=0; i--) {
    pushMatrix();
    translate(i, 0);
    ellipse(0, -inventory.get(i)+(height/2)-150, 2, 2);
    popMatrix();
  }
}


// Enfoncer la barre d’espace au moment jugé opportun
void keyPressed() {
  if (key == ' ') {
    reSync();
  }
}


// Fonction de resynchronisation
void reSync() {
  dephasagePonctuel = temps%periode;
}


// Fonctions pour gérer mouvements cycliques
float fonctionSin(float freq, float _temps) {
  return (sin(_temps/((1000.0/TWO_PI)/freq))*amplitude);
}

float fonctionSinInverse(float freq, float _temps) {
  return (sin(_temps/((1000.0/TWO_PI)/freq))*amplitude)*-1;
}
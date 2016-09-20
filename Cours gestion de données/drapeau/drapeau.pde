// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.2.1
// mardi, 20 septembre 2016

boolean drapeau =false;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
}

void draw() {
  background(0);

  if (drapeau) {
    // On réalise quelquechose
    // Est-ce que l’on réalise cette chose plusieurs fois ou une seule fois?
    rect(200, 200, 50, 50);
    drapeau = !drapeau; // une seule fois, car le drapeau retourne à false
    println("bang");
  }
}

void mousePressed() {
  drapeau = !drapeau;
}
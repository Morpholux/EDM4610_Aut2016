// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.2.1
// mardi, 20 septembre 2016


int posMax =0;

void setup() {
  size(600, 600);
  background(0);
  fill(255);
  noStroke();
}

void draw() {
  background(0);

  // Double condition pour repousser le rectangle vers le bas
  if ((mouseY > pmouseY)&&(mouseY>posMax)) {
    posMax = mouseY;
  }

  rect(200, posMax, 20, 20);

  // le rectangle retourne à sa place
  if (posMax > 0) {
    posMax--;
  }
}
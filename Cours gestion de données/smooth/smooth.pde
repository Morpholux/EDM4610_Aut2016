float smoothValX, smoothValY, posSourisX, posSourisY;
float facteurLissage = 0.25, seuil = 1;

void setup() {
  size(600, 600, P2D);
  // pixelDensity(displayDensity());
  background(0);
  fill(255);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(0);
  
  posSourisX = mouseX;
  posSourisY = mouseY;

  if ((abs(smoothValX-posSourisX) > seuil)||(abs(smoothValY-posSourisY) > seuil)) {
    // Formule emprunté à Thomas Frederics
    smoothValX = (posSourisX-smoothValX)*facteurLissage+smoothValX;
    smoothValY = (posSourisY-smoothValY)*facteurLissage+smoothValY;
  } else {
    smoothValX = posSourisX;
    smoothValY = posSourisY;
  }

  rect(smoothValX, smoothValY, 40, 40);
}
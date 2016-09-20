float delta1= 0, delta2 = 0;
float offset1 = 0.0, offset2 = 0.0;
float noisescale1 = 2.0, noisescale2 = 0.5;
float incrementOffset1 = 0.01, incrementOffset2 = 0.01;
float posInitialeX, posInitialeY;
float amplitude = 400;
int pas = 10;
float tailleEllipse = 20;

void setup() {
  size(600, 600);
  posInitialeX = width/2;
  posInitialeY = height/2;
  background(0);
  smooth();
  fill(255,150);
  noStroke();
}

void draw() {
  background(0);
  noiseDetail(2, 1);
  
  translate(0, -amplitude*0.5);
  delta2 = ((noise(offset2*noisescale2))*amplitude)-(amplitude*0.5);
  for (int i = (int)amplitude; i > 0; i-=pas) {
    delta1 = ((noise(offset1*noisescale1))*amplitude)-(amplitude*0.5);
    // Les variables de décalage sont progressivement affectées par l’incrémentation de i :
    // De même pour la taille de l'ellipse
    float diametre = tailleEllipse*(map(i, amplitude, 0, 0, -1));
    ellipse(posInitialeX+((delta1+delta2)*map(i,amplitude, 0, 1, 0)), posInitialeY+i, diametre, diametre);
    offset1+=incrementOffset1;
  }
  
  // Incrémentation de offset2 seulement à la fin de la boucle
  offset2+=incrementOffset2;
  
  
  // Si on réinitialise offset1 à 0, on redessine la même chose à tous les frames
  //offset1 = 0;
  // Si on incrémente offset1 par la nouvelle valeur de offset2, on produit une animation «imbriquée»
  offset1 = offset2;
}


// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.2.1
// jeudi, 15 septembre 2016

// Trois stratégies pour placer des coordonnées x et y en mémoire dans un tableau


int nbCases = 10; // nombre d’entrées

// Deux tableaux, un pour chaque coordonnée
float [] posX = new float [nbCases];
float [] posY = new float [nbCases];

// Un tableau à deux dimensions
float [][] pos = new float [nbCases][2]; // Le chiffre 2 indique un sous tableau à deux cases

// Un tableau de PVector
PVector [] pv = new PVector[nbCases];


void setup() {
  size(200, 200);
  background(0);
  fill(255);
  noStroke();
  noLoop();
}

void draw() {
  background(0);

  // Méthode 1
  posX[frameCount%10] = mouseX;
  posY[frameCount%10] = mouseY;

  // Méthode 2
  pos[frameCount%10][0] = mouseX;
  pos[frameCount%10][1] = mouseY;

  // Méthode 3
  pv[frameCount%10] = new PVector(mouseX, mouseY, 0);
  
  // Note : le %(modulo) 10 nous permet d’enregistrer les valeurs en boucle,
  // même lorsque le frameCount dépasse la taille des tableaux.
}

void mouseReleased() {
  // Méthode deux arrays
  println("Liste posX");
  printArray(posX);
  println();
  println("Liste posY");
  printArray(posY);

  // Méthode Array à deux dimensions [][]
  println();
  println("Liste pos");
  printArray(pos);
  println(pos[9][0]+", "+pos[9][1]);

  // Méthode PVector
  println();
  println("Liste pv");
  printArray(pv);
  println(pv[9].x + ", " + pv[9].y);
}


// Chaque déplacement de souris modifie le contenu des tableaux
void mouseMoved() {
  redraw();
}
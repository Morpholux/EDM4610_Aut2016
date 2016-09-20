// L'utilisation de PGraphics est essentielle ici.
// Elle permet de gérer à la fois une animation (le mouvement du plotter)
// et une trace (un mouvement qui n'est pas effacé par la commande background()).

float xoff = 0.0, yoff = 0.0, noiseScale1=0.4, noiseScale2=0.2;
float n1, n2;
float posPrecX=0.0, posPrecY;
PGraphics p;

void setup() {
  size(600,600);
  background(127);
  stroke(0,90);
  p = createGraphics(width, height, JAVA2D);
  noiseDetail(4); // détermine le nombre d'octaves dans le calcul. par défaut est à 4.
  noiseSeed(10); // le déroulement de la pige sera chaque fois similaire

}

void draw() 
{

  background(127);

  xoff = xoff + .01;
  yoff = ((millis()/1000.0));
  n1 = noise(xoff*noiseScale1) * width;
  line(n1, 0, n1, height);
  n2 = noise(yoff*noiseScale2) * width;
  line(0, n2, width, n2);

  // Pour laisser la trace du plotter
  p.beginDraw();
  p.noStroke();
  p.fill(255,20);
  p.noStroke();
  p.smooth();
  p.ellipse(n1, n2, 10, 10);
  p.stroke(150,255,0);
  if (posPrecX == 0) {
    p.line(n1, n2, n1, n2);
  } 
  else {
    p.line(posPrecX, posPrecY, n1, n2);
  }
  p.endDraw();
  image(p,0,0);

  posPrecX = n1;
  posPrecY = n2;
}


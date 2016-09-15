// renaud.jean-francois@uqam.ca
// Syntaxe Processing version 1.2.1
// mardi, 21 septembre 2010

PImage [] listeImg = new PImage[9];
int tailleCell = 20;

void setup() {
  size(900, 900);
  background(0);
  smooth();
  fill(255);
  noStroke();
  noLoop();
  for (int i = 1; i <= listeImg.length; i++) {
    listeImg[i-1] = loadImage("bloc0"+i+".jpg");
  }
}

void draw() {
  background(0);
  for(int j=0; j<height/tailleCell; j++) {
    for (int i=0; i<width/tailleCell; i++) {
      tint(random(120,155),random(150,195),random(200,255));
      image(listeImg[int(floor(random(i%9,listeImg.length)))], i*tailleCell, j*tailleCell, tailleCell, tailleCell);
    }
   }
   //saveFrame();
}
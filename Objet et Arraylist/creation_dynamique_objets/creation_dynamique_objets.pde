int taille, nbShapes = 10;
// liste
ArrayList listeObjets = new ArrayList();

void setup(){
  size(600, 600);
  background(255,0,0);
  smooth();
  strokeWeight(1);
  //noLoop();
}

void draw() {
  // produit l'effet fantomatique
  fill(0,10);
  noStroke();
  rect(0,0,width,height);
  noFill();
  stroke(255,50);
  
  translate(mouseX, mouseY);
  for (int i=0; i < nbShapes; i++) {
    taille = floor(random(50,150));
    listeObjets.add(new Polygon(0, 0, taille, taille, 6+(floor(random(15)))));
  }
  for (int i = 0; i < listeObjets.size(); i++) {
    /*
    // On copie l'objet de la liste dans un objet temporaire
    Polygon p = (Polygon) listeObjets.get(i);
    // on appelle la méthode de la classe Polygon
    p.create();
    */
    // Autre manière d'écrire le même code
    ((Polygon) listeObjets.get(i)).create();
  }
  // On vide la liste
  listeObjets.clear();
}

class Shape {
  //class properties
  int x;
  int y;
  int w;
  int h;

  //constructors
  Shape (){
  }

  Shape (int x, int y, int w, int h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
}

class Polygon extends Shape{
  int pts;
  //constructor
  Polygon (int x, int y, int w, int h, int pts){
    //Optional call to superclass constructor must come first
    super(x, y, w, h);
    // add any remaining initializations
    this.pts = pts;
  }

  //method to draw poly
  void create(){
    float px = 0, py = 0;
    float angle = 0;
    beginShape();
    for (int i=0; i<pts; i++){
      px = cos(radians(angle))*w;
      py = sin(radians(angle))*h;
      vertex(px, py);
      angle+=360.0/pts;
    }
    endShape(CLOSE);
  }
}

/*
void mousePressed() {
  redraw();
}
*/


// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.0a9
// mardi, 9 juin 2015

// Il y a un problème avec noLoop() dans cette version de Processing.
// Voir à l’adresse qui suit : https://github.com/processing/processing/issues/3310

ArrayList<Chose> choses = new ArrayList<Chose>();
int numero;

void setup() {
  size(100, 100);
  background(0);
  fill(255);
  noStroke();

  numero = 0;
  choses.add(new Chose(numero));

  noLoop();
}

void draw() {
  background(0);

  // You can iterate over an ArrayList in two ways.
  // The first is by counting through the elements:
  // The second is using an enhanced loop:
  for (Chose c : choses) {
    //c.display();
    println("La chose numéro "+c.id+" est née à "+c.timeStamp+" millisecondes");
  }

  // If you are modifying an ArrayList during the loop,
  // then you cannot use the enhanced loop syntax.
  // In addition, when deleting in order to hit all elements, 
  // you should loop through it backwards, as shown here:

  // Nombre d’objets dans le ArrayList
  println("La liste contient "+choses.size()+" chose(s).");
  println();
}

// Définir la classe Chose
class Chose {
  int id;
  int timeStamp;
  
  // Constructeur
  Chose (int _numero) {
    id = _numero;
    timeStamp = millis();
  }
  
  // Méthode
  void display() {
    //println("La chose numéro "+id+" est née à "+timeStamp+" millisecondes");
  }
}

void mousePressed() {
  numero++;
  choses.add(new Chose(numero));
  redraw();
}

//void keyPressed() {
//  for (Chose c : choses) {
//    c.timeStamp = millis();
//    println(c.timeStamp);
//  }
//}
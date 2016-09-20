boolean flag = true; // État initial

void setup() {
  size(400,400);
  background(200);
  fill(0);
  rect(200,200,200,200); // zone 1
  rect(100,100,50,50); // zone 2
}


void draw() {

  if ((mouseX > 200)&&(mouseX < 200+200)&&(mouseY > 200)&&(mouseY < 200+200)) {
    if (flag == true) {
      println("Bang_Zone 1");
      fill(255);
      rect(200,200,200,200);
      flag = false;
    }
  } 
  else if ((mouseX > 100)&&(mouseX < 100+50)&&(mouseY > 100)&&(mouseY < 100+50)) {
    if (flag == true) {
      println("Bang_Zone 2");
      fill(255);
      rect(100,100,50,50);
      flag = false;
    }
  }
  else if (flag== false) { // L'état de "flag" en sortant de l'un ou l'autre zone de détection
    println("Zone neutre");
    flag = true;
    
    // On redessine le sketch et ses zones dans leur couleur initiale
    background(200);
    fill(0);
    rect(200,200,200,200); // zone 1
    rect(100,100,50,50); // zone 2
  }
}

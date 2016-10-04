// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.2.1
// lundi, 3 octobre 2016

// * * * * * * * * * * * * * * * * * * * *
// Variable à ajuster selon les besoins
int dureeMinuterie = 500; // en millisecondes

// À 60 fps, les intervalles en millisecondes sont idéalement de 17 (16,6).
// La lecture pouvant être faite avant ou après la mesure de temps idéale
// on détermine une marge d’erreur d’environ 50% l’intervalle moyen
int margeErreur = 8;

// P.-S. Suivant la valeur ci-dessus et dépendamment de la durée d’exécution,
// le programme n’offrira peut-être pas suffisament de précision,
// car il cumule des millisecondes de retard, en raison
// du mode d’évaluation (la comparaison dans la conditionnelle).
// Lui préférer la méthode Java (voir sketch pulsation_java.pde)
// si l’on souhaite synchroniser les pulsations à des durées absolues :
// 1000 secondes se seront exactement écoulées après 1000 pulsations à toutes les secondes
// * * * * * * * * * * * * * * * * * * * *

// Autres variables globales
int tempsZero, tempsUn, compteur = 0;
int tempsEcoule;
boolean affiche = false;
PFont maPolice;

void setup() {
  size(300, 300);
  background(0);
  fill(255);
  noStroke();
  tempsZero = millis();
  maPolice = loadFont("Menlo-Regular-48.vlw");
  textFont(maPolice, 48);
  textAlign(CENTER);
}

void draw() {
  background(0);

  // 1- Calcul du temps écoulé depuis la dernière borne temporelle
  tempsEcoule = millis() - tempsZero;
  // Notons que la lecture ne se fait jamais selon des intervalles constants


  // 2- Affichage d’un témoin lumineux
  // Méthode à privilégier :
  // Pour bien voir le témoin, il faut le laisser visible pendant PLUSIEURS frames
  // On fixe un délai plus grand qu’un seul frame, mais plus petit que notre minuterie
  if (tempsEcoule > (dureeMinuterie*0.25)) {
    // On éteint le témoin (au quart de sa durée potentielle)
    affiche = false;
  }
  // Un carré s’affiche lorsque la valeur booléenne est vraie
  if (affiche) {
    fill(200, 40, 20);
    rect((width*0.5)-30, (height*0.5)+10, 60, 5);
  }

  // 3- Déclenchement de l’événement ponctuel sur des durées qui sont
  // approximativement celle fixée par la variable (avec quelques millisecondes
  // de retard pour certaines mesures)
  // Pour minimiser l’écart progressif des intervalles ciblés, on utilise la marge d’erreur 
  if (tempsEcoule >= dureeMinuterie-margeErreur) {
    // À décommenter pour observer le niveau d’imprécision
    println("temps écoulé : " + tempsEcoule);

    // La fonction bang n’est appelée que pendant un seul frame,
    // car la condition sera fausse au frame suivant.
    bang();
  }



  fill(255);
  text(compteur, width*0.5, height*0.5);
}


void bang() {
  // On ré-évalue le temps présent afin de définir la prochaine borne de départ
  tempsZero = millis();
  // On incrémente la variable
  compteur++;
  // on autorise l’affichage du témoin
  affiche = true;
}
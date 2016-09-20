// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.2.1
// samedi, 17 septembre 2016

boolean visible = false, gagnant, gagnantPlusChanceux, gagnantMoinsChanceux;
int pige, pige1, pige2;

// Taux inverse de probabilité (donc, le niveau d’improbabilité).
// Ce taux croît plus le chiffre est grand (augmentant la rareté de notre événement).
int tauxRarete = 50;

void setup() {
  size(200, 200);
  background(0);
  fill(255);
  noStroke();

  //Dans notre exemple, une modification du frameRate affecte la fréquence des événements
  //frameRate(60);
}

void draw() {
  background(0);

  // 1 - On utilise un opérateur de comparaison pour déterminer si le tirage au sort
  // contient le "numéro chanceux". Ce numéro, ici le 0, est choisi arbitrairement.
  // Ce pourrait être n’importe lequel entre 0 et tauxRarete-1 que la probabilité
  // resterait la même.
  pige = int(floor(random(0, tauxRarete)));
  gagnant = (pige==0);

  // 2 - On peut influencer notre probabilité, soit en augmentant les chances, soit en les réduisant

  // Avec un tauxRarete à 50 et la conditionnelle à OU (||), la probabilité passe à 1 fois sur 25.
  // Notez que chaque tirage est indépendant, qu’il dispose d’une probabilité identique,
  // et que l’événement final implique l’évaluation conjointe de deux sous-événements.
  pige1 = int(floor(random(0, tauxRarete)));
  pige2 = int(floor(random(0, tauxRarete)));
  gagnantPlusChanceux = (pige1==0)||(pige2==0);
  // ou encore
  //gagnantPlusChanceux = (pige1==0)||(pige1==1); 

  // Avec un tauxRarete à 50 et la conditionnelle à ET (&&), la probabilité passe à 1 fois sur 2 500.
  gagnantMoinsChanceux = (pige1==0)&&(pige2==0);


  // Si la pige s’avère gagnante, on inverse le statut de notre état
  if (gagnant) visible = !visible;
  //if (gagnantPlusChanceux) visible = !visible;
  //if (gagnantMoinsChanceux) visible = !visible;

  // Il faut comprendre que la pige influence simplement la fréquence de l’alternance
  // soit le passage du rectangle visible à l’absence de rectangle,
  // et que le rythme de ce changement d’état, dans un sens comme dans l’autre,
  // ne présente aucune régularité.
  if (visible) {
    rect(50, 50, 100, 100);
  }
}
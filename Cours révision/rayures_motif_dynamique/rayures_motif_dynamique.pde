// Motif de rayures avec bandes à chaque extrémité du sketch
// Le nombre et la largeur des rayures sont modifiés dans le temps,
// et selon la hauteur de la souris.
// Le système d’affichage s’adapte et le motif conserve ses attributs :
// espacement régulier des intervalles et étalement ajusté à la largeur du sketch.

// Variables globales
// Le type de variable déclarée joue un rôle précis
int nombreRayures;
int nombreMaxRayures = 20;
// Les trois variables qui suivent pourraient également être des Float
int largeurRayure;
int espaceOccupeParRayures;
int espaceRestant;
float largeurIntervalle;
float reperePosRayure;
color couleurRayure;
color couleurIntervalle;


void setup() { 
  size(400, 400);
  background(0);
  noStroke();
}

void draw() {
  background(0);
  // On modifie le nombre de bandes à chaque frame
  // Il y aura deux bandes au minimum, et 20 au maximum.
  // Les cas limites de la formule ci-dessous sont (2+0) et (2+18)
  nombreRayures = 2 + (int(floor((frameCount*0.1)%(nombreMaxRayures-1))));
  //println(nombreRayures);

  // La largeur de la bande est déterminée ici.
  // Elle peut varier suivant la position de la souris en Y.
  // La largeur oscille entre 2 et 20 pixels, par incréments arrondis au pixel (donc, des entiers)
  largeurRayure = int(floor(map(mouseY, 0, height, 2, 21)));
  //println(largeurRayure);
  
  // Les mesures des autres variables découlent toutes des deux premières :
  espaceOccupeParRayures = largeurRayure*nombreRayures;
  espaceRestant = width-espaceOccupeParRayures;
  // ATTENTION : si on veut garder la précision des fractions dans notre calcul, il faut diviser par un float
  largeurIntervalle = espaceRestant/float(nombreRayures-1);

  // La variable recherchée est donc la suivante
  reperePosRayure = largeurRayure+largeurIntervalle;

  couleurRayure = color(224,220,2);
  couleurIntervalle = color(98,126,38);

  // On procède maintenant au dessin des rayures
  // Une première rayure est placé à gauche, suivie d’un intervalle:
  fill(couleurRayure);
  rect(0, 0, largeurRayure, height);
  fill(couleurIntervalle);
  rect(largeurRayure, 0, largeurIntervalle, height);

  // On dessine les autres rayures, partant de la seconde, jusqu’à l’avant-dernière
  // Notez l’usage de la valeur incrémentée (i), multipliée par le repère de position
  // Notez également que la boucle débute avec i à 1, et non à 0
  for (float i = 1; i < nombreRayures-1; i++) { 
    fill(couleurRayure);
    rect(i*reperePosRayure, 0, largeurRayure, height);
    fill(couleurIntervalle);
    rect((i*reperePosRayure)+largeurRayure, 0, largeurIntervalle, height);
  }
  // On dessine la dernière rayure
  fill(couleurRayure);
  rect(width-largeurRayure, 0, largeurRayure, height);
  
}
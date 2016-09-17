EDM4610
=======

Contenu du cours «Image de synthèse et interactivité»<br>
UQAM - Université du Québec à Montréal<br>
Programme de Baccalauréat en médias interactifs<br>
Session automne 2016

Enseignant : <a href="mailto:renaud.jean-francois@uqam.ca">Jean-François Renaud</a> (professeur)

<br>
_ _ _

####Description des travaux d’atelier

A1 . **Atelier Pixels** - mardi, semaine 2

• Réaliser un sketch en colorisant sa surface à l’aide d’une méthode exclusivement matricielle, c’est-à-dire que les valeurs de couleurs sont assignées directement aux pixels. Donc on n’utilise aucune des primitives – rect(), line(), quad() – comme stratégie de remplissage. On peut considérer le chargement d’images comme source de données. On évite l’utilisation des commandes set() ou get() pour lire ou écrire la donnée de couleur. On lui préfère la commande pixels[]. Enfin, on voit comment extraire les valeurs RGB ou HSB d’une couleur grâce aux opérateurs <i>Bit Shift</i>.

Notions à considérer :

`pixels[], loadPixels(), updatePixels(), loadImage(), PImage`

<br>

A2 . **Atelier tracé vectoriel** - vendredi, semaine 2

• Réaliser un sketch présentant un motif ou une structure graphique, idéalement animée. Le dessin des figures se fait à l’aide d’une méthode exclusivement vectorielle, c’est-à-dire qu’elles sont dotées de tracés (droites, courbes), et donc de points de contrôle (ancrage, levier) pouvant être déplacés depuis le code. On évite l’utilisation des primitives 2D rect() ou ellipse(), car on construit ses propres formes. Bravo à ceux qui exploreront l’exportation de leurs rendus en format PDF.

Notions à considérer :

`vertex(), curve(), bezier(), curveVertex(), bezierVertex(), beginShape() endShape(), PShape`

<br>

A3 . **Atelier gestion de données et d’événements** - mardi, semaine 3

• Créer un sketch qui repose sur l’interprétation statistique d’une propriété de votre choix, d’un événement particulier. Par exemple, les variations de vitesse de déplacement de la souris. On explore tant les conditions binaires (dedans/dehors, actif/inactif) que les états continus (près/loin, beaucoup/peu). On procède à l’analyse de nos données et on exploite les résultats. Ceux-ci influenceront le visuel de quelque manière que ce soit.
L’objectif consiste à se familiariser aux concepts de gestion de données (tableaux de valeurs, pige, signaux, événements), à appliquer des seuils (treshold), des bornes (constrain), des filtres, des [valeurs sentinelles](https://en.wikipedia.org/wiki/Sentinel_value) (flag), etc. On cherche à enrichir le système d’affichage de comportements plus complexes, moins déterministes en apparence.

Notions à considérer :

`map(), random(), noise(), max(), min(), floor(), dist(), boolean`

<br>


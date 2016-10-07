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

A4 . **Atelier objet et ArrayList** - vendredi, semaine 3

• Créer un sketch qui repose sur la programmation orientée objet et les tableaux Java (ArrayList). Les principaux avantages de cette forme de programmation consistent à créer sur commande des instances d’une classe, chacune des entités disposant de propriétés adressables individuellement. Combinées à l’ajout ou le retrait d’objets à des tableaux Java, ces méthodes d’instanciation offrent l’avantage de gérer efficacement une large population d’objets typés. On suggère donc de construire des motifs ou des mondes en conséquence.
Suggestion d’exercice : des flocons de neige tombent en tournoyant; chaque flocon a une taille et une forme légèrement différente (structure des branches) et sa vitesse de rotation varie suivant la proximité d’autres flocons. On pourrait également implémenter une opération qui fait disparaître le flocon sur lequel on clique : validation pour reconnaître quelle est l’instance sous la souris et suppression de celle-ci dans la liste.

Notions à considérer :

`class, extends, ArrayList, <>, .size(), .add(), new, .clear(), .remove(), .get()`

<br>

A5 . **Atelier PVector et simulation de forces physiques** - mardi, semaine 4

• Créer une animation dont les mouvements sont gérés par des opérations sur les PVector. On s’efforce d’introduire des simulations de forces physiques : vitesse, accélération, friction, gravité, déviation, etc. À la base, il faut exploiter la méthodologie des trois vecteurs de base : location, velocity, acceleration. Il faut ensuite introduire une force externe qui viendra influencer l’élan initial. Par exemple, une force de friction, un mouvement brownien, un rebond, etc.

Notions à considérer :

`PVector, .add(), .sub(), .set(), mag(), .setMag(), .normalize(), .mult(), .limit(), .cross()`

<br>

A6 . **Introduction à TouchDesigner - survol des opérateurs de texture (TOPs)** - vendredi, semaine 4

• Créer un système d’affichage simple dans TouchDesigner. On peut explorer les divers jeux de traitement, les filtres, le compositing, les masques. Il faut d’abord bien maîtriser la question des résolutions (Common page) et du positionnement (transformation). Suggestion : d’exercice : combiner plusieurs images et exploiter des masques animés permettant de les dévoiler partiellement.

Notions à considérer :

[First things to Know about TouchDesigner](https://www.derivative.ca/wiki088/index.php?title=First_Things_to_Know_about_TouchDesigner), [Sweet 16 TOPs](https://www.derivative.ca/wiki088/index.php?title=TOP#Sweet_16_TOPs), [Movie File In TOP](https://www.derivative.ca/wiki088/index.php?title=Movie_File_In_TOP)

<br>

A7 . **Gestion des durées dans Processing** - mardi, semaine 5

• Créer un système pouvant interpréter une suite de signaux (comme les pulsations sonores d’un métronome), déduire la fréquence – le BPM – et exploiter cette donnée pour synchroniser une animation.

Notions à considérer :

`millis(), Timer Java`

<br>

A8 . **TouchDesigner - survol des «channel operators» (CHOPs)** - vendredi, semaine 5

• Explorer quelques opérateurs de la famille CHOP, afin de mieux saisir leur usage dans le contexte de votre réseau, qu’il s’agisse de récupérer les données d’une prothèse de contrôle (souris, clavier, Leap, Kinect…) ou de générer des valeurs dans le temps, en vue d’une animation. Explorer également les CHOPs qui vont permettre de modifier (lisser, filtrer, convertir, traduire) la donnée. Par ailleurs, on peut expérimenter avec les procédés de détection en vue du projet de mi-session.

Notions à considérer :

[Sweet 16 CHOPs](https://www.derivative.ca/wiki088/index.php?title=CHOP#Sweet_16_CHOPs)

<br>

A9 . **Communication inter-applications et inter-machines** - mardi, semaine 6

• Exploiter le protocole OSC pour communiquer des données entre applications sur une même machine, ou distribuées sur des machines en réseau. Examiner le transfert d’un message entre Processing et TouchDesigner, puis inversement, ainsi que les messages distribués en Multicast. L’exercice proposé consiste à déterminer des ponts entre deux personnes, la première prenant en charge la structuration d’une donnée, et la seconde, son interprétation en image.

Notions à considérer :

`Librairie OscP5 dans Processing, CHOPs OscIn et OscOut dans TouchDesigner`

<br>


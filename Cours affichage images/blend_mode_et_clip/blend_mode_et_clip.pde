// renaud.jean-francois(arobas)uqam(point)ca
// Syntaxe Processing version 3.2.1
// lundi, 29 août 2016
// Crédits : Joshua Davis pour l’usage du blendMode(BLEND);

/*
Modes supportés : 
 
 BLEND - linear interpolation of colours: C = A*factor + B. This is the default blending mode.
 
 ADD - additive blending with white clip: C = min(A*factor + B, 255)
 
 SUBTRACT - subtractive blending with black clip: C = max(B - A*factor, 0)
 
 DARKEST - only the darkest colour succeeds: C = min(A*factor, B)
 
 LIGHTEST - only the lightest colour succeeds: C = max(A*factor, B)
 
 DIFFERENCE - subtract colors from underlying image.
 
 EXCLUSION - similar to DIFFERENCE, but less extreme.
 
 MULTIPLY - multiply the colors, result will always be darker.
 
 SCREEN - opposite multiply, uses inverse values of the colors.
 
 REPLACE - the pixels entirely replace the others and don't utilize alpha (transparency) values
 */

PImage img1, img2, img3;
boolean fondSeul = false;

void setup() {
  img1 = loadImage("img1.jpg");
  surface.setSize(img1.width, img1.height);
  background(0);
  fill(255);
  noStroke();
  img2 = loadImage("img2.jpg");
  img3 = loadImage("img3.jpg");
}

void draw() {
  if (fondSeul) {
    background(img1);
  } else {
    background(img1);

    clip(0, 200, 200, 200); // cadrage de la portion visible (coin gauche, coin haut, largeur, hauteur)
    blendMode(DIFFERENCE); // Le blendmode est appliqué à l’image qui suit
    image(img2, -mouseX/2, 200-mouseY/2); // Position absolue (et non relative au clipping)
    blendMode(BLEND); // On revient au blendmode par défaut


    clip(200, 200, 200, 200); // cadrage de la portion visible
    blendMode(SCREEN); // Le blendmode est appliqué à l’image qui suit
    image(img3, mouseX/2, mouseY/2);
    blendMode(BLEND); // On revient au blendmode par défaut

    clip(0, 0, 200, 200); // cadrage de la portion visible
    blendMode(LIGHTEST); // Le blendmode est appliqué à l’image qui suit
    image(img3, -mouseX/2, -mouseY/2);
    blendMode(BLEND); // On revient au blendmode par défaut

    // Retour à la vue globale de toute la surface du sketch
    clip(0, 0, width, height);

    rectMode(CENTER);
    rect(width/2, height/2, 60, 60);
  }
}

void mousePressed() {
  fondSeul = !fondSeul;
}
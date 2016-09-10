// Retour sur les conditionnels et les opérations logiques

int premierChiffre = 1;
int secondChiffre = round(1.49999);

boolean test;
test = premierChiffre==secondChiffre; // opérateur de comparaison (ici, l’équivalence)

// L’information entre parenthèses après le "if" ou le "else if" est le "test" de la condition.
// Un test ne peut être que vrai ou faux.

// Quelques exemples :
println(12 > 10); // retourne true (vrai)
println(((12 > 10)&&(1 > 2))); // retourne false (double conditions, reliées par l’opérateur logique ET : vrai seulement si les deux conditions le sont).
println(((12 > 10)||(1 > 2))); // retourne true (OU inclusif, soit OR : vrai si l’un des deux ou les deux sont vrais)
println(((12 > 10)^(1 > 2))); // retourne true (OU exclusif, soit XOR : vrai seulement si l’un des deux est vrai)
println('a' == 'a'); // retourne true
println("abc" == "abc"); // retourne true
println("abc".equals("abc")); // retourne true (on doit préférer cette forme pour des String)
println(12345.6789 == 12345.678); // retourne false
println();

// Procédons à l’évaluation du test
if (test) {
  println("équivalents");
}

// On peut évaleur le contraire :
// La condition "if" entraine donc une action advenant que le test soit faux
if (!test) {
  println("distincts");
}

// Le "else" permet aussi de cerner cette possibilité
if (test) {
  println("équivalents");
} else {
  println("distincts");
}

// Notons la commande pour inverser la valeur d’une variable booléenne,
// peu importe qu’elle soit vrai ou fausse.
test = !test;
// On n’a donc pas à faire de tests (si faux devient vrai, sinon devient faux)
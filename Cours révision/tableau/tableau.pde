// Révision tableau

int [] ma_liste = new int[10];
for (int i = 1; i<10; i++){ // Notez le i qui débute à 1
  ma_liste[i-1] = i; // Décalage entre l’index de la cellule et sa valeur //<>//
}
printArray(ma_liste);
println();

println(ma_liste[ma_liste.length-1]);
// retourne 0, car la cellule du tableau n’avait pas encore été initialisée
println();

// Preuve:
// Déclaration variable tableau et prescription de sa taille (nombre de cellules)
int [] ma_deuxieme_liste = new int [1];
printArray(ma_deuxieme_liste);

// Initialisation
ma_deuxieme_liste[0] = 12345;
printArray(ma_deuxieme_liste);
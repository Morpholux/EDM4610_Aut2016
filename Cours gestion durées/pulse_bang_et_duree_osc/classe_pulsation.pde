import java.util.*;

// Utilisation des propriétés d’héritage en programmation objet
class Pulsation extends TimerTask {

  // Objet Java
  Timer timer;

  boolean pulse = false;
  boolean bang;
  int duree;
  float periode;
  int tempsZero, temps;

  Pulsation(float _periode, int _duree) {
    // Création d’une instance de l’objet Timer
    timer = new Timer();
    periode = _periode;
    periode *= 1000;
    // Méthode de l’objet Timer
    // Le deuxième argument est le délai initial avant le lancement des pulsations
    // Le troisième argument est la période pour chaque pulsation
    timer.scheduleAtFixedRate(this, 0, (long)periode);
    duree = _duree;
    bang = true;
  }

  // Il faut obligatoirement déclarer une méthode run(), même si elle n’est pas utilisée dans le draw principal
  void run() {
    // Instruction ci-dessous est exécutée ponctuellement, suivant le rythme du minuteur
    // println(System.currentTimeMillis());
    tempsZero = (int)System.currentTimeMillis();
    pulse =  true;
  }

  // Permet de gérer la durée de l’affichage
  void evaluerDuree() {
    temps = (int)System.currentTimeMillis();
    if (temps > tempsZero + duree) {
      pulse = false;
      bang = true;
    }
  }


  // Méthode optionnelle pour annuler l’activité du minuteur dans l’objet Timer
  void annulerTimer() {
    timer.cancel();
  }
}
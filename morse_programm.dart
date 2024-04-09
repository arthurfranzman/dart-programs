import 'dart:io';

main() {
  stdout.writeln('Dieser Programmcode übersetzt einen Text in das Morsealphabet. \nWichtig ist dabei, dass nur Zeichen von a bis z sowie Nummern von 1 bis 9 eingegeben werden. \nWelcher Text soll übersetzt werden?');
  String text = (stdin.readLineSync() ?? ""); //fragt den Nutzer nach dem zu übersetzenden Text
  text = text.toLowerCase(); //verwandelt den Text in lowercase Buchstaben
  String answer = morse_translator(text); //setzt die Funktion einem String "answer" gleich
  stdout.writeln(answer);
  stdout.writeln("");
}

morse_translator(String morse) { //Morse-Funktion
  bool false_input = false; //gibt an, wenn die Eingabe nicht zulässige Symbole enthält
  List<String> not_convertable_letters = [];
  Map<String, String> morse_zuordnungen = { //map, welche die buchstaben mit den morsecodes verknüpft
  "a": ".-", "b": "-...", "c": "-.-.", "d": "-..",
  "e": ".", "f": "..-.", "g": "--.", "h": "....",
  "i": "..", "j": ".---", "k": "-.-", "l": ".-..",
  "m": "--", "n": "-.", "o": "---", "p": ".--.",
  "q": "--.-", "r": ".-.", "s": "...", "t": "-",
  "u": "..-", "v": "...-", "w": ".--", "x": "-..-",
  "y": "-.--", "z": "--..", "1": ".----", "2": "..---",
  "3": "...--", "4": "....-", "5": ".....", "6": "-....",
  "7": "--...", "8": "---..", "9": "----.","0": "-----"," ": "       "  };
  String final_morsecode = ""; // String, wo der übersetzte Morse-Code eingefügt wird
  List<String> morse_list = morse.split(''); // wandelt den String in die Liste um
  int counter = 0;
  if (morse == "") {return "Sie haben nichts eingegeben.";}
  stdout.writeln("");
  for (String i in morse_list) { // for-Schleife, welche durch den Text loopt
    if (morse_zuordnungen.containsKey(i)) { // prüft, ob der Buchstabe übersetzbar ist
    counter ++; // definiert einen Counter, welcher für die Absatzformatierung verwendet wird
      final_morsecode += "${morse_zuordnungen[i]}   "; //dem Morse-Code String wird der aktuell geloopte Buchstabe hinzugefügt
      if (counter % 15 == 0) { // hier wird nach ein paar Zeichen eine neue Zeile angefangen, damit die Morse-Übersetzung eleganter aussieht. 
        final_morsecode = final_morsecode + "\n"; 
      }
    }
    else {
      false_input = true;
      not_convertable_letters.add(i);
    }
  }
  if (false_input == false) {return "Der Morse-Code lautet wie folgt:\n${final_morsecode}";}
  else {return "(Sie haben die falschen Zeichen ${not_convertable_letters.join(', ')} eingegeben.)";}
}
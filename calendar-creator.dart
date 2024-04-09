import 'dart:io';

main () { 
  print("Bitte geben den Monat des Kalenders im Format [1 - 12] ein. \nMonat:"); //Ich habe jetzt hier die Variablen m und w vom Nutzer einlesen lassen
  int m = int.parse(stdin.readLineSync() ?? '0'); //Monat einlesen mithilfe von stdin.readLineSync() und nullable machen
  print("Bitte geben den ersten Wochentag des Monats ein. Für Montag verwenden Sie 1, für Sonntag die 7. \Wochentag:");
  int w = int.parse(stdin.readLineSync() ?? '0'); //Wochentag einlesen mithilfe von stdin.readLineSync() und nullable machen
  printCalendar(m, w); //Funktion printCalendar mit den eingelesenen Parametern m,w aufrufen
}

void printCalendar(m, w) { //Anfang Funktion
  Map<int, int> months = { //map, welche "monatsnummer" mit tagesanzahl verknüpft
  1: 31,
  2: 28,
  3: 31,
  4: 30,
  5: 31,
  6: 30,
  7: 31,
  8: 31,
  9: 30,
  10: 31,
  11: 30,
  12: 31
  };
  int daysOfMonth = months[m]!; //daysOfMonth wird die verknüpfte tagesanzahl zugewiesen, wenn man m in die map einsetzt
  if (m < 1 && m > 12) { //Wenn der Nutzer die falsche Zahl für den Monat eingibt (außerhalb 1 - 12)
    print("Die Zahl für den Monat muss zwischen 1 und 12 liegen!");
    return;
  } else {} 
  if (w <1 || w > 7) { //Wenn der Nutzer die falsche Zahl für den Wochentag eingibt (außerhalb 1 - 7)
    print("Die Zahl für den Wochentag muss zwischen 1 und 7 liegen!");
    return;
  } else {}
  stdout.write("\n|MO|DI|MI|DO|FR|SA|SO|\n|"); //Erste Zeile des Kalenders - mit Beschriftungen der Wochentage
  int day = 1; 
  while (day < w) { //die ersten leeren Zeilen, welche entstehen, weil der Wochentag nicht 1 ist
    stdout.write("  |");
    day++;
  }
  for (int day = 1; day <= daysOfMonth; day++) { //der Kern des Programms: eine for-schleife, die durch einen Bereich 1 bis die Tagesanzahl des Monats daysOfMonth loopt. 
    if ((day+w-1)%7 != 0) { //mit Modulo checken, wenn man bei der siebten Spalte, angekommen ist, denn dann geht man in eine neue Zeile
      if (day.toString().length == 1) { //überprüfen, ob die Zahl ein- oder zweistellig ist, denn einstellige Zahlen müssen davor noch ein Leerzeichen haben, hier - case ist einstellig
        stdout.write(" "); //leerzeichen vor dem einstelligen zeichen
        stdout.write("$day|"); //zeichen mit | danach (formatierung)
      }
      else { //zweistellig
        stdout.write("$day|"); 
      }
    }
    else { //bei der siebten spalte angekommen, jetzt werden die Zahlen mit einem zeilenumbruch ausgegeben, ansonsten gleicher code wie oben
      if (day.toString().length == 1) { 
        stdout.write(" ");
        stdout.write("$day|\n|"); //ich habe übrigens stdout.write() gewählt und nicht print(), denn print erstellt standardmäßig einen Zeilenumbruch, was ja nicht gewollt wäre...
      }
      else {
        stdout.write("$day|\n|"); 
      }
    }
  }
  while ((daysOfMonth+w-1) < 35) { //restlichen leeren Zellen füllen, die zellen werden aber nicht gefüllt, wenn es mehr als 5 zeilen sind (ohne header mit wochentagen), da das schöner aussieht
    stdout.write("  |"); 
    ++daysOfMonth; //für die while-schleife den zähler von daysOfMonth erhöhen, damit keine Endlosschleife entsteht.
  }
  stdout.write("\n "); //neue Zeile, damit es ein wenig schöner aussieht
  stdout.write("\n");
}
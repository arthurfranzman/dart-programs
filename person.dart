import 'dart:convert';
import 'dart:io';

void main() {
  // Den Pfad zur externen JSON-Datei angeben
  String path = 'assets/person.json';

  // Überprüfen, ob die Datei existiert
  if (fileExists(path)) {
    // JSON-Datei einlesen
    String jsonString = File(path).readAsStringSync();

    // JSON-Datei parsen und  Person-Objekt erstellen
    Map<String, dynamic> data = jsonDecode(jsonString);
    Person person = Person.fromJson(data['person']);

    // Den Vorstellungstext generieren
    String introduction = generateIntroduction(person);

    // Den Vorstellungstext auf der Konsole ausgeben
    print(introduction);

    // Fehlermeldung, falls Datei nicht vorhanden ist
  } else {
    print('Die externe Datei wurde nicht gefunden.');
  }
}

// Testfunktion, ob Datei vorhanden ist
bool fileExists(String filePath) {
  return File(filePath).existsSync();
}

// Person-Klasse, um die Daten zu modellieren
class Person {
  String name;
  int age;
  String gender;
  List<String> hobbies;
  bool isStudent;
  Map<String, dynamic> education;

  Person({
    required this.name,
    required this.age,
    required this.gender,
    required this.hobbies,
    required this.isStudent,
    required this.education,
  });

  // Konvertierung von JSON zu Person-Objekt
  factory Person.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Ungültige JSON-Daten: null.');
    }

    return Person(
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      hobbies: List<String>.from(json['hobbies']),
      isStudent: json['is_student'],
      education: json['education'],
    );
  }
}

// Funktion zur Generierung des Vorstellungstextes
String generateIntroduction(Person person) {
  String introduction =
      '''
    Hallo, mein Name ist ${person.name}.
    Ich bin ${person.age} Jahre alt und ${person.gender}.
    Meine Hobbys sind: ${person.hobbies.join(', ')}.
    ''';

  if (person.isStudent) {
    introduction +=
        '''
    Ich studiere ${person.education['course']} seit ${person.education['enrollment']} an der ${person.education['university']}.
    ''';
  } else {
    introduction +=
        '''
    Ich habe an der ${person.education['university']} studiert und dort mein/en ${person.education['degree']} in ${person.education['course']} gemacht.
    ''';
  }

  return introduction;
}

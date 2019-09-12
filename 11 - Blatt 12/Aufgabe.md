---
title: 12 - Blatt 13
---

# Einleitung

Hier wird das zwölfte Blatt der Java-Übungsaufgaben bearbeitet. Es geht im
folgenden um das schreiben von eigenen Klassen.

# Vorbereitung

Erstelle dir ein neues Konsolenprogramm. Dann bearbeite die Aufgaben und schaue
dir die Musterlösung an. Wichtig: Es können auch andere Wege richtig und gut
sein. Bei Fragen fragen, entweder uns oder das Internet.

# Aufgaben

Schreibe die im folgenden genannten Klassen, in eigenen Units jeweils mit:

- den benötigten Attributen (`private`)
- Getter- und Setter-Methoden (`private`) und propertys(`public`), die dafür
  sorgen, dass die Attribute keine unerlaubten Werte annehmen können (solange
  bei der Aufgabe nichts anderes genannt wird, soll eine Exception geworfen
  werden)
- einer `ToString`-Methode
- einem passenden Konstruktor
- wenn nötig auch einem passenden Destruktor

Schreibe jeweils eine Testfunktion, in der Du alle Eigenschaften der Klasse
austesten.

## Nr 1

Schreibe eine Klasse `TPunkt` für einen Vektor im $\mathbb{R} ^ {2}$.

## Nr 2

Schreibe eine Klasse `TKomplex` für eine komplexe Zahl.

## Nr 3

Schreibe eine Klasse `TGeradeZahl`. Die Klasse hat ein einziges Attribut, das
eine gerade Zahl sein muss. Wird versucht, eine ungerade Zahl zu setzen, wird
statt dessen die nächstniedrigere gerade Zahl genommen.

## Nr 4

Schreibe eine Klasse `TNote` für eine Notenverwaltung. Gültige Noten sind
an der Hochschule:

- 1,0
- 1,3
- 1,7
- 2,0
- 2,3
- 2,7
- 3,0
- 3,3
- 3,7
- 4,0
- 5,0

## Nr 5

Schreibe eine Klasse `TGeburtstag`, die den Tag und den Monat eines
Geburtstags enthält. Die Anzahl der Tage der einzelnen Monate ist:

|Monat|Tage|
|-|-|
|Januar|31|
|Februar|29|
|März|31|
|April|30|
|Mai|31|
|Juni|30|
|Juli|31|
|August|31|
|September|30|
|Oktober|31|
|November|30|
|Dezember|31|

## Nr 6

Schreibe eine Klasse `TDominostein`, die einen Dominostein repräsentiert. Beide
Seiten des Dominostein können die Zahlen 0-6 enthalten.

# Rückblick

[Zurück zur Übersicht](../Index.html)

---
title: 08 - Blatt 8
---

# Einleitung

Hier wird das achte Blatt der Java-Übungsaufgaben bearbeitet. Es geht hier um
die Nutzung von Arrays.

# Vorbereitung

Erstelle dir ein neues Konsolenprogramm. Dann bearbeite die Aufgaben und schaue
dir die Musterlösung an. Wichtig: Es können auch andere Wege richtig und gut
sein. Bei Fragen fragen, entweder uns oder das Internet.

# Theorie

## Arrays

### Größe bekannt

Arrays kennst du schon aus Java. Diese existieren so auch in Delphi. Wir
beginnen mit einer Einfachen Deklaration eines Arrays mit 10 Gästen:

``` Java
  String[] gaeste = new String[10];
```

oder in Delpi:

``` Pascal
var
  HGäste : Array [0..9] of String;
```

Dabei lässt sich die Struktur der Array-Deklaration erkennen

``` Pascal
<varname> : array [<startindex>..<endindex>] of Datentyp;
```

Dabei geben `<startindex>..<endindex>` den Indexbereich und somit die Größe des
Arrays an, wobei die Grenzen inklusiv sind. Das bedeutet, im Unterschied zu Java
wo ein Array immer bei `0` beginnt, ist es z.B. möglich den Bereich `-3..5`
anzugeben, welcher nun bei `-3` startet und bei `5` endet.

Der zugriff auf eine Position im Array ist dabei aber genau wie in Java über
folgende Syntax `<varname>[<index>]`. Daher kann einfach mit `for` - Schleifen
über das Array iteriert werden.

### Größe unbekannt

Wenn nun die Größe des Arrays zur Kompilezeit unbekannt ist, kann natürlich
nicht die obere Variante verwended werden, da keine werte Eingetragen werden
können. Das wäre der Fall, wenn wir nicht immer wissen, das `10` Gäste in dem
Array stehen sollen. Bei der Deklaration werden dann einfach die Grenzen
weggelassen:

``` Pascal
var
  HGäste : Array of String;
```

Hierbei handelt es sich um ein dynamisches Array, welches zu Beginn keine
Elemente beinhaltet. Um die Länge des Arrays nun zu ändern muss die Methode
`SetLength` verwendet werden:

``` Pascal
SetLength(HGäste, 10);
```

Dieses Array hat nun Platz für die Namen von `10` Gästen. Dabei beginnt der
Index immer bei `0` und geht bis zum Index `Länge - 1` (am Beispiel: `10-1=9`).
Um den Speicher der für dieses dynamische Array blockiert wurde wieder
freizugeben, damit keine MemoryLeaks entstehen, muss am Ende immer

``` Pascal
SetLength(HGäste, 0);
```

aufgerufen werden.

### High, Low, Length

Um nun in diesem Chaos an Index-Start, Index-Ende und Array-Länge
durchzublicken, haben die netten Entwickler von Delphi die Funktionen `High`,
`Low` und `Length` erfunden.

Diese geben den entsprechenden Wert zurück:

``` Pascal
var
  HTestEins : Array[-3..5] of String; // statisches Array
  HTestZwei : Array of String;        // dynaisches Array
begin
  SetLength(HTestZwei, 10); // Erstelle ein Array mit Platz für 10 Einträgen

  Low(HTestEins);    // -3
  Length(HTestEins); //  9
  High(HTestEins);   //  5

  Low(HTestZwei);    //  0
  Length(HTestZwei); // 10
  High(HTestZwei);   //  9

  SetLength(HTestZwei, 0); // Gib das dynamische Array frei
end;
```

### Mehrdimensionale Arrays

Mehrdimensionale Arrays lassen sich in Delphi mit folgender Syntax erstellen:

``` Pascal
var
  <name>: array of array [of array...] of <Datentyp>;
```

am Besipiel mit festen Indexbereichen, läst sich diese Syntax vereinfachen, und
weicht von der Java-Syntax ab:

``` Pascal
var
  a1: array[1..10, 0..5] of Byte;          // zweidimensional, 10 "Zeilen" á 6 "Spalten"
  a2: array[1..10, 1..10, 1..10] of Byte;  // dreidimensional, 10 Zeilen á 10 Spalten á 10 Felder in die Tiefe
```

Der Zugriff auf die einzelnen Elemente kann nun mithilfe der `[]` gemacht
werden. Zum einen geht das über die dir bereits bekannte Syntax
`<name>[<index>][<index>]`, aber der Delphi-Style, der dir daher auch häufiger
über den Weg laufen wird ist: `<name>[<index>, <index>]`.

``` Pascal
a1[1, 0] := 15;
// ist das selbe wie
a1[1][0] := 15;
```

Die einzelnen Unterbereiche des Mehrdimensionalen Array können dabei sowohl
dynamisch als auch statisch sein.

### Bennenung von Arrays

In Delphi ist es guter Stil (und ab und zu zwingend notwendig) für die
benötigten Arrays Typen anzulegen. Dazu wird im Abschnitt `type` eine Alias
hinzugefügt und dieser dann im Programm verwended. Das sieht dann folgendermaßen
aus:

Statt

``` Pascal
procedure One;
var
  HGäste   : Array of String;
  HFeieren : Array of Array of String;
begin
  // ...
end;
```

würde man eher schreiben:

``` Pascal
type
  TGästeListe = Array of String;
  TFeierListe = Array of TGästeListe;

procedure One;
var
  HGäste   : TGästeListe;
  HFeieren : TFeierListe;
begin
  // ...
end;
```

Das ist vorallendingen bei Parametern und Rückgabetypen sehr wichtig.

### Initialisierung von Arrays

Manchmal ist es nützlich Arrays im `const`-Abschnitt zu haben. Daher muss es
auch möglich sein Arrays in einer Zeile zu initialisieren.

#### Statische Arrays

``` Pascal
const
  HArray : Array [0..1] of String = ('0','1');
```

#### Dynamische Arrays

``` Pascal
const
  HArray : Array of String = ['0','1'];
```

# Aufgaben

## Nr 1

Definiere Folgende Array-Typen um sie Anschließend nutzen zu können.

1. `TExtendedArray` als `Extended`-Array
2. `TIntegerArray` als `Integer`-Array
3. `TTwoDimesionalExtendedArray` als `TExtendedArray`-Array
4. `TTwoDimesionalIntegerArray` als `TIntegerArray`-Array
5. `TMonthArray` als `String`-Array mit Startindex `1` und End-Index `12`

## Nr 2

Erzeuge ein eindimensionales Integer-Feld mit den Werten `6`,`9`,`2`,`1` und
`3`. Verwende 2 Methoden:

1. Belegen der Elemente gleich bei der Deklaration und Initialisierung eines
   `const`-Arrays.
2. Belegen der Elemente nach der Initialisierung eines `var`-Arrays.

## Nr 3

Erzeuge ein 10 Element großes `Extended`-Feld. Setze die Feldelemente auf
$\sqrt{i}$ für $i = 0, ... , 9$

## Nr 4

Erzeuge ein 10 × 10 großes `Integer`-Feld. Setze das Element $(4,5)$ auf den
Wert $7$.

## Nr 5

Gegeben ist ein parameter vom Typ  `TTwoDimesionalExtendedArray`. Stelle fest,
ob das Feld groß genug ist, sodass das Element $(5,5)$ existiert.

## Nr 6

Schreib eine Funktion

``` Pascal
function GetExtendedArray(_SizeX : Integer; _SizeY : Integer) : TTwoDimesionalExtendedArray;
```

die ein `Extended`-Feld der Dimension $x×y$ zurückgibt. Vergiss bei einem Aufruf
nicht das Feld wieder freizugeben.

## Nr 7

Schreib zwei Funktionen

``` Pascal
function GetMinimum(_Array : TExtendedArray) : Extended;
function GetMinimumIndex(_Array : TExtendedArray) : Integer;
```

die das Minimum bzw. den Index des Minimums von `_Array` zurückgeben.

## Nr 8

Schreibe eine Funktion

``` Pascal
function IsSquare(_Array : TTwoDimesionalIntegerArray) : Boolean;
```

die feststellt, ob `_Array` quadratisch ist.

## Nr 9

Schreibe eine Funktion

``` Pascal
function GetNameOfMonth(_Nr : Integer) : String;
```

Die Funktion erhält eine Zahl zwischen `1` und `12` und gibt die entsprechenden
Monatsnamen "Januar" bis "Dezember" zurück. Vereinfache deine Lösung aus
[Aufgabe 4.10](./../04 - Blatt 3/Aufgabe.html#nr-10), indem Du ein `TMonthArray`
statt eines `if`- oder `switch`-Konstrukts verwendest.

## Nr 10

Schreibe eine Funktion

``` Pascal
function Concat(_ArrayOne : TIntegerArray; _ArrayTwo : TIntegerArray) : TIntegerArray;
```

die die beiden `Integer`-Arrays aneinanderhängt. Das Resultat wird
zurückgegeben.

## Nr 11

Schreibe eine Funktion

``` Pascal
function GetIndexSumArray(_A : Integer; _B : Integer) : TTwoDimesionalIntegerArray;
```

Diese Funktion gibt ein `Integer`-Feld der Größe $\_A × \_B$ zurück, deren
Elemente nach dem folgenden Schema gebildet werden:

$$
a_{ij} = i + j + 1
$$

## Nr 12

Berechne die Spur der Matrix aus Aufgabe [8.10](./Aufgabe.html#nr-11) nach der
Formel

$$
spur(A)=\sum_{i=1}^{n} a_{ii}
$$

(es werden also alle Elemente auf der Diagonalen von links oben nach rechts
  unten addiert)

Schreibe dazu eine Funktion

```
function GetTrace(_Matrix : TTwoDimesionalIntegerArray) : Integer;
```

# Rückblick

[Zurück zur Übersicht](../Index.html)

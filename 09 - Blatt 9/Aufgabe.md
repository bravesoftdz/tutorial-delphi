---
title: 09 - Blatt 9
---

# Einleitung

Hier wird das neunte Blatt der Java-Übungsaufgaben bearbeitet. Es geht hier um
das arbeiten mit Strings.

# Vorbereitung

Erstelle dir ein neues Konsolenprogramm. Dann bearbeite die Aufgaben und schaue
dir die Musterlösung an. Wichtig: Es können auch andere Wege richtig und gut
sein. Bei Fragen fragen, entweder uns oder das Internet. In den gegebenen
Aufgaben sind Funktionalitäten gefordert die so eventuell schon existieren.
Diese sollen nicht verwendet werden.

# Aufgaben

## Nr 1

Der String `CString` habe den Wert `abcde`. Weise der `Char`-Variablen `HChar`
mit `[]`(dem Array Operator) das 2. Zeichen des Strings zu. Gib `HChar` aus.

## Nr 2

Teste, ob das erste und letzte Zeichen eines Strings `_String` identisch sind.

## Nr 3

Schreibe eine Funktion

``` Pascal
function GetCharCount(_String : String; _Char : Char) : Integer;
```

die zählt, wie häufig das Zeichen `_Char` im String `_String` vorkommt und das
Ergebnis zurückgibt.

## Nr 4

Schreibe eine Funktion

``` Pascal
function GetCapitalString : String;
```

die einen String von der Konsole einliest, die Zeichen in Großbuchstaben
wandelt und das Ergebnis zurückgibt.

Hinweis: Buchstaben sind A-Z und a-z. Umlaute müssen nicht beachtet werden.

## Nr 5

Schreibe ein Programm, das eine ASCII-Tabelle von ASCII-Wert 0 bis 127 auf
dem Bildschirm ausgibt.

## Nr 6

Schreibe eine Funktion

``` Pascal
function Reverse(_String : String) : String;
```

die eine Zeichenreihe umdreht. Beispiel:

Aus `Donaudampfschiffahrtsgesellschaftskapitän` soll
`nätipakstfahcsllesegstrhaffihcsfpmaduanoD` werden.

## Nr 7

Schreibe eine Funktion

``` Pascal
function ClozeText(_String : String) : String;
```

die aus einem beliebigen String `_String` einen Lückentext macht, indem sie
jedes 4. Zeichen durch ein Leerzeichen ersetzt.

## Nr 8

Schreibe eine Funktion

```
type
  TIntArr = Array of Integer;

function GetParameters : TIntArr;
```

Die Funktion soll den Benutzer nach einer Parameterzeile fragen. In der
Parameterzeile kann der Benutzer beliebig viele, durch ein Komma getrennte
Integer-Werte eingeben. Diese Zeile soll das Programm in ein Integer-Feld
verwandeln und das Ergebnis zurückgeben. Zur Verabeitung kann die Methode
`String.Split` verwendet werden.

## Nr 9

Schreibe eine Funktion

``` Pascal
function NewGermanOrthography(_String : String) : String;
```

Die Funktion verwandelt alle `sch` eines eingegebenen Textes in `sh`. `Neue
deutsche Rechtschreibung` wird also zu `Neue deutshe Rechtshreibung`. Beachte
auch die Sonderfälle in denen ein Wort mit `sch` anfängt oder mit `sch`
aufhört. Großschreibung und Kleinschreibung soll auch berücksichtigt werden.

## Nr 10

Schreib eine Funktion

``` Pascal
function GetDigitCount(_Number : Integer) : TIntArr;
```

Die Methode gibt ein Feld mit 10 Elementen zurück, in dem die Häufigkeit
jeder Ziffer von `_Number` eingetragen ist. Die Funktion soll auch mit negativen
Zahlen funktionieren. Das Minuszeichen wird nicht gezählt.

# Rückblick

[Zurück zur Übersicht](../Index.html)

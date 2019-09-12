---
title: 12 - Blatt 13
---

# Einleitung

Hier wird das dreizehnte Blatt der Java-Übungsaufgaben bearbeitet. Es wird die
Erweiterung von Klassen betrachtet.

# Vorbereitung

Erstelle dir ein neues Konsolenprogramm. Dann bearbeite die Aufgaben und schaue
dir die Musterlösung an. Wichtig: Es können auch andere Wege richtig und gut
sein. Bei Fragen fragen, entweder uns oder das Internet.

# Aufgaben

Beginne dein Programm auf der Grundlage der Klassen die in der
[Aufgabe 11 - Blatt 12](./../11 - Blatt 12/Aufgabe.html) entstanden sind.

## Nr 1

Füge den Klassen `TPunkt`, `TKomplex`, `TGeradeZahl`, `TNote`,
`TGeburtstag` und `TDominostein` einen Copy-Konstruktor (nenne diesen `CreateCopy`) hinzu.

## Nr 2

Füge der Klasse `TPunkt` folgende Methode hinzu:

``` Pascal
public
  procedure Schiebe(_DX : Extended; _DY : Extended);
```

verschiebt den Punkt um den Wert $\begin{pmatrix}\_DX \\ \_DY\end{pmatrix}$.

## Nr 3

Füge der Klasse `TKomplex` folgende Methoden hinzu:

``` Pascal
public
  // gibt den Betrag der Zahl zurück
  function GetBetrag : Extended;

  // konjugiert die Zahl
  procedure KonjugiertKomplex;

  // gibt ein neues Objekt zurück, welches den konjugiert komplexen Wert
  // von Self hat. Das Self-Objekt bleibt unverändert.
  function GetKonjugiertKomplex : TKomplex;

  procedure Add(_Other : TKomplex); // addiert den Wert _Other.
  procedure Mult(_Other : TKomplex); // multipliziert den Wert _Other.
```

## Nr 4

Füge der Klasse `TGeradeZahl` folgende Methoden hinzu:

``` Pascal
public
  // gibt die nächsthöhere gerade Zahl zurück
  function GetNachfolger : TGeradeZahl;

  // gibt die Summe von Self und _Other zurück
  function GetSum(_Other : TGeradeZahl) : TGeradeZahl;

  // gibt das Produkt von Self und _Other zurück
  function GetProd(_Other : TGeradeZahl) : TGeradeZahl;
```

## Nr 5

Füge der Klasse `TNote` folgende Methode hinzu:

``` Pascal
public
  // gibt true zurück, falls FGrade maximal 4,0 ist und ansonsten false.
  function HatBestanden : Boolean;
```

## Nr 6

Füge der Klasse `TGeburtstag` folgende Methode hinzu:

``` Pascal
public
  //  gibt true zurück, falls _Other ein Object der Klasse Geburtstag ist
  // (Hinweis: is) und die Geburtstage self und _Other übereinstimmen und
  // ansonsten false.
  function Equals(_Other : TObject): Boolean; Override;
```

## Nr 7

Füge Sie der Klasse `TDominostein` folgende Methoden hinzu:

``` Pascal
public
  // dreht den Dominostein um, vertauscht also beide Seiten
  procedure DreheUm;

  // gibt die Werte in einem int-Feld der Größe 2 zurück. TDominoArray muss
  // selbst definiert werden.
  function GetValues : TDominoArray;
```

# Rückblick

[Zurück zur Übersicht](../Index.html)

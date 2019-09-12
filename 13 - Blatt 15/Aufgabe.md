---
title: 13 - Blatt 14
---

# Einleitung

Hier wird das fünfzehnte Blatt der Java-Übungsaufgaben bearbeitet. Das letzte
mal Wiederholung, Wiederholung, Wiederholung.

# Vorbereitung

Erstelle dir ein neues Konsolenprogramm. Im Order `Start` findest du die Unit
`Punkt.pas` und `Dominostein.pas`. Diese musst du in dein Projekt einbinden, da
sie die Klassen `TPunkt` und `TDominostein` enthalten. Dann bearbeite die
Aufgaben und schaue dir die Musterlösung an. Wichtig: Es können auch andere Wege
richtig und gut sein. Bei Fragen fragen, entweder uns oder das Internet..

# Aufgaben

Nutze für die Lösung die Klassen aus dem Start-Ordner.

## Nr 1

Implementiere die Klasse `TKreis` für einen Kreis nach dem folgenden
UML-Diagramm. Alle privaten Getter und Setter sollen über `property` sichtbar
gemacht werden. Auch darf der Destuktor nicht vergessen werden.

![](kreis_uml.jpg "Das UML Diagramm"){ style="display:block; margin-left:auto;
margin-right:auto; width:100%" }

Beachte beim Copy-Konstruktor, dass das Attribut `FMittelpunkt` eine Referenz
auf ein Objekt der Klasse `TPunkt` ist. Die Methode `GetAbstand` berechnet den
kürzesten Abstand des Punktes `_Punkt` zum Rand des Kreises.

## Nr 2

Schreibe eine Klasse `TDominokette`, die eine Kette von Dominosteinen
repräsentiert (siehe Bild).

![](dominokette.jpg "Ein Beispiel für eine Dominokette"){ style="display:block;
margin-left:auto; margin-right:auto; width:100%" }

Es ist möglich, an beide Enden der Kette weitere Steine anzufügen, wenn die
Symbole passen (siehe Abbildung). Implementiere folgende Konstruktoren und Methoden:

- Einen Konstruktor, der den ersten Dominostein als Übergabeparameter erhält
- Einen Destruktor, der die Dominosteine freigibt
- Eine `ToString`-Methode (Ausgabeformat: `[4,2][2,5][5,0][0,6][6,3][3,3]`)

und

``` Pascal
procedure FuegeRechtsAn(_Dominostein : TDominostein);
```

die den Dominostein am rechten Ende anfügt. Gegebenenfalls muss der Stein vorher
herumgedreht werden. Die Methode löst eine Exception aus, falls der Stein nicht
angelegt werden kann. Die Methode

``` Pascal
procedure FuegeLinksAn(_Dominostein : TDominostein);
```

muss analog für die linke Seite implementiert werden.

# Rückblick

[Zurück zur Übersicht](../Index.html)

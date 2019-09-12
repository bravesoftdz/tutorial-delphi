---
title: 07 - Blatt 7
---

# Einleitung

Hier wird das siebte Blatt der Java-Übungsaufgaben bearbeitet. Es geht hier um
den Umgang mit Objekten.

# Vorbereitung

Erstelle dir ein neues Konsolenprogramm. Im Order `Start` findest du die Unit
`Klassen.pas`. Diese musst du in dein Projekt einbinden, da diese die Klassen
`TBruch` und `TPoint` enthält. Dann bearbeite die Aufgaben und schaue dir die
Musterlösung an. Wichtig: Es können auch andere Wege richtig und gut sein. Bei
Fragen fragen, entweder uns oder das Internet.

# Aufgaben

## Nr 1

1. Erzeuge ein `TBruch`-Objekt mit dem Wert $\frac{1}{5}$ und gib ihm den Namen
   `HBruch`.
2. Gib dem Objekt `HBruch` einen zweiten Alias-Namen `HAlias`.
3. Erzeugen Sie einen Klon von `HBruch` und geben Sie ihm den Namen `HKlon`.
4. Invertiere `HBruch`. Was steht jetzt in `HBruch`, `HAlias` und `HKlon`.
5. Gib die Objekte auch wieder frei (Hinweis: `FreeAndNil`).

## Nr 2

1. Schreib ein Programm, dass Zähler und Nenner eines Bruchs von der Tastatur
   einliest und daraus ein `TBruch`-Objekt erzeugt.
2. Erzeuge ein zweites `TBruch`-Objekt, dass genau $\frac{1}{10}$ größer als das
   erste Objekt ist. Gib deine Resultate auf dem Bildschirm aus.

Hinweis: Auf MemoryLeaks achten.

## Nr 3

Erzeuge ein `TBruch`-Objekt mit dem Wert $\frac{1}{3}$. Erzeugen Sie einen Alias
und einen Klon dieses Objektes. Vergleiche die Objekte untereinander mit `=` und
`equals`. Welche Ergebnisse erhältst Du?

## Nr 4

Schreib ein Programm, dass zwei Objekte der Klasse `TPoint` erzeugt, testet und
freigibt.

1. Lies die Koordinaten zweier Punkte von der Tastatur ein und erzeuge daraus
   zwei `TPoint`-Objekte.
2. Verschiebe beide Objekte um $\begin{pmatrix}10 \\ 10\end{pmatrix}$ und gib
   die neuen Koordinaten aus.
3. Gib die Distanz zwischen beiden Punkten aus. (Methode `Distance`)

# Rückblick

[Zurück zur Übersicht](../Index.html)

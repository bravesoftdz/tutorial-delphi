---
title: 06 - Blatt 6
---

# Einleitung

Hier wird das sechste Blatt der Java-Übungsaufgaben bearbeitet. Wiederholung und
Festigung der zuvor behandelten Kenntnisse steht an.

# Vorbereitung

Erstelle dir ein neues Konsolenprogramm. Dann bearbeite die Aufgaben und schaue
dir die Musterlösung an. Wichtig: Es können auch andere Wege richtig und gut
sein. Bei Fragen fragen, entweder uns oder das Internet.

# Aufgaben

## Nr 1

Schreib eine Funktion

``` Pascal
function GCD(_A : Integer; _B : Integer) : Integer;
```

die den größten gemeinsamen Teiler zweier Zahlen `_A` und `_B` nach dem
Euklidischen Algorithmus berechnet und ihn zurückgibt. Der Euklidische
Algorithmus funktioniert wie folgt:

``` Pseudocode
solange b != 0
  wenn a > b
   dann a = a - b
   sonst b = b - a
```

Der größte gemeinsame Teiler steht nun in der Variablen `a`. Wirf eine
Exception, falls `_A` oder `_B` kleiner als $1$ sind. `GCD` steht übrigens für
`G`reatest `C`ommon `D`ivisor.

## Nr 2

Schreib ein Programm, das mit `for`-Anweisungen und `Write`- bzw.
`WriteLn`-Anweisungen das folgende Dreieck auf dem Bildschirm ausgibt. Geben Sie
die benötigte Zeilenanzahl (hier fünf) durch eine Konstante vor:

$$
\begin{array}{l}
{1}
\\
{2} {2}
\\
{3} {3} {3}
\\
{4} {4} {4} {4}
\\
{5} {5} {5} {5} {5}
\end{array}
$$

Passe das Programm zur Ausgabe des Dreiecks so an, dass die Zahlen, wie unten
dargestellt, zentriert werden:

$$
\begin{array}{c}
{1}
\\
{2} {2}
\\
{3} {3} {3}
\\
{4} {4} {4} {4}
\\
{5} {5} {5} {5} {5}
\end{array}
$$

## Nr 3

Schreib eine Funktion

``` Pascal
procedure PrintCircle(_Radius : Integer);
```

die einen (angenäherten) Kreis mit dem übergebenen Radius, wie im Beispiel
gezeigt, ausgibt.

Beispiel: Kreis mit Radius 5. Bei höheren Radien ist die Annäherung an die
Kreisform deutlich besser.

``` Shell
   #####
  #     #
 #       #
#         #
#         #
#         #
#         #
#         #
 #       #
  #     #
   #####
```

Hinweis: Die `Round` Funktion von Delphi verwendet sogenanntes Kaufmännisches
Runden. Das führt hier nicht zum richtigen Ergebnis. Daher schreibst du dir am
besten deine eigene Funktion.

Hinweis: Gegeben sei ein Kreis mit Mittelpunkt $(m_x,m_y)$. Der Abstand eines
Punktes $(p_x, p_y)$, vom Mittelpunkt ist dann

$$
a = \sqrt{(m_x − p_x)^2 + (m_y − p_y)^2}
$$

Der Kreis kann durch die unterschiedliche Zeichenhöhe und -breite zu einer
Ellipse verzerrt sein.

# Rückblick

[Zurück zur Übersicht](../Index.html)

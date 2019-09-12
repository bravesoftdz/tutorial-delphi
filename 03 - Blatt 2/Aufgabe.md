---
title: 03 - Blatt 2
---

# Einleitung

Hier wird nun das zweite Blatt der Java-Übungsaufgaben bearbeitet. Hier werden
die Grundlagen von Funktionen und Variablen-Deklaration und deren Nutzung und
Ausgabe wiederholt.

# Vorbereitung

Erstelle dir ein neues Konsolenprogramm. Dann bearbeite die Aufgaben und schaue
dir die Musterlösung an. Wichtig: Es können auch andere Wege richtig und gut
sein. Bei Fragen fragen, entweder uns oder das Internet.

# Aufgaben

## Nr 1

Deklariere eine Integer Variable `HMenge`. Initialisiere sie dann mit `2`.

## Nr 2

Gib den Wert von $\frac{3}{17}$ auf dem Bildschirm aus.

## Nr 3

Weise der Variable `HBruch` den Wert $\frac{1}{7}$ zu und gib den Wert auf dem
Bildschirm aus.

## Nr 4

Weise der Variablen `HPi` den Wert von Pi zu (Konstante Pi). Dann gib den Satz
`Pi hat den Wert` gefolgt vom Wert von `HPi` aus.

## Nr 5

Berechne den Wert von $\sqrt{2}$.

1. Weise den Wert einer Double Variablen zu
2. Weise den Wert einer Integer Variablen zu

## Nr 6

1. Erstelle eine Extended-Variable mit dem Wert `4,3`
2. Speichere den Wert in einer neuen Int Variable
3. Wandle diesen Wert in eine neue Extendet Variable um.

An Welcher stelle muss eine Explizite Umwandlung passieren?

## Nr 7

Lies einen String von der Tastatur ein und weisen diesen einer Variablen
`HInput` zu.

## Nr 8

Lies einen Integer von der Tastatur ein und weisen diesen einer Variablen
`HInput` zu.

## Nr 9

Lies einen Extended von der Tastatur ein und weisen diesen einer Variablen
`HInput` zu.

## Nr 10

Vertausche den Wert von zwei Integer-Variablen `HOne` und `HTwo`. Hinweis: Du
brauchst eine Hilfsvariable.

## Nr 11

Lies einen Extended Wert von der Tastatur ein und gib folgende Zeile aus:

``` shell
Zahl: 5, Reziproke Zahl: 0.2
```

Wobei die Reziproke den Kehrwert beschreibt.

## Nr 12

Lies einen Extended Wert `HInput` ein und und gib dann folgendes aus:

1. Den Absolutwert von x
2. Den natürlichen Logarithmus von x
3. Den Sinus Hyperbolikus von x

## Nr 13

Schreib ein Funktion

``` Pascal
function ToFahrenheit(_Celsius : Extended) : Extended;
```

Diese Funktion berechnet den Fahrenheit Wert aus einem Celsius Wert und gibt das
Ergenbniss zurück. Es gilt:

$$
temp[°C] = ( temp[°F] - 32 ) \cdot \frac{5}{9}
$$

## Nr 14

Schreib eine Funktion

``` Pascal
function GetDistance(_X1 : Extended; _Y1 : Extended; _X2 : Extended; _Y2 : Extended) : Extended;
```

welche den Eukildischen-Abstand zweier Punkte
$P_{1} = (x_{1}, y_{1}), P_{2} = (x_{2}, y_{2})$ berechnet und zurückgibt.
Für diesen gilt:

$$
||\vec{P_{1}P_{2}}||=\sqrt{(x_{1}-x_{2})^2+(y_{1}-y_{2})^2}
$$

## Nr 15

Nutze die Funktion `Random` um eine Funktion

``` Pascal
function GetExtendedRandom(_Min : Extended; _Max : Extended) : Extended;
```

zu schreiben, welche eine Double Zahl zwischen `_Min`(einschließlich) und
`_Max`(ausschließlich) zurückgibt. Erstelle danach folgende Funktion

``` Pascal
function GetIntegerRandom(_Min : Integer; _Max : Integer) : Integer;
```

welche die selben Anforderungen für Integer-Werte erfüllt.

# Rückblick

[Zurück zur Übersicht](../Index.html)

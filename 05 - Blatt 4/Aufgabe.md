---
title: 05 - Blatt 4
---

# Einleitung

Hier wird das vierte Blatt der Java-Übungsaufgaben bearbeitet. Es geht hier um
das Steuern des Programmflusses mithilfe von Schleifen.

# Vorbereitung

Erstelle dir ein neues Konsolenprogramm. Dann bearbeite die Aufgaben und schaue
dir die Musterlösung an. Wichtig: Es können auch andere Wege richtig und gut
sein. Bei Fragen fragen, entweder uns oder das Internet.

# Aufgaben

## Nr 1

Schreibe eine for-Schleife, die die Zahlen 1 bis 10 auf dem Bildschirm ausgibt.

## Nr 2

Schreibe eine for-Schleife, die die Wurzel der Zahlen 2 bis 30 auf dem
Bildschirm ausgibt.

## Nr 3

Suche mit einer `while`-Schleife die kleinste positive Integer-Zahl n, deren
Quadrat größer als 12000 ist.

## Nr 4

Schreib eine Funktion

``` Pascal
function GetFactorial(_Number : Integer) : Integer;
```

die die Fakultät der Zahl `_Number` zurückgibt. Werfen Sie eine aussagekräftige
Exception, falls `_Number` kleiner als 1 ist.

Hinweis: $x!$($x$ Fakultät) ist $1\cdot2\cdot3\cdot...\cdot{x}$

## Nr 5

Die Wahrscheinlichkeit, dass zwei Menschen in einer Gruppe von $n$ Menschen am
gleichen Tag Geburtstag haben, beträgt

$$
p(n) = 1-\frac{365}{365} \cdot \frac{364}{365} \cdot \frac{363}{365}
\cdot \frac{362}{365} \cdot ... \cdot \frac{365 - n + 1}{365}
$$

Schreib eine Funktion
``` Pascal
function DoubleBirthday(_Size : Integer) : Extended;
```
die die Wahrscheinlichkeit zurückgibt, dass in einer Gruppe von `_Size` Personen
zwei Personen am gleichen Tag Geburtstag haben. Wirf eine Exception, falls
`_Size` kleiner als 1 ist.

## Nr 6

Schreib eine Funktion
``` Pascal
function GetPi(_Count : Integer) : Extended;
```
Die Funktion berechnet den Wert $\pi$ näherungsweise und benutzt dafür die
Reihenentwicklung:

$$
\pi = 4 \cdot ( 1 - \frac{1}{3} + \frac{1}{5} -
\frac{1}{7} + \frac{1}{9} - \frac{1}{11} + \frac{1}{13} - ...)
$$

Das Programm berücksichtig dabei nur die ersten `_Count` Reihenglieder. Wirf
eine Exception, falls `n` kleiner als 1 ist.

## Nr 7

Schreib eine Funktion

``` Pascal
function GetNextPartialSum(_V : Integer) : Integer;
```

Die Summe

$$
1 + 2 + 3 + 4 + . . . + n
$$

wird ab einem bestimmten Wert $n = n_0$ größer (oder gleich) werden als der
Übergabeparameter `v`. Geben Sie den Wert

$$
1 + 2 + 3 + 4 + . . . + n_0
$$

für diesen Wert zurück. Wirf eine Exception, falls `_V` kleiner als 1 ist.

## Nr 8

Schreib ein Programm mit der folgenden Funktionaltiät:
In einer Schleife kann der Anwender Zahlen eingeben. Wenn der Anwender die Zahl
0 eingibt, wird die Schleife abgebrochen und die Gesamtsumme, sowie der
Durchschnitt der bisher eingegebenen Zahlen auf dem Bildschirm ausgegeben.

## Nr 9

Schreib ein Programm, das einen ASCII-Code (eine Integer-Zahl zwischen 0 und
  127) einliest und das entsprechende ASCII-Zeichen auf dem Bildschirm ausgibt.
  Bei einer 0 soll das Programm stoppen.

## Nr 10

Die Fibonacci-Folge besteht aus einer Folge von Zahlen, in der jede Zahl die
Summe der beiden vorangehenden ist, z.B.:

$$
1, 1, 2, 3, 5, 8, 13, 21, 34, 55
$$

Schreib eine Funktion

``` Pascal
function GetFibonacciNumber(_N : Integer) : Integer;
```

die das `_N`-te Element der Fibonacci-Folge zurückgibt. Wirf eine Exception,
falls `_N` kleiner als 1 ist.

# Rückblick

[Zurück zur Übersicht](../Index.html)

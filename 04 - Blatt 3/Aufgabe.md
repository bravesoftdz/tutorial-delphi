---
title: 04 - Blatt 3
---

# Einleitung

Hier wird das dritte Blatt der Java-Übungsaufgaben bearbeitet. Es geht hier um
das Steuern des Programmflusses mithilfe von `if` und `switch`.

# Vorbereitung

Erstelle dir ein neues Konsolenprogramm. Dann bearbeite die Aufgaben und schaue
dir die Musterlösung an. Wichtig: Es können auch andere Wege richtig und gut
sein. Bei Fragen fragen, entweder uns oder das Internet.

# Aufgaben

## Nr 1

Gegeben ist eine Boolean-Variable `_Input`. Erstelle eine Boolean-Variable
`HInvert` welche die Negation von `_Input` enthält und gib dein Ergebniss aus.

## Nr 2

Schreibe eine `if` Anweisung die `Ja` in der Konsole ausgibt, falls die Integer
Variable `_Input` den Wert $5$ oder $37$ hat.

## Nr 3

Schreibe eine `if-else` Anweisung welche `_Input` in der Konsole ausgibt, falls
die Integer Variable `_Input` kleiner als $1$ sonst soll `_Input + 1` ausgegeben
werden.

## Nr 4

Es ist eine Integer `_Input` gegeben. Wenn nun `_Input`=$5$ ist dann soll eine
Boolean Variable mit `true` belegt werden, sonst mit `false`. Das soll einmal
mithilfe einer `if`-Anweisung geschehen und einmal ohne.

## Nr 5

Schreibe einen `case`-Block für eine Variable `_Input` welche die Werte $1$, $2$
und $3$ annehmen kann. In den einzelnen Verzweigungen soll nichts geschehen.

## Nr 6

Schreib die Funktion

``` Pascal
function GetTemperaturText(_Temp : Extended) : String;
```

Diese Funktion soll

1. `kalt` zurückgeben, wenn `_Temp`$\leq10$
2. `lauwarm` zurückgeben, wenn $10<$`_Temp`$\leq25$
3. `warm` zurückgeben, wenn $25<$`_Temp`$\leq40$
4. `heiß` zurückgeben, wenn $40<$`_Temp`

## Nr 7

Schreibe eine Funktion

``` Pascal
function GetWaitingTime(_Hours : Integer; _Min : Integer) : Integer;
```

Die eine Uhrzeit erhält und die Wartezeit zur nächsten vollen/halben Stunde
zurückgibt. Da heißt das keine Wartezeit $\leq30$ möglich ist.

## Nr 8

Schreibe eine Funktion

``` Pascal
function SolveLinearEquation(_A : Extended; _B : Extended) : Extended;
```

welche die Gleichung $a\cdot{x}+b=0$ löst und die Lösung für x zurückgibt. Wenn
unendlich viele oder keine Lösung möglich ist soll eine Exception geworfen
werden.

## Nr 9

Schreibe eine Funktion

``` Pascal
function GetPostage(_Cents : Integer) : Integer;
```

Die den Wert einer Bestellung in Cent erhält und Porto und Versandkosten für
diese zurückgibt, gemäß folgenden Bedingungen.

1. Ist die Bestellung weniger als 100€ Wert, dann beläuft sich der Betrag auf
   5,50€.
2. Ist die Bestellung zwischen 100€ bis 200€ Wert, dann beläuft sich der Betrag
   auf 3€.
3. Ab einem Wert von 200€ werden keine Versandkosten berechnet.

## Nr 10

Schreibe eine Funktion

``` Pascal
function GetNameOfMonth(_Nr : Integer) : String;
```

welche für die Zahlen zwischen 1 und 12 den entsprechenden Monatsnamen
zurückgibt. Wenn die Zahl nicht zwischen 1 und 12 liegt soll eine entsprechende Exception geworfen werden.

# Rückblick

[Zurück zur Übersicht](../Index.html)

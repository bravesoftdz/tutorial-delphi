---
title: 01 - Hello World
---

# Einleitung

Im folgenden wird die obligatorische `Hello World` Anwendung geschrieben. Dabei
lernst du die grundlegende Syntax für Methodenaufrufe.

# Vorbereitung

Du erstellst dir eine neue Konsolenanwendung, die `HelloWorld` heißen soll.

# Bearbeitung

## Schritt 1

Wir beginnen damit den automatisch generierten Code an unsere Bedürfnisse
anzupassen. Dafür löschen wir die Usesliste und den TryExcept-Block. Das machen
wir, da wir eine Anwendung schreiben, die keine weiteren Units benötigt außer
denen, die standartmäßig eingebunden werden und welche Code ausführt der keine
Exceptions werfen wird. Um zu verifizieren, dass du alles richtig gemacht hast,
kannst du Kompilieren (mit z.B.: `Strg` + `Shift` + `F10`). Hierbei dürfen keine
Fehler auftreten. Nachdem du Kompiliert hast, kannst du deinen Code auch
ausführen. Frage dich vorab was für ein Verhalten du erwarten würdest und
überprüfe deine Vermutung (mit z.B.: `F9` zum Ausführen mit und z.B.: `Strg` +
  `Shift` + `F9` ohne Debugger).

## Schritt 2

Wie du in Schritt 1 festgestellt haben solltest öffnet sich für sehr kurze Zeit
ein Konsolenfenster, welche sich sofort wieder schließt. Wir wollen nun Text auf
dieser Konsole ausgeben. Dafür existiert bereits eine Funktion die genutzt
werden kann. Diese heißt `Write` (endet nicht mit einer neuen Zeile) oder auch
`WriteLn` (fügt eine neue Zeile hinzu). Diese können wie folgt benutzt werden:

``` Pascal
Write('Text');
WriteLn('Text');
```

In den Klammern werden analog zu Java Parameter angegeben, Text bzw Strings
werden mit einfachen Anführungsstrichen gekennzeichnet (z.B.: `'Text'`). Füge
deinem Programm nun eine Zeile hinzu, die folgende Ausgabe erzeugt:
`Hello World`. Teste dein Programm erneut indem du es ausführst. Was für ein
Problem tritt auf und warum?

## Schritt 3

Du hast gemerkt, das das Konsolenfenster immernoch nur für kurze Zeit angezeigt,
sodass der Nutzer nicht sehen kann was nun in der Konsole steht. Das Problem
ist, das sobald das Programm mit der Bearbeitung der Ausgabe fertig ist, keine
weiteren Anweisungen folgen die abgearbeitet werden müssen. Hier kommt nun
`ReadLn` ins Spiel. Diese Funktion ermöglicht das Einlesen der nächsten Zeile
in der Konsole. Und das wichtige ist: solange keine neue Zeile hinzugefügt wird,
also nicht `<ENTER>` gedrückt wird, wartet diese Anweisung. Zusätzlich führen
wir hier einen Unterschied zu Java ein: in Delphi werden leere Klammerpaare `()`
grundsätlich weggelassen, also wenn eine Funktion keine Parameter benötigt.
Daher muss `ReadLn` wiefolgt benutzt werden:

``` Pascal
ReadLn;
```

Füge den Methodenaufruf sinnvoll hinzu, sodass der vorher ausgegebene Text nun
länger auf der Konsole bleibt. Teste deine Änderungen und wenn du alles richtig
gemacht hast, hast du es geschafft, dein `HelloWorld`-Programm ist fertig
geschrieben.

# Rückblick

Du solltest nun folgende Themen verstanden haben:

- Kompilieren und Ausführen von Programmen
- Benutzung von ReadLn und WriteLn

[Zurück zur Übersicht](../Index.html)

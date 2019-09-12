---
title: 15 - Taschenrechner
---

# Einleitung

Deine letzte Übungsaufgabe, dann kann es für dich auch schon richtig losgehen.

# Aufgaben

Für diese Aufgabe gibt es keine Musterlösung und auch keine genaue Erklärung der
Aufgaben. Ich erkläre dir lediglich was dein Programm am Ende können soll,
stelle also Anforderungen, die dein Programm erfüllen soll. Also viel Spaß beim
erarbeiten einer Lösung.

Ziel ist es einen Taschenrechner zu schreiben. Die Oberfläche soll
folgendermaßen aussehen:

![](target_taschenrechner.jpg "Die Oberfläche"){style="display:block;margin-left:auto; margin-right:auto; width:70%" }

Er soll alle mathematisch korrekten Kombinationen von Zahlen, Klammern, `+`,
`-`, `*` und `/` zulassen und berechnen können. Wenn die Syntax der Eingabe
falsch ist, soll eine entspechende Fehlermeldung hinter `Fehler` stehen und der
`Berechnen`-Button ausgegraut sein:

![](target_taschenrechner_fehler.jpg "Eine Korrekte Eingabe"){style="display:block;margin-left:auto; margin-right:auto; width:70%" }

Wenn kein Syntaxfehler auftritt, dann soll der Button klickbar sein:

![](target_taschenrechner_ok.jpg "Die Oberfläche bei korrekter Eingabe"){style="display:block;margin-left:auto; margin-right:auto; width:70%" }

Wenn er nun geklickt wird, gibt es zwei Möglichkeiten.

- Die Eingabe ist mathematisch korrekt und das Ergebnis soll in dem Textfenster
 angezeigt werden:

![](target_taschenrechner_result.jpg "Die Ergebniss-Anzeige"){style="display:block;margin-left:auto; margin-right:auto; width:70%" }

- Die Eingabe ist mathematisch nicht korrekt, der Fehler wird in einem neuen
  Fenster angezeigt:

![](target_taschenrechner_fehler_math.jpg "Die Fehler-Anzeige"){style="display:block;margin-left:auto; margin-right:auto; width:70%" }

Während der Berechnung soll die Eingabe und der Button disabled sein und der
Curser ein Wartekringel sein. Die Oberfläche soll aber trotzdem noch reagiren
können.

![](target_taschenrechner_wait.jpg "Der rechnende Prozess"){style="display:block;margin-left:auto; margin-right:auto; width:70%" }

Bei Fragen gerne Fragen.

# Rückblick

[Zurück zur Übersicht](../Index.html)

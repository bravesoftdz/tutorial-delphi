---
title: 00 - Einführung
---

# Entwicklungsumgebung

Als Entwicklungsumgebung wird die Delphi IDE RAD Studio von Embarcadero
verwendet. Die Eingewöhnung in die Umgebung kann zu Beginn schwer fallen, wird
aber mit jedem Projekt besser. Im ersten Schritt ist es wichtig das du lernst
wie du eine neues Projekt erstellst.

# Allgemein

Wie die Überschrift andeutet, stehen nachfolgend ein paar Informationen die
sonst keinen Platz gefunden haben:

- Delphisyntax ist nicht Case-Sensitive, das heißt: `VariablenName =
  variablenName = VARIABLENNAME = variablenname` (DelphiCase, Camelcase,
  UpperCase, LowerCase)
- Delphi basiert auf Pascal

# Bearbeitung

## Das erste Projekt

Um ein eigenes Projekt zu erstellen wird zunächst der Dialog `Datei->Neu->
Weitere..` ausgewählt, woraufhin sich ein Fenster öffnet in welchem man aus
vordefinierten Anwendungsscenarien wählen kann. Im folgenden wählst du unter dem
Punkt `Delphi-Projekte` eine Konsolenanwendung aus. Wenn du das gemacht hast,
siehst du eine automatisch generierte Datei, die im folgenden näher betrachtet
wird. Doch zuerst speichert du das Projekt mit `Strg` + `S` unter dem Namen
`Introduction`.

Die Datei `Introduction.dpr` sollte nun so aussehen:

``` Pascal
program Introduction;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

begin
  try
    { TODO -oUser -cConsole Main : Code hier einfügen }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end
```

## Programm

``` Pascal
program FirstProject;
```

In dieser Zeile wird dem Compiler zweierlei mitgeteilt:

- Die Datei in der du dich befindest, ist der Einstieg des Programms. Hier
startet das Programm (`program`).
- Der Name der Datei und des Projekts ist `Introduction`. Das heißt dieser Name
darf beliebig gewählt werden, muss aber dann entsprechend als Dateiname oder in
der Datei festgehalten werden.
- Es darf pro Projekt nur eine Datei existieren die mit `program` beginnt.

## Kompilerschalter

``` Pascal
{$APPTYPE CONSOLE}

{$R *.res}
```

Bei diesen beiden Zeilen handelt es sich um Kompilerschalter. Das bedeutet, das
diese Informationen nicht im kompilierten Programm selbst zu finden sind,
sondern wie der Name nahelegt, zusätzliche Informationen an den Kompiler weiter
gibt. Im folgenden wird die Variable `APPTYPE` (gekenzeichnet durch ein `$`) mit
dem Wert `CONSOLE` belegt. Diese Informationen können genutzt werden um das
Programm zur Kompilezeit anzupassen. Grunsätzlich gibt es diese Konzept in Java
nicht.

## Die Usesliste

``` Pascal
uses
  System.SysUtils;
```

Bei den dem Stichwort `uses` handelt es sich um das Äquivalent zu `import` in
Java. Hier müssen alle benötigten Klassen und Funktionen angegeben werden,
genauer die Units in denen diese zu finden sind. Was genau Units sind wird zu
einem späteren Zeitpunkt geklärt. Die Liste kann hierbei wiefolgt erweitert
werden:

``` Pascal
uses
  System.SysUtils,
  System.Classes;
```

Neue benötigte Units werden also der Liste angehängt, bzw sollte noch keine
bestehen muss eine neue hinzugefügt werden. Wenn keine Units benötigt werden,
wird dieses Token weggelassen.

## Der Programmeinstieg

In Java hast du bereits gelernt, das eine main-Methode existiert, welchen den
Einstiegspunkt in ein Programm kennzeichenet. Nun wirst du auf einen großen Teil
der Delphiprogrammierung stoßen der in Java nicht vorhanden ist, die sogennante
Prozedurale Programmierung. Wenn du dich erinnerst, gab es in Java die
Objektorienterte Programmierung, die verlangt, das jede Methode an eine Klasse
gebunden ist. Das ist hier nicht der Fall, es können auch Funktinen ohne eine
dazugehörige Klasse implementiert werden. Das sieht man auch am
Programmeinstieg:

``` Pascal
begin
  try
    { TODO -oUser -cConsole Main : Code hier einfügen }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end
```

Da es sich um den Programmeinstieg handelt ist dieser noch etwas anders als eine
Methode aber sehr ähnlich. `begin`/`end` entspricht `{`/`}` in Java, und
Kennzeichnet allgemein Bereiche. In diesem Fall ist das der Bereich in dem die
Methoden stehen die zu Beginn des Programms ausgeführt werden, also im weitesten
Sinne die `main`-Methode in Java.

## Try-Except und Try-Finally

### Try-Except

``` Pascal
try
  { TODO : Codeschnipsel 1 }
except
  on E: Exception do
    { TODO : Codeschnipsel 2 }
end;
```

`try ... except ...` entspricht `try ... catch ...` in Java. Code der hier an
der Position `Codeschnipsel 1` ist wird ausgeführt. Sollte während des
Ausführens eine Exception geworfen werden und ein passende Fehlerbehandlung
existieren, so wird der Code an der Position `Codeschnipsel 2` ausgeführt.

### Try-Finally

``` Pascal
try
  { Codeschnipsel 1 }
finally
  { Codeschnipsel 2 }
end;
```

`try ... finally ...` entspricht `try ... finally ...` in Java. Code der hier an
der Position `Codeschnipsel 1` ist wird ausgeführt. Egal ob nun eine Exception
geworfen wird oder nicht, der Code an Position `Codeschnipsel 2` wird immer
danach ausgeführt.

### Vergleich

Das in Java vorhandene Konstrukt

``` Java
try {
  // Code bei dem Fehler entstehen können
} catch(Exception e) {
  // Code welcher der Fehlerbehandlung dient
} finally {
  // Code der auf jeden fall ausgeführt werden soll.
}
```

existiert in Delphi so nicht, wird aber von folgender Struktur abgelöst

``` Pascal
try
  try
    { Code bei dem Fehler entstehen können }
  catch
    { Code welcher der Fehlerbehandlung dient }
  end;
finally
  { Code der auf jeden Fall ausgeführt werden soll. }
end;
```

## Kommentare

In den obigen Beispielen sind die Kommentare ähnlich wie Kompilerschalter durch
`{ Kommentar }` gekennzeichnet. Das ist grundsätzlich möglich allerdings wird ab
jetzt die aus Java bekannte Struktur `// Kommentar` verwendet.

# Rückblick

Du solltest nun folgende Themen verstanden haben:

- Wie du eine Konsolenanwendung in der IDE erstellst
- Du solltest folgende Namen gehört haben und verstehen was sich dahinter
  verbirgt
  - Kompilerschalter
  - Usesliste
  - `try ... except ...` und `try ... finally ...`
- Wie der Programmeinstieg aussieht und wie er grob funktioniert

[Zurück zur Übersicht](../Index.html)

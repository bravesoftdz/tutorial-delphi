---
title: 14 - GUI
---

# Einleitung

Im folgenden wird ein kleiner Einstig in die Gui-Programmierung in Delphi
gegeben und wir schauen uns an wie Du in Delphi kommentieren kannst. Daher
leider wieder eher mehr Theorie als Praxis.

# Vorbereitung

Erstelle dir kein neues Konsolenprogramm ;) Du beginnst damit, dir ein neues
VLC-Formularanwendung zu erstellen. Das automatisch erzeugte Programm speicherst
du als erstes an einem Ort deiner Wahl. Dann bearbeite die Aufgaben und schaue
dir die Musterlösung an. Wichtig: Es können auch andere Wege richtig und gut
sein. Bei Fragen fragen, entweder uns oder das Internet.

# Theorie

Wie du in der `.dpr` Datei siehst, wurde automatisch Code hinzugefügt, welcher
es erlaubt das Programm auszuführen. Das kannst du direkt einmal machen und
dann siehst du wie sich ein Fenster öffnet.

## Funktions- und Methodenzeiger

In Delphi ist es möglich verweise auf Funktionen zu nutzen, ähnlich wie
`FunctionalInterfaces` in Java, um Funktionen aufzurufen, welche der Nutzer
selbst bestimmen kann.

``` Java
@FunctionalInterface
interface StringMethode {
  void doStuffWithString(String s);
}

private void execute(StringMethode methode) {
  	methode.doStuffWithString("Test");
}

static void main(String[] args) {
  execute((s) -> System.out.println(s)); // -> Führt zur Ausgabe Test
  execute((s) -> System.out.println(s.replace("T", "F"))); // -> Führt zur Ausgabe Fest
}
```

in Delphi würde das folgendermaßen umgesetzt werden:

``` Pascal
type
  TStringMethode = procedure(_String : String);

procedure Execute(_Func : TStringMethode);
begin
  _Func('Test');
end;

procedure One(_String : String);
begin
  WriteLn(_String);
end;

procedure Two(_String : String);
begin
  WriteLn(_String.Replace('T','F'));
end;

begin
  Execute(One);
  Execute(Two);
end;
```

Der interessante Teil ist hier `TStringMethode = procedure(_String : String);`
In dieser Zeile wird ein Typ deklariert, welcher einen Zeiger auf eine
`procedure` mit einem `String`-Parameter ist. Dabei handelt es sich um einen
Funktionszeiger.

Wenn es sich nun um eine Funktion/Methode eines Objektes handelt, müsste die
deklaration folgendermaßen abgeändert werden:
`TStringMethode = procedure(_String : String) of object;`. Dann handelt es sich
um einen Methodenzeiger.

## GUI

Die Gui in delphi ist hauptsächlich durch Formularklassen geregelt. Diese können
mit dem Formulareditor (Shortcut `F12`) per Drag and Drop bearbeitet werden. Um
eine Formularklasse zu erstellen fügst du, ähnlich wie eine Unit, eine neue
VCL-Formularklasse hinzu. Hier Können nun per Drag and Drop die gewünschten
Komponenten abgelegt werden. Diese Findest du unten rechts in der Tool-Palette.
Die Funktionalität von diesen kannst du dann mithilfe des Objektinspektors unten
links anpassen. Hier findest du unter Eigenschaften alle Attribute die du
verändern kannst. Unter dem Reiter Ereignisse siehst du alle Actionen die mit
dieser Komponente ausgeführt werden können. Dahinter kannst du eventuell
benötigte Callback funktionen haben, zum Beispiel bei einem Klick aif einen
Button, welche dann aufgerufen werden sollen. Unter dem Reiter Struktur siehst
du die Hierarchie der Komponenten. Denk daran deinen Komponenten sinnvolle Namen
zu geben.

Um nun ein Layout zusammen zu stellen, nutzt du am besten die Eigenschaft
`Align` der Komponenten und die Mecanic der `TPanel`s auf `TPanel`s.

## Threads

Ein Thread bietet die Möglichkeit bestimmten Code 'gleichzeitig' auszuführen:

![](./normal_and_thread.jpg "Vergleich Nebenläufigkeit und Sequenziell"){
style="display:block;margin-left:auto; margin-right:auto; width:100%" }

Das ist natürlich nur möglich, wenn die Aufgben 1,2 und 3 zumindest ansatzweise
nicht voneindander Abhängen. Problematisch wird es wenn nun Threads untereinnder
Kommunizieren müssen und evtl. die selben Resourcen Teilen. im Kurzdurchlauf
heißt das:

- Kommunikation muss synchron ablaufen. Das geschieht mit dem Schlüsselwort
  `syncronized(MetodenName)` welches die Methode `MethodenName` synchron
  auszuführen, also so als würde nur ein Thread existieren. Ein Beispiel:

``` Pascal

```

- Wenn nun aus zwei Threads schreibend auf die selbe Variable zugrgriffen wird
  können sogennante RaceConditions auftreten. Kurz, das Objekt macht nicht mehr
  das was es soll. Daher gibt es Critical Sections welche in der Lage sind zu
  warten bis eine bestimmte Variable wieder frei gegeben wird. Ein Beispiel:

``` Pascal
interface

procedure Add;
procedure Subtract;

implementation

var
  HNum             : Integer;

procedure Add;
begin
  Inc(HNum);
end;

procedure Subtract;
begin
  Dec(HNum);
end;
end.
```

Wenn hier nun in Thread 1 die Methode `Add` 10000 mal aufgerufen wird, und in
Thread 3 die Methode `Subtract` 10000 mal aufgerufen wird, sollte in `HNum` 0
stehen. In wirklichkeit kann aber jeder wert zwischen -10000 und 10000 in `HNum`
sein. Daher muss der Code folgendermaßen abgeändert werden:

``` Pascal
interface

procedure Add;
procedure Subtract;

implementation

uses
  Windows;

var
  HNum             : Integer;
  HCriticalSection : TRTLCriticalSection;

procedure Add;
begin
  EnterCriticalSection(HCriticalSection);
  try
    Inc(HNum);
  finally
    LeaveCriticalSection(HCriticalSection);
  end;
end;

procedure Subtract;
begin
  EnterCriticalSection(HCriticalSection);
  try
    Dec(HNum);
  finally
    LeaveCriticalSection(HCriticalSection);
  end;
end;

initialization
  InitializeCriticalSection(FCriticalSection);

finalization
  DeleteCriticalSection(FCriticalSection);

end.
```

Hier wird nun bevor eine schreibende Operation eine CriticalSection betreten und
in dem `finally` wieder verlassen. Kannst du dir vorstellen warum das verlassem
in einem `finally` ist? Es ist der Selbe Grund wie beim allocieren von Objekten.

## Threads und GUI

Warum sind Threads gerade bei GUI-Anwendungen wichtig. Dafür muss man wissen das
Oberfächen in einem Thread laufen, der eine Eventschleife hat. Das muss der
Thread haben um angemessen auf die Nutzerinteraktion zu reagieren. Wenn nun in
diesem Thread Berechnungen ausgeführt werden, erscheint dieses Fenster so als
hätte sich das Programm aufgehangen. Das kann dann mitunter so aussehen:

![](warum_threads.jpg "Deine allerliebste IDE"){ style="display:block;
margin-left:auto; margin-right:auto; width:100%" }

Deswegen ist es Standart die Arbeit und Logik in einem anderen Thread zu machen.
Dafür erstellt man am besten eine weiter Klasse die sich nur um die Bearbeitung
kümmert. Das hat auch den vorteil, das die Logik auch ohne eine Oberfläche
testbar ist.

# Aufgaben

## Nr 1

Füge eine neue Unit `Chess` hinzu. In dieser soll folgendes implementiert
werden:

- Ein Enum `TChessTileStates` welches die Zustände eines Schachbrettfeldes
speichert. Diese ensprechen den Schachfiguren `König`, `Dame`, `Läufer`,
`Springer`, `Turm` und `Bauer`. Diese sind sowohl in schwarz und weiß zulässig.
Außerdem gibt es auch Leere Felder.
- Zwei Funktion die gemäß folgender Tabelle aus einem `TChessTileStates` einen
`Char` machen und andersherum

|Zeichen    |Figuren(TChessTileStates)|
|-----------|-------------------------|
|K          |König (w)                |
|D          |Dame (w)                 |
|L          |Läufer(w)                |
|S          |Springer(w)              |
|T          |Turm (w)                 |
|k          |König (b)                |
|d          |Dame (b)                 |
|l          |Läufer(b)                |
|s          |Springer(b)              |
|t          |Turm (b)                 |
|Leerzeichen|Leeres Feld              |

- Eine Typdefinition `TChessBoard` welche ein zweidimensionales 8x8
  `TChessTileStates`-Array definiert.
- Eine Klasse `TChessBoardHandler` welche ein `TChessBoard` verwaltet. Diese hat
  folgende Funktionen:
  - `procedure SetBoardFromString(_Board: String);` welches einen String der
    Form `FigurPositionFigurPosition...` einliest und auf einem Leeren Feld
    platziert. Ein Beispiel wäre der String `K22t23` welcher einen weißen König
    auf Feld (2,2) und eine schwarzen Turm platziert.
  - `function GetBoardAsString : String;` welches das aktuelle Feld ausgibt. Das
    soll für den Feldstring `b22K24l28B23k66` folgendes ausgeben:

```
+---+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+---+
|   | b | B | K |   |   |   | l |
+---+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+---+
|   |   |   |   |   | k |   |   |
+---+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+---+
|   |   |   |   |   |   |   |   |
+---+---+---+---+---+---+---+---+
```

Beachte dabei auch Fehler wie zum Beispiel:

- Bezeichnung der Figur ungültig(falsche Buchstaben)
- Position nicht auf dem Feld
- Feld soll zweimal besetzt werden

Wenn einer dieser Fälle eintritt, dann soll eine Exception mit einer
entsprechenden Fehlermeldung geworfen werden.

## Nr 2

Füge eine weitere Unit `WorkerThread` hinzu. Diese soll sich darum kümmern, dass
die eigentliche Aufgabe in einem neuen Thread ausgeführt werden soll, um wie
oben beschrieben Hänger der Oberfläche zu vermeiden.

- Erstelle als erstes eine Typdeklaration `TChessCallback` eines Methodenzeiger
  mit folgender Signatur `procedure(_Board : String)`. Dieser soll später von
  dem Thread verwendet werden um die Oberfläche zu Benarichtigen das ein neues
  Schachbrett zur Anzeige vorliegt.
- Erstelle eine weitere Typdeklaration `TErrorCallback` eines Methodenzeiger
  mit folgender Signatur `procedure(_Message : String)`. Dieser soll später von
  dem Thread verwendet werden um die Oberfläche zu Benarichtigen wenn ein Fehler
  aufgetreten ist.
- Schreibe eine weitere Klasse nach folgendem UML-Diagramm (`FChessCallback` und
  `FErrorCallback` sollen für den Schreibzugriff über `propertys` sichtbar sein)

![](worker_thread_uml.jpg "UML-Diagramm"){ style="display:block;
margin-left:auto; margin-right:auto; width:100%" }

Wobei die einzelnen Methoden folgende Aufgaben haben:

- `Create` erstellt ein neues Objekt der Klasse. Das heist das das Attibut
  `FChessBoardHandler`, `FWork` und `FCriticalSection` initialiesiert werden
  müssen. Auch soll der Konstruktor der Oberklasse mit dem Argument `True`
  aufgerufen werden.
- `Destroy` gibt die im Konstruktor erstellten Objekte frei und ruft den
  Destruktor der Oberklasse auf.
- Die Methode `Exceute` soll folgenden Inhalt haben:

``` Pascal
procedure TWorkerThread.Execute;
var
  HBoard : String;
begin
  while not Terminated do
  begin
    try
      if FWork.Count <> 0 then
      begin
        HBoard := FWork.First;

        EnterCriticalSection(FCriticalSection);
        try
          FWork.Delete(0);
        finally
          LeaveCriticalSection(FCriticalSection);
        end;

        FChessBoardHandler.SetBoardFromString(HBoard);
        Synchronize(Success);
      end
      else
      begin
        Sleep(100);
      end;
    except on E : Exception do
      begin
        FLastError := E.Message;
        Synchronize(Error);
      end;
    end;
  end;
end;
```

- In der Methode `GenerateChessBoardFromString` soll der übergebene String
  innerhalb der Critical Section `FCriticalSection` in der Liste hinzugefügt
  werden. Warum wird hier eine Critical Section benötigt?
- Die Methode `Error` ruft `FErrorCallback` mit `FLastError` auf.
- Die Methode `Success` ruft `FChessCallback` mit
  `FChessBoardHandler.GetBoardAsString` auf.

## Nr 3

Ändere die Standartmäßig hinzugefügte Oberfläche so ab, dass sie Folgendermaßen
aussieht:

![](gui_small.jpg "Beispiel"){ style="display:block;
margin-left:auto; margin-right:auto; width:40%" }

![](gui_big.jpg "Beispiel"){ style="display:block;
margin-left:auto; margin-right:auto; width:100%" }

![](gui_with_info.jpg "Beispiel"){ style="display:block;
margin-left:auto; margin-right:auto; width:40%" }

Die Klasse soll reagieren, wenn auf den Button gedrückt wird und dann die
weiter unten definierte Methode `ShowNewChessBoard` aufrufen. Auch sollen die
Signale `FormCreate` und `FormDestroy` genutzt werden, um ein Attribut `FWorker`
vom Typ `TWorkerThread` zu initialiesieren/wieder frei zu geben. Initial soll
ein leeres Schachbrett angezeigt werden.

Hinweis: Der Code um `FWorker` zu initialiesieren ist folgender:

``` Pascal
FWorker := TWorkerThread.Create;
FWorker.FreeOnTerminate := True;
FWorker.ChessCallback := OnBoardGenerated;
FWorker.ErrorCallback := OnError;

FWorker.Start;
```

Füge der Klasse außerdem die Methoden `ShowNewChessBoard`, `OnBoardGenerated`,
`OnError` und `MakeGuiGreatAgain` hinzu.

- `ShowNewChessBoard` fügt `FWorker` einen neuen Schachbrettstring hinzu,
  undzwar genau den, welcher in diesem moment in der `TEdit`-Komponente
  befindet. Dann soll der `TButton` disabled werden und der Cursor soll zu
  `crHourGlass` wechseln.
- `OnBoardGenerated` erhält einen String als Parameter und zeigt den Inhalt an
  und ruft `MakeGuiGreatAgain` zu gegebenem Zeitpunkt auf.
- `OnError` erhält einen String mit einer Fehlernachricht und zeigt diese
   mithilfe von ShowMessage an und ruft `MakeGuiGreatAgain` zu gegebenem
   Zeitpunkt auf.
- `MakeGuiGreatAgain` enabled den `TButton` wieder und setzt den Cursor auf
  `crDefault`.

# Rückblick

[Zurück zur Übersicht](../Index.html)

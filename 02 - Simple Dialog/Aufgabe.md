---
title: 02 - Simple Dialog
---

# Einleitung

Im folgenden wird ein kleines Dialogprogramm erläutert, um einen Umfassenden
Einstieg in den Aufbau von Delphi-Programmen zu geben.

# Vorbereitung

Das Programm im Ordner `Start` wird heruntergeladen und im RAD Studio geöffnet,
da der Code nur durchgesprochen wird. Tut mir leid `¯\_(ツ)_/¯`.

# Programm Teile

Im folgenden werden einzelne Delphi-Funktionalitäten am Prgramm erläutert. Daher
am besten diesen Text lesen und währenddessen im Code nachvollziehen, und
weitere Beispiele suchen.

## Grundidee und Ablauf

Es handelt sich um ein primitives Dialog-Programm, welches mit einigen Eingaben
zurecht kommen sollte. Darunter befinden sich Funktionen für die Berechnung von
Fibonacci-Zahlen, eine kurze Hilfe und ein kleiner Dialog. Der Nutzer soll
auswählen können welche dieser Optionen er gerne nutzen möchte. Diese soll
solange ausgeführt werden bis der Nutzer sagt, das er das Gespräch beenden
möchte. Dann soll sich das Programm schließen.

## Programm Teil 1: Units

Beim öffnen des Projekts, also der `SimpleDialog.dpr` siehst du den aus
[Introduction](../0x00 - Introduction/Aufgabe.html#der-programmeinstieg)
bekannten Aufbau des Programmeinstiegs. Neu ist, das selbstgeschriebene Units
verwendet werden. Das es selbstgeschriebene Units sind erkennts du daran das die
Einträge in der `uses`-Liste Pfadangaben hinter ihrem Namen haben. Das ist die
Datei die eine Unit enthält und geladen werden soll. Alle selbstgeschriebenen
Units müssen in der Hauptdatei mit Pfad eingebunden werden, damit der Compiler
weiß womit er es zu tun hat.

### Aufbau einer Unit

Mit `Strg + Rechts Klick` auf die Unit `UserInteraction` gehen wir in diese Unit
um uns den Aufbau einmal genauer anzusehen.

#### Unit

Mit diesem Token wird eine Datei als Unit deklariert. Das steht im Gegensatz zu
dem kennengelernten [program](../0x00 - Introduction/Aufgabe.html#program) und
sagt dem Compiler das es sich hierbei um eine Sammlung an Funktionalitäten
handelt, die genutzt werden können. Dateien die mit `unit` gekennzeichnet sind
haben einen anderen Aufbau und können nicht zu einem ausführbaren Programm
kompiliert werden. Eine Gemeinsamkeit zwischen `program` und `unit` besteht
darin, das auch die Unit den selben Namen wie die Datei haben muss.

#### Interface

Jede Unit Besitzt einen `interface` Teil. In diesem werden, wie der Name
nahelegt, die Methoden/Klassen etc. aufgeführt auf die von außen zugegriffen
werden kann. Diese werden allerdings nur deklariert. Die implementierung wird
ausgelagert. Daher befinden sich daher nur Funktionssignaturen. Dieser Bereich
besitzt daher auch eine `uses`-Liste, die nur die Units beinhaltet, die benötigt
werden um die Funktionalitäten im Interface bekannt zu machen.

Am Beispiel von Zeile 3 bis 6:

- Diese Unit stellt nur die Methode `TalkToUser` für die Nutzung von außerhalb
bereit.

#### Implementation

Auch besitzt jede Unit einen `implementation` Teil. In diesem werden die zuvor
deklarierten Funktionalietäten implementiert. Das heisßt, das hier eine
`uses`-Liste existiert, in die nun nur noch die von der Implementierung
benötigte Informationen geschrieben werden. Hier können auch hilfsmethoden
implementiert werden die nicht nach aussenhin sichtbar sein sollen.

Am Beispiel von Zeile 7 bis 248:

- In diesem Teil werden Funktionalitäten von 5 Units verwendet.
- Es wird ein Enum deklariert, welches die Eingabe das Nutzers kategoriesiert.
- Es werden 4 Variablen vom Typ StringListe deklariet welche die verschiedenen
  Stichworte enthalten die von dem Programm verstanden werden.
- Hier wird die Methode `TalkToUser` sowie benötigte Hilfsfunktionen
  implementiert.

#### Initialization

Dieser Teil einer Unit (`initialization`) ist optional, das heißt er kann muss
aber nicht auftreten. Code der an dieser Stelle steht wird vor Beginn des
Programms ausgeführt. Das wird genutzt um z.B.: Variablen zu initialiesieren
oder initialiesierungen im allgemeinen vorzunehmen

Am Beispiel von Zeile 249 bis 270:

- Die deklarierten StringListen werden instanziert und es werden ihnen die Sätze
  hinzugefügt auf die sie reagieren sollen.

#### Finalization

Auch dieser Teil einer Unit (`finalization`) ist optional. Hier wird genau das
Gegenteil zu [Initialization](#initialization) gemacht, das heißt dieser Code
wird ganz am Ende des Programms aufgerufen. Daher kann diese Stelle gut dazu
verwendet werden benötigte Resourcen frei zu geben.

Am Beispiel von Zeile 271 bis 277:

- Die deklarierten und initilaiesierten StringListen werden freigegeben, um den
  benötigten Speicher wieder freizugeben.

#### End

Am Ende einer jeden Unit steht nun `end.` das markiert das Ende der Datei und
darf nicht weggelassen werden. Auch darf nichts dahinter stehen.

Am Beispiel in Zeile 278.

### Warum Units

Units sollten verwendet werden, um Thematisch zusammengehörigen Code zu bündeln.
Der Vorteil bei großen Projekten liegt auf der Hand. Übersicht. Wenn ich ein
Problem mit der Anzeige eines Fensters habe, suche ich in der Unit in der
Fenster definiert wurde, und muss mich nicht durch einen Dschungel an
Methode/Funktionen/Klassen schlagen die nichts mit meinem Problem zu tun haben.
Ausderdem kann Code so einfacher an verschieden Stellen benutzt werden.

## Programm Teil 2: Funktionen

In Delphi wird grundsätzlich zwischen zwei Arten von Funktionen unterschieden.
Solche die einen Rückgabewert haben (`function`) und die die keinen haben
(`procedures`). Diese werden nachfolgend beleuchtet, dafür am besten in die Unit
`UserInteraction`.

### Begriffsabgrenzung

### Procedures

In der Unit ist im `interface` die Funktion `TalkToUser` ohne Rückgabewert
deklariert. Die deklaration hat nun folgenden Aufbau:

``` Pascal
procedure ProcedureOne;
procedure ProcedureTwo(_ParamOne : Integer);
procedure ProcedureThree(_ParamOne : Integer; _ParamTwo : Integer; _ParamThree : String);
```

Wobei `ProcedureOne`, `ProcedureTwo` und `ProcedureThree` die Namen der
Funktionen sind und in den Klammern eventuell vorhanden Parameter stehen.

In dem `implementation`-Abschnitt sieht man nun die implementierung dieser
Methode. Dafür wird zunächst klargestellt um was für eine Funktion es sich
handelt. Dann werden eventuell benötigete Konstanten/Variablen deklariert und
zwischen einem `begin` und `end;` wird die Funktionalität aufgeführt.

``` Pasc
procedure ProcedureOne; // Mit welcher Funktion haben wir es zu tun.
begin
  // Funktionalität steht hier
end;
```

bzw.

``` Pascal
procedure ProcedureThree(_ParamOne : Integer; _ParamTwo : Integer; _ParamThree : String);
const
  CKey : String = 'EIN_SCHLÜSSEL'; // CKey ist der Name (Constant Key), String der Typ und EIN_SCHLÜSSEL der Wert der der Konstanten zugewiesen wird.
var
  HIndex : Integer; // HIndex ist der Name (Helper Index) und Integer der Typ.
begin
  // Funktionalität steht hier
end;
```

### Functions

Die Funktion `TypeOfMessage` ist im `implementation` Bereich definiert und
implementiert. Die Methode hat den Rückgabetyp `TMessageType`. Die deklaration
einer `function` sieht im Allgemeinen folgendermaßen aus:

``` Pascal
function FunctionOne : Boolean;
function FunctionTwo(_ParamOne : Integer) : Integer;
function FunctionThree(_ParamOne : Integer; _ParamTwo : Integer; _ParamThree : String) : String;
```

Grundsätzlich ist das gleich der Definition von `procedure`, allerdings wird nun
auch am Ende der Rückgabetyp angegeben.

In der Implementierung werden nun analog zur `procedure` eventuell benötigete
Konstanten/Variablen deklariert und zwischen einem `begin` und `end;` die
Funktionalität aufgeführt. Inerhalb der Methode kann mit `Result := WERT` der
Rückgabewert gesetzt werden. Wichtig ist, das das nicht die Methode abbricht
also keinem `return` gleichkommt.

``` Pascal
function FunctionOne : Boolean; // Mit welcher Funktion haben wir es zu tun.
begin
  Result := true;
  // Funktionalität steht hier
  Result := false; // Gibt hier false zurück, da es die letzte Zuweisung zur 'Variablen' Result ist.
end;
```

bzw. genau wie im Unterpunkt Procedures mit `const` und `var`.

Entspricht in Java:

``` Java
public boolean functionOne() {
  boolean ret;

  ret = true;
  // Funktionalität steht hier
  ret = false;

  return ret;
}
```

## Programm Teil 3: Variablen und Konstanten

Wie im Abschnitt zuvor eingeführt, kann eine Methode (und eine Unit) Konstanten
`const` und Variablen `var` besitzen. Alle Variablen/Konstanten müssen zu Beginn
der Funktion (Unit) feststehen, damit der Compiler entsprechenden Speicher
reservieren kann. Daher werden diese auch in den zugehörigen Blöcken deklariert
und eventuell initialiesiert.

### Variablen

Der typische Deklarationsblock von Variablen sieht folgendermaßen aus:

``` Pascal
var
  HVarOne : Integer;
  HVarTwo : String;
```

In Java würde man diese Deklarationen folgendermaßen schreiben:

``` Java
int    HVarOne;
String HVarTwo;
```

Hier werden die Variablen `HVarOne` und `HVarTwo` mit ihrem Typ deklariert.
Dieser steht wie auch schon bei den Parametern nach dem Doppelpunkt. Das
bedeutet, das nachfolgend in der Funktion (Unit) diese Variablen `HVarOne` und
so weiter verwendet werden können. Den Wert der Variablen kann man nun mit dem
Zuweisungsoperator `:=` verändern und mit dem Punktoperator `.` kann auf Member
zugegriffen werden. Dazu folgendes kleines Beispiel:

``` Pascal
var
  HVarTwo : String;
begin
  HVarTwo := 'Ein Test';    // Setze den Wert von HVarTwo auf "Ein Test"
  HVarTwo := HVarTwo.Replace('T','F'); // Aufruf einer Memberfunktion.
  WriteLn(HVarTwo);         // Gibt "Ein Fest" aus
end;
```

Tipp: Im Code sind solche Variablen für Methoden fast immer mit einem
vorangestellten `H` für Hilfsvariable.

### Konstanten

Der typische Deklarationsblock von Konstanten sieht folgendermaßen aus:

``` Pascal
const
  CConstOne : Integer = 0;
  CConstTwo : String  = 'Test';
```

Das entspricht folgendem Javacode:

``` Java
final int    CConstOne = 0;
final String CConstTwo = 'Test';
```

Dabei werden die Konstanten mit ihrem Typ deklariet und müssen sofort danach
initialiesiert werden. Dies Erfolgt über den `=`-Operator. Von nun an steht in
dieser Variable exakt der Wert der zu Beginn hinein geschrieben wurde und kann
nicht verändert werden. Methoden können jetzt auf dem Objekt wie gewohnt
ausgeführt werden.

``` Pascal
var
  CConstTwo : String  = 'Test';
begin
  CConstTwo := 'Ein Test';             // Diese Zeile kann nicht ausgeführt werden, da versucht wird der Konstanten einen neuen Wert zuzuweisen.
  WriteLn(CConstTwo.Replace('T','F')); // Gibt "Fest" aus
end;
```

## Programm Teil 4: Kontrollstrukturen

### Boolsche Operatoren

In Java kennst du `&&` (Und), `||` (Oder) bzw `!` (Nicht) als Boolsche
Operatoren. Diese sind in Delphi `and`(Und), `or`(Oder) bzw `not`(nicht).

### if

Die if-Anweisung ist dir aus Java bekannt dort sieht sie wie folgt aus:

``` Java
if(Ausdruck1) {
  // ...
} else if (Ausdruck2) {
  // ...
} else if (Ausdruck3) {
  // ...
} else {
  // ...
}
```

Es gibt also `if`, `else if` und `else`. So ist es auch in Delphi allerdings ein
bisschen geschriebener:

``` Pascal
if Ausdruck1 then
begin
  // ...
end
else if Ausdruck2 then
begin
  // ...
end
else
begin
  // ...
end;
```

Das `;` nach dem `end` hat im Zusammenhang mit `if` markiert das Ende der
Anweisung. Das heißt ein `if` ohne `else if` oder `else` hat sein `;` am `end`
nach dem `if`:

``` Pascal
if Ausdruck1 then
begin
  // ...
end;
```

So wie es in Java möglich ist eine Anweisung ohne Klammern zu schreiben, so ist
es auch in Delphi ohne `begin` und `end` zu schreiben.

``` Pascal
if Ausdruck1 then
  Anweisung1
else if Ausdruck2 then
  Anweisung2
else
  Anweisung3;
```

Wichtig hierbei ist, das das `;` wieder nur an der allerletzten Anweisung steht.

Delphi verwendet standartmäßig nicht die sogenannte Kurzschlusslogik, wie du sie
aus Java gewohnt bist.

``` Java
if (false && eineFunktion()) {
  // Hier wird eineFunktion() niemals aufgerufen, weil das Programm erkennt das der Ausdruck niemals wahr werden kann.
}

if (true || eineFunktion()) {
  // Hier wird eineFunktion() auch nicht aufgerufen, weil Ausdruck immer wahr ist.
}
```

Das ist in unserem Programm nicht so. Hier sieht es folgendermaßen aus:

``` Pascal
if False and eineFunktion then
begin
  // Hier wird eineFunktion aufgerufen
end;

if False then
begin
  if eineFunktion then
  begin
    // Hier wird eineFunktion nicht aufgerufen, das ist also der Work-Around um Kurzschlusslogik ähnliches Verhalten zu erreichen.
  end;
end;

if True or eineFunktion then
begin
  // Auch hier wird eineFunktion aufgerufen, außerdem existiert kein allzu einfacher Weg das zu umgehen.
end;
```

### switch

Eine weiter möglickeit die auch aus Java bekannt ist ist die sogenannte
`switch`-Struktur. Diese sieht in Java so aus:

``` Java
switch(Variable1) {
  case Möglichkeit1: Anweisung1(); break;
  case Möglichkeit2: Anweisung2(); break;
  case Möglichkeit3: Anweisung3(); break;
  default: Anweisung4(); break
}
```

Das würde in Delphi folgender maßen umgesetzt werden:

``` Pascal
case Variable1 of
  Möglichkeit1: Anweisung1;
  Möglichkeit2: Anweisung2;
  Möglichkeit3: Anweisung3;
  else
end;
```

Es ist in Delphi nicht möglich ein Verhalten folgender Java Anweisung zu
erhalten:

``` Java
switch(Variable1) {
  case Möglichkeit1: Anweisung1();
  case Möglichkeit2: Anweisung2();
  case Möglichkeit3: Anweisung3();
}
```

## Programm Teil 5: Schleifen

### for

Es gibt in Delphi Zwei Arten von for Schleifen:

``` Pascal
var
  HIndex: Integer;
  HVal: String;
begin
  // Diese Schleife zähl von 0 bis 100 und gibt den aktuellen Wert aus.
  for HIndex := 0 to 100 do
  begin
    WriteLn(HIndex);
  end;

  // Mit dieser Schleife wird eine Liste durchlaufen und der aktuelle Wert ausgegeben.
  for HVal in HList do
  begin
    WriteLn(HVal);
  end;
end;
```

Das sieht so in Java aus:

``` Java
for(int i = 0; i <= 100; ++i) {
  System.out.println(String.valueOf(i));
}

for(String x : HList) {
  System.out.println(x);
}
```

Diese beiden Schleifenarten Verhalten sich eqivalten.

### while und until

Zusätzlich gibt es auch in Delphi Schleifen die so lange wiederholt werden bis
eine Bedingung nicht mehr erfüllt ist.

``` Pascal
while Bedingung do
begin

end;

repeat

until Bedingung;
```

Eqivalent unter Java:

``` Java
while (Bedingung) {

}

do {

} while (Bedingung);
```

## Programm Teil 6: Klassen

### Aufbau/Deklaration

Klassen müssen in der `type`-Sektion deklariert werden. Diese sieht wie folgt
aus:

``` Pascal
type

TMyClassOne = class
end;

TMyClassTwo = class
end;
```

Hier sind nun zwei Klassen ohne Attribute und Methoden definiert. Den Klassen
müssen nämlich in der Deklaration auch die Methoden und Attribute angegeben
werden. Das ist nicht wie in Java, sondern in C++, wo eine Trennung von Klassen
deklaration und Implementation vorgenommen wird. Bei C++ wird diese Trennung
meißt durch zwei unterschiedliche Dateien (`*.h` und `*.cpp`) deutlich in Delphi
ist die Klasse meißt im `interface` definiert und `implementation` programmiert.
Ein kleines Beispiel:

``` Pascal
interface

type

TMyClassOne = class
  procedure DoStuff;
end;

implementation

procedure TMyClassOne.DoStuff;
begin
  WriteLn('Diese Funktion macht Sachen.');
end;
```

Für ein komplexeres und schön beschriebenes Klassenbeispiel bitte in der Example
Unit nachsehen. Die Klasse wird im Programm nicht verwendet, beinhaltet aber
alle wichtigen Programmschnipsel die zum Erstellen einer Klasse benötigt werden,
und erklärt diese mithilfe von Kommentaren.

### Enums

Enumerations werden ähnlich wie Klassen definiert:

``` Pascal
type

TMyEnum = (YELLOW,RED,GREEN,UNKNOWN);
```

Hier ist nun ein Enum definiert Worden welches `TMyEnum` heißt und die
angegbenen 4 Werte annehmen kann. Das Anwendungsgebiet von Enums ist genau wie
in Java und kann aquivalent genutzt werden.

### Record

Ein Record ist ein Container der einfach eine Menge an Daten enthält. Um einen
Record zu erzeugen muss folgendes getan werden.

``` Pascal
type
  TPerson = record
    FName : String;
    FAge  : Integer;
  end;
```

In einem Record können auch Abhänigkeiten erzeugt werden. Nachfolgend ein
Beispiel. Für eine sehr genaue Erklärung empfehle ich folgenden
[Link](https://de.wikibooks.org/wiki/Programmierkurs:_Delphi:_Pascal:_Records).

``` Pascal
type
  TGast = record
    FForename, FSurname : String;  // bei statischen Feldern erlaubt
    case FInvited : Boolean of
      True:
        (FPlace, FGuestNumber : Integer);
      False:
        (FWanted : Boolean);
  end;
```

## Programm Teil 7: Vererbung

### Vererbung und Virtuelle Funktionen

Eine Klasse kann nur von einer Oberklasse erben. Um das zu ereichen, muss in
Klammern hinter dem `class` Token die Klasse stehen von der geerbt werden soll.

``` Pascal
TSuperClass = class
  public
    procedure DoSomething;
end;

TSubClass = class(TSuperClass)
  public
    procedure SomethingElse;
end;
```

Im Beispiel erbt `TSubClass` von `TSuperClass` und somit kann dort auch die
Methode `DoSomething` aufgerufen werden. Um nun wie in Java eine Funktion zu
überschreiben, muss es sich um virtuelle Funktionen handeln. In Java sind alle
Funktionen virtuell, daher muss das nicht mehr explizit angegeben werde,
allerdings bringt es einen Geschwindigkeitsvorteil wenn nicht mit virtuellen
Funktionen gearbeitet wird, da nicht erst die richtige Stelle im Programm
ermittelt werden muss. Bsp:

``` Pascal
interface

type
TSuperClass = class
  public
    function GetClassName : String;
end;

TSubClass = class(TSuperClass)
  public
    function GetClassName : String;
end;

implementation

function TSuperClass.GetClassName : String;
begin
  Result := 'TSuperClass';
end;

function TSubClass.GetClassName : String;
begin
  Result := 'TSubClass';
end;
```

Wenn nun folgender Programmschnipsel ausgeführt wird:

``` Pascal
HSuperClass := TSuperClass.Create;
try
  WriteLn(HSuperClass.GetClassName);
finally
  FreeAndNil(HSuperClass);
end;

HSubClass := TSubClass.Create;
try
  WriteLn(HSubClass.GetClassName);
finally
  FreeAndNil(HSubClass);
end;

HSuperClass := TSubClass.Create;
try
  WriteLn(HSuperClass.GetClassName);
finally
  FreeAndNil(HSuperClass);
end;
```

entsteht folgende Ausgabe:

``` shell
TSuperClass
TSubClass
TSuperClass
```

erwartet hätten wir allerdings folgende Ausgabe:

``` shell
TSuperClass
TSubClass
TSubClass
```

Um das zu erreichen muss die Deklaration etwas angepasst werden:

``` Pascal
interface

type
TSuperClass = class
  public
    function GetClassName : String; virtual;
end;

TSubClass = class(TSuperClass)
  public
    function GetClassName : String; override;
end;
```

Die Methode die überschrieben werden soll muss zusätzlich als `virtual`
gekennzeichnet sein. Auch bekommt sie Methode welche überschreibt das
Kennzeichen `override`. An der Implementation muss nichts geändert werden. Wenn
nun auch die Methode von `TSubClass` überschrieben werden soll muss diese auch
als virtual gekennzeichnet sein. Wenn du nun also z.B. eine Bibliothek mit einer
Sammlung deiner Klassen zur Verfügung stellst, kannst du mit der Vergabe des
`virtual` Kennzeichens entscheiden welche Methoden überschrieben werden können.

### Abstrakte Funktionen Klassen

In Delphi gibt es auch wie in Java abstrakte Funktionen für Klassen. Das sind
Funktionen welche Deklariert wurden, aber nicht implementiert. Wenn nun versucht
wird diese Methode aufzurufen, ohne das eine implementierung bekannt ist, wird
ein Fehler geworfen. Sollte allerdings die Klasse als `abstract` gekenneichnet
sein, so kann keine Instanz der Klasse erzeugt werden, und schon das Kompilieren
funktioniert nicht.

``` Pascal
interface

type
TAbstractClass = class abstract
public
  procedure Method; virtual; abstract;
end;

TClass = class(TAbstractClass)
public
  procedure Method; override;
end;

implementation

procedure TClass.Method;
begin
end;
```

Dieses Beispiel würde in Java folgendermaßen umgesetzt werden.

``` Java
abstract class TAbstractClass {
  public abstract void Method();
}

class TClass {
  public void Method() {
  }
}
```

### Interface

Ein interface erfüllt die selben Anforderungen wie in Java. Diese werden
folgender Maßen erzeugt:

``` Pascal
type
  IInterface = interface
    procedure DoSomething;
  end;
```

Um nun ein interface zu implementieren, muss zusätzlich von einer Klasse geerbt
werden, die die Methoden `AddRef` und `RemoveRef` überschreibt, oder ein eigenes
Verhalten implementiert. Für den Anfang ist es einfacher wenn solche Klassen
immer grundsätzlich von der Klasse `TInterfacedObject` abstammen:

``` Pascal
type
  TMyInterfacedClass = class (TInterfacedObject, IInterface)
    procedure DoSomething;
  end;

implementation

procedure TMyInterfacedClass.DoSomething;
begin

end;
```

## Programm Teil 9: Exceptions

### Exceptions werfen

Das Fangen von Exceptions mit `try ... except` und `try ... finally` Blöcken
haben wir bereits in der [ersten Aufgabe](../0x00 - Introduction/Aufgabe.html)
gesehen. Um nun eine Exception zu werfen wird zunächst ein Objekt einer
Exception-Klasse benötigt (auch selbstgeschriebene Exceptions sind möglich),
welches dann mit dem `raise`-Stichwort geworfen werden kann.

## Programm Teil 9: Der K(r)ampf mit dem Speicher

### Was ist ein Memoryleak

Mit jeder initiliesierung einer Variablen wird Speicher allociert, das heißt
blockiert und mit den benötigten Werten beschrieben. Wenn nun Speicher blockiert
und im Laufe des Programms nie wieder freigegeben wird, wächst der
Speicherverbauch des Programms und es wird langsamer. Dann handelt es sich um
ein Memoryleak.

### Wie entehen diese in Delphi

Ein Beispiel für ein Memoryleak:

``` Pascal
procedure CreateMemoryLeak;
var
HList   : TStringList;
HString : String;
begin
  HList := TStringList.Create;
  HList.Add('Eins');
  HList.Add('Zwei');

  for HString in HList do
  begin
    WriteLn(HString);
  end;
end;
```

Das Problem, ist das eine Objekt vom Typ `TStringList` erstellt wird, aber nicht
mehr freigeben wird. Dafür müsste der Destruktor aufgerufen werden. Dieser
Aufruf wird forzugsweise mit FreeAndNil gemacht, einer Funktion die den Speicher
freigibt und die Variable auf `Nil` setzt. `Nil` ist hier das gleiche wie `null`
in Java. Es wäre daher besser die Methode folgender maßen abzuändern:

``` Pascal
procedure CreateMemoryLeak;
var
HList   : TStringList;
HString : String;
begin
  HList := TStringList.Create;
  HList.Add('Eins');
  HList.Add('Zwei');

  for HString in HList do
  begin
    WriteLn(HString);
  end;

  FreeAndNil(HList);
end;
```

Sollte aber im Teil zwischen Konstruktor und Destruktor eine Exception
auftreten, so wird der destruktor auch nicht aufgerufen. Daher gehört es zum
Best-Practice folgende Codestruktur zu verwenden. Hier wird auch im Fall einer
Exception die Liste wieder frei gegeben.

``` Pascal
procedure CreateMemoryLeak;
var
HList   : TStringList;
HString : String;
begin
  HList := TStringList.Create;

  try
    HList.Add('Eins');
    HList.Add('Zwei');

    for HString in HList do
    begin
      WriteLn(HString);
    end;
  finally  
    FreeAndNil(HList);
  end;
end;
```

In Java treten solche Probleme nicht auf, da hier der GarbageCollector aufräumt.
Die Nutzung eines Solchen, macht das Programm allerdings langsamer. Auch hat man
keine Kontrolle über die Zerstörung des Objekts, daher existiert auch kein
Destruktor.

### Wie geht man dagegen vor

Grundsätzlich ist der einfachste Weg, einfach keine MemoryLeaks zu erzeugen. Das
bedeutet, immer wenn man einen Konstruktor aufruft direkt den Destrukoraufruf
hinzuzufügen. Wenn man überprüfen will, ob Memoryleaks vorhanden sind, empfielt
es sich folgende Zeile am Anfang des Programms einzugeben:

``` Pascal
ReportMemoryLeakOnShutdowm := True;
```

Wenn beim Beenden des Programms noch Speicherblöcke existieren die nicht
freigebene sind werden diese Ausgegeben. Zudem versucht das Programm den
entsprechenden Typ des im Block gespeicherten Objekts zu ermitteln. Mehr
Informationen werden allerdings nicht gespeichert. Das heißt das die Suche nach
Leaks sehr aufwendig werden kann.

### Ausnahmen

Primitive und Referenzgezählte Typen sowie Enums und Records bilden hier eine
Ausnahme. Diese dürfen nicht frei gegeben werden, da sich der Kompiler darum
kümmert.

#### Bsp. Primitive Datentypen

Ein Integer Wert wird einer Variablen zugewiesen. Diese darf nicht freigegeben
werden.

#### Bsp. Referenzgezählte Datentypen

String und TInterfaceObjekte besitzen die Methoden AddRef und RemoveRef und
dürfen auch nicht freigegeben werden.

## Test

Führe nun das Programm aus und teste dich so wie du möchtest hindurch. Läuft das
Programm so wie du es erwartet hast? Was könnte verbessert werden?

# Rückblick

Du solltest nun folgende Themen verstanden haben:

- Units: Warum und Wie?
- `functions` und `procedures`
- Variablen/Konstanten in Funktionen
- Kontrollstrukturen (`if` und `switch`)
- Schleifen (`for`, `until` und `while`)
- Aufbau von Klassen
- Virtuelle/Abstrakte Funktionen und Vererbung
- Werfen und Fangen von Exceptions
- Grundsätzliches Speichermanagement

[Zurück zur Übersicht](../Index.html)
